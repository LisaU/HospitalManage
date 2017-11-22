package com.cjj.service.baseinfo.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjj.dao.baseinfo.PatienttypeMapper;
import com.cjj.po.Patienttype;
import com.cjj.service.baseinfo.PatienttypeService;

@Transactional
@Service("patienttypeService")
public class PatienttypeServiceImpl implements PatienttypeService{

	@Autowired
	private PatienttypeMapper patienttypeMapper;
	
	@Override
	public List<Patienttype> findAll() {
		return patienttypeMapper.findAll();
	}

	@Override
	public int add(Patienttype t) {
		return patienttypeMapper.insert(t);
	}

	@Override
	public Patienttype findById(int id) {
		return patienttypeMapper.selectByPrimaryKey(id);
	}

	@Override
	public int edit(Patienttype t) {
		return patienttypeMapper.updateByPrimaryKeySelective(t);
	}

	@Override
	public int delete(int id) {
		return patienttypeMapper.delete(id);
	}

	@Override
	public List<Patienttype> vagueFind(String contant, int currentpage,
			int pagesize) {
		return patienttypeMapper.vagueFind(contant, currentpage, pagesize);
	}

}
