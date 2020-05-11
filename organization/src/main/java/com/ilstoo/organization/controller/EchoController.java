package com.ilstoo.organization.controller;

import com.ilstoo.organization.feign.EchoVisitor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author yihaowen
 * @create 2020-05-08 18:07
 */
@RestController
public class EchoController {

    @Resource
    private EchoVisitor echoVisitor;

    @GetMapping("/org/echo")
    @ResponseBody
    public String echo() {
        return "Welcome!";
    }

    @GetMapping("/org/visit")
    @ResponseBody
    public String visit() {
        return echoVisitor.echo();
    }

}
