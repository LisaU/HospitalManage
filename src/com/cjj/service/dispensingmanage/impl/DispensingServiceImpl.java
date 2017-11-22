package com.cjj.service.dispensingmanage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjj.dao.dispensingmanage.DispensingMapper;
import com.cjj.po.Dispensing;
import com.cjj.service.dispensingmanage.DispensingService;
import com.cjj.vo.DispensingVo;

@Transactional
@Service("dispensingService")
public class DispensingServiceImpl implements DispensingService {

	@Autowired
	private DispensingMapper dispensingMapper;

	@Override
	public List<DispensingVo> manyConditionsFind(DispensingVo t,
			int currentpage, int pagesize) {
		return dispensingMapper.manyConditionsFind(t, currentpage, pagesize);
	}

	@Override
	public int add(Dispensing t) {
		return dispensingMapper.insert(t);
	}

	@Override
	public int updatedispensingstatus(Dispensing t) {
		return dispensingMapper.updatedispensingstatus(t);
	}

	@Override
	public Dispensing findByRegisterId(int rid) {
		return dispensingMapper.findByRegisterId(rid);
	}

	@Override
	public int delete(int id) {
		return dispensingMapper.delete(id);
	}

}
