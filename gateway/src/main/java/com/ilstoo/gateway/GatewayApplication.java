package com.ilstoo.gateway;

import com.alicp.jetcache.anno.config.EnableCreateCacheAnnotation;
import com.alicp.jetcache.anno.config.EnableMethodCache;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;


/**
 * @author yihaowen
 * @create 2020-05-05 14:26
 */
@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients(value = {"com.ilstoo.authentication.client"})
@EnableMethodCache(basePackages = "com.ilstoo.gateway")
@EnableCreateCacheAnnotation
public class GatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(GatewayApplication.class, args);
    }

}
