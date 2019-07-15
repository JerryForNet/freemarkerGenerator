package com.mycode;

import lombok.Builder;

@Builder
public class ResultVO<T> {

    private int code;
    private String desc;
    private T data;

    public ResultVO<T> success(T data) {
        this.code = 10000;
        this.data = data;
        this.desc = "业务处理成功";
        return this;
    }

    public ResultVO<T> error(Integer code, String desc) {
        this.code = code;
        this.data = null;
        this.desc = desc;
        return this;
    }


}
