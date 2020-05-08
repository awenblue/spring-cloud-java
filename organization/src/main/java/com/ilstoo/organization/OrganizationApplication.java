package com.ilstoo.organization;

import com.ilstoo.common.web.util.UserContextFilter;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;

import javax.servlet.Filter;

/**
 * @author yihaowen
 * @create 2020-05-07 17:48
 */
@SpringBootApplication
@EnableResourceServer
public class OrganizationApplication {

    @Bean
    public Filter userContextFilter() {
        UserContextFilter userContextFilter = new UserContextFilter();
        return userContextFilter;
    }

    public static void main(String[] args) {
        SpringApplication.run(OrganizationApplication.class, args);
    }

}
