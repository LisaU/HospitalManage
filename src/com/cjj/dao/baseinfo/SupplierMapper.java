package com.cjj.dao.baseinfo;

import java.util.List;

import com.cjj.po.Supplier;

public interface SupplierMapper {
	/**
	 * 查询供货商信息
	 * @return
	 */
    List<Supplier> findAll();
}