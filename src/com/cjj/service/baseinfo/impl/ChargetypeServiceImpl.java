package com.cjj.service.baseinfo.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjj.dao.baseinfo.ChargetypeMapper;
import com.cjj.po.Chargetype;
import com.cjj.service.baseinfo.ChargetypeService;

@Transactional
@Service("chargetypeService")
public class ChargetypeServiceImpl implements ChargetypeService {

	@Autowired
	private ChargetypeMapper chargetypeMapper;
	
	@Override
	public List<Chargetype> findAll() {
		return chargetypeMapper.findAll();
	}

	@Override
	public int add(Chargetype t) {
		return chargetypeMapper.insert(t);
	}

	@Override
	public Chargetype findById(int id) {
		return chargetypeMapper.selectByPrimaryKey(id);
	}

	@Override
	public int edit(Chargetype t) {
		return chargetypeMapper.updateByPrimaryKeySelective(t);
	}

	@Override
	public int delete(int id) {
		return chargetypeMapper.delete(id);
	}

	@Override
	public List<Chargetype> vagueFind(String contant, int currentpage,
			int pagesize) {
		return chargetypeMapper.vagueFind(contant, currentpage, pagesize);
	}

}
