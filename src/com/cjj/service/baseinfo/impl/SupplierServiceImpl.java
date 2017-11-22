package com.cjj.service.baseinfo.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjj.dao.baseinfo.SupplierMapper;
import com.cjj.po.Supplier;
import com.cjj.service.baseinfo.SupplierService;

@Transactional
@Service("supplierService")
public class SupplierServiceImpl implements SupplierService {

	@Autowired
	private SupplierMapper supplierMapper;

	@Override
	public List<Supplier> findAll() {
		return supplierMapper.findAll();
	}
	
	

}
