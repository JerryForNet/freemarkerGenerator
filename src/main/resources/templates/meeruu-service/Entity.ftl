package ${package_name}.entity;
import java.util.Date;
import java.math.BigDecimal;
<#if is_use_lombok == true>
import lombok.Data;
</#if>

/**
* 描述：${table_annotation}模型
* @author ${author}
* @date ${date}
*/
<#if is_use_lombok == true>
@Data
</#if>
public class ${table_name}Entity{

<#assign dataType = "String">


<#if model_column?exists>
    <#list model_column as model>
    /**
    *${model.columnComment!}
    */
    <#if (model.columnType?upper_case=='VARCHAR' || model.columnType?upper_case=='TEXT')>
        <#assign dataType = "String">
    <#elseif (model.columnType?upper_case=='TIMESTAMP' || model.columnType?upper_case=='DATETIME') >
        <#assign dataType = "Date">
    <#elseif model.columnType?upper_case == 'BIGINT' >
        <#assign dataType = "Long">
    <#elseif model.columnType?upper_case == 'DECIMAL' >
        <#assign dataType = "BigDecimal">
    <#elseif model.columnType?upper_case == 'TINYINT' ||  model.columnType?upper_case == 'INT' || model.columnType?upper_case == 'INT UNSIGNED' >
        <#assign dataType = "Integer">
    </#if>
    private ${dataType} ${model.changeColumnName?uncap_first};

    </#list>
</#if>



<#if is_use_lombok == false>
<#if model_column?exists>
    <#list model_column as model>
        <#if (model.columnType?upper_case=='VARCHAR' || model.columnType?upper_case=='TEXT')>
            <#assign dataType = "String">
        <#elseif (model.columnType?upper_case=='TIMESTAMP' || model.columnType?upper_case=='DATETIME') >
            <#assign dataType = "Date">
        <#elseif model.columnType?upper_case == 'BIGINT' >
            <#assign dataType = "Long">
        <#elseif model.columnType?upper_case == 'DECIMAL' >
            <#assign dataType = "BigDecimal">
        <#elseif model.columnType?upper_case == 'TINYINT' ||  model.columnType?upper_case == 'INT' || model.columnType?upper_case == 'INT UNSIGNED' >
            <#assign dataType = "Integer">
        </#if>
    public ${dataType} get${model.changeColumnName}() {
        return this.${model.changeColumnName?uncap_first};
    }

    public void set${model.changeColumnName}(${dataType} ${model.changeColumnName?uncap_first}) {
        this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
    }

    </#list>
</#if>
</#if>

<#if is_use_lombok == false>
<#if model_column?exists>
    @Override
    public String toString() {
        return "${table_name}{" +
        <#list model_column as model>
        <#if model_index==0>
            <#if (model.columnType?upper_case == 'INT' || model.columnType?upper_case == 'BIGINT'
                || model.columnType?upper_case == 'DECIMAL'|| model.columnType?upper_case == 'INT UNSIGNED'
                || model.columnType?upper_case == 'TINYINT')>
            "${model.changeColumnName?uncap_first}=" + ${model.changeColumnName?uncap_first} +
            <#else>
            "${model.changeColumnName?uncap_first}='" + ${model.changeColumnName?uncap_first} +'\'' +
            </#if>
        <#else>
            <#if (model.columnType?upper_case == 'INT' || model.columnType?upper_case == 'BIGINT'
            || model.columnType?upper_case == 'DECIMAL' || model.columnType?upper_case == 'INT UNSIGNED'
            || model.columnType?upper_case == 'TINYINT')>
            ", ${model.changeColumnName?uncap_first}=" + ${model.changeColumnName?uncap_first} +
            <#else>
            ", ${model.changeColumnName?uncap_first}='" + ${model.changeColumnName?uncap_first} +'\'' +
            </#if>
        </#if>
        </#list>
            '}';
    }
</#if>
</#if>

}