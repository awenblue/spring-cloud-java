package com.ilstoo.authentication.server.authentication;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients
@Slf4j
public class Oauth2AuthenticationApplication {
    public static void main(String[] args) {
        SpringApplication.run(Oauth2AuthenticationApplication.class, args);
        log.debug("Running");
    }
}
