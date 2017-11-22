package com.cjj.service.doctorworkstation.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjj.dao.doctorworkstation.PrescriptiontemplateMapper;
import com.cjj.po.Prescriptiontemplate;
import com.cjj.service.doctorworkstation.PrescriptiontemplateService;
import com.cjj.vo.PrescriptiontemplateVo;

@Transactional
@Service("prescriptiontemplateService")
public class PrescriptiontemplateServiceImpl implements
		PrescriptiontemplateService {

	@Autowired
	private PrescriptiontemplateMapper prescriptiontemplateMapper;
	
	@Override
	public List<PrescriptiontemplateVo> manyConditionsFind(
			PrescriptiontemplateVo t,int currentpage,int pagesize) {
		return prescriptiontemplateMapper.manyConditionsFind(t,currentpage,pagesize);
	}

	@Override
	public List<PrescriptiontemplateVo> vagueFind(String contant) {
		return prescriptiontemplateMapper.vagueFind(contant);
	}

	@Override
	public int add(Prescriptiontemplate t) {
		prescriptiontemplateMapper.insert(t);
		return prescriptiontemplateMapper.findmaxid();
	}

	@Override
	public PrescriptiontemplateVo findByid(int id) {
		return prescriptiontemplateMapper.findByid(id);
	}

	@Override
	public int edit(Prescriptiontemplate t) {
		int id = 0;
		prescriptiontemplateMapper.updateByPrimaryKeySelective(t);
		id = t.getId();
		return id;
	}

	@Override
	public int delete(int id) {		
		prescriptiontemplateMapper.delete(id);
		return id;
	}

	@Override
	public Prescriptiontemplate findRepetitionByName(String templatename) {
		return prescriptiontemplateMapper.findRepetitionByName(templatename);
	}

	@Override
	public List<Prescriptiontemplate> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Prescriptiontemplate findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
}
