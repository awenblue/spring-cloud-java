package com.ilstoo.authentication.server.po;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
public class Resource {
    private Long id = -1L;
    private String code;
    private String name;
    private String type;
    private String url;
    private String method;
    private String description;
    private String createdBy;
    private String updatedBy;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
}
