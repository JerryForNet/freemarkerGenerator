package com.common;

import lombok.Getter;

/**
 * @author jerryli
 * @description
 * @date 2019-11-11 19:51
 */
@Getter
public enum ItemFilePathEnum {

    // TODO: 2019-11-11 目录待确认
    BIZFACADE(0, "biz/facade", "biz/facade/src/main/java/com/meeruu/sg/mall/biz/{0}/"),
    BIZBUSINESS(1, "biz/business", "biz/business/src/main/java/com/meeruu/sg/mall/{0}/biz/"),
    MODULESFACADE(2, "modules/service/facade", "{0}-service-facade/src/main/java/com/meeruu/sg/mall/{0}/"),
    MODULESABILITYIMPL(3, "modules/service/ability", "{0}-service-ability/src/main/java/facade.impl/"),
    MODULESABILITYBUSINESS(4, "modules/service/ability", "{0}-service-ability/src/main/java/business/"),
    MODULESABILITYDOMAIN(5, "modules/service/domain", "{0}-service-ability/src/main/java/domain/"),
    /**
     * 0：module 1 tableName
     */
    MODULESintrgrationrepository(6, "modules/intrgration/repository", "{0}-service-intrgration/src/main/java/com/meeruu/sg/mall/{0}/{1}/infrastructure/repository/repository/"),
    MODULESintrgrationrepositoryimpl(7, "modules/intrgration/repository/impl", "{0}-service-intrgration/src/main/java/com/meeruu/sg/mall/{0}/{1}/infrastructure/repository/repository/impl/"),
    MODULESintrgrationrepositorymapper(7, "modules/intrgration/repository/mapper", "{0}-service-intrgration/src/main/java/com/meeruu/sg/mall/{0}/{1}/infrastructure/repository/mapper/"),
    ;

    private Integer code;
    private String desc;
    private String path;

    private ItemFilePathEnum(Integer code, String desc, String path) {
        this.code = code;
        this.desc = desc;
        this.path = path;
    }

    public static ItemFilePathEnum getByCode(Integer code) {
        if (code == null) {
            return null;
        }

        for (ItemFilePathEnum typeEnum : ItemFilePathEnum.values()) {
            if (typeEnum.getCode().equals(code)) {
                return typeEnum;
            }
        }
        return null;
    }
}
