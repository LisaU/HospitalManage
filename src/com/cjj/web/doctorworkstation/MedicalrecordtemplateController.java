package com.cjj.web.doctorworkstation;

import java.util.List;
import java.util.Random;

import net.sf.json.JSONSerializer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjj.core.common.BaseController;
import com.cjj.po.Medicalrecordtemplate;
import com.cjj.service.personnelmanage.DepartmentService;
import com.cjj.service.personnelmanage.EmployeeService;
import com.cjj.service.doctorworkstation.DiseaseService;
import com.cjj.service.doctorworkstation.MedicalrecordtemplateService;
import com.cjj.vo.EmployeeVo;
import com.cjj.vo.MedicalrecordtemplateVo;

@Controller
@RequestMapping("/medicalrecordtemplateController")
public class MedicalrecordtemplateController extends BaseController{
	
	@Autowired
	private MedicalrecordtemplateService medicalrecordtemplateService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private DiseaseService diseaseService;
	
	/**
	 * 病历模板页面
	 * @return
	 */
	@RequestMapping("list")
	public String list(){
		request().setAttribute("departments", departmentService.findIsRgs());
		request().setAttribute("doctors",  employeeService.findIsRegister());
		return "/doctorworkstation/medicalrecord/medicalrecordtemplate_list";
	}
	
	/**
	 * 分页查询
	 * @param bo
	 * @param pagesize
	 * @param currentpage
	 * @return
	 */
	@RequestMapping("/datalist")
	public String datalist(MedicalrecordtemplateVo bo,Integer pagesize, Integer currentpage){
		//获取总行数
		int sumrow = medicalrecordtemplateService.manyConditionsFind(bo, 0, 99999999).size();
		//设置分页参数
		setPaging(pagesize, sumrow, currentpage);
		//获取分页后的数据
		List<MedicalrecordtemplateVo> list = medicalrecordtemplateService.manyConditionsFind(bo,pagingVo.getCurrentpage(),pagesize);
		request().setAttribute("medicalrecordtemplates", list);
		return "/doctorworkstation/medicalrecord/table/medicalrecordtemplatetable";
	}
	
	/**
	 * 新增病历模板页面
	 * @return
	 */
	@RequestMapping("/toadd")
	public String toadd(){
		request().setAttribute("doctors",  employeeService.findIsRegister());
		request().setAttribute("diseases", diseaseService.findAll());
		return "/doctorworkstation/medicalrecord/medicalrecordtemplate_add";
	}
	
	/**
	 * 新增病历模板
	 * @param bo
	 * @return
	 */
	@RequestMapping("/add")
	public String add(Medicalrecordtemplate bo){
		//模板编号随机生成，不可重复
		String code = "BLMB" + new Random().nextInt(99999999);
		Medicalrecordtemplate vo = medicalrecordtemplateService.findRepetitionByCode(code);
		do {
			code = "BLMB" + new Random().nextInt(99999999);
			vo = medicalrecordtemplateService.findRepetitionByCode(code);
		}while(vo != null);
		
		bo.setTemplatecode(code);
		bo.setIsvalid(1);
		medicalrecordtemplateService.add(bo);
		request().setAttribute("resulttext", "add");
		return list();
	}
	
	/**
	 * 修改病历模板页面
	 * @param id
	 * @return
	 */
	@RequestMapping("/toedit")
	public String toedit(int id){
		request().setAttribute("doctors",  employeeService.findIsRegister());
		request().setAttribute("diseases", diseaseService.findAll());
		Medicalrecordtemplate vo = medicalrecordtemplateService.findById(id);
		request().setAttribute("medicalrecordtemples", vo);
		int dtid = employeeService.findById(vo.getDoctorid()).getDepartmentid();
		String departmentname = departmentService.findById(dtid).getDepartmentname();
		request().setAttribute("departmentname", departmentname);
		return "/doctorworkstation/medicalrecord/medicalrecordtemplate_edit";
	}
	
	/**
	 * 修改病历模板
	 * @param bo
	 * @return
	 */
	@RequestMapping("/edit")
	public String edit(Medicalrecordtemplate bo){
		medicalrecordtemplateService.edit(bo);
		request().setAttribute("resulttext", "edit");
		return list();
	}
	
	/**
	 * 删除病历模板
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete",produces="application/json")
	public Object delete(Integer id){
		int i = medicalrecordtemplateService.delete(id);
		String msg = i > 0 ? "删除成功" : "删除失败";
		return JSONSerializer.toJSON("{'msg':'"+ msg +"'}");
	}
	
	/**
	 * 根据科室id查询医生
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/dataselect",produces="application/json")
	public Object dataselect(int id){
		List<EmployeeVo> list = employeeService.findByDepartmentId(id);
		return list;
	}
}
