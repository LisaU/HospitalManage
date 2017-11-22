package com.cjj.service.baseinfo;

import java.util.List;

import com.cjj.core.common.BaseService;
import com.cjj.po.Chargetype;

public interface ChargetypeService extends BaseService<Chargetype, Integer>{
	/**
	 * 分页查询收费类别
	 * @param contant
	 * @param currentpage
	 * @param pagesize
	 * @return
	 */
	public List<Chargetype> vagueFind(String contant,int currentpage,int pagesize);
}
