package com.cjj.service.doctorworkstation.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjj.dao.doctorworkstation.DiseaseMapper;
import com.cjj.po.Disease;
import com.cjj.service.doctorworkstation.DiseaseService;

@Transactional
@Service("/diseaseService")
public class DiseaseServiceImpl implements DiseaseService {

	@Autowired
	private DiseaseMapper diseaseMapper;
	
	@Override
	public List<Disease> findAll() {
		return diseaseMapper.findAll();
	}

}
