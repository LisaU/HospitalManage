package com.cjj.service.doctorworkstation.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjj.dao.doctorworkstation.MedicalrecordtemplateMapper;
import com.cjj.po.Medicalrecordtemplate;
import com.cjj.service.doctorworkstation.MedicalrecordtemplateService;
import com.cjj.vo.MedicalrecordtemplateVo;

@Transactional
@Service("/medicalrecordtemplateService")
public class MedicalrecordtemplateServiceImpl implements MedicalrecordtemplateService {

	@Autowired
	private MedicalrecordtemplateMapper medicalrecordtemplateMapper;
	
	@Override
	public List<MedicalrecordtemplateVo> manyConditionsFind(MedicalrecordtemplateVo t,int currentpage,int pagesize) {
		return medicalrecordtemplateMapper.manyConditionsFind(t,currentpage,pagesize);
	}

	@Override
	public int add(Medicalrecordtemplate t) {
		return medicalrecordtemplateMapper.insert(t);
	}

	@Override
	public Medicalrecordtemplate findRepetitionByCode(String templatecode) {
		return medicalrecordtemplateMapper.findRepetitionByCode(templatecode);
	}

	@Override
	public Medicalrecordtemplate findById(int id) {
		return medicalrecordtemplateMapper.selectByPrimaryKey(id);
	}

	@Override
	public int edit(Medicalrecordtemplate t) {
		return medicalrecordtemplateMapper.updateByPrimaryKeySelective(t);
	}

	@Override
	public int delete(int id) {
		return medicalrecordtemplateMapper.delete(id);
	}

	@Override
	public List<MedicalrecordtemplateVo> vagueFind(String contant) {
		return medicalrecordtemplateMapper.vagueFind(contant);
	}

	@Override
	public Medicalrecordtemplate findRepetitionByName(String templatename) {
		return medicalrecordtemplateMapper.findRepetitionByName(templatename);
	}

	@Override
	public List<Medicalrecordtemplate> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
