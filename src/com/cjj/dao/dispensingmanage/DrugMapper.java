package com.cjj.dao.dispensingmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cjj.po.Drug;
import com.cjj.vo.DrugVo;

public interface DrugMapper {
	/**
	 * 添加药品
	 * @param record
	 * @return
	 */
    int insert(Drug record);
    
    /**
     * 分页多条件查询药品
     * @param vo
     * @param currentpage
     * @param pagesize
     * @return
     */
    List<DrugVo> manyConditionsFind(@Param("vo") DrugVo vo,@Param("currentpage")Integer currentpage,@Param("pagesize")Integer pagesize);
    
    /**
     * 模糊查询药品
     * @param contant
     * @return
     */
    List<DrugVo> vagueFind(String contant);
    
    /**
     * 根据id查询药品
     * @param id
     * @return
     */
    DrugVo findByid(Integer id);
    
    /**
     * 添加库存/库存报损
     * @param record
     * @return
     */
    int updateInventoryquantity(Drug record);
    
    /**
     * 修改药品
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Drug record);
    
    /**
     * 删除药品
     * @param id
     * @return
     */
    int delete(Integer id);
}