package com.ilstoo.organization.repository.jpa;

import com.ilstoo.common.db.repository.BaseRepository;
import com.ilstoo.organization.repository.entity.UserEntity;

import java.util.Optional;

public interface UserRepository extends BaseRepository<UserEntity> {

    Optional<UserEntity> findByUsernameOrMobile(String username, String mobile);


}
