package com.cjj.dao.doctorworkstation;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cjj.po.Prescriptiontemplate;
import com.cjj.vo.PrescriptiontemplateVo;

public interface PrescriptiontemplateMapper {
	/**
	 * 添加处方模板
	 * @param record
	 * @return
	 */
    int insert(Prescriptiontemplate record);
    
    /**
     * 分页多条件查询处方模板
     * @param record
     * @param currentpage
     * @param pagesize
     * @return
     */
    List<PrescriptiontemplateVo> manyConditionsFind(@Param("vo")PrescriptiontemplateVo record,
    		@Param("currentpage")Integer currentpage,@Param("pagesize")Integer pagesize);
    
    /**
     * 模糊查询处方模板
     * @param contant
     * @return
     */
    List<PrescriptiontemplateVo> vagueFind(String contant);
    
    /**
     * 查询最后一个处方
     * @return
     */
    int findmaxid();
    
    /**
     * 根据模板id查询处方模板
     * @param id
     * @return
     */
    PrescriptiontemplateVo findByid(Integer id);
    
    /**
     * 根据模板名称查询是否重复
     * @param templatename
     * @return
     */
    Prescriptiontemplate findRepetitionByName(String templatename);

    /**
     * 修改处方模板
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Prescriptiontemplate record);
    
    /**
     * 删除处方模板
     * @param id
     * @return
     */
    int delete(Integer id);
}