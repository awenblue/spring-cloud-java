package com.ilstoo.gateway.admin.dao;

import com.ilstoo.common.db.repository.BaseRepository;
import com.ilstoo.gateway.admin.entity.po.GatewayRoute;

import java.util.List;

public interface GatewayRouteRepository extends BaseRepository<GatewayRoute> {

    List<GatewayRoute> findByUri(String uri);

}
