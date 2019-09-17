package com.ds.codegenerator;

import lombok.extern.slf4j.Slf4j;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Stream;

/**
 * @author jerryli
 * @description
 * @date 2019-09-09 17:10
 */
@Slf4j
public class JsonGenerator {

    public static void main(String[] args) throws Exception {
        Map<String, Object> dataMap = new HashMap<>();

        // 类属性
        dataMap.put("package_name", "com.meeruu.admin.web.model.productV2");
        dataMap.put("table_name_small", "product");
        dataMap.put("table_name", "ProductSkuSearch");
        dataMap.put("table_annotation", "商品价格查询参数");

        // 需要生成的字段在这里写
        List<ColumnClass> columnClassList = new ArrayList<>();
        columnClassList.add(new ColumnClass("merchantName", "VARCHAR", "公司名称"));
        columnClassList.add(new ColumnClass("product", "VARCHAR", "商品"));
        columnClassList.add(new ColumnClass("skuCode", "VARCHAR", "商品SKU"));
        columnClassList.add(new ColumnClass("productName", "VARCHAR", "商品名称"));
        columnClassList.add(new ColumnClass("categoryId", "VARCHAR", "三级分类"));
        columnClassList.add(new ColumnClass("skuName", "VARCHAR", "商品规格"));
        columnClassList.add(new ColumnClass("type", "INTEGER", "商品类型"));
        columnClassList.add(new ColumnClass("freightTemplateCode", "VARCHAR", "运费结算模板编号"));
        columnClassList.add(new ColumnClass("freightTemplateName", "VARCHAR", "运费结算模板"));
        columnClassList.add(new ColumnClass("sellFreightTemplateCode", "VARCHAR", "运费售价模板编号"));
        columnClassList.add(new ColumnClass("sellFreightTemplateName", "VARCHAR", "运费售价模板"));
        columnClassList.add(new ColumnClass("settlementPrice", "VARCHAR", "商品结算价"));
        columnClassList.add(new ColumnClass("sellPrice", "VARCHAR", "商品售价"));
        columnClassList.add(new ColumnClass("groupPrice", "VARCHAR", "商品拼店价"));


        columnClassList.add(new ColumnClass("groupPrice", "VARCHAR", "小促价格"));
        columnClassList.add(new ColumnClass("groupPrice", "VARCHAR", "大促价格"));


        columnClassList.add(new ColumnClass("groupPrice", "VARCHAR", "销售毛利"));
        columnClassList.add(new ColumnClass("groupPrice", "VARCHAR", "成本利润率"));
        columnClassList.add(new ColumnClass("groupPrice", "VARCHAR", "自购奖励金"));
        columnClassList.add(new ColumnClass("groupPrice", "VARCHAR", "推广奖励金"));
        columnClassList.add(new ColumnClass("groupPrice", "VARCHAR", "写手奖励金"));
        columnClassList.add(new ColumnClass("groupPrice", "VARCHAR", "运营推广金"));
        columnClassList.add(new ColumnClass("groupPrice", "VARCHAR", "价格模板"));

        columnClassList.add(new ColumnClass("groupPrice", "VARCHAR", "分润模板1"));
        columnClassList.add(new ColumnClass("groupPrice", "VARCHAR", "分润模板2"));
        columnClassList.add(new ColumnClass("groupPrice", "VARCHAR", "分润模板3"));






        dataMap.put("model_column", columnClassList);


        // 默认
        dataMap.put("author", "Jerry.Li");
        dataMap.put("date", new SimpleDateFormat("yyyy/MM/dd").format(new Date()));
        dataMap.put("is_use_lombok", true);


        CodeGenerateUtils codeGen = new CodeGenerateUtils();
        String filePath = "/Users/jerryli/mycode/ProductSkuSearchVO.java";
        File file = new File(filePath);
        if (file.exists()) {
            log.info("文件已存在");
            return;
        }

        codeGen.setAuthor(dataMap.get("author").toString());
        codeGen.setPackageName(dataMap.get("package_name").toString());

        codeGen.generateFileByTemplate(dataMap.get("table_name").toString(), dataMap.get("table_annotation").toString()
                , true, dataMap.get("table_name").toString()
                , "meeruu/VO.ftl", file, dataMap);



    }
}
