package com.cjj.service.doctorworkstation;

import java.util.List;

import com.cjj.core.common.BaseService;
import com.cjj.po.Medicalrecord;
import com.cjj.vo.MedicalrecordVo;

public interface MedicalrecordService extends BaseService<Medicalrecord, Integer>{
	/**
	 * 分页多条件查询病历
	 * @param t
	 * @param currentpage
	 * @param pagesize
	 * @return
	 */
	public List<MedicalrecordVo> manyConditionsFind(MedicalrecordVo t,int currentpage,int pagesize);
	
	/**
	 * 查询病历号是否重复
	 * @param medicalrecordcode
	 * @return
	 */
	public Medicalrecord findRepetition(String medicalrecordcode);
}
