package com.cjj.dao.doctorworkstation;

import java.util.List;

import com.cjj.po.Prescriptiondetail;
import com.cjj.vo.PrescriptiondetailVo;

public interface PrescriptiondetailMapper {
	/**
	 * 添加处方明细
	 * @param record
	 * @return
	 */
    int insert(Prescriptiondetail record);
    
    /**
     * 根据处方id查询处方明细
     * @param id
     * @return
     */
    List<PrescriptiondetailVo> findByPrescriptionid(Integer id);
    
    /**
     * 根据处方id查询中药明细
     * @param id
     * @return
     */
    List<PrescriptiondetailVo> findZyByPrescriptionId(Integer id);
    
    /**
     * 根据处方id查询西药明细
     * @param id
     * @return
     */
    List<PrescriptiondetailVo> findXyByPrescriptionId(Integer id);
    
    /**
     * 根据挂号id查询处方明细
     * @param id
     * @return
     */
    List<Prescriptiondetail> findByRegisterid(Integer id);

    /**
     * 根据明细id查询处方明细
     * @param id
     * @return
     */
    Prescriptiondetail selectByPrimaryKey(Integer id);

    /**
     * 修改处方明细
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Prescriptiondetail record);
    
    /**
     * 删除处方明细
     * @param id
     * @return
     */
    int deleteByPrescriptionid(Integer id);
}