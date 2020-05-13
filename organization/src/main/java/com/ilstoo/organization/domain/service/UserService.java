package com.ilstoo.organization.domain.service;

import com.ilstoo.organization.repository.entity.UserEntity;

public interface UserService {

    UserEntity getByUniqueId(String uniqueId);

}
