package com.ilstoo.authentication.service.impl;

import com.ilstoo.authentication.entity.User;
import com.ilstoo.authentication.provider.OrganizationProvider;
import com.ilstoo.authentication.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserService implements IUserService {

    @Resource
    private OrganizationProvider organizationProvider;

    @Override
    public User getByUniqueId(String uniqueId) {
        return organizationProvider.getUserByUniqueId(uniqueId).getData();
    }
}
