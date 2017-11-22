package com.cjj.dao.doctorworkstation;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cjj.po.Medicalrecord;
import com.cjj.vo.MedicalrecordVo;

public interface MedicalrecordMapper {
	/**
	 * 病历录入
	 * @param record
	 * @return
	 */
    int insert(Medicalrecord record);

    /**
     * 根据病历id查询病历 
     * @param id
     * @return
     */
    Medicalrecord selectByPrimaryKey(Integer id);
    
    /**
     * 根据病历号查询是否重复
     * @param medicalrecordcode
     * @return
     */
    Medicalrecord findRepetition(String medicalrecordcode);
    
    /**
     * 分页多条件模糊查询病历
     * @param record
     * @param currentpage
     * @param pagesize
     * @return
     */
    List<MedicalrecordVo> manyConditionsFind(@Param("vo")MedicalrecordVo record,
    		@Param("currentpage")Integer currentpage,@Param("pagesize")Integer pagesize);

    /**
     * 修改病历
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Medicalrecord record);
    
    /**
     * 删除病历
     * @param id
     * @return
     */
    int delete(Integer id);
}