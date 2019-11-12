package ${package_name}.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import com.alibaba.fastjson.JSON;
import com.meeruu.common.utils.mapper.OrikaMapperUtils;
import com.github.pagehelper.PageInfo;
import java.util.*;
import ${package_name}.dto.${table_name}DTO;
import ${package_name}.entity.${table_name}Entity;
import ${package_name}.service.${table_name}Service;
import ${package_name}.repository.${table_name}Repository;


<#if is_use_lombok == true>
    import lombok.extern.slf4j.Slf4j;
<#else>
    import org.slf4j.Logger;
    import org.slf4j.LoggerFactory;
</#if>

/**
* 描述：${table_annotation} 业务实现层（数据由entity->DTO）
* @author ${author}
* @date ${date}
*/
<#if is_use_lombok == true>
    @Slf4j
</#if>
@Service
public class ${table_name}ServiceImpl implements ${table_name}Service {
<#if is_use_lombok == false>
    private final Logger log = LoggerFactory.getLogger(${table_name}ServiceImpl.class);
</#if>
@Autowired
private ${table_name}Repository ${table_name?uncap_first}Repository;


    @Override
    @Transactional
    public int saveOrUpdate(${table_name}DTO dto){
        if(Objects.isNull(dto)){
        throw new ServiceException(MerchantCode.PARAM_ERROR, "请求参数-NULL");
        }
        if(dto.getId()!=null&&this.findById(dto.getId())!=null){
            return ${table_name?uncap_first}Repository.update(OrikaMapperUtils.map(dto,${table_name}Entity.class));
        }else{
            return ${table_name?uncap_first}Repository.save(OrikaMapperUtils.map(dto,${table_name}Entity.class));
        }
    }


    @Override
    public PageInfo selectPage(int pageSize,int pageNum, ${table_name}DTO dto){
         return null;
    }


    @Override
    @Transactional
    public int save(${table_name}DTO dto){
        Assert.isNull(dto,"请求参数-NULL");

        return ${table_name?uncap_first}Repository.save(OrikaMapperUtils.map(dto,${table_name}Entity.class));
    }


    @Override
    @Transactional
    public int insertSelective(${table_name}DTO dto)  {
        Assert.isNull(dto,"请求参数-NULL");

        return ${table_name?uncap_first}Repository.insertSelective(OrikaMapperUtils.map(dto, ${table_name}Entity.class));
    }

    @Override
    @Transactional
    public int insertBatch(List<${table_name}DTO> dtoList)  {
        Assert.isNull(dtoList,"请求参数-NULL");

        return ${table_name?uncap_first}Repository.insertBatch(OrikaMapperUtils.mapList(dtoList,${table_name}DTO.class,${table_name}Entity.class));
    }


    @Override
    @Transactional
    public int delete(Integer id)  {
        Assert.isNull(id,"请求参数-NULL");

        return ${table_name?uncap_first}Repository.delete(id);
    }


    @Override
    @Transactional
    public int deleteLogic(Integer id)  {
        Assert.isNull(id,"请求参数-NULL");

        return ${table_name?uncap_first}Repository.deleteLogic(id);
    }


    @Override
    @Transactional
    public int deleteBatch(${table_name}DTO dto)  {
        Assert.isNull(dto,"请求参数-NULL");

        return ${table_name?uncap_first}Repository.deleteBatch(OrikaMapperUtils.map(dto, ${table_name}Entity.class));
    }

    @Override
    @Transactional
    public int update(${table_name}DTO dto)  {
        Assert.isNull(dto,"请求参数-NULL");

        return ${table_name?uncap_first}Repository.update(OrikaMapperUtils.map(dto, ${table_name}Entity.class));
    }


    @Override
    @Transactional
    public int updateWithSelective(${table_name}DTO dto)  {
        Assert.isNull(dto,"请求参数-NULL");

        return ${table_name?uncap_first}Repository.updateWithSelective(OrikaMapperUtils.map(dto, ${table_name}Entity.class));
    }


    @Override
    public ${table_name}DTO findById(Integer id)  {
        Assert.isNull(id,"请求参数-NULL");

       ${table_name}Entity ${table_name?uncap_first}Entity =${table_name?uncap_first}Repository.findById(id);
       if(Objects.isNull(${table_name?uncap_first}Entity)){
           return new ${table_name}DTO();
       }
       return OrikaMapperUtils.map(${table_name?uncap_first}Entity, ${table_name}DTO.class);
    }

    @Override
    public ${table_name}DTO findByIdForUpdate(Integer id) {
        Assert.isNull(id,"请求参数-NULL");

        ${table_name}Entity ${table_name?uncap_first}Entity =${table_name?uncap_first}Repository.findByIdForUpdate(id);
       if(Objects.isNull(${table_name?uncap_first}Entity)){
          return new ${table_name}DTO();
       }
       return OrikaMapperUtils.map(${table_name?uncap_first}Entity, ${table_name}DTO.class);
    }

    @Override
    public ${table_name}DTO selectFirstByParams(${table_name}DTO dto)  {
        Assert.isNull(dto,"请求参数-NULL");

        ${table_name}Entity ${table_name?uncap_first}Entity =${table_name?uncap_first}Repository.selectFirstByParams(OrikaMapperUtils.map(dto, ${table_name}Entity.class));
        if(Objects.isNull(${table_name?uncap_first}Entity)){
           return new ${table_name}DTO();
        }
        return OrikaMapperUtils.map(${table_name?uncap_first}Entity, ${table_name}DTO.class);
    }

    @Override
    public int countByParams(${table_name}DTO dto)  {
        Assert.isNull(dto,"请求参数-NULL");
        return  ${table_name?uncap_first}Repository.countByParams(OrikaMapperUtils.map(dto, ${table_name}Entity.class));
    }

    @Override
    public List<${table_name}DTO> selectByParams(${table_name}DTO dto)  {
        Assert.isNull(dto,"请求参数-NULL");

        List<${table_name}Entity> entityList =${table_name?uncap_first}Repository.selectByParams(OrikaMapperUtils.map(dto, ${table_name}Entity.class));
        if(CollectionUtils.isEmpty(entityList)){
          return new ArrayList<>();
        }
        return OrikaMapperUtils.mapList(entityList,${table_name}Entity.class, ${table_name}DTO.class);
    }

 }