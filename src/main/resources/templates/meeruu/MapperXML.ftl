<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${package_name}.infrastructure.repository.mapper.${table_name}Mapper">

<#if model_column?exists>
    <sql id="searchColumns">
    <#list model_column as model>
        <#if model_has_next>
            ${model.columnName} ${model.changeColumnName?uncap_first},
        <#else>
            ${model.columnName} ${model.changeColumnName?uncap_first}
        </#if>
    </#list>
    </sql>
</#if>

    <sql id="limit_1_sql">LIMIT 1</sql>
    <sql id="order_by_sql">ORDER BY id DESC</sql>

    <!-- 单条保存数据全部数据 -->
    <insert id="insert" useGeneratedKeys="true" keyProperty="id" parameterType="${package_name}.entity.${table_name}Entity">
        insert into
        ${table_name_small}(
        <#list model_column as model>
            <#if model_has_next>
            ${model.columnName},
            <#else>
            ${model.columnName}
            </#if>
        </#list>
        )
        values (
        <#list model_column as model>
            <#if model_has_next>
            <#noparse>#{</#noparse>${model.changeColumnName?uncap_first}},
            <#else>
            <#noparse>#{</#noparse>${model.changeColumnName?uncap_first}}
            </#if>
        </#list>
        )
    </insert>

    <!-- 单条保存非空字段 -->
    <insert id="insertSelective" useGeneratedKeys="true" keyProperty="id"  parameterType="${package_name}.entity.${table_name}Entity">
        insert into ${table_name_small}
        <trim prefix="(" suffix=")" suffixOverrides=",">
            <#list model_column as model>
                <#if model.columnName!="id">
                    <#if model.columnName=="is_test">
                        ${model.columnName},
                    <#else>
                        <if test="${model.changeColumnName?uncap_first} != null">${model.columnName},</if>
                    </#if>
                </#if>
            </#list>
        </trim>
        <trim prefix="VALUES (" suffix=")" suffixOverrides=",">
            <#list model_column as model>
                <#if model.columnName!="id">
                    <#if model.columnName=="is_test">
                        ${r'#{'}${model.columnName}${r'}'},
                    <#else>
                        <if test="${model.changeColumnName?uncap_first} != null">${r'#{'}${model.changeColumnName?uncap_first}${r'}'},</if>
                    </#if>
                </#if>
            </#list>
        </trim>
    </insert>

    <!-- 批量保存数据 -->
    <insert id="insertBatch" parameterType="java.util.List">
        insert into
        ${table_name_small}(
        <#list model_column as model>
            <#if model_has_next>
                ${model.columnName},
            <#else>
                ${model.columnName}
            </#if>
        </#list>
        )
        <trim prefix="VALUES" suffixOverrides=",">
            <if test="list != null">
                <foreach collection="list" item="item" index="index" separator=",">
                    <trim prefix="(" suffix=")" suffixOverrides=",">
                        <#list model_column as model>
                            <#if model.columnName!="id">
                                ${r'#{item.'}${model.changeColumnName?uncap_first}${r'}'},
                            </#if>
                        </#list>
                    </trim>
                </foreach>
            </if>
        </trim>
    </insert>



    <!-- 查询方法  -->
    <!-- 根据主键ID查询 -->
    <select id="findById" resultType="${package_name}.entity.${table_name}Entity">
        select
        <include refid="searchColumns"/>
        from ${table_name_small}
        <where>
            and id=<#noparse>#{</#noparse>id}
            and is_deleted=0
        </where>
    </select>

    <!-- 根据主键ID查询（行锁） -->
    <select id="findByIdForUpdate" resultType="${package_name}.entity.${table_name}Entity">
        select
        <include refid="searchColumns"/>
        from ${table_name_small}
        <where>
            and id=<#noparse>#{</#noparse>id}
            and is_deleted=0
        </where>
        for update
    </select>


    <!-- 根据主键多个条件查询复合条件的最新的一条记录 -->
    <select id="selectFirstByParams" resultType="${package_name}.entity.${table_name}Entity" parameterType="${package_name}.entity.${table_name}Entity">
        select
        <include refid="searchColumns"/>
        from ${table_name_small}
        <where>
            <#list model_column as model>
                <if test="${model.changeColumnName?uncap_first} != null"> and ${model.columnName}=<#noparse>#{</#noparse>${model.changeColumnName?uncap_first}}</if>
            </#list>
        </where>

        <include refid="order_by_sql"/>
        <include refid="limit_1_sql"/>
    </select>

    <!-- 列表查询 -->
    <select id="selectByParams" resultType="${package_name}.entity.${table_name}Entity" parameterType="java.util.Map">
        select
        <include refid="searchColumns" />
        from ${table_name_small}
        <where>
            <#list model_column as model>
                <if test="${model.changeColumnName?uncap_first} != null"> and ${model.columnName}=<#noparse>#{</#noparse>${model.changeColumnName?uncap_first}}</if>
            </#list>
        </where>
    </select>

    <!-- 列表总数查询 -->
    <select id="countByParams" resultType="java.lang.Integer" parameterType="java.util.HashMap">
        select
        count(1)
        from ${table_name_small}
        <where>
            <#list model_column as model>
                <if test="${model.changeColumnName?uncap_first} != null"> and ${model.columnName}=<#noparse>#{</#noparse>${model.changeColumnName?uncap_first}}</if>
            </#list>
        </where>
    </select>


    <!-- 更新方法 -->
    <!-- 根据ID更新所有字段 -->
    <update id="update" parameterType="${package_name}.entity.${table_name}Entity">
        update ${table_name_small}
        <set>
        <#list model_column as model>
            <#if model.columnName != 'id'>
            ${model.columnName}=<#noparse>#{</#noparse>${model.changeColumnName?uncap_first}},
            </#if>
        </#list>
        </set>
        where id = <#noparse>#{</#noparse>id}
    </update>

    <!-- 根据ID更新非空字段 -->
    <update id="updateWithSelective" parameterType="${package_name}.entity.${table_name}Entity">
        update ${table_name_small}
        <set>
            <#list model_column as model>
                <#if model.columnName != 'id'>
            <if test="${model.changeColumnName?uncap_first} != null"> ${model.columnName}=<#noparse>#{</#noparse>${model.changeColumnName?uncap_first}},</if>
                </#if>
            </#list>
        </set>
        where id = <#noparse>#{</#noparse>id}
    </update>


    <!-- 批量删除方法  -->
    <delete id="deleteBatch" parameterType="${package_name}.entity.${table_name}Entity">
        delete from ${table_name_small}
        <where>
            <#list model_column as model>
                <if test="${model.changeColumnName?uncap_first} != null"> and ${model.columnName}=<#noparse>#{</#noparse>${model.changeColumnName?uncap_first}}</if>
            </#list>
        </where>
    </delete>

    <!-- 根据ID物理删除 -->
    <delete id="delete">
        delete from ${table_name_small}
        where id = <#noparse>#{</#noparse>id}
    </delete>

    <!-- 根据ID逻辑删除 -->
    <update id="deleteLogic">
        update ${table_name_small} set is_deleted = 1 where id = <#noparse>#{</#noparse>id}
    </update

</mapper>