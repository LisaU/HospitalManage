package com.cjj.service.system;

import com.cjj.po.Useunit;

public interface UseunitService {
	/**
	 * 查询第一条数据
	 * @return
	 */
	public Useunit findOne();
	
	/**
	 * 添加使用单位
	 * @param t
	 * @return
	 */
	public int add(Useunit t);
	
	/**
	 * 修改使用单位
	 * @param t
	 * @return
	 */
	public int edit(Useunit t);
}
