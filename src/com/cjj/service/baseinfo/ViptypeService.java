package com.cjj.service.baseinfo;

import java.util.List;

import com.cjj.po.Viptype;

public interface ViptypeService{
	/**
	 * 查询会员类别
	 * @return
	 */
	public List<Viptype> findAll();
}
