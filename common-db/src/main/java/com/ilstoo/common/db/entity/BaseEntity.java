package com.ilstoo.common.db.entity;

import lombok.Data;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import java.time.LocalDateTime;

/**
 * @author yihaowen
 * @create 2020-05-07 18:12
 */

@Data
@MappedSuperclass
public abstract class BaseEntity {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id = -1L;

    private LocalDateTime createdTime = LocalDateTime.now();

    private LocalDateTime updatedTime = LocalDateTime.now();

}
