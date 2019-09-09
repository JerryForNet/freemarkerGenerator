package com.ds.codegenerator;

import freemarker.template.Configuration;
import freemarker.template.Template;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.ResourceUtils;
import org.springframework.util.StringUtils;

import java.io.*;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.*;

@Data
@Slf4j
public class CodeGenerateUtils {
    private String author;
    private String packageName;
    private String jdbcUrl;
    private String jdbcName;
    private String jdbcPwd;
    private String jdbcDriver;
    private String diskPath;
    private static Configuration config = new Configuration();

    // 自定义属性  start

    // 自定义属性 end


    public CodeGenerateUtils() {
    }

    public CodeGenerateUtils(String author, String jdbcUrl, String jdbcName, String jdbcPwd, String jdbcDriver,
                             String diskPath, String packageName) {
        this.author = author;
        this.jdbcUrl = jdbcUrl;
        this.jdbcName = jdbcName;
        this.jdbcPwd = jdbcPwd;
        this.jdbcDriver = jdbcDriver;
        this.diskPath = diskPath;
        this.packageName = packageName;
    }

    public Connection getConnection() throws Exception {
        Class.forName(jdbcDriver);
        Connection connection = DriverManager.getConnection(jdbcUrl, jdbcName, jdbcPwd);
        return connection;
    }


    static {
        try {
            config.setDirectoryForTemplateLoading(new File(ResourceUtils.getURL("classpath:").getPath() + "templates" + File.separator));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /**
     * 默认  tableAnnotation= tableName 覆盖为false  有controller
     *
     * @param tableName
     * @return
     * @throws Exception
     */
    public boolean generate(String prefix, String tableName) throws Exception {
        boolean isOverwrite = false;
        boolean haveController = true;
        String tableAnnotation = tableName;
        boolean isUseLombok = false;
        return generate(prefix, tableName, tableAnnotation, isOverwrite, haveController, isUseLombok, "");
    }

    /**
     * 默认  覆盖为false  有controller
     *
     * @param tableName
     * @param tableAnnotation
     * @return
     * @throws Exception
     */
    public boolean generate(String prefix, String tableName, String tableAnnotation) throws Exception {
        boolean isOverwrite = false;
        boolean haveController = true;
        boolean isUseLombok = false;
        return generate(prefix, tableName, tableAnnotation, isOverwrite, haveController, isUseLombok, "");
    }


    /**
     * 最全参数的
     *
     * @param prefix          前缀
     * @param tableName       表名
     * @param tableAnnotation 表说明
     * @param isOverwrite     是否覆盖文件
     * @param haveController  是否生成controller文件
     * @param isUseLombok     是否使用lombok
     * @return
     * @throws Exception
     */
    public boolean generate(String prefix, String tableName, String tableAnnotation, boolean isOverwrite, boolean haveController, boolean isUseLombok, String templateType) throws Exception {
        ResultSet resultSet = null;

        try {
            Connection connection = getConnection();
            DatabaseMetaData databaseMetaData = connection.getMetaData();
            resultSet = databaseMetaData.getColumns(null, "%", tableName, "%");

            List<ColumnClass> columnClassList = new ArrayList<>();
            ColumnClass columnClass = null;
            while (resultSet.next()) {
                columnClass = new ColumnClass();

                //获取字段名称
                columnClass.setColumnName(resultSet.getString("COLUMN_NAME"));

                //获取字段类型
                columnClass.setColumnType(resultSet.getString("TYPE_NAME"));

                //转换字段名称，如 sys_name 变成 sysName
                columnClass.setChangeColumnName(replaceUnderLineAndUpperCase(resultSet.getString("COLUMN_NAME")));

                //字段在数据库的注释
                columnClass.setColumnComment(resultSet.getString("REMARKS"));
                columnClassList.add(columnClass);

                log.info("---> name=[" + columnClass.getColumnName() + "],type=[" + columnClass.getColumnType() + "],comment=[" + columnClass.getColumnComment() + "]");
            }

            if (haveController == true) {
                //生成Controller层文件
                generateFile(prefix, tableName, tableAnnotation, isUseLombok, isOverwrite, "controller", "Controller.java", templateType + "Controller.ftl", columnClassList);
            }

            //生成Mapper文件
            generateFile(prefix, tableName, tableAnnotation, isUseLombok, isOverwrite, "mapper", "Mapper.xml", templateType + "MapperXML.ftl", columnClassList);

            //生成服务层接口文件
            generateFile(prefix, tableName, tableAnnotation, isUseLombok, isOverwrite, "service", "Service.java", templateType + "Service.ftl", columnClassList);

            //生成服务实现层文件
            generateFile(prefix, tableName, tableAnnotation, isUseLombok, isOverwrite, "service" + File.separator + "impl", "ServiceImpl.java", templateType + "ServiceImpl.ftl", columnClassList);

            //生成Dao文件
            generateFile(prefix, tableName, tableAnnotation, isUseLombok, isOverwrite, "dao", "Mapper.java", templateType + "Mapper.ftl", columnClassList);

            //生成DTO文件
            generateFile(prefix, tableName, tableAnnotation, isUseLombok, isOverwrite, "dto", "DTO.java", templateType + "DTO.ftl", columnClassList);

            //生成Model文件
            generateFile(prefix, tableName, tableAnnotation, isUseLombok, isOverwrite, "entity", "Entity.java", templateType + "Entity.ftl", columnClassList);

            //生成Repository文件
            generateFile(prefix, tableName, tableAnnotation, isUseLombok, isOverwrite, "repository", "Repository.java", templateType + "Repository.ftl", columnClassList);

            //生成Repository实现层
            generateFile(prefix, tableName, tableAnnotation, isUseLombok, isOverwrite, "repository" + File.separator + "impl", "RepositoryImpl.java", templateType + "RepositoryImpl.ftl", columnClassList);

            return true;
        } catch (Exception e) {
            log.error("gen [" + tableName + "] err, e=" + e.getMessage(), e);
            e.printStackTrace();
            return false;
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
        }
    }


    private void generateFile(String prefix, String tableName, String tableAnnotation, boolean isUseLombok
            , boolean isOverwrite, String subPath, String suffix, String templateName
            , List<ColumnClass> columnClassList) throws Exception {
        final String path = diskPath + packageName.replace(".", File.separator) + File.separator + subPath + File.separator;
        String tableNameWithoutPrefix = tableName;
        if (prefix != null) {
            tableNameWithoutPrefix = tableName.substring(tableName.indexOf(prefix) + prefix.length());
        }
        String changeTableName = replaceUnderLineAndUpperCase(tableNameWithoutPrefix);
        String filePath = path + changeTableName + suffix;
        File pathFile = new File(path);
        if (!pathFile.exists()) {
            pathFile.mkdirs();
        }

        File mapperFile = new File(filePath);
        if (mapperFile.exists() && isOverwrite == false) {
            return;
        }
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("model_column", columnClassList);
        log.info("正在生成文件[" + filePath + "]...");

        generateFileByTemplate(tableName, tableAnnotation, isUseLombok, changeTableName, templateName, mapperFile, dataMap);
    }

    public void generateFileByTemplate(String tableName, String tableAnnotation, boolean isUseLombok, String changeTableName,
                                        final String templateName, File file, Map<String, Object> dataMap) throws Exception {

        dataMap.put("table_name_small", tableName);
        dataMap.put("table_name", changeTableName);
        dataMap.put("author", author);
        dataMap.put("date", new SimpleDateFormat("yyyy/MM/dd").format(new Date()));
        dataMap.put("package_name", packageName);
        dataMap.put("table_annotation", tableAnnotation);
        dataMap.put("is_use_lombok", isUseLombok);

        Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "utf-8"), 10240);

        Template template = config.getTemplate(templateName);
        template.process(dataMap, out);
    }

    private String replaceUnderLineAndUpperCase(String str) {
        StringBuffer sb = new StringBuffer();
        sb.append(str);
        int count = sb.indexOf("_");
        while (count != 0) {
            int num = sb.indexOf("_", count);
            count = num + 1;
            if (num != -1) {
                char ss = sb.charAt(count);
                char ia = (char) (ss - 32);
                sb.replace(count, count + 1, ia + "");
            }
        }
        String result = sb.toString().replaceAll("_", "");
        return StringUtils.capitalize(result);
    }
}
