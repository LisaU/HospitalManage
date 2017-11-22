package com.cjj.service.chargemanage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjj.dao.chargemanage.ChargeMapper;
import com.cjj.po.Charge;
import com.cjj.service.chargemanage.ChargeService;
import com.cjj.vo.ChargeVo;

@Transactional
@Service("chargeService")
public class ChargeServiceImpl implements ChargeService {

	@Autowired
	private ChargeMapper chargeMapper;
	
	@Override
	public ChargeVo findLast() {
		return chargeMapper.findLast();
	}

	@Override
	public int add(Charge t) {
		int id = 0;
		chargeMapper.insert(t);
		id = t.getId();
		return id;
	}

	@Override
	public List<ChargeVo> manyConditionsFindHistory(ChargeVo t,
			int currentpage, int pagesize) {
		return chargeMapper.manyConditionsFindHistory(t, currentpage, pagesize);
	}

	@Override
	public int delete(int id) {
		return chargeMapper.delete(id);
	}

}
