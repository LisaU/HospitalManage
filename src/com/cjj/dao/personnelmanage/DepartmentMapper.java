package com.cjj.dao.personnelmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cjj.po.Department;

public interface DepartmentMapper {
	/**
	 * 添加科室部门
	 * @param record
	 * @return
	 */
    int insert(Department record);
    
    /**
     * 查询科室部门
     * @return
     */
    List<Department> findAll();
    
    /**
     * 查询科室是否可以挂号
     * @return
     */
    List<Department> findIsRgs();
    
    /**
     * 根据职务id查询科室部门
     * @param id
     * @return
     */
    List<Department> findDptByPid(Integer id);
    
    /**
     * 查询最后一个部门的编号
     * @return
     */
    Department findLastCode();

    /**
     * 根据科室id查询科室
     * @param id
     * @return
     */
    Department selectByPrimaryKey(Integer id);

    /**
     * 修改科室部门
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Department record);
    
    /**
     * 删除科室部门
     * @param id
     * @return
     */
    int delete(Integer id);
    
    /**
     * 分页模糊查询科室部门
     * @param contant
     * @param currentpage
     * @param pagesize
     * @return
     */
    List<Department> vagueFind(@Param("contant")String contant,@Param("currentpage")Integer currentpage,@Param("pagesize")Integer pagesize);
}