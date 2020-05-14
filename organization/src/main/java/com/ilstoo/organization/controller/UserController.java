package com.ilstoo.organization.controller;

import com.ilstoo.common.util.Result;
import com.ilstoo.organization.domain.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/user")
@Slf4j
public class UserController {

    @Autowired
    private UserService userService;

//    @ApiOperation(value = "获取用户", notes = "获取指定用户信息")
//    @ApiImplicitParam(paramType = "path", name = "id", value = "用户ID", required = true, dataType = "string")
    @GetMapping(value = "/{id}")
    public Result get(@PathVariable Long id) {
        log.debug("get with id:{}", id);
        return Result.success(userService.get(id));
    }

//    @ApiOperation(value = "获取用户", notes = "根据用户唯一标识（username or mobile）获取用户信息")
//    @ApiImplicitParam(paramType = "query", name = "uniqueId", value = "用户唯一标识", required = true, dataType = "string")
//    @ApiResponses(@ApiResponse(code = 200, message = "处理成功", response = Result.class))
    @GetMapping
    public Result query(@RequestParam String uniqueId) {
        log.debug("query with username or mobile:{}", uniqueId);
        return Result.success(userService.getByUniqueId(uniqueId));
    }
}