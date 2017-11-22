package com.cjj.dao.doctorworkstation;

import java.util.List;

import com.cjj.po.Prescriptiontemplatedetail;
import com.cjj.vo.PrescriptiontemplatedetailVo;

public interface PrescriptiontemplatedetailMapper {
	/**
	 * 添加处方模板明细
	 * @param record
	 * @return
	 */
    int insert(Prescriptiontemplatedetail record);
    
    /**
     * 根据处方模板id查询处方模板明细
     * @param id
     * @return
     */
    List<PrescriptiontemplatedetailVo> findByTemplateid(Integer id);
    
    /**
     * 根据明细id查询处方模板明细
     * @param id
     * @return
     */
    Prescriptiontemplatedetail selectByPrimaryKey(Integer id);
    
    /**
     * 修改处方模板明细
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Prescriptiontemplatedetail record);
    
    /**
     * 删除处方模板明细
     * @param id
     * @return
     */
    int deleteByPrescriptionid(Integer id);
}