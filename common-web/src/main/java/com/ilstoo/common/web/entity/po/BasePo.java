package com.ilstoo.common.web.entity.po;

import lombok.Data;


import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import java.io.Serializable;
import java.util.Date;

@Data
@MappedSuperclass
public class BasePo implements Serializable {
    public final static String DEFAULT_USERNAME = "system";

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id = -1L;

    private String createdBy;

    private Date createdTime;

    private String updatedBy;

    private Date updatedTime;
}
