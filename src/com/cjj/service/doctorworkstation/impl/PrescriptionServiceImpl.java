package com.cjj.service.doctorworkstation.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjj.dao.doctorworkstation.PrescriptionMapper;
import com.cjj.po.Prescription;
import com.cjj.service.doctorworkstation.PrescriptionService;
import com.cjj.vo.PrescriptionVo;

@Transactional
@Service("prescriptionService")
public class PrescriptionServiceImpl implements PrescriptionService {

	@Autowired
	private PrescriptionMapper prescriptionMapper;

	@Override
	public List<PrescriptionVo> manyConditionsFind(PrescriptionVo t,int currentpage,int pagesize) {
		return prescriptionMapper.manyConditionsFind(t,currentpage,pagesize);
	}

	@Override
	public Prescription findRepetitionByCode(String prescriptioncode) {
		return prescriptionMapper.findRepetitionByCode(prescriptioncode);
	}

	@Override
	public int add(Prescription t) {
		prescriptionMapper.insert(t);
		return prescriptionMapper.findmaxid();
	}

	@Override
	public PrescriptionVo findByid(int id) {
		return prescriptionMapper.findByid(id);
	}

	@Override
	public int edit(Prescription t) {
		int id = 0;
		prescriptionMapper.updateByPrimaryKeySelective(t);
		id = t.getId();
		return id;
	}

	@Override
	public int delete(int id) {
		prescriptionMapper.delete(id);
		return id;
	}

	@Override
	public List<PrescriptionVo> vagueFind(String contant) {
		return prescriptionMapper.vagueFind(contant);
	}

	@Override
	public List<Prescription> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Prescription findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}	

}
