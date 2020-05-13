package com.ilstoo.organization.domain.service.impl;

import com.ilstoo.organization.domain.service.RoleResourceService;
import com.ilstoo.organization.repository.entity.ResourceEntity;
import com.ilstoo.organization.repository.entity.RoleResourceEntity;
import com.ilstoo.organization.repository.jpa.RoleResourceRepository;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author yihaowen
 * @create 2020-05-13 18:22
 */
@Service
public class RoleResourceServiceImpl implements RoleResourceService {

    @Resource
    private RoleResourceRepository roleResourceRepository;

    @Override
    public List<RoleResourceEntity> listByRoleIds(List<Long> roleIds) {

        return roleResourceRepository.getAllByRoleIdIn(roleIds);
    }

    @Override
    public List<RoleResourceEntity> listByRole(Long roleId) {

        return roleResourceRepository.findAllByRoleId(roleId);
    }

}
