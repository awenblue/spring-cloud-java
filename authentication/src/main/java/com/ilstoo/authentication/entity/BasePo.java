package com.ilstoo.authentication.entity;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author yihaowen
 * @create 2020-05-14 13:46
 */
@Data
public abstract class BasePo {
    private Long id = -1L;
    private String createdBy;
    private String updatedBy;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
}
