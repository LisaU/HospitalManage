package com.cjj.service.dispensingmanage;

import java.util.List;

import com.cjj.core.common.BaseService;
import com.cjj.po.Drug;
import com.cjj.vo.DrugVo;

public interface DrugService extends BaseService<Drug, Integer>{
	/**
	 * 分页多条件查询药品
	 * @param t
	 * @param currentpage
	 * @param pagesize
	 * @return
	 */
	public List<DrugVo> manyConditionsFind(DrugVo t,int currentpage,int pagesize);
	
	/**
	 * 模糊查询药品
	 * @param contant
	 * @return
	 */
	public List<DrugVo> vagueFind(String contant);
	
	/**
	 * 修改库存
	 * @param t
	 * @return
	 */
	public int updateInventoryquantity(Drug t);
}
