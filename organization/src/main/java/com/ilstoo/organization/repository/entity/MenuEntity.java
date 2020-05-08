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
@Table(name = "tb_menu")
public class MenuEntity extends BaseEntity {

    @Column(nullable = false)
    private Long parentId;

    @Column(length = 200, nullable = false)
    private String name;

    @Column(length = 200)
    private String description;

    @Column(length = 200)
    private String type;

    @Column(length = 200)
    private String href;

    @Column(length = 200)
    private String icon;

    @Column(length = 100, nullable = false)
    private String createdBy;

    @Column(length = 100, nullable = false)
    private String updatedBy;

}
