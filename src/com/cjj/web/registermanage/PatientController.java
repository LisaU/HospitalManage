package com.cjj.web.registermanage;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import net.sf.json.JSONSerializer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjj.core.common.BaseController;
import com.cjj.po.Patient;
import com.cjj.service.baseinfo.AttributedetailService;
import com.cjj.service.personnelmanage.DepartmentService;
import com.cjj.service.personnelmanage.EmployeeService;
import com.cjj.service.baseinfo.PatienttypeService;
import com.cjj.service.baseinfo.RegistertypeService;
import com.cjj.service.baseinfo.ViptypeService;
import com.cjj.service.registermanage.PatientService;
import com.cjj.service.registermanage.RegisterService;
import com.cjj.vo.EmployeeVo;
import com.cjj.vo.PatientVo;

@Controller
@RequestMapping("/patientController")
public class PatientController extends BaseController{
	
	@Autowired
	private PatientService patientService;
	@Autowired
	private AttributedetailService attributedetailService;
	@Autowired
	private PatienttypeService patienttypeService;
	@Autowired
	private ViptypeService viptypeService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private RegisterService registerService;
	@Autowired
	private RegistertypeService registertypeService;
	
	/**
	 * 挂号页面
	 * @return
	 */
	@RequestMapping("/list")
	public String list(){
		request().setAttribute("registertypes", registertypeService.findBefor());
		request().setAttribute("register", registerService.findLast());
		request().setAttribute("countinfo", registerService.countInfo());
		request().setAttribute("patienttypes", patienttypeService.findAll());
		request().setAttribute("viptypes", viptypeService.findAll());
		request().setAttribute("politicsstatuss", attributedetailService.findByAttributeid(3));
		request().setAttribute("insuretypes", attributedetailService.findByAttributeid(20));
		request().setAttribute("departments", departmentService.findIsRgs());
		request().setAttribute("doctors", employeeService.findIsRegister());
		return "/registermanage/register";
	}
	
	/**
	 * 模糊查询病人信息
	 * @param contant
	 * @return
	 */
	@RequestMapping("/patienttablelist")
	public String patienttablelist(String contant){
		PatientVo bo = new PatientVo();
		bo.setPatientname(contant);
		bo.setCardcode(contant);
		List<PatientVo> list = patientService.vagueFind(bo);
		request().setAttribute("patients", list);
		return "/registermanage/table/patienttable";
	}
	
	/**
	 * 添加病人
	 * @param bo
	 * @return
	 */
	@RequestMapping("/add")
	public String add(Patient bo){
		bo.setCardcode(new Random().nextInt(99999999)+"");
		patientService.add(bo);
		request().setAttribute("resulttext", "addpt");
		return list();
	}
	
	/**
	 * 根据科室id查询医生
	 * @param id
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value="/findemp",produces="application/json")
	public Object findemp(int id) throws IOException{		
		List<EmployeeVo> employees = employeeService.findByDepartmentId(id);
		return JSONSerializer.toJSON(employees);
	}
}
