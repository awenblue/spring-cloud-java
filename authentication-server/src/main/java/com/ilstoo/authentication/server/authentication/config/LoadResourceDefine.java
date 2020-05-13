package com.ilstoo.authentication.server.authentication.config;

import com.ilstoo.authentication.server.authentication.service.IResourceService;
import org.springframework.context.annotation.Bean;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Map;

/**
 * Created by zhoutaoo on 2018/5/25.
 */
@Component
class LoadResourceDefine {

    @Resource
    private IResourceService resourceService;

    @Bean
    public Map<RequestMatcher, ConfigAttribute> resourceConfigAttributes() {
        return resourceService.loadResource();
    }
}
