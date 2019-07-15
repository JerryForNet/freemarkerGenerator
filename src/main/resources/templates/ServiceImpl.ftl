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
       log.info("---->[${table_name}DTO-Service-saveOrUpdate],请求参数-NULL ");
       return 0;
       }
       try{
          if(dto.getId()!=null&&this.findById(dto.getId())!=null){
             return ${table_name?uncap_first}Repository.update(OrikaMapperUtils.map(dto,${table_name}Entity.class));
          }else{
             return ${table_name?uncap_first}Repository.save(OrikaMapperUtils.map(dto,${table_name}Entity.class));
         }

       }catch(Exception e){
            log.error("---->[${table_name}-Service-saveOrUpdate]异常，param-{} ",JSON.toJSONString(dto),e);
            return 0;
       }

    }


    @Override
    public PageInfo selectPage(int pageSize,int pageNum,WarehouseTestDTO dto){
         return null;
    }


    @Override
    @Transactional
    public int save(${table_name}DTO dto){
       if(Objects.isNull(dto)){
           log.info("---->[${table_name}-Service-save],请求参数-NULL ");
           return 0;
       }
       try{
           return ${table_name?uncap_first}Repository.save(OrikaMapperUtils.map(dto,${table_name}Entity.class));

       }catch(Exception e){
          log.error("---->[${table_name}-Service-save]异常，param-{} ",JSON.toJSONString(dto),e);
          return 0;
       }
    }


    @Override
    @Transactional
    public int insertSelective(${table_name}DTO dto)  {
        if(Objects.isNull(dto)){
            log.info("---->[${table_name}-Service-insertSelective],请求参数-NULL ");
            return 0;
        }
        try{
           return ${table_name?uncap_first}Repository.insertSelective(OrikaMapperUtils.map(dto, ${table_name}Entity.class));

       }catch (Exception e){
          log.error("---->[${table_name}-Service-insertSelective]异常，param-{} ", JSON.toJSONString(dto),e);

          return 0;
       }
    }

    @Override
    @Transactional
    public int insertBatch(List<${table_name}DTO> dtoList)  {
       if(CollectionUtils.isEmpty(dtoList)){
            log.info("---->[${table_name}-Service-insertBatch],请求参数-NULL ");
            return 0;
       }
       try{
           return ${table_name?uncap_first}Repository.insertBatch(OrikaMapperUtils.mapList(dtoList,${table_name}DTO.class,${table_name}Entity.class));

       }catch (Exception e){
           log.error("---->[${table_name}-Service-insertBatch]异常，param-{} ", JSON.toJSONString(dtoList),e);

           return 0;

       }
    }


    @Override
    @Transactional
    public int delete(Long id)  {
       if(Objects.isNull(id)){
           log.info("---->[${table_name}-Service-delete],请求参数-NULL ");
           return 0;
       }
       try{
           return ${table_name?uncap_first}Repository.delete(id);

       }catch (Exception e){
          log.error("---->[${table_name}-Service-delete]异常，param-{} ", JSON.toJSONString(id),e);

          return 0;

       }
    }


    @Override
    @Transactional
    public int deleteLogic(Long id)  {
        if(Objects.isNull(id)){
            log.info("---->[${table_name}-Service-deleteLogic],请求参数-NULL ");
            return 0;
        }
        try{
            return ${table_name?uncap_first}Repository.deleteLogic(id);

        }catch (Exception e){
           log.error("---->[${table_name}-Service-deleteLogic]异常，param-{} ", JSON.toJSONString(id),e);

           return 0;

        }
    }


    @Override
    @Transactional
    public int deleteBatch(${table_name}DTO dto)  {
        if(Objects.isNull(dto)){
            log.info("---->[${table_name}-Service-deleteBatch],请求参数-NULL ");
            return 0;
        }
        try{
           return ${table_name?uncap_first}Repository.deleteBatch(OrikaMapperUtils.map(dto, ${table_name}Entity.class));

        }catch (Exception e){
          log.error("---->[${table_name}-Service-deleteBatch]异常，param-{} ", JSON.toJSONString(dto),e);

          return 0;
        }
    }

    @Override
    @Transactional
    public int update(${table_name}DTO dto)  {
        if(Objects.isNull(dto)){
            log.info("---->[${table_name}-Service-update],请求参数-NULL ");
            return 0;
        }
        try{
            return ${table_name?uncap_first}Repository.update(OrikaMapperUtils.map(dto, ${table_name}Entity.class));

        }catch (Exception e){
           log.error("---->[${table_name}-Service-update]异常，param-{} ", JSON.toJSONString(dto),e);

           return 0;

        }
    }


    @Override
    @Transactional
    public int updateWithSelective(${table_name}DTO dto)  {
        if(Objects.isNull(dto)){
           log.info("---->[${table_name}-Service-updateWithSelective],请求参数-NULL ");
           return 0;
        }
        try{
           return ${table_name?uncap_first}Repository.updateWithSelective(OrikaMapperUtils.map(dto, ${table_name}Entity.class));

        }catch (Exception e){
           log.error("---->[${table_name}-Service-updateWithSelective]异常，param-{} ", JSON.toJSONString(dto),e);

           return 0;

        }
    }


    @Override
    public ${table_name}DTO findById(Long id)  {
       if(Objects.isNull(id)){
            log.info("---->[${table_name}-Service-findById],请求参数-NULL ");
            return new ${table_name}DTO();
       }
       try{
           ${table_name}Entity ${table_name?uncap_first}Entity =${table_name?uncap_first}Repository.findById(id);
           if(Objects.isNull(${table_name?uncap_first}Entity)){
               return new ${table_name}DTO();
           }
           return OrikaMapperUtils.map(${table_name?uncap_first}Entity, ${table_name}DTO.class);
       }catch (Exception e){
           log.error("---->[${table_name}-Service-findById]异常，param-{} ", JSON.toJSONString(id),e);

           return new ${table_name}DTO();

       }

    }

    @Override
    public ${table_name}DTO findByIdForUpdate(Long id) {
         if(Objects.isNull(id)){
             log.info("---->[${table_name}-Service-findByIdForUpdate],请求参数-NULL ");
             return new ${table_name}DTO();
         }
         try{
           ${table_name}Entity ${table_name?uncap_first}Entity =${table_name?uncap_first}Repository.findByIdForUpdate(id);
           if(Objects.isNull(warehouseTestEntity)){
              return new ${table_name}DTO();
           }
           return OrikaMapperUtils.map(${table_name?uncap_first}Entity, ${table_name}DTO.class);

         }catch (Exception e){
           log.error("---->[${table_name}-Service-findByIdForUpdate]异常，param-{} ", JSON.toJSONString(id),e);

            return new ${table_name}DTO();

         }

    }

    @Override
    public ${table_name}DTO selectFirstByParams(${table_name}DTO dto)  {
        if(Objects.isNull(dto)){
            log.info("---->[${table_name}-Service-selectFirstByParams],请求参数-NULL ");
            return new ${table_name}DTO();
        }
        try{
            ${table_name}Entity ${table_name?uncap_first}Entity =${table_name?uncap_first}Repository.selectFirstByParams(OrikaMapperUtils.map(dto, ${table_name}Entity.class));
            if(Objects.isNull(${table_name?uncap_first}Entity)){
               return new ${table_name}DTO();
            }
            return OrikaMapperUtils.map(${table_name?uncap_first}Entity, ${table_name}DTO.class);

        }catch (Exception e){
            log.error("---->[${table_name}-Service-selectFirstByParams]异常，param-{} ", JSON.toJSONString(dto),e);

            return new ${table_name}DTO();

        }

    }

    @Override
    public int countByParams(${table_name}DTO dto)  {
          if(Objects.isNull(dto)){
              log.info("---->[${table_name}-Service-countByParams],请求参数-NULL ");
              return 0;
          }
          try{
             return  ${table_name?uncap_first}Repository.countByParams(OrikaMapperUtils.map(dto, ${table_name}Entity.class));

          }catch (Exception e){
             log.error("---->[${table_name?uncap_first}-Service-countByParams]异常，param-{} ", JSON.toJSONString(dto),e);

             return 0;

          }

    }

    @Override
    public List<${table_name}DTO> selectByParams(${table_name}DTO dto)  {
        if(Objects.isNull(dto)){
            log.info("---->[${table_name}-Service-selectByParams],请求参数-NULL ");
            return new ArrayList<>();
        }
        try{
            List<${table_name}Entity> entityList =${table_name?uncap_first}Repository.selectByParams(OrikaMapperUtils.map(dto, ${table_name}Entity.class));
            if(CollectionUtils.isEmpty(entityList)){
              return new ArrayList<>();
            }
            return OrikaMapperUtils.mapList(entityList,${table_name}Entity.class, ${table_name}DTO.class);

         }catch (Exception e){
                log.error("---->[${table_name}-Service-selectByParams]异常，param-{} ", JSON.toJSONString(dto),e);

                 return new ArrayList<>();

            }
         }



 }