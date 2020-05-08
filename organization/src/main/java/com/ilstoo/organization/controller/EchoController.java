package com.ilstoo.organization.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author yihaowen
 * @create 2020-05-08 18:07
 */
@RestController
public class EchoController {

    @GetMapping("/echo")
    @ResponseBody
    public String echo() {
        return "Welcome!";
    }


}
