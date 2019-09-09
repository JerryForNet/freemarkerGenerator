package ${package_name}.dto;

import java.util.Date;
import java.math.BigDecimal;
import io.swagger.annotations.ApiModelProperty;
<#if is_use_lombok == true>
import lombok.Data;
</#if>

/**
 *  描述：${table_annotation}模型
 * @author ${author}
 * @date ${date}
 */
<#if is_use_lombok == true>
@Data
</#if>
public class ${table_name}VO {

<#assign dataType = "String">
<#if model_column?exists>
    <#list model_column as model>
        <#if (model.columnType?upper_case=='VARCHAR' || model.columnType?upper_case=='TEXT')>
            <#assign dataType = "String">
        <#elseif (model.columnType?upper_case=='TIMESTAMP' || model.columnType?upper_case=='DATETIME') >
            <#assign dataType = "Date">
        <#elseif model.columnType?upper_case == 'BIGINT' >
            <#assign dataType = "Long">
        <#elseif model.columnType?upper_case == 'INT' || model.columnType?upper_case == 'INT UNSIGNED' || model.columnType?upper_case == 'TINYINT'>
            <#assign dataType = "Integer">
        <#elseif model.columnType?upper_case == 'DECIMAL' >
            <#assign dataType = "BigDecimal">
        </#if>
    /**
     * ${model.columnComment!}
     */
    @ApiModelProperty(name = "${model.changeColumnName!}", value = "${model.columnComment!}")
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
            <#elseif model.columnType?upper_case == 'INT' >
                <#assign dataType = "Integer">
            <#elseif model.columnType?upper_case == 'INT UNSIGNED' >
                <#assign dataType = "Integer">
            <#elseif model.columnType?upper_case == 'DECIMAL' >
                <#assign dataType = "BigDecimal">
            <#elseif model.columnType?upper_case == 'TINYINT' >
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

}