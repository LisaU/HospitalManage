package com.cjj.dao.baseinfo;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cjj.po.Chargetype;

public interface ChargetypeMapper {
	/**
	 * 添加收费类别
	 * @param record
	 * @return
	 */
    int insert(Chargetype record);
    
    /**
     * 查询收费类别
     * @return
     */
    List<Chargetype> findAll();

    /**
     * 根据id查询收费类别
     * @param id
     * @return
     */
    Chargetype selectByPrimaryKey(Integer id);
    
    /**
     * 修改收费类别
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Chargetype record);
    
    /**
     * 删除收费类别
     * @param id
     * @return
     */
    int delete(Integer id);
    
    /**
     * 分页模糊查询收费类别
     * @param contant
     * @param currentpage
     * @param pagesize
     * @return
     */
    List<Chargetype> vagueFind(@Param("contant")String contant,@Param("currentpage")Integer currentpage,@Param("pagesize")Integer pagesize);
}