package com.ilstoo.organization.domain.service.impl;

import com.ilstoo.organization.domain.service.UserService;
import com.ilstoo.organization.exception.UserNotFoundException;
import com.ilstoo.organization.repository.entity.UserEntity;
import com.ilstoo.organization.repository.jpa.UserRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author yihaowen
 * @create 2020-05-13 17:54
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserRepository userRepository;

    @Override
    public UserEntity getByUniqueId(String uniqueId) {
        return userRepository.findByUsernameOrMobile(uniqueId, uniqueId)
                .orElseThrow(UserNotFoundException::new);
    }
}
