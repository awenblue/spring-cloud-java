package com.ilstoo.gateway.admin.entity.form;

import com.ilstoo.common.web.entity.form.BaseQueryForm;
import com.ilstoo.gateway.admin.entity.param.GatewayRouteQueryParam;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Past;
import java.util.Date;

@EqualsAndHashCode(callSuper = true)
@Data
public class GatewayRouteQueryForm extends BaseQueryForm<GatewayRouteQueryParam> {

    //@ApiModelProperty(value = "uri路径", required = true)
    private String uri;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    @Past(message = "查询开始时间必须小于当前日期")
    //@ApiModelProperty(value = "查询开始时间")
    private Date createdTimeStart;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    @Past(message = "查询结束时间必须小于当前日期")
    //@ApiModelProperty(value = "查询结束时间")
    private Date createdTimeEnd;
}
