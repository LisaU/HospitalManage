package com.cjj.dao.registermanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cjj.po.Register;
import com.cjj.vo.RegisterVo;

public interface RegisterMapper {
	/**
	 * 挂号
	 * @param record
	 * @return
	 */
    int insert(Register record);
    
    /**
     * 查询挂号信息
     * @return
     */
    List<RegisterVo> findAll();
    
    /**
     * 查询最后一个挂号信息
     * @return
     */
    RegisterVo findLast();
    
    /**
     * 统计挂号人数和挂号金额
     * @return
     */
    RegisterVo countInfo();
    
    /**
     * 分页查询单天挂号信息
     * @param currentpage
     * @param pagesize
     * @return
     */
    List<RegisterVo> pageFindToday(@Param("currentpage")Integer currentpage,@Param("pagesize")Integer pagesize);
    
    /**
     * 模糊查询挂号信息
     * @param record
     * @return
     */
    List<RegisterVo> vagueFind(RegisterVo record);
    
    /**
     * 分页多条件查询挂号信息
     * @param vo
     * @param currentpage
     * @param pagesize
     * @return
     */
    List<RegisterVo> manyConditionsFindhistory(@Param("vo")RegisterVo vo,@Param("currentpage")Integer currentpage,@Param("pagesize")Integer pagesize);
    
    /**
     * 根据挂号id查询挂号信息
     * @param id
     * @return
     */
    RegisterVo findByid(Integer id);

    /**
     * 修改挂号信息
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Register record);
    
    /**
     * 删除挂号信息
     * @param id
     * @return
     */
    int delete(Integer id);
    
    /**
     * 修改挂号状态
     * @param record
     * @return
     */
    int updatestatus(Register record);
}