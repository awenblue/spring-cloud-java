package com.ilstoo.organization.domain.service.impl;

import com.ilstoo.organization.domain.service.ResourceService;
import com.ilstoo.organization.domain.service.RoleResourceService;
import com.ilstoo.organization.domain.service.RoleService;
import com.ilstoo.organization.domain.service.UserService;
import com.ilstoo.organization.repository.entity.ResourceEntity;
import com.ilstoo.organization.repository.entity.RoleEntity;
import com.ilstoo.organization.repository.entity.RoleResourceEntity;
import com.ilstoo.organization.repository.entity.UserEntity;
import com.ilstoo.organization.repository.jpa.ResourceRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author yihaowen
 * @create 2020-05-13 17:45
 */
@Service
public class ResourceServiceImpl implements ResourceService {

    @Resource
    private ResourceRepository resourceRepository;

    @Resource
    private UserService userService;

    @Resource
    private RoleService roleService;

    @Resource
    private RoleResourceService roleResourceService;

    @Override
    public List<ResourceEntity> getAll() {
        return resourceRepository.findAll();
    }

    @Override
    public List<ResourceEntity> queryByUsername(String username) {
        UserEntity userEntity = userService.getByUniqueId(username);
        List<Long> roleIds = roleService.listByUser(userEntity.getId())
                .stream()
                .map(RoleEntity::getId)
                .distinct()
                .collect(Collectors.toList());

        List<Long> resourceIds = roleResourceService.listByRoleIds(roleIds)
                .stream()
                .map(RoleResourceEntity::getResourceId)
                .collect(Collectors.toList());

        return resourceRepository.findAllById(resourceIds);
    }

}
