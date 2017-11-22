package com.cjj.dao.system;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cjj.po.Role;
import com.cjj.vo.RoleVo;

public interface RoleMapper {
	/**
	 * 添加角色
	 * @param record
	 * @return
	 */
    int insert(Role record);
    
    /**
     * 查询角色，含rid和frid
     * @return
     */
    List<RoleVo> findRid();
    
    /**
     * 根据职务id查询角色
     * @param record
     * @return
     */
    List<RoleVo> findRidByPositionid(RoleVo record);

    /**
     * 根据id查询角色
     * @param id
     * @return
     */
    Role selectByPrimaryKey(Integer id);

    /**
     * 修改角色
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Role record);
    
    /**
     * 删除角色
     * @param id
     * @return
     */
    int delete(Integer id);
    
    /**
     * 分页模糊查询角色
     * @param contant
     * @param currentpage
     * @param pagesize
     * @return
     */
    List<Role> vagueFind(@Param("contant")String contant,@Param("currentpage")Integer currentpage,@Param("pagesize")Integer pagesize);
    
    /**
     * 根据员工id查询角色
     * @param eid
     * @return
     */
    Role findByEpId(Integer eid);
}