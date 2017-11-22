package com.cjj.dao.baseinfo;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cjj.po.Attributedetail;

public interface AttributedetailMapper {
	/**
	 * 添加属性明细
	 * @param record
	 * @return
	 */
    int insert(Attributedetail record);
    
    /**
     * 根据属性id查询属性明细
     * @param id
     * @return
     */
    List<Attributedetail> findByAttributeid(Integer id);
    
    /**
     * 根据明细id查询明细
     * @param id
     * @return
     */
    Attributedetail selectByPrimaryKey(Integer id);

    /**
     * 修改属性明细
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Attributedetail record);
    
    /**
     * 删除属性明细
     * @param id
     * @return
     */
    int delete(Integer id);

    /**
     * 分页模糊查询属性明细
     * @param contant
     * @param currentpage
     * @param pagesize
     * @return
     */
    List<Attributedetail> vagueFind(@Param("contant")String contant,@Param("currentpage")Integer currentpage,@Param("pagesize")Integer pagesize);
}