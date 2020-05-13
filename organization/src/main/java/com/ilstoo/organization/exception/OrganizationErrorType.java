package com.ilstoo.organization.exception;

import com.ilstoo.common.exception.ErrorType;
import lombok.Getter;

@Getter
public enum OrganizationErrorType implements ErrorType {

    USER_NOT_FOUND("030100", "用户未找到！"),
    ROLE_NOT_FOUND("030200", "角色未找到！");

    /**
     * 错误类型码
     */
    private String code;
    /**
     * 错误类型描述信息
     */
    private String msg;

    OrganizationErrorType(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
