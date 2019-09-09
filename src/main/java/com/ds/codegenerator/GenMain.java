package com.ds.codegenerator;

public class GenMain {


    public static void main(String[] args) throws Exception {

        CodeGenerateUtils codeGen = new CodeGenerateUtils();

        codeGen.setJdbcUrl("jdbc:mysql://172.16.10.10:3306/sg_product?allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&useSSL=false&zeroDateTimeBehavior=convertToNull");
        codeGen.setJdbcName("jure");
        codeGen.setJdbcPwd("Jure@123456");
        codeGen.setJdbcDriver("com.mysql.jdbc.Driver");

        codeGen.setAuthor("Jerry.Li");
        codeGen.setDiskPath("/Users/jerryli/IdeaProjects/codeGen/src/main/java/");
        codeGen.setPackageName("com.meeruu.sg.mall.merchant.merchant");

        codeGen.generate("", "merchant_mng", "供应商申请入住表", true, false, true, "meeruu/");
    }
}










