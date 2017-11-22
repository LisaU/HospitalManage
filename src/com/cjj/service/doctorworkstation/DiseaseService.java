package com.cjj.service.doctorworkstation;

import java.util.List;

import com.cjj.po.Disease;

public interface DiseaseService{
	/**
	 * 查询疾病类型
	 * @return
	 */
	public List<Disease> findAll();
}
