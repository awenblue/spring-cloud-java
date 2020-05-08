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
@Table(name = "tb_user_position")
public class RoleMenuEntity extends BaseEntity {

    @Column(nullable = false)
    private Long menuId;

    @Column(nullable = false)
    private Long roleId;

    @Column(length = 100, nullable = false)
    private String createdBy;

    @Column(length = 100, nullable = false)
    private String updatedBy;

}
