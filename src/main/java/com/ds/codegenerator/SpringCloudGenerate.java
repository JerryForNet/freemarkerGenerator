package com.ds.codegenerator;

import com.common.HSFGenerateUtils;
import com.common.SpringColudGenerateUtils;
import com.common.TemplateTypeEnum;

/**
 * Spring Cloud 代码生成
 */
public class SpringCloudGenerate {


    public static void main(String[] args) throws Exception {

        SpringColudGenerateUtils codeGen = new SpringColudGenerateUtils();

        codeGen.setJdbcUrl("jdbc:mysql://172.16.10.10:3306/sg_merchant?allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&useSSL=false&zeroDateTimeBehavior=convertToNull");
        codeGen.setJdbcName("jure");
        codeGen.setJdbcPwd("Jure@123456");
        codeGen.setJdbcDriver("com.mysql.jdbc.Driver");

        codeGen.setAuthor("Jerry.Li");
        codeGen.setDiskPath("/Users/jerryli/IdeaProjects/codeGen/src/main/java/");
        codeGen.setPackageName("com.meeruu.sg.mall.apply");


        codeGen.generateMS("","merchant","商家信息表", TemplateTypeEnum.MEERUUSERVICE);

    }
}










