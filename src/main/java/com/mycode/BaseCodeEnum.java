package com.mycode;

import lombok.Getter;

@Getter
public enum BaseCodeEnum {
    SUCCESS(10000, "业务处理成功", "业务处理成功"),
    SYSTEM_FAILD(10001, "网络走神了,请稍后重试", "网络走神了,请稍后重试"),
    TIMED_OUT(10002, "业务处理超时", "系统处理超时，请重试"),
    PARAM_ERROR(10003, "参数错误", "请检查参数是否正确"),
    RPC_TIMED_OUT(10004, "RPC调用超时", "系统处理超时，请重试"),
    RPC_INVOKE_FAILED(10005, "RPC调用异常", "系统处理失败，请重试"),
    RPC_PROVIDER_NOT_FOUND(10006, "RPC未找到服务提供者", "系统处理失败，请重试"),
    RPC_INVALID_ACCESS_ROLE(10007, "无效的RPC接口访问角色", "系统处理失败，请重试"),
    RPC_METHOD_ACCESS_DENIED(10008, "RPC接口方法无访问权限", "系统处理失败，请重试");

    private int code;
    private String info;
    private String fixTips;

    private BaseCodeEnum(int code, String info, String fixTips) {
        this.code = code;
        this.info = info;
        this.fixTips = fixTips;
    }

    public int getCode() {
        return this.code;
    }

    public String getInfo() {
        return this.info;
    }

    public String getFixTips() {
        return this.fixTips;
    }
}