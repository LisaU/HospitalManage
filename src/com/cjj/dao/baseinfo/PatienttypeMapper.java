package com.cjj.dao.baseinfo;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cjj.po.Patienttype;

public interface PatienttypeMapper {
	/**
	 * 添加病人类别
	 * @param record
	 * @return
	 */
    int insert(Patienttype record);
    
    /**
     * 查询病人类别
     * @return
     */
    List<Patienttype> findAll();

    /**
     * 根据id查询病人类别
     * @param id
     * @return
     */
    Patienttype selectByPrimaryKey(Integer id);

    /**
     * 修改病人类别
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Patienttype record);
    
    /**
     * 删除病人类别
     * @param id
     * @return
     */
    int delete(Integer id);
    
    /**
     * 分页模糊查询挂号信息
     * @param contant
     * @param currentpage
     * @param pagesize
     * @return
     */
    List<Patienttype> vagueFind(@Param("contant")String contant,@Param("currentpage")Integer currentpage,@Param("pagesize")Integer pagesize);
}