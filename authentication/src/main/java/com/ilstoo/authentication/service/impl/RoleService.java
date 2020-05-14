package com.ilstoo.authentication.service.impl;

import com.ilstoo.authentication.entity.Role;
import com.ilstoo.authentication.provider.OrganizationProvider;
import com.ilstoo.authentication.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Set;

@Service
public class RoleService implements IRoleService {

    @Resource
    private OrganizationProvider organizationProvider;

    @Override
    public Set<Role> queryUserRolesByUserId(Long userId) {
        return organizationProvider.queryRolesByUserId(userId).getData();
    }

}
