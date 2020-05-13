package com.ilstoo.organization.controller;


import com.ilstoo.common.util.Result;
import com.ilstoo.organization.domain.service.ResourceService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;

@RestController
@RequestMapping("/resource")
@Slf4j
public class ResourceController {

    @Resource
    private ResourceService resourceService;

//    @ApiOperation(value = "查询所有资源", notes = "查询所有资源信息")
//    @ApiResponses(
//            @ApiResponse(code = 200, message = "处理成功", response = Result.class)
//    )
    @GetMapping(value = "/all")
    public Result queryAll() {
        return Result.success(resourceService.getAll());
    }

//    @ApiOperation(value = "查询资源", notes = "根据userId查询用户所拥有的资源信息")
//    @ApiImplicitParam(paramType = "path", name = "userId", value = "用户id", required = true, dataType = "long")
//    @ApiResponses(
//            @ApiResponse(code = 200, message = "处理成功", response = Result.class)
//    )
    @GetMapping(value = "/user/{username}")
    public Result queryByUsername(@PathVariable String username) {
        log.debug("query with username:{}", username);
        return Result.success(resourceService.queryByUsername(username));
    }
}