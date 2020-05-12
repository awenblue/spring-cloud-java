package com.ilstoo.gateway.service.impl;

import com.ilstoo.authentication.client.service.IAuthService;
import com.ilstoo.gateway.service.IPermissionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class PermissionService implements IPermissionService {

    /**
     * 由authentication-client模块提供签权的feign客户端
     */
    @Resource
    private IAuthService authService;

    @Override
    public boolean permission(String authentication, String url, String method) {
        return authService.hasPermission(authentication, url, method);
    }
}
