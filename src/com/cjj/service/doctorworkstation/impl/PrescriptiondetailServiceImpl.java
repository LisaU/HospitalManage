package com.cjj.service.doctorworkstation.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjj.dao.doctorworkstation.PrescriptiondetailMapper;
import com.cjj.po.Prescriptiondetail;
import com.cjj.service.doctorworkstation.PrescriptiondetailService;
import com.cjj.vo.PrescriptiondetailVo;

@Transactional
@Service("prescriptiondetailService")
public class PrescriptiondetailServiceImpl implements PrescriptiondetailService {

	@Autowired
	private PrescriptiondetailMapper prescriptiondetailMapper;
	
	@Override
	public List<PrescriptiondetailVo> findByPrescriptionid(int id) {
		return prescriptiondetailMapper.findByPrescriptionid(id);
	}

	@Override
	public List<PrescriptiondetailVo> findZyByPrescriptionId(int id) {
		return prescriptiondetailMapper.findZyByPrescriptionId(id);
	}

	@Override
	public List<PrescriptiondetailVo> findXyByPrescriptionId(int id) {
		return prescriptiondetailMapper.findXyByPrescriptionId(id);
	}

	@Override
	public List<Prescriptiondetail> findByRegisterid(int id) {
		return prescriptiondetailMapper.findByRegisterid(id);
	}

	@Override
	public int add(Prescriptiondetail t) {
		return prescriptiondetailMapper.insert(t);
	}

	@Override
	public int deleteByPrescriptionid(int id) {
		return prescriptiondetailMapper.deleteByPrescriptionid(id);
	}
}
