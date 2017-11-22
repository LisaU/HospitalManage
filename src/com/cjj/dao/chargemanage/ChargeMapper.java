package com.cjj.dao.chargemanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cjj.po.Charge;
import com.cjj.vo.ChargeVo;

public interface ChargeMapper {
	/**
	 * 添加收费信息
	 * @param record
	 * @return
	 */
    int insert(Charge record);
    
    /**
     * 根据id查询收费信息
     * @param id
     * @return
     */
    Charge selectByPrimaryKey(Integer id);
    
    /**
     * 分页多条件查询收费记录
     * @param record
     * @param currentpage
     * @param pagesize
     * @return
     */
    List<ChargeVo> manyConditionsFindHistory(@Param("vo")ChargeVo record,
    		@Param("currentpage")Integer currentpage,@Param("pagesize")Integer pagesize);
    
    /**
     * 查询最后一条收费信息
     * @return
     */
    ChargeVo findLast();

    /**
     * 修改收费信息
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Charge record);
    
    /**
     * 删除收费信息
     * @param id
     * @return
     */
    int delete(Integer id);
}