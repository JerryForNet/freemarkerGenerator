package ${package_name}.controller;

import java.util.Map;
import ${package_name}.common.ErrorCode;
import ${package_name}.common.ResultVO;
import ${package_name}.entity.${table_name};
import ${package_name}.service.${table_name}Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.stereotype.Controller;
import javax.annotation.Resource;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
<#if is_use_lombok == true>
import lombok.extern.slf4j.Slf4j;
<#else>
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
</#if>

/**
* 描述：${table_annotation} 控制层
* @author ${author}
* @date ${date}
*/
<#if is_use_lombok == true>
@Slf4j
</#if>
@Api(tags = { "${table_name}Controller ${table_annotation} 接口类" })
@Controller
@RequestMapping(value = "/${table_name}")
public class ${table_name}Controller {

<#if is_use_lombok == false>
    private final Logger log = LoggerFactory.getLogger(${table_name}Controller.class);
</#if>
    @Resource
    private ${table_name}Service service;

	@ApiOperation(value = "保存或更新")
	@ApiImplicitParam(paramType = "body", name = "entity", required = true, dataType = "${table_name}", value = "明细")
    @RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
    @ResponseBody
    public Object saveOrUpdate(@RequestBody ${table_name} entity){
        log.info("---->[saveOrUpdate] param entity={}", entity);
        try{
			int ret = service.saveOrUpdate(entity);
			if(ret ==0){
				log.error("---->[saveOrUpdate] error");
				return ResultVO.build(ErrorCode.DATABASE_EXCEPTION);
			}
			return ResultVO.build(ErrorCode.SUCCESS);
        }catch(Exception e){
            log.error("--->[saveOrUpdate] error,e={}", e);
			return ResultVO.build(ErrorCode.SYSTEM_INNER_FAILED);
        }
    }

	@ApiOperation(value = "更新非空字段")
	@ApiImplicitParam(paramType = "body", name = "entity", required = true, dataType = "${table_name}", value = "明细")
    @RequestMapping(value = "/updateWithoutNull", method = RequestMethod.POST)
	@ResponseBody
	public Object updateWithSelective(@RequestBody ${table_name} entity) {
		log.info("---->[updateWithSelective] param entity={}", entity);
		try {
			int ret = service.updateWithSelective(entity);
			if(ret ==0){
				log.error("---->[updateWithSelective] error");
				return ResultVO.build(ErrorCode.DATABASE_EXCEPTION);
			}
			return ResultVO.build(ErrorCode.SUCCESS);
		} catch (Exception e) {
			log.error("--->[updateWithSelective] error,e={}", e);
			return ResultVO.build(ErrorCode.SYSTEM_INNER_FAILED);
		}
	}

	@ApiOperation(value = "根据ID查找数据")
	@ApiImplicitParams({
			@ApiImplicitParam(paramType = "form", name = "id", required = true, dataType = "Long", value = "主键") })
    @RequestMapping(value = "/findById", method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Object findById(Long id){
        log.info("---->[findById] param id={}", id);
        try{
			${table_name} ${table_name?uncap_first} = service.findById(id);
            if(null == ${table_name?uncap_first}){
				log.error("---->[findById] get data is null, id={}", id);
				return ResultVO.build(ErrorCode.SYSTEM_INNER_FAILED);
			}
			return ResultVO.build(ErrorCode.SUCCESS, ${table_name?uncap_first});
        }catch(Exception e){
            log.error("--->[findById] error,e={}", e);
            return ResultVO.build(ErrorCode.SYSTEM_INNER_FAILED);
        }
    }

	@ApiOperation(value = "根据ID删除数据(物理删除)")
	@ApiImplicitParams({
			@ApiImplicitParam(paramType = "form", name = "id", required = true, dataType = "Long", value = "主键") })
    @RequestMapping(value = "/deleteById", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public Object deleteById(Long id) {
        log.info("---->[deleteById] param id={}", id);
		try {
			int ret = service.delete(id);
			if(ret == 0){
				log.error("--->[deleteById] db error");
				return ResultVO.build(ErrorCode.SYSTEM_INNER_FAILED);
			}
			return ResultVO.build(ErrorCode.SUCCESS);
		} catch (Exception e) {
			log.error("--->[deleteById] error,e={}", e);
			return ResultVO.build(ErrorCode.SYSTEM_INNER_FAILED);
		}
	}

	@ApiOperation(value = "根据ID删除数据(逻辑删除)")
	@ApiImplicitParams({
			@ApiImplicitParam(paramType = "form", name = "id", required = true, dataType = "Long", value = "主键") })
    @RequestMapping(value = "/deleteByIdLogic", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public Object deleteByIdLogic(Long id) {
        log.info("---->[deleteByIdLogic] param id={}", id);
		try {
			int ret = service.deleteLogic(id);
			if(ret == 0){
				log.error("--->[deleteByIdLogic] db error");
				return ResultVO.build(ErrorCode.SYSTEM_INNER_FAILED);
			}
			return ResultVO.build(ErrorCode.SUCCESS);
		} catch (Exception e) {
			log.error("--->[deleteByIdLogic] error,e={}", e);
			return ResultVO.build(ErrorCode.SYSTEM_INNER_FAILED);
		}
	}

	@ApiOperation(value = "获取数据列表（分页）")
	@ApiImplicitParam(paramType = "body", name = "queryMap", required = true, dataType = "Map", value = "查询条件")
    @RequestMapping(value = "/pageQuery", method = RequestMethod.POST)
	@ResponseBody
	public Object pageQuery(@RequestBody Map<String,Object> queryMap) {
		log.info("---->[pageQuery] param queryMap={}", queryMap);
		Integer pageNum = 1; //页数从1开始
		Integer pageSize = 10; //页面大小

		try {
			if(queryMap != null) {
				if(queryMap.get("pageNum") != null) {
					pageNum = Integer.parseInt(queryMap.get("pageNum").toString());
				}
				if(queryMap.get("pageSize") != null) {
					pageSize = Integer.parseInt(queryMap.get("pageSize").toString());
				}
			}

			Object pageInfo = service.selectPage(pageSize, pageNum, queryMap);
			return ResultVO.build(ErrorCode.SUCCESS, pageInfo);
		} catch (Exception e) {
			log.error("--->[pageQuery] error,e={}", e);
			return ResultVO.build(ErrorCode.SYSTEM_INNER_FAILED);
		}
	}

}