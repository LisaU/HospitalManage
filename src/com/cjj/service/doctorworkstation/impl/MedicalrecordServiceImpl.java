package com.cjj.service.doctorworkstation.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjj.dao.doctorworkstation.MedicalrecordMapper;
import com.cjj.po.Medicalrecord;
import com.cjj.service.doctorworkstation.MedicalrecordService;
import com.cjj.vo.MedicalrecordVo;

@Transactional
@Service("/medicalrecordService")
public class MedicalrecordServiceImpl implements MedicalrecordService {

	@Autowired
	private MedicalrecordMapper medicalrecordMapper;
	
	@Override
	public List<MedicalrecordVo> manyConditionsFind(MedicalrecordVo t,int currentpage,int pagesize) {
		return medicalrecordMapper.manyConditionsFind(t,currentpage,pagesize);
	}

	@Override
	public Medicalrecord findRepetition(String medicalrecordcode) {
		return medicalrecordMapper.findRepetition(medicalrecordcode);
	}

	@Override
	public int add(Medicalrecord t) {
		return medicalrecordMapper.insert(t);
	}

	@Override
	public Medicalrecord findById(int id) {
		return medicalrecordMapper.selectByPrimaryKey(id);
	}

	@Override
	public int delete(int id) {
		return medicalrecordMapper.delete(id);
	}

	@Override
	public int edit(Medicalrecord t) {
		return medicalrecordMapper.updateByPrimaryKeySelective(t);
	}

	@Override
	public List<Medicalrecord> findAll() {
		// TODO Auto-generated method stub
		return null;
	}
}
