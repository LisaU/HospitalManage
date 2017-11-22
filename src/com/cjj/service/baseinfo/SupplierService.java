package com.cjj.service.baseinfo;

import java.util.List;

import com.cjj.po.Supplier;

public interface SupplierService {
	/**
	 * 查询供应商
	 * @return
	 */
	public List<Supplier> findAll();
}
