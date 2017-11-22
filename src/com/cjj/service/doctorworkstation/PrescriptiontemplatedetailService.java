package com.cjj.service.doctorworkstation;

import java.util.List;

import com.cjj.po.Prescriptiontemplatedetail;
import com.cjj.vo.PrescriptiontemplatedetailVo;

public interface PrescriptiontemplatedetailService {
	/**
	 * 根据处方模板id查询处方(模板)明细
	 * @param id
	 * @return
	 */
	public List<PrescriptiontemplatedetailVo> findByTemplateid(int id);
	
	/**
	 * 添加处方(模板)明细
	 * @param t
	 * @return
	 */
	public int add(Prescriptiontemplatedetail t);
	
	/**
	 * 根据处方id删除处方明细
	 * @param id
	 * @return
	 */
	public int deleteByPrescriptionid(int id);
}
