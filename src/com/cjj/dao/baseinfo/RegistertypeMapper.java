package com.cjj.dao.baseinfo;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cjj.po.Registertype;

public interface RegistertypeMapper {
	/**
	 * 添加挂号类别
	 * @param record
	 * @return
	 */
    int insert(Registertype record);
    
    /**
     * 查询挂号类别
     * @return
     */
    List<Registertype> findAll();
    
    /**
     * 查询前三个挂号类别
     * @return
     */
    List<Registertype> findBefor();

    /**
     * 根据id查询挂号类别
     * @param id
     * @return
     */
    Registertype selectByPrimaryKey(Integer id);

    /**
     * 修改挂号类别
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Registertype record);
    
    /**
     * 删除挂号类别
     * @param id
     * @return
     */
    int delete(Integer id);
    
    /**
     * 分页模糊查询
     * @param contant
     * @param currentpage
     * @param pagesize
     * @return
     */
    List<Registertype> vagueFind(@Param("contant")String contant,@Param("currentpage")Integer currentpage,@Param("pagesize")Integer pagesize);
}