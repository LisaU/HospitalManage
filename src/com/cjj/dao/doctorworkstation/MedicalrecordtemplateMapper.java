package com.cjj.dao.doctorworkstation;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cjj.po.Medicalrecordtemplate;
import com.cjj.vo.MedicalrecordtemplateVo;

public interface MedicalrecordtemplateMapper {
	/**
	 * 添加病历模板
	 * @param record
	 * @return
	 */
    int insert(Medicalrecordtemplate record);
    
    /**
     * 分页多条件模糊查询病历模板
     * @param record
     * @param currentpage
     * @param pagesize
     * @return
     */
    List<MedicalrecordtemplateVo> manyConditionsFind(@Param("vo") MedicalrecordtemplateVo record,
    		@Param("currentpage")Integer currentpage,@Param("pagesize")Integer pagesize);
    
    /**
     * 根据病历模板号查询是否重复
     * @param templatecode
     * @return
     */
    Medicalrecordtemplate findRepetitionByCode(String templatecode);
    
    /**
     * 模糊查询病历模板
     * @param contant
     * @return
     */
    List<MedicalrecordtemplateVo> vagueFind(String contant);
    
    /**
     * 根据病历模板名称查询是否重复
     * @param templatename
     * @return
     */
    Medicalrecordtemplate findRepetitionByName(String templatename);

    /**
     * 根据病历模板id查询病历模板
     * @param id
     * @return
     */
    Medicalrecordtemplate selectByPrimaryKey(Integer id);

    /**
     * 修改病历模板
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Medicalrecordtemplate record);
    
    /**
     * 删除病历模板
     * @param id
     * @return
     */
    int delete(Integer id);
}