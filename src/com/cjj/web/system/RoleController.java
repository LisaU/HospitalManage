package com.cjj.web.system;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONSerializer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjj.core.common.BaseController;
import com.cjj.po.Attributedetail;
import com.cjj.po.Role;
import com.cjj.service.baseinfo.AttributedetailService;
import com.cjj.service.system.RoleService;
import com.cjj.vo.RoleVo;

@Controller
@RequestMapping("/roleController")
public class RoleController extends BaseController{
	
	@Autowired
	private RoleService roleService;
	@Autowired
	private AttributedetailService attributedetailService;
	
	/**
	 * 角色页面
	 * @return
	 */
	@RequestMapping("/list")
	public String list(){
		return "/system/rolemanage/role_list";
	}
	
	/**
	 * 模糊查询角色
	 * @param contant
	 * @param pagesize
	 * @param currentpage
	 * @return
	 */
	//分页模糊查询
	@RequestMapping("/datalist")
	public String datalist(String contant,int pagesize, int currentpage){
		//获取总行数
		int sumrow = roleService.vagueFind(contant, 0, 99999999).size();
		//设置分页参数
		setPaging(pagesize, sumrow, currentpage);
		//获取分页后的数据
		List<Role> list = roleService.vagueFind(contant, pagingVo.getCurrentpage(), pagesize);
		request().setAttribute("roles", list);
		return "/system/rolemanage/table/roletable";
	}
	
	/**
	 * 添加角色页面
	 * @return
	 */
	@RequestMapping("/toadd")
	public String toadd(){
		return "/system/rolemanage/role_add";
	}
	
	/**
	 * 添加角色
	 * @param vo
	 * @return
	 */
	@RequestMapping("/add")
	public String add(Role vo){
		vo.setIsvalid(1);
		roleService.add(vo);
		request().setAttribute("resulttext", "add");
		return list();
	}
	
	/**
	 * 修改角色页面
	 * @param id
	 * @return
	 */
	@RequestMapping("/toedit")
	public String toedit(Integer id){
		Role vo = roleService.findById(id);
		request().setAttribute("role", vo);
		return "/system/rolemanage/role_edit";
	}
	
	/**
	 * 修改角色
	 * @param vo
	 * @return
	 */
	@RequestMapping("/edit")
	public String edit(Role vo){
		roleService.edit(vo);
		request().setAttribute("resulttext", "edit");
		return list();
	}
	
	/**
	 * 删除角色
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete",produces="application/json")
	public Object delete(Integer id){
		int i = roleService.delete(id);
		String msg = i > 0 ? "删除成功" : "删除失败";
		return JSONSerializer.toJSON("{'msg':'"+ msg +"'}");
	}
	
	/**
	 * 角色职务页面
	 * @return
	 */
	@RequestMapping("/toroleposition")
	public String toroleposition(){
		return "/system/roleposition/roleposition";
	}
	
	/**
	 * 查询角色职务
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/findrolepositon",produces="application/json")
	public Object findrolepositon(){
		List<RoleVo> list = roleService.findRid();
		List<RoleVo> listAll = new ArrayList<RoleVo>();
		listAll.addAll(list);
		for (RoleVo vo : list) {
			List<RoleVo> clist = roleService.findRidByPositionid(vo);
			listAll.addAll(clist);
		}
		return JSONSerializer.toJSON(listAll);
	}
	
	/**
	 * 查询职务
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/findposition",produces="application/json")
	public Object loadrole(){		
		List<Attributedetail> attributedetail = attributedetailService.findByAttributeid(4);
		return JSONSerializer.toJSON(attributedetail);
	}
	
	/**
	 * 添加角色职务或角色资源
	 * @param bo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/addChild", produces="application/json")
	public Object addChild(Role bo){
		int i = roleService.edit(bo);
		String msg = i > 0 ? "保存成功！" : "保存失败！";
		return JSONSerializer.toJSON("{'msg':'"+ msg +"'}");
	}
	
	/**
	 * 权限页面
	 * @return
	 */
	@RequestMapping("/tolimit")
	public String tolimit(){
		return "/system/limitmanage/limit";
	}
	
	/**
	 * 查询角色
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/findrole",produces="application/json")
	public Object findrole(){
		List<RoleVo> list = roleService.findRid();
		return JSONSerializer.toJSON(list);
	}
}
