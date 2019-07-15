package com.ds.codegenerator;

public class GenMain {


    public static void main(String[] args) throws Exception {

        CodeGenerateUtils codeGen = new CodeGenerateUtils();

        codeGen.setJdbcUrl("jdbc:mysql://172.16.10.10:3306/sg_merchant?allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&useSSL=false&zeroDateTimeBehavior=convertToNull");
        codeGen.setJdbcName("jure");
        codeGen.setJdbcPwd("Jure@123456");
        codeGen.setJdbcDriver("com.mysql.jdbc.Driver");

        codeGen.setAuthor("Jerry.Li");
        codeGen.setDiskPath("/Users/jerryli/IdeaProjects/codeGen/src/main/java/");
        codeGen.setPackageName("com.mycode.merchant");

        codeGen.generate("", "merchant", "商家基础表", true, true, true);
    }
}










