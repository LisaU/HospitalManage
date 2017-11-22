package com.cjj.service.baseinfo.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjj.dao.baseinfo.ViptypeMapper;
import com.cjj.po.Viptype;
import com.cjj.service.baseinfo.ViptypeService;

@Transactional
@Service("viptypeService")
public class ViptypeServiceImpl implements ViptypeService{

	@Autowired
	private ViptypeMapper viptypeMapper;
	
	@Override
	public List<Viptype> findAll() {
		return viptypeMapper.findAll();
	}

}
