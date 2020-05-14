package com.ilstoo.authentication.provider;

import com.ilstoo.authentication.entity.Role;
import com.ilstoo.authentication.entity.User;
import com.ilstoo.common.util.Result;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;

@Component
public class OrganizationProviderFallback implements OrganizationProvider {

    @Override
    public Result<User> getUserByUniqueId(String uniqueId) {
        return Result.success(new User());
    }

    @Override
    public Result<Set<Role>> queryRolesByUserId(Long userId) {
        return Result.success(new HashSet<Role>());
    }
}
