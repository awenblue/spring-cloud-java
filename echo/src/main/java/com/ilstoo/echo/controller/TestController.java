package com.ilstoo.echo.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author yihaowen
 * @create 2020-05-05 19:45
 */
@RestController
@RefreshScope
public class TestController {

    @Value("${echo.account}")
    private String account;

    @GetMapping("/echo")
    @ResponseBody
    public String echo() {
        return account;
    }
}
