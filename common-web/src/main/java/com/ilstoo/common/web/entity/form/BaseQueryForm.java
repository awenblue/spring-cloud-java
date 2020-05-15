package com.ilstoo.common.web.entity.form;

import com.ilstoo.common.web.entity.param.BaseParam;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;

@EqualsAndHashCode(callSuper = true)
@Slf4j
@Data
public class BaseQueryForm<P extends BaseParam> extends BaseForm {
    /**
     * 分页查询的参数，当前页数
     */
    private long current = 1;
    /**
     * 分页查询的参数，当前页面每页显示的数量
     */
    private long size = 10;

    /**
     * Form转化为Param
     *
     * @param clazz
     * @return
     */
    public P toParam(Class<P> clazz) {
        P p = BeanUtils.instantiateClass(clazz);
        BeanUtils.copyProperties(this, p);
        return p;
    }

}
