package com.cjj.web.baseinfo;

import java.util.List;

import net.sf.json.JSONSerializer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjj.core.common.BaseController;
import com.cjj.po.Attributedetail;
import com.cjj.service.baseinfo.AttributedetailService;

@Controller
@RequestMapping("/attributedetailController")
public class AttributedetailController extends BaseController{
	
	@Autowired
	private AttributedetailService attributedetailService;
	
	/**
	 * 职务页面
	 * @return
	 */
	@RequestMapping("/list")
	public String list(){
		return "/personnelmanage/position/position_list";
	}
	
	/**
	 * 分页模糊查询
	 * @param contant
	 * @param pagesize
	 * @param currentpage
	 * @return
	 */
	@RequestMapping("/datalist")
	public String datalist(String contant,int pagesize, int currentpage){
		//获取总行数
		int sumrow = attributedetailService.vagueFind(contant, 0, 99999999).size();
		//设置分页参数
		setPaging(pagesize, sumrow, currentpage);
		//获取分页后的数据
		List<Attributedetail> list = attributedetailService.vagueFind(contant, pagingVo.getCurrentpage(), pagesize);
		request().setAttribute("positions", list);
		return "/personnelmanage/position/table/positiontable";
	}
	
	/**
	 * 添加职务页面
	 * @return
	 */
	@RequestMapping("/toadd")
	public String toadd(){
		return "/personnelmanage/position/position_add";
	}
	
	/**
	 * 添加职务
	 * @param vo
	 * @return
	 */
	@RequestMapping("/add")
	public String add(Attributedetail vo){
		vo.setAttributeid(4);
		vo.setIsvalid(1);
		attributedetailService.add(vo);
		request().setAttribute("resulttext", "add");
		return list();
	}
	
	/**
	 * 修改职务页面
	 * @param id
	 * @return
	 */
	@RequestMapping("/toedit")
	public String toedit(Integer id){
		Attributedetail vo = attributedetailService.findById(id);
		request().setAttribute("position", vo);
		return "/personnelmanage/position/position_edit";
	}
	
	/**
	 * 修改职务
	 * @param vo
	 * @return
	 */
	@RequestMapping("/edit")
	public String edit(Attributedetail vo){
		attributedetailService.edit(vo);
		request().setAttribute("resulttext", "edit");
		return list();
	}
	
	/**
	 * 删除职务
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete",produces="application/json")
	public Object delete(Integer id){
		int i = attributedetailService.delete(id);
		String msg = i > 0 ? "删除成功" : "删除失败";
		return JSONSerializer.toJSON("{'msg':'"+ msg +"'}");
	}
}
