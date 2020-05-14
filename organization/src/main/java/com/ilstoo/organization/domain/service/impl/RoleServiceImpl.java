package com.ilstoo.organization.domain.service.impl;

import com.ilstoo.organization.domain.service.RoleService;
import com.ilstoo.organization.domain.service.UserRoleService;
import com.ilstoo.organization.exception.RoleNotFoundException;
import com.ilstoo.organization.repository.entity.RoleEntity;
import com.ilstoo.organization.repository.jpa.RoleRepository;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;

/**
 * @author yihaowen
 * @create 2020-05-13 18:03
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Resource
    private UserRoleService userRoleService;

    @Resource
    private RoleRepository roleRepository;

    @Override
    public List<RoleEntity> listByUser(Long userId) {
        List<Long> ids = userRoleService.listByUser(userId);
        if (CollectionUtils.isEmpty(ids))
            return Collections.emptyList();

        return roleRepository.findAllById(ids);
    }

    @Override
    public RoleEntity get(Long id) {
        return roleRepository.findById(id)
                .orElseThrow(RoleNotFoundException::new);
    }

    @Override
    public List<RoleEntity> getAll() {
        return roleRepository.findAll();
    }
}
