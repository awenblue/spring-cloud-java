package com.ilstoo.common.web.entity.form;

import com.ilstoo.common.web.entity.po.BasePo;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;

@Slf4j
@Data
public class BaseForm<T extends BasePo> {
    /**
     * 用户名
     */
    private String username;

    /**
     * From转化为Po，进行后续业务处理
     *
     * @param clazz
     * @return
     */
    public T toPo(Class<T> clazz) {
        T t = BeanUtils.instantiateClass(clazz);
        BeanUtils.copyProperties(this, t);
        return t;
    }

    /**
     * From转化为Po，进行后续业务处理
     *
     * @param id
     * @param clazz
     * @return
     */
    public T toPo(Long id, Class<T> clazz) {
        T t = BeanUtils.instantiateClass(clazz);
        t.setId(id);
        BeanUtils.copyProperties(this, t);
        return t;
    }
}
