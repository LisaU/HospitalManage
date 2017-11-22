package com.cjj.service.dispensingmanage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjj.dao.dispensingmanage.DrugMapper;
import com.cjj.po.Drug;
import com.cjj.service.dispensingmanage.DrugService;
import com.cjj.vo.DrugVo;

@Transactional
@Service("drugService")
public class DrugServiceImpl implements DrugService {

	@Autowired
	private DrugMapper drugMapper;

	@Override
	public int add(Drug t) {
		int i;
		drugMapper.insert(t);
		i = t.getId();
		return i;
	}

	@Override
	public List<DrugVo> manyConditionsFind(DrugVo t,int currentpage,int pagesize) {
		return drugMapper.manyConditionsFind(t,currentpage,pagesize);
	}

	@Override
	public List<DrugVo> vagueFind(String contant) {
		return drugMapper.vagueFind(contant);
	}

	@Override
	public Drug findById(int id) {
		return drugMapper.findByid(id);
	}

	@Override
	public int edit(Drug t) {
		return drugMapper.updateByPrimaryKeySelective(t);
	}

	@Override
	public int updateInventoryquantity(Drug t) {
		return drugMapper.updateInventoryquantity(t);
	}

	@Override
	public int delete(int id) {
		return drugMapper.delete(id);
	}

	@Override
	public List<Drug> findAll() {
		// TODO Auto-generated method stub
		return null;
	}
}
