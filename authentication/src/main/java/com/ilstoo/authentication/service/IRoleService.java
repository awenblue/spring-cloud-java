package com.ilstoo.authentication.service;

import com.ilstoo.authentication.entity.Role;
import org.springframework.stereotype.Service;

import java.util.Set;

@Service
public interface IRoleService {

    Set<Role> queryUserRolesByUserId(Long userId);

}
