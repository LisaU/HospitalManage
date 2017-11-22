package com.cjj.service.baseinfo;

import java.util.List;

import com.cjj.core.common.BaseService;
import com.cjj.po.Patienttype;

public interface PatienttypeService extends BaseService<Patienttype, Integer>{
	/**
	 * 分页查询病人类别
	 * @param contant
	 * @param currentpage
	 * @param pagesize
	 * @return
	 */
	List<Patienttype> vagueFind(String contant,int currentpage,int pagesize);
}
