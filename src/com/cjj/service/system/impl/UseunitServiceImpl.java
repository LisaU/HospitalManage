package com.cjj.service.system.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjj.dao.system.UseunitMapper;
import com.cjj.po.Useunit;
import com.cjj.service.system.UseunitService;

@Transactional
@Service("useunitService")
public class UseunitServiceImpl implements UseunitService {

	@Autowired
	private UseunitMapper useunitMapper;
	
	@Override
	public Useunit findOne() {
		return useunitMapper.findOne();
	}

	@Override
	public int add(Useunit t) {
		return useunitMapper.insert(t);
	}

	@Override
	public int edit(Useunit t) {
		return useunitMapper.updateByPrimaryKeySelective(t);
	}
}
