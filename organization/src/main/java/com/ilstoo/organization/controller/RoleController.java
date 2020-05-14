package com.ilstoo.organization.controller;

import com.ilstoo.common.util.Result;
import com.ilstoo.organization.domain.service.RoleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/role")
@Slf4j
public class RoleController {

    @Resource
    private RoleService roleService;

//    @ApiOperation(value = "获取角色", notes = "获取指定角色信息")
//    @ApiImplicitParam(paramType = "path", name = "id", value = "角色ID", required = true, dataType = "long")
    @GetMapping(value = "/{id}")
    public Result get(@PathVariable Long id) {
        log.debug("get with id:{}", id);
        return Result.success(roleService.get(id));
    }

//    @ApiOperation(value = "获取所有角色", notes = "获取所有角色")
    @GetMapping(value = "/all")
    public Result get() {
        return Result.success(roleService.getAll());
    }

//    @ApiOperation(value = "查询角色", notes = "根据用户id查询用户所拥有的角色信息")
//    @ApiImplicitParam(paramType = "path", name = "userId", value = "用户id", required = true, dataType = "long")
//    @ApiResponses(
//            @ApiResponse(code = 200, message = "处理成功", response = Result.class)
//    )
    @GetMapping(value = "/user/{userId}")
    public Result query(@PathVariable Long userId) {
        log.debug("query with userId:{}", userId);
        return Result.success(roleService.listByUser(userId));
    }
}