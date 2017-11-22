package com.cjj.dao.doctorworkstation;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cjj.po.Prescription;
import com.cjj.vo.PrescriptionVo;

public interface PrescriptionMapper {
	/**
	 * 开处方
	 * @param record
	 * @return
	 */
    int insert(Prescription record);
    
    /**
     * 分页多条件查询处方
     * @param record
     * @param currentpage
     * @param pagesize
     * @return
     */
    List<PrescriptionVo> manyConditionsFind(@Param("vo")PrescriptionVo record,
    		@Param("currentpage")Integer currentpage,@Param("pagesize")Integer pagesize);
    
    /**
     * 根据处方号查询是否重复
     * @param prescriptioncode
     * @return
     */
    Prescription findRepetitionByCode(String prescriptioncode);
    
    /**
     * 查询最后一个处方
     * @return
     */
    int findmaxid();
    
    /**
     * 根据处方id查询处方
     * @param id
     * @return
     */
    PrescriptionVo findByid(Integer id);
    
    /**
     * 模糊查询处方
     * @param contant
     * @return
     */
    List<PrescriptionVo> vagueFind(String contant);

    /**
     * 修改处方
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Prescription record);
    
    /**
     * 删除处方
     * @param id
     * @return
     */
    int delete(Integer id);
}