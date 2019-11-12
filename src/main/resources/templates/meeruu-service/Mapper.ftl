package ${package_name}.dao;

import java.util.List;
import ${package_name}.entity.${table_name}Entity;

/**
 * 描述：${table_annotation} mapper层接口
 * @author ${author}
 * @date ${date}
 */
public interface ${table_name}Mapper{

    /**
     * 描述：单条保存数据全部数据
     *
     * @param entity
    */
    int insert(${table_name}Entity entity);

    /**
     * 描述：单条保存非空字段
     *
     * @param entity
     */
    int insertSelective(${table_name}Entity entity);

    /**
     * 描述：批量保存数据
     *
     * @param entityList
     */
    int insertBatch(List<${table_name}Entity> entityList);


    /**
     * 描述：根据Id 删除数据
     *
     * @param id
     */
    int delete(Integer id);

    /**
     * 描述：根据Id 逻辑删除数据
     *
     * @param id
     */
    int deleteLogic(Integer id);

    /**
     * 描述：批量删除方法
     *
     * @param entity
     */
    int deleteBatch(${table_name}Entity entity);


    /**
     * 描述：更新全部数据
     *
     * @param entity
     */
    int update(${table_name}Entity entity);

    /**
     * 描述：更新非空字段数据
     *
     * @param entity
     */
    int updateWithSelective(${table_name}Entity entity);


    /**
     * 描述：根据Id获取数据
     *
     * @param id
     */
    ${table_name}Entity findById(Integer id)throws Exception;

    /**
     * 描述：根据Id获取数据行锁
     *
     * @param id
     */
    ${table_name}Entity findByIdForUpdate(Integer id)throws Exception;


    /**
     * 描述：根据多个条件查询复合条件的最新的一条记录
     *
     * @param entity
     */
    ${table_name}Entity selectFirstByParams(${table_name}Entity entity)throws Exception;

    /**
     * 描述：根据查询条件获取数据列表
     *
     * @param entity 查询条件
     */
    List<${table_name}Entity> selectByParams(${table_name}Entity entity);

   /**
    * 描述：列表总数查询
    *
    * @param entity 查询条件
    */
   int countByParams(${table_name}Entity entity);

}