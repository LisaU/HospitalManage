package com.cjj.service.doctorworkstation.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjj.dao.doctorworkstation.PrescriptiontemplatedetailMapper;
import com.cjj.po.Prescriptiontemplatedetail;
import com.cjj.service.doctorworkstation.PrescriptiontemplatedetailService;
import com.cjj.vo.PrescriptiontemplatedetailVo;

@Transactional
@Service("prescriptiontemplatedetailService")
public class PrescriptiontemplatedetailServiceImpl implements
		PrescriptiontemplatedetailService {

	@Autowired
	private PrescriptiontemplatedetailMapper prescriptiontemplatedetailMapper;
	
	@Override
	public List<PrescriptiontemplatedetailVo> findByTemplateid(int id) {
		return prescriptiontemplatedetailMapper.findByTemplateid(id);
	}

	@Override
	public int add(Prescriptiontemplatedetail t) {
		return prescriptiontemplatedetailMapper.insert(t);
	}

	@Override
	public int deleteByPrescriptionid(int id) {
		return prescriptiontemplatedetailMapper.deleteByPrescriptionid(id);
	}

}
