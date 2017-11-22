package com.cjj.service.system;

import java.util.List;

import com.cjj.core.common.BaseService;
import com.cjj.po.Resource;
import com.cjj.vo.ResourceVo;

public interface ResourceService extends BaseService<Resource, Integer>{
	
	/**
	 * 查询全部资源，含各个资源的父元素
	 * @return
	 */
	public List<ResourceVo> findAllSp();
	
	/**
	 * 删除多个资源
	 * @param ids
	 * @return
	 */
	public int deleteMore(String ids);
	
	/**
	 * 根据职务id集合查询资源fid为0的资源
	 * @param pids
	 * @return
	 */
	public List<ResourceVo> findFByPids(String pids);
	
	/**
	 * 根据职务id集合查询所有资源
	 * @param pids
	 * @return
	 */
	public List<ResourceVo> findByPids(String pids);
}
