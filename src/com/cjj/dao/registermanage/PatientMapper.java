package com.cjj.dao.registermanage;

import java.util.List;

import com.cjj.po.Patient;
import com.cjj.vo.PatientVo;

public interface PatientMapper {
	/**
	 * 添加病人信息
	 * @param record
	 * @return
	 */
    int insert(Patient record);
    
    /**
     * 查询病人信息
     * @return
     */
    List<PatientVo> findAll();

    /**
     * 模糊查询病人信息
     * @param record
     * @return
     */
    List<PatientVo> vagueFind(PatientVo record);
    
    /**
     * 根据病人id查询病人
     * @param id
     * @return
     */
    Patient selectByPrimaryKey(Integer id);

    /**
     * 修改病人信息
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Patient record);
}