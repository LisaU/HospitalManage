package com.cjj.web.baseinfo;

import java.util.List;

import net.sf.json.JSONSerializer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjj.core.common.BaseController;
import com.cjj.po.Chargetype;
import com.cjj.service.baseinfo.ChargetypeService;

@Controller
@RequestMapping("/chargetypeController")
public class ChargetypeController extends BaseController{
	
	@Autowired
	private ChargetypeService chargetypeService;
	
	/**
	 * 收费类别页面
	 * @return
	 */
	@RequestMapping("/list")
	public String list(){
		return "/baseinfo/chargetype/chargetype_list";
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
		int sumrow = chargetypeService.vagueFind(contant, 0, 99999999).size();
		//设置分页参数
		setPaging(pagesize, sumrow, currentpage);
		//获取分页后的数据
		List<Chargetype> list = chargetypeService.vagueFind(contant, pagingVo.getCurrentpage(), pagesize);
		request().setAttribute("chargetypes", list);
		return "/baseinfo/chargetype/table/chargetypetable";
	}
	
	/**
	 * 新增收费类别页面
	 * @return
	 */
	@RequestMapping("/toadd")
	public String toadd(){
		return "/baseinfo/chargetype/chargetype_add";
	}
	
	/**
	 * 新增收费类别
	 * @param vo
	 * @return
	 */
	@RequestMapping("/add")
	public String add(Chargetype vo){
		vo.setIsvalid(1);
		chargetypeService.add(vo);
		List<Chargetype> list = chargetypeService.findAll();
		request().setAttribute("chargetypes", list);
		request().setAttribute("resulttext", "add");
		return list();
	}
	
	/**
	 * 修改收费类别页面
	 * @param id
	 * @return
	 */
	@RequestMapping("/toedit")
	public String toedit(Integer id){
		Chargetype vo = chargetypeService.findById(id);
		request().setAttribute("chargetype", vo);
		return "/baseinfo/chargetype/chargetype_edit";
	}
	
	/**
	 * 修改收费类别
	 * @param vo
	 * @return
	 */
	@RequestMapping("/edit")
	public String edit(Chargetype vo){
		chargetypeService.edit(vo);
		request().setAttribute("resulttext", "edit");
		return list();
	}
	
	/**
	 * 删除收费类别
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete",produces="application/json")
	public Object delete(Integer id){
		int i = chargetypeService.delete(id);
		String msg = i > 0 ? "删除成功" : "删除失败";
		return JSONSerializer.toJSON("{'msg':'"+ msg +"'}");
	}
}
