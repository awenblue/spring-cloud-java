package com.ilstoo.organization.domain.service.impl;

import com.ilstoo.organization.domain.service.UserRoleService;
import com.ilstoo.organization.repository.entity.UserRoleEntity;
import com.ilstoo.organization.repository.jpa.UserRoleRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author yihaowen
 * @create 2020-05-13 18:05
 */
@Service
public class UserRoleServiceImpl implements UserRoleService {

    @Resource
    private UserRoleRepository userRoleRepository;

    @Override
    public List<Long> listByUser(Long userId) {
        return userRoleRepository.findAllByUserId(userId)
                .stream()
                .map(UserRoleEntity::getRoleId)
                .collect(Collectors.toList());
    }

}
