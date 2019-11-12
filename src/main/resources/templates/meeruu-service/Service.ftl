package ${package_name}.service;

import java.util.*;
import ${package_name}.dto.${table_name}DTO;
import com.github.pagehelper.PageInfo;

/**
* 描述：${table_annotation} 业务层接口（数据由entity->DTO）
* @author ${author}
* @date ${date}
*/
public interface ${table_name}Service{

    /**
	 * 保存或更新
	 * @param dto
	 */
	int saveOrUpdate(${table_name}DTO dto) ;

    /**
     * 描述：分页获取数据信息
     * @param pageSize 页大小
     * @param pageNum 页码
     * @param dto 查询条件
     */
    PageInfo selectPage(int pageSize,int pageNum, ${table_name}DTO dto) ;


   /**
   * 描述：单条保存数据全部数据
   * @param dto
   */
   int save(${table_name}DTO dto) ;


  /**
   * 描述：单条保存非空字段
   * @param dto
   */
   int insertSelective(${table_name}DTO dto) ;


   /**
   * 描述：批量保存数据
   * @param dtoList
   */
   int insertBatch(List<${table_name}DTO> dtoList) ;


    /**
    * 描述：根据Id 删除数据
    * @param id
    */
    int delete(Integer id) ;


    /**
    * 描述：根据Id 逻辑删除数据
    * @param id
    */
    int deleteLogic(Integer id) ;


    /**
    * 描述：批量删除方法
    * @param dto
    */
    int deleteBatch(${table_name}DTO dto) ;


    /**
    * 描述：更新全部数据
    * @param dto
    */
    int update(${table_name}DTO dto) ;

    /**
    * 描述：更新非空字段数据
    * @param dto
    */
    int updateWithSelective(${table_name}DTO dto) ;


    /**
    * 描述：根据Id获取数据
    * @param id
    */
    ${table_name}DTO findById(Integer id);


    /**
    * 描述：根据Id获取数据行锁
    * @param id
    */
    ${table_name}DTO findByIdForUpdate(Integer id);


    /**
    * 描述：根据多个条件查询复合条件的最新的一条记录
    * @param dto
    */
    ${table_name}DTO selectFirstByParams(${table_name}DTO dto);



    /**
    * 描述：列表总数查询
    * @param dto 查询条件
    */
    int countByParams(${table_name}DTO dto) ;


    /**
    * 描述：根据查询条件获取数据列表
    * @param dto 查询条件
    */
    List<${table_name}DTO> selectByParams(${table_name}DTO dto) ;


}