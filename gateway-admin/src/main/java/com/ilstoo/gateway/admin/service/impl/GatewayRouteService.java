package com.ilstoo.gateway.admin.service.impl;

import com.alicp.jetcache.Cache;
import com.alicp.jetcache.anno.CacheType;
import com.alicp.jetcache.anno.CreateCache;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ilstoo.gateway.admin.config.BusConfig;
import com.ilstoo.gateway.admin.dao.GatewayRouteRepository;
import com.ilstoo.gateway.admin.entity.ov.GatewayRouteVo;
import com.ilstoo.gateway.admin.entity.param.GatewayRouteQueryParam;
import com.ilstoo.gateway.admin.entity.po.GatewayRoute;
import com.ilstoo.gateway.admin.events.EventSender;
import com.ilstoo.gateway.admin.service.IGatewayRouteService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.filter.FilterDefinition;
import org.springframework.cloud.gateway.handler.predicate.PredicateDefinition;
import org.springframework.cloud.gateway.route.RouteDefinition;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.io.IOException;
import java.net.URI;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
public class GatewayRouteService implements IGatewayRouteService {

    private static final String GATEWAY_ROUTES = "gateway_routes::";

    @CreateCache(name = GATEWAY_ROUTES, cacheType = CacheType.REMOTE)
    private Cache<String, RouteDefinition> gatewayRouteCache;

    @Resource
    private EventSender eventSender;

    @Resource
    private GatewayRouteRepository gatewayRouteRepository;

    @Override
    public boolean add(GatewayRoute gatewayRoute) {
        gatewayRouteRepository.save(gatewayRoute);
        // 转化为gateway需要的类型，缓存到redis, 并事件通知各网关应用
        RouteDefinition routeDefinition = gatewayRouteToRouteDefinition(gatewayRoute);
        gatewayRouteCache.put(gatewayRoute.getRouteId(), routeDefinition);
        eventSender.send(BusConfig.ROUTING_KEY, routeDefinition);
        return true;
    }

    @Override
    public boolean delete(Long id) {
        GatewayRoute gatewayRoute = gatewayRouteRepository.getOne(id);
        // 删除redis缓存, 并事件通知各网关应用
        gatewayRouteCache.remove(gatewayRoute.getRouteId());
        eventSender.send(BusConfig.ROUTING_KEY, gatewayRouteToRouteDefinition(gatewayRoute));
        gatewayRouteRepository.deleteById(id);
        return true;
    }

    @Override
    public boolean update(GatewayRoute gatewayRoute) {
        gatewayRouteRepository.save(gatewayRoute);
        // 转化为gateway需要的类型，缓存到redis, 并事件通知各网关应用
        RouteDefinition routeDefinition = gatewayRouteToRouteDefinition(gatewayRoute);
        gatewayRouteCache.put(gatewayRoute.getRouteId(), routeDefinition);
        eventSender.send(BusConfig.ROUTING_KEY, routeDefinition);
        return true;
    }

    /**
     * 将数据库中json对象转换为网关需要的RouteDefinition对象
     *
     * @param gatewayRoute
     * @return RouteDefinition
     */
    private RouteDefinition gatewayRouteToRouteDefinition(GatewayRoute gatewayRoute) {
        RouteDefinition routeDefinition = new RouteDefinition();
        routeDefinition.setId(gatewayRoute.getRouteId());
        routeDefinition.setOrder(gatewayRoute.getOrders());
        routeDefinition.setUri(URI.create(gatewayRoute.getUri()));
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            routeDefinition.setFilters(objectMapper.readValue(gatewayRoute.getFilters(), new TypeReference<List<FilterDefinition>>() {
            }));
            routeDefinition.setPredicates(objectMapper.readValue(gatewayRoute.getPredicates(), new TypeReference<List<PredicateDefinition>>() {
            }));
        } catch (IOException e) {
            log.error("网关路由对象转换失败", e);
        }
        return routeDefinition;
    }

    @Override
    public GatewayRoute get(Long id) {
        return gatewayRouteRepository.getOne(id);
    }

    @Override
    public List<GatewayRouteVo> query(GatewayRouteQueryParam gatewayRouteQueryParam) {
        return gatewayRouteRepository.findByUri(gatewayRouteQueryParam.getUri())
                .stream()
                .map(GatewayRouteVo::new)
                .collect(Collectors.toList());
    }

    @Override
    @PostConstruct
    public boolean overload() {
        List<GatewayRoute> gatewayRoutes = gatewayRouteRepository.findAll();
        gatewayRoutes.forEach(gatewayRoute ->
                gatewayRouteCache.put(gatewayRoute.getRouteId(), gatewayRouteToRouteDefinition(gatewayRoute))
        );
        log.info("全局初使化网关路由成功!");
        return true;
    }
}
