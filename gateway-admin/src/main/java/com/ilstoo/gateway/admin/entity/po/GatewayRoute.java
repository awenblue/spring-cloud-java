package com.ilstoo.gateway.admin.entity.po;

import com.ilstoo.common.web.entity.po.BasePo;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Entity;
import javax.persistence.Table;

@EqualsAndHashCode(callSuper = true)
@Data
@Entity
@Table(name = "tb_gateway_route")
public class GatewayRoute extends BasePo {
    private String uri;
    private String routeId;
    private String predicates;
    private String filters;
    private String description;
    private Integer orders = 0;
    private String status = "Y";
    private String createdBy;
    private String updatedBy;
}
