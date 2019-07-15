package ${package_name}.repository.impl;

import java.util.*;
import ${package_name}.repository.${table_name}Repository;
import ${package_name}.entity.${table_name}Entity;
import ${package_name}.dao.${table_name}Mapper;
import org.springframework.beans.factory.annotation.Autowired;
/*import org.springframework.context.annotation.Lazy;*/
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

<#if is_use_lombok == true>
import lombok.extern.slf4j.Slf4j;
<#else>
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
</#if>

/**
* 描述：${table_annotation} 数据实现层
* @author ${author}
* @date ${date}
*/
<#if is_use_lombok == true>
@Slf4j
</#if>
@Repository
public class ${table_name}RepositoryImpl implements ${table_name}Repository {

<#if is_use_lombok == false>
    private final Logger log = LoggerFactory.getLogger(${table_name}ServiceImpl.class);
</#if>

    //mysql数据库数据来源
    @Autowired
    private ${table_name}Mapper mapper;

    /*
    //redis缓存数据来源
    @NamedCache("default")
    private IRedisCache redisCache;*/

    /*
    //mongoDB数据来源
    @Autowired
    @Lazy
    private MongoTemplate mongoTemplate;*/



    @Override
    @Transactional
	public int save(${table_name}Entity entity) throws Exception{
        if(Objects.isNull(entity)){
            log.info("---->[${table_name}-Repository-save],请求参数-NULL ");
        }
        return mapper.save(entity);
    }

    @Override
    @Transactional
    public int insertSelective(${table_name}Entity entity) throws Exception {
        if(Objects.isNull(entity)){
            log.info("---->[${table_name}-Repository-insertSelective],请求参数-NULL ");
        }
        return mapper.insertSelective(entity);
    }

    @Override
    @Transactional
    public int insertBatch(List<${table_name}Entity> entityList) throws Exception {
        if(CollectionUtils.isEmpty(entityList)){
            log.info("---->[${table_name}-Repository-insertBatch],请求参数-NULL ");
        }
        return mapper.insertBatch(entityList);
    }


    @Override
    @Transactional
    public int delete(Long id) throws Exception{
        if(Objects.isNull(id)){
             log.info("---->[${table_name}-Repository-delete],请求参数-NULL ");
         }
         return mapper.delete(id);
    }


    @Override
    @Transactional
    public int deleteLogic(Long id) throws Exception{
       if(Objects.isNull(id)){
           log.info("---->[${table_name}-Repository-deleteLogic],请求参数-NULL ");
        }
        return mapper.deleteLogic(id);
    }

    @Override
    @Transactional
    public int deleteBatch(${table_name}Entity entity) throws Exception {
       if(Objects.isNull(entity)){
           log.info("---->[${table_name}-Repository-deleteBatch],请求参数-NULL ");
       }
       return mapper.deleteBatch(entity);
    }

    @Override
    @Transactional
    public int update(${table_name}Entity entity) throws Exception {
        if(Objects.isNull(entity)){
            log.info("---->[${table_name}-Repository-update],请求参数-NULL ");
        }
        return mapper.update(entity);
    }

    @Override
    @Transactional
    public int updateWithSelective(${table_name}Entity entity) throws Exception {
       if(Objects.isNull(entity)){
           log.info("---->[${table_name}-Repository-updateWithSelective],请求参数-NULL ");
       }
       return mapper.updateWithSelective(entity);
    }

    @Override
    public WarehouseTestEntity findById(Long id) throws Exception {
       if(Objects.isNull(id)){
           log.info("---->[${table_name}-Repository-findById],请求参数-NULL ");
           return null;
       }
       return mapper.findById(id);
    }

    @Override
    public WarehouseTestEntity findByIdForUpdate(Long id) throws Exception {
       if(Objects.isNull(id)){
           log.info("---->[${table_name}-Repository-findByIdForUpdate],请求参数-NULL ");
           return null;
       }
      return mapper.findByIdForUpdate(id);
    }

    @Override
    public WarehouseTestEntity selectFirstByParams(${table_name}Entity entity) throws Exception {
        if(Objects.isNull(entity)){
            log.info("---->[${table_name}-Repository-selectFirstByParams],请求参数-NULL ");
            return null;
        }
        return mapper.selectFirstByParams(entity);
    }

    @Override
    public int countByParams(${table_name}Entity entity) throws Exception {
        if(Objects.isNull(entity)){
            log.info("---->[${table_name}-Repository-countByParams],请求参数-NULL ");
            return 0;
        }
        return mapper.countByParams(entity);
    }

    @Override
    public List<${table_name}Entity> selectByParams(${table_name}Entity entity) throws Exception {
        if(Objects.isNull(entity)){
        log.info("---->[${table_name}-Repository-selectByParams],请求参数-NULL ");
        return null;
        }
        return mapper.selectByParams(entity);
        }


}