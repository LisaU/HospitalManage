package com.cjj.service.registermanage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjj.dao.registermanage.RegisterMapper;
import com.cjj.po.Register;
import com.cjj.service.registermanage.RegisterService;
import com.cjj.vo.RegisterVo;

@Transactional
@Service("registerService")
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	private RegisterMapper registerMapper;
	
	@Override
	public List<RegisterVo> findAll() {
		return registerMapper.findAll();
	}

	@Override
	public RegisterVo findLast() {
		return registerMapper.findLast();
	}

	@Override
	public RegisterVo countInfo() {
		return registerMapper.countInfo();
	}	

	@Override
	public int add(Register t) {
		return registerMapper.insert(t);
	}

	@Override
	public List<RegisterVo> pageFindToday(int currentpage, int pagesize) {
		return registerMapper.pageFindToday(currentpage, pagesize);
	}

	@Override
	public List<RegisterVo> vagueFind(RegisterVo t) {
		return registerMapper.vagueFind(t);
	}

	@Override
	public List<RegisterVo> manyConditionsFindhistory(RegisterVo vo,int currentpage,int pagesize) {
		return registerMapper.manyConditionsFindhistory(vo,currentpage,pagesize);
	}

	@Override
	public RegisterVo findByid(int id) {
		return registerMapper.findByid(id);
	}

	@Override
	public int delete(int id) {
		return registerMapper.delete(id);
	}

	@Override
	public int updatestatus(Register t) {
		return registerMapper.updatestatus(t);
	}
}
