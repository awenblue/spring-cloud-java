package com.ilstoo.organization.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;

@Component
@FeignClient(name = "echo"/*, fallback = AuthProvider.AuthProviderFallback.class*/)
public interface EchoVisitor {


    @GetMapping("/echo")
    String echo();


}
