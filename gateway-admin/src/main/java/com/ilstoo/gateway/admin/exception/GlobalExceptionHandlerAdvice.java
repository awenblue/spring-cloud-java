package com.ilstoo.gateway.admin.exception;

import com.ilstoo.common.web.exception.DefaultGlobalExceptionHandlerAdvice;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandlerAdvice extends DefaultGlobalExceptionHandlerAdvice {
}