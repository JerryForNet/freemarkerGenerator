package com.mycode.mytest;

import org.springframework.boot.system.SystemProperties;

import java.nio.charset.Charset;

public class MyCharset {

    public static void main(String[] args) {
        char a = '中';
        System.out.print(a+"\n");
        System.out.print((int)a+"\n");

        String ab = "中国";

        System.out.print(ab+"\n");
        System.out.print(Integer.valueOf(ab));

    }


}
