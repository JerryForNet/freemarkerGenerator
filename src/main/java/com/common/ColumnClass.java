package com.common;

import lombok.Builder;
import lombok.Data;


@Data
public class ColumnClass {

    public ColumnClass() {
    }

    /**
     * 数据库字段名称
     **/
    private String columnName;

    /**
     * 数据库字段类型
     **/
    private String columnType;

    /**
     * 数据库字段首字母小写且去掉下划线字符串
     **/
    private String changeColumnName;

    /**
     * 数据库字段注释
     **/
    private String columnComment;

    public ColumnClass(String columnName, String columnType, String columnComment) {
        this.columnName = columnName;
        this.columnType = columnType;
        this.columnComment = columnComment;
        this.changeColumnName = columnName;
    }

    public ColumnClass(String columnName, String columnType, String columnComment, String changeColumnName) {
        this.columnName = columnName;
        this.columnType = columnType;
        this.columnComment = columnComment;
        this.changeColumnName = changeColumnName;
    }
}
