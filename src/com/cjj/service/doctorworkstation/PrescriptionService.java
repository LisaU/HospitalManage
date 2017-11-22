package com.cjj.service.doctorworkstation;

import java.util.List;

import com.cjj.core.common.BaseService;
import com.cjj.po.Prescription;
import com.cjj.vo.PrescriptionVo;

public interface PrescriptionService extends BaseService<Prescription, Integer>{
	/**
	 * 分页多条件查询处方
	 * @param t
	 * @param currentpage
	 * @param pagesize
	 * @return
	 */
	public List<PrescriptionVo> manyConditionsFind(PrescriptionVo t,int currentpage,int pagesize);
	
	/**
	 * 查询处方号是否重复
	 * @param prescriptioncode
	 * @return
	 */
	public Prescription findRepetitionByCode(String prescriptioncode);
	
	/**
	 * 模糊查询处方
	 * @param contant
	 * @return
	 */
	public List<PrescriptionVo> vagueFind(String contant);
	
	/**
	 * 根据处方id查询处方
	 * @param id
	 * @return
	 */
	public PrescriptionVo findByid(int id);
}
