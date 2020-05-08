package com.ilstoo.organization.repository.entity;

import com.ilstoo.common.db.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author yihaowen
 * @create 2020-05-07 19:34
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Entity
@Table(name = "tb_resource")
public class ResourceEntity extends BaseEntity {

    @Column(length = 200, nullable = false)
    private String name;

    @Column(length = 200, nullable = false, unique = true)
    private String code;

    @Column(length = 200, nullable = false)
    private String type;

    @Column(length = 200, nullable = false)
    private String url;

    @Column(length = 20, nullable = false)
    private String method;

    @Column(length = 200)
    private String description;

    @Column(length = 100, nullable = false)
    private String createdBy;

    @Column(length = 100, nullable = false)
    private String updatedBy;

}
