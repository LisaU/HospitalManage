package com.cjj.service.registermanage;

import java.util.List;

import com.cjj.po.Register;
import com.cjj.vo.RegisterVo;

public interface RegisterService {
	/**
	 * 查询挂号信息
	 * @return
	 */
	public List<RegisterVo> findAll();
	
	/**
	 * 查询最后一个挂号信息
	 * @return
	 */
	public RegisterVo findLast();
	
	/**
	 * 统计挂号人数与金额
	 * @return
	 */
	public RegisterVo countInfo();
	
	/**
	 * 挂号
	 * @param t
	 * @return
	 */
	public int add(Register t);
	
	/**
	 * 分页查询当天挂号信息
	 * @param currentpage
	 * @param pagesize
	 * @return
	 */
	public List<RegisterVo> pageFindToday(int currentpage,int pagesize);
	
	/**
	 * 模糊查询挂号信息
	 * @param t
	 * @return
	 */
	public List<RegisterVo> vagueFind(RegisterVo t);
	
	/**
	 * 分页多条件查询挂号信息
	 * @param vo
	 * @param currentpage
	 * @param pagesize
	 * @return
	 */
	public List<RegisterVo> manyConditionsFindhistory(RegisterVo vo,int currentpage,int pagesize);
	
	/**
	 * 根据挂号id查询挂号信息
	 * @param id
	 * @return
	 */
	public RegisterVo findByid(int id);
	
	/**
	 * 删除挂号信息
	 * @param id
	 * @return
	 */
	public int delete(int id);
	
	/**
	 * 修改挂号状态
	 * @param t
	 * @return
	 */
	public int updatestatus(Register t);
}
