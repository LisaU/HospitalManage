package com.cjj.service.registermanage;

import java.util.List;

import com.cjj.po.Patient;
import com.cjj.vo.PatientVo;

public interface PatientService {
	/**
	 * 查询病人
	 * @return
	 */
	public List<PatientVo> findAll();
	
	/**
	 * 添加病人
	 * @param t
	 * @return
	 */
	public int add(Patient t);
	
	/**
	 * 模糊查询病人
	 * @param t
	 * @return
	 */
	public List<PatientVo> vagueFind(PatientVo t);
}
