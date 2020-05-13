package com.ilstoo.organization.repository.jpa;

import com.ilstoo.common.db.repository.BaseRepository;
import com.ilstoo.organization.repository.entity.UserRoleEntity;

import java.util.List;

public interface UserRoleRepository extends BaseRepository<UserRoleEntity> {

    List<UserRoleEntity> findAllByUserId(Long userId);

}
