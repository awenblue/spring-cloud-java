package com.ilstoo.organization.domain.service;

import com.ilstoo.organization.repository.entity.ResourceEntity;

import java.util.List;

/**
 * @author yihaowen
 * @create 2020-05-13 17:43
 */
public interface ResourceService {

    List<ResourceEntity> getAll();

    List<ResourceEntity> queryByUsername(String username);
}
