package com.ilstoo.common.web.entity.param;

import com.ilstoo.common.web.entity.po.BasePo;
import lombok.Data;

import java.util.Date;

/**
 * Created by zhoutaoo on 2018/6/1.
 */
@Data
public class BaseParam<T extends BasePo> {
    private Date createdTimeStart;
    private Date createdTimeEnd;

}
