package com.cjj.service.baseinfo;

import java.util.List;

import com.cjj.core.common.BaseService;
import com.cjj.po.Registertype;

public interface RegistertypeService extends BaseService<Registertype, Integer>{
	/**
	 * 查询前三个挂号类别
	 * @return
	 */
	public List<Registertype> findBefor();
	
	/**
	 * 分页查询挂号类别
	 * @param contant
	 * @param currentpage
	 * @param pagesize
	 * @return
	 */
	public List<Registertype> vagueFind(String contant,int currentpage,int pagesize);
}
