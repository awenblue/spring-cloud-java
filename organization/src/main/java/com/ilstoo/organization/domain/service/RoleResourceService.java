package com.ilstoo.organization.domain.service;

import com.ilstoo.organization.repository.entity.RoleResourceEntity;

import java.util.List;

public interface RoleResourceService {

    List<RoleResourceEntity> listByRoleIds(List<Long> roleIds);

    List<RoleResourceEntity> listByRole(Long roleId);

}
