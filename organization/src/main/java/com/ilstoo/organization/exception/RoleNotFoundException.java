package com.ilstoo.organization.exception;


import com.ilstoo.common.exception.BaseException;

public class RoleNotFoundException extends BaseException {
    public RoleNotFoundException() {
        super(OrganizationErrorType.ROLE_NOT_FOUND);
    }

    public RoleNotFoundException(String message) {
        super(OrganizationErrorType.ROLE_NOT_FOUND, message);
    }
}
