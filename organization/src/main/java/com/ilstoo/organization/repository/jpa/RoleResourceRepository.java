package com.ilstoo.organization.repository.jpa;

import com.ilstoo.common.db.repository.BaseRepository;
import com.ilstoo.organization.repository.entity.RoleResourceEntity;

import java.util.List;

public interface RoleResourceRepository extends BaseRepository<RoleResourceEntity> {

    List<RoleResourceEntity> findAllByRoleId(Long roleId);

    List<RoleResourceEntity> getAllByRoleIdIn(List<Long> roleIds);


}
