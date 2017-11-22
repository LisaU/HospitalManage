package com.cjj.service.registermanage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjj.dao.registermanage.PatientMapper;
import com.cjj.po.Patient;
import com.cjj.service.registermanage.PatientService;
import com.cjj.vo.PatientVo;

@Transactional
@Service("patientService")
public class PatientServiceImpl implements PatientService {

	@Autowired
	private PatientMapper patientMapper;
	
	@Override
	public List<PatientVo> findAll() {
		return patientMapper.findAll();
	}

	@Override
	public int add(Patient t) {
		return patientMapper.insert(t);
	}

	@Override
	public List<PatientVo> vagueFind(PatientVo t) {
		return patientMapper.vagueFind(t);
	}
}
