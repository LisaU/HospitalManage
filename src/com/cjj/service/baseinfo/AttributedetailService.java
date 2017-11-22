package com.cjj.service.baseinfo;

import java.util.List;

import com.cjj.core.common.BaseService;
import com.cjj.po.Attributedetail;

public interface AttributedetailService extends BaseService<Attributedetail, Integer>{
	/**
	 * 根据属性id查询属性明细
	 * @param id
	 * @return
	 */
	public List<Attributedetail> findByAttributeid(int id);
	
	/**
	 * 分页查询属性明细
	 * @param contant
	 * @param currentpage
	 * @param pagesize
	 * @return
	 */
	public List<Attributedetail> vagueFind(String contant,int currentpage,int pagesize);
}
