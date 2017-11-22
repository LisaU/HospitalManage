package com.cjj.web.baseinfo;

import java.util.List;

import net.sf.json.JSONSerializer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjj.core.common.BaseController;
import com.cjj.po.Patienttype;
import com.cjj.service.baseinfo.PatienttypeService;

@Controller
@RequestMapping("/patienttypeController")
public class PatienttypeController extends BaseController{
	
	@Autowired
	private PatienttypeService patienttypeService;
	
	/**
	 * 病人类别页面
	 * @return
	 */
	@RequestMapping("/list")
	public String list(){
		return "/baseinfo/patienttype/patienttype_list";
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
		int sumrow = patienttypeService.vagueFind(contant, 0, 99999999).size();
		//设置分页参数
		setPaging(pagesize, sumrow, currentpage);
		//获取分页后的数据
		List<Patienttype> list = patienttypeService.vagueFind(contant, pagingVo.getCurrentpage(), pagesize);
		request().setAttribute("patienttypes", list);
		return "/baseinfo/patienttype/table/patienttypetable";
		
	}
	
	/**
	 * 新增病人类别页面
	 * @return
	 */
	@RequestMapping("/toadd")
	public String toadd(){
		return "/baseinfo/patienttype/patienttype_add";
	}
	
	/**
	 * 新增病人类别
	 * @param vo
	 * @return
	 */
	@RequestMapping("/add")
	public String add(Patienttype vo){
		vo.setIsvalid(1);
		patienttypeService.add(vo);
		request().setAttribute("resulttext", "add");
		return list();
	}
	
	/**
	 * 修改病人类别页面
	 * @param id
	 * @return
	 */
	@RequestMapping("/toedit")
	public String toedit(Integer id){
		Patienttype vo = patienttypeService.findById(id);
		request().setAttribute("patienttype", vo);
		return "/baseinfo/patienttype/patienttype_edit";
	}
	
	/**
	 * 修改病人类别
	 * @param vo
	 * @return
	 */
	@RequestMapping("/edit")
	public String edit(Patienttype vo){
		patienttypeService.edit(vo);
		request().setAttribute("resulttext", "edit");
		return list();
	}
	
	/**
	 * 删除病人类别
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete",produces="application/json")
	public Object delete(Integer id){
		int i = patienttypeService.delete(id);
		String msg = i > 0 ? "删除成功" : "删除失败";
		return JSONSerializer.toJSON("{'msg':'"+ msg +"'}");
	}
}
