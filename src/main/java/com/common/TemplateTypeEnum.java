package com.common;

import lombok.Getter;

/**
 * @author jerryli
 * @description
 * @date 2019-11-11 19:25
 */
@Getter
public enum TemplateTypeEnum {

    DEFAULT(0, "默认", "default/"),

    MEERUU(1, "HSF版本", "meeruu/"),

    MEERUUSERVICE(2, "SrpingCloud 版本", "meeruu-service/"),
    ;

    private Integer code;
    private String desc;
    private String path;

    private TemplateTypeEnum(Integer code, String desc, String path) {
        this.code = code;
        this.desc = desc;
        this.path = path;
    }

    public static TemplateTypeEnum getByCode(Integer code) {
        if (code == null) {
            return null;
        }

        for (TemplateTypeEnum typeEnum : TemplateTypeEnum.values()) {
            if (typeEnum.getCode().equals(code)) {
                return typeEnum;
            }
        }
        return null;
    }
}
