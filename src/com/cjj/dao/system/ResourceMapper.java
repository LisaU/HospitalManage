package com.cjj.dao.system;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cjj.po.Resource;
import com.cjj.vo.ResourceVo;

public interface ResourceMapper {
	/**
	 * 添加资源
	 * @param record
	 * @return
	 */
    int insert(Resource record);
    
    /**
     * 根据资源上级id集合查询上级id为0的资源
     * @param pids
     * @return
     */
    List<ResourceVo> findFByPids(String pids);
    
    /**
     * 根据资源id集合查询所有资源
     * @param pids
     * @return
     */
    List<ResourceVo> findByPids(String pids);
    
    /**
     * 查询所有资源及其子资源
     * @return
     */
    List<ResourceVo> findAllSp();
    
    /**
     * 根据医院上级id查询资源
     * @param spid
     * @return
     */
    List<Resource> findBySpId(Integer spid);

    /**
     * 根据资源id查询资源
     * @param id
     * @return
     */
    Resource selectByPrimaryKey(Integer id);

    /**
     * 修改资源
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Resource record);
    
    /**
     * 删除资源
     * @param ids
     * @return
     */
    int delete(@Param("ids") List<Integer> ids);
}