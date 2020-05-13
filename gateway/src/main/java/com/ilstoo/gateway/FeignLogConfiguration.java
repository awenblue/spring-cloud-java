package com.ilstoo.gateway;

import feign.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FeignLogConfiguration {
 
  @Bean
  Logger.Level feignLoggerLevel() {
 
    return Logger.Level.FULL;
 
  }
}