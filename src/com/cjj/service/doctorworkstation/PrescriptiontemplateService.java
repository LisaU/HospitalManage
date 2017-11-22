package com.cjj.service.doctorworkstation;

import java.util.List;

import com.cjj.core.common.BaseService;
import com.cjj.po.Prescriptiontemplate;
import com.cjj.vo.PrescriptiontemplateVo;

public interface PrescriptiontemplateService extends BaseService<Prescriptiontemplate, Integer>{
	/**
	 * 分页多条件查询处方模板
	 * @param t
	 * @param currentpage
	 * @param pagesize
	 * @return
	 */
	public List<PrescriptiontemplateVo> manyConditionsFind(PrescriptiontemplateVo t,int currentpage,int pagesize);
	
	/**
	 * 模糊查询处方模板
	 * @param contant
	 * @return
	 */
	public List<PrescriptiontemplateVo> vagueFind(String contant);
	
	/**
	 * 查询处方模板名称是否重复
	 * @param templatename
	 * @return
	 */
	public Prescriptiontemplate findRepetitionByName(String templatename);
	
	/**
	 * 根据处方模板id查询处方模板
	 * @param id
	 * @return
	 */
	public PrescriptiontemplateVo findByid(int id);
}
