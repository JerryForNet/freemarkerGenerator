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
        codeGen.setPackageName("com.meeruu.sg.mall.apply");

//        codeGen.generate("", "product_apply_audit", "商品申请审核记录", true, false, true, "meeruu/");
        codeGen.generate("", "product_apply_audit", "商品申请详情及状态", true, false, true, "meeruu/");
        codeGen.generate("", "product_apply_submit", "商品申请详情及状态", true, false, true, "meeruu/");

    }
}










