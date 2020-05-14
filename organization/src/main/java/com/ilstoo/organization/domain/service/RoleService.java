package com.ilstoo.organization.domain.service;

import com.ilstoo.organization.repository.entity.RoleEntity;

import java.util.List;

public interface RoleService {

    List<RoleEntity> listByUser(Long userId);

    RoleEntity get(Long id);

    List<RoleEntity> getAll();
}
