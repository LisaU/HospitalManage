package com.cjj.web.personnelmanage;

import java.util.List;

import net.sf.json.JSONSerializer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjj.core.common.BaseController;
import com.cjj.po.Department;
import com.cjj.po.Employee;
import com.cjj.service.personnelmanage.DepartmentService;
import com.cjj.service.personnelmanage.EmployeeService;

@Controller
@RequestMapping("/departmentController")
public class DepartmentController extends BaseController{
	
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private EmployeeService employeeService;
	
	/**
	 * 科室部门页面
	 * @return
	 */
	@RequestMapping("/list")
	public String list(){
		return "/personnelmanage/department/department_list";
	}
	
	/**
	 * 分页查询
	 * @param contant
	 * @param pagesize
	 * @param currentpage
	 * @return
	 */
	@RequestMapping("/datalist")
	public String datalist(String contant, int pagesize, int currentpage) {
		//获取总行数
		int sumrow = departmentService.vagueFind(contant, 0, 99999999).size();
		//设置分页参数
		setPaging(pagesize, sumrow, currentpage);
		//获取分页后的数据
		List<Department> list = departmentService.vagueFind(contant, pagingVo.getCurrentpage(), pagesize);
		request().setAttribute("departments", list);
		return "/personnelmanage/department/table/departmenttable";
	}
	
	/**
	 * 根据科室id查询科室名称
	 * @param did
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/findbydid",produces="application/json")
	public Object findbydid(int did){
		Employee employee = employeeService.findById(did);
		int id = employee.getDepartmentid();
		Department vo = departmentService.findById(id);
		String dpname = vo.getDepartmentname();
		return JSONSerializer.toJSON("{'dpname':'" + dpname +"'}");
	}
	
	/**
	 * 添加科室页面
	 * @return
	 */
	@RequestMapping("/toadd")
	public String toadd(){
		return "/personnelmanage/department/department_add";
	}
	
	/**
	 * 添加科室
	 * @param vo
	 * @return
	 */
	@RequestMapping("/add")
	public String add(Department vo){
		vo.setIsvalid(1);
		vo.setDepartmentcode(findLastCode());
		departmentService.add(vo);
		request().setAttribute("resulttext", "add");
		return list();
	}
	
	/**
	 * 修改科室页面
	 * @param id
	 * @return
	 */
	@RequestMapping("/toedit")
	public String toedit(Integer id){
		Department vo = departmentService.findById(id);
		request().setAttribute("department", vo);
		return "/personnelmanage/department/department_edit";
	}
	
	/**
	 * 修改科室
	 * @param vo
	 * @return
	 */
	@RequestMapping("/edit")
	public String edit(Department vo){
		if(vo.getIsregister() == null){
			vo.setIsregister(2);
		}
		departmentService.edit(vo);
		request().setAttribute("resulttext", "edit");
		return list();
	}
	
	/**
	 * 删除科室
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete",produces="application/json")
	public Object delete(Integer id){
		int i = departmentService.delete(id);
		String msg = i > 0 ? "删除成功" : "删除失败";
		return JSONSerializer.toJSON("{'msg':'"+ msg +"'}");
	}
	
	/**
	 * 根据职务id查询科室
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getdptbypid",produces="application/json")
	public Object dataselect(Integer id){
		List<Department> list = departmentService.findDptByPid(id);
		return list;
	}
	
	public String findLastCode(){
		Department vo = departmentService.findLastCode();
		String code = (vo.getDepartmentcode() == null ? "0" : vo.getDepartmentcode());
		code = (Integer.parseInt(code) + 1) + "";
		code = (code.length() > 1 ? "0" + code : "00" + code);
		return code;
	}
}
