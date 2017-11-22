package com.cjj.service.baseinfo.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjj.dao.baseinfo.RegistertypeMapper;
import com.cjj.po.Registertype;
import com.cjj.service.baseinfo.RegistertypeService;

@Transactional
@Service("registertypeService")
public class RegistertypeServiceImpl implements RegistertypeService{

	@Autowired
	private RegistertypeMapper registertypeMapper;

	@Override
	public List<Registertype> findBefor() {
		return registertypeMapper.findBefor();
	}

	@Override
	public List<Registertype> findAll() {
		return registertypeMapper.findAll();
	}

	@Override
	public int add(Registertype t) {
		return registertypeMapper.insert(t);
	}

	@Override
	public Registertype findById(int id) {
		return registertypeMapper.selectByPrimaryKey(id);
	}

	@Override
	public int edit(Registertype t) {
		return registertypeMapper.updateByPrimaryKeySelective(t);
	}

	@Override
	public int delete(int id) {
		return registertypeMapper.delete(id);
	}

	@Override
	public List<Registertype> vagueFind(String contant, int currentpage,
			int pagesize) {
		return registertypeMapper.vagueFind(contant, currentpage, pagesize);
	}
	

}
