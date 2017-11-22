package com.cjj.dao.dispensingmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cjj.po.Dispensing;
import com.cjj.vo.DispensingVo;

public interface DispensingMapper {
	/**
	 * 发药
	 * @param record
	 * @return
	 */
    int insert(Dispensing record);
    
    /**
     * 根据发药id查询发药信息
     * @param id
     * @return
     */
    Dispensing selectByPrimaryKey(Integer id);
    
    /**
     * 分页多条件查询发药信息
     * @param record
     * @param currentpage
     * @param pagesize
     * @return
     */
    List<DispensingVo> manyConditionsFind(@Param("vo")DispensingVo record,
    		@Param("currentpage")Integer currentpage,@Param("pagesize")Integer pagesize);
    
    /**
     * 根据挂号id查询发药信息
     * @param rid
     * @return
     */
    Dispensing findByRegisterId(Integer rid);
    
    /**
     * 退药
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Dispensing record);
    
    /**
     * 修改发药状态
     * @param record
     * @return
     */
    int updatedispensingstatus(Dispensing record);
    
    /**
     * 删除发药信息
     * @param id
     * @return
     */
    int delete(Integer id);
}