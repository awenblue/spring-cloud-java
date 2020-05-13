package com.ilstoo.organization.domain.service;

import java.util.List;

/**
 * @author yihaowen
 * @create 2020-05-13 18:04
 */
public interface UserRoleService {

    List<Long> listByUser(Long userId);

}
