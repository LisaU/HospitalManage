package com.cjj.web.doctorworkstation;

import java.util.List;
import java.util.Random;

import net.sf.json.JSONSerializer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjj.core.common.BaseController;
import com.cjj.core.util.DateUtil;
import com.cjj.dao.registermanage.RegisterMapper;
import com.cjj.po.Medicalrecord;
import com.cjj.po.Medicalrecordtemplate;
import com.cjj.po.Register;
import com.cjj.service.personnelmanage.DepartmentService;
import com.cjj.service.personnelmanage.EmployeeService;
import com.cjj.service.doctorworkstation.DiseaseService;
import com.cjj.service.doctorworkstation.MedicalrecordService;
import com.cjj.service.doctorworkstation.MedicalrecordtemplateService;
import com.cjj.vo.MedicalrecordVo;
import com.cjj.vo.MedicalrecordtemplateVo;
import com.cjj.vo.RegisterVo;

@Controller
@RequestMapping("/medicalrecordController")
public class MedicalrecordController extends BaseController{
	
	@Autowired
	private MedicalrecordService medicalrecordService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private DiseaseService diseaseService;
	@Autowired
	private RegisterMapper registerService;
	@Autowired
	private MedicalrecordtemplateService medicalrecordtemplateService;
	
	/**
	 * 病历页面
	 * @return
	 */
	@RequestMapping("list")
	public String list(){
		request().setAttribute("departments", departmentService.findIsRgs());
		request().setAttribute("doctors",  employeeService.findIsRegister());
		return "/doctorworkstation/medicalrecord/medicalrecord_list";
	}
	
	/**
	 * 分页查询
	 * @param bo
	 * @param pagesize
	 * @param currentpage
	 * @return
	 */
	@RequestMapping("/datalist")
	public String datalist(MedicalrecordVo bo,Integer pagesize, Integer currentpage){
		//获取总行数
		int sumrow = medicalrecordService.manyConditionsFind(bo, 0, 99999999).size();
		//设置分页参数
		setPaging(pagesize, sumrow, currentpage);
		//获取分页后的数据
		List<MedicalrecordVo> list = medicalrecordService.manyConditionsFind(bo,pagingVo.getCurrentpage(),pagesize);
		request().setAttribute("medicalrecords", list);
		return "/doctorworkstation/medicalrecord/table/medicalrecordtable";
	}
	
	/**
	 * 病历录入页面
	 * @return
	 */
	@RequestMapping("/toadd")
	public String toadd(){
		request().setAttribute("doctors",  employeeService.findIsRegister());
		request().setAttribute("diseases", diseaseService.findAll());
		return "/doctorworkstation/medicalrecord/medicalrecord_add";
	}
	
	/**
	 * 模糊查询挂号信息
	 * @param contant
	 * @return
	 */
	@RequestMapping("/registertablelist")
	public String registertablelist(String contant){
		RegisterVo bo = new RegisterVo();
		bo.setRegisterstatus(1);
		bo.setCardcode(contant);
		bo.setPatientname(contant);
		List<RegisterVo> list = registerService.vagueFind(bo);
		request().setAttribute("registers", list);
		return "/doctorworkstation/medicalrecord/table/registertable";
	}
	
	/**
	 * 模糊查询病历模板
	 * @param contant
	 * @return
	 */
	@RequestMapping("/templatetablelist")
	public String templatetablelist(String contant){
		List<MedicalrecordtemplateVo> list = medicalrecordtemplateService.vagueFind(contant);
		request().setAttribute("templates", list);
		return "/doctorworkstation/medicalrecord/table/templatetable";
	}
	
	/**
	 * 保存病历
	 * @param bo
	 */
	public void addmedicalrecord(Medicalrecord bo){
		String code = "BL" + new Random().nextInt(99999999);
		Medicalrecord vo = medicalrecordService.findRepetition(code);
		do {
			code = "BL" + new Random().nextInt(99999999);
			vo = medicalrecordService.findRepetition(code);
		}while(vo != null);
		
		bo.setMedicalrecordcode(code);
		bo.setRecordtime(DateUtil.timestamp());
		bo.setIsvalid(1);
		medicalrecordService.add(bo);
	}
	
	/**
	 * 保存病历
	 * @param medicalrecord
	 * @param template
	 * @return
	 */
	@RequestMapping("/add")
	public String add(Medicalrecord medicalrecord,Medicalrecordtemplate template){
		String name = medicalrecord.getMedicalrecordname();
		Medicalrecordtemplate namevo = medicalrecordtemplateService.findRepetitionByName(name);
		//若病历模板中没有记录该病历，则添加病历模板
		if(namevo == null){
			String templatecode = "BLMB" + new Random().nextInt(99999999);
			Medicalrecordtemplate templatevo = medicalrecordtemplateService.findRepetitionByCode(templatecode);
			do {
				templatecode = "BLMB" + new Random().nextInt(99999999);
				templatevo = medicalrecordtemplateService.findRepetitionByCode(templatecode);
			}while(templatevo != null);
			
			template.setTemplatecode(templatecode);
			template.setTemplatename(name);
			template.setIsvalid(1);
			medicalrecordtemplateService.add(template);
			
			addmedicalrecord(medicalrecord);
		}else{
			addmedicalrecord(medicalrecord);
		}
		Register register = new Register();
		register.setId(medicalrecord.getRegisterid());
		register.setRegisterstatus(2);
		registerService.updatestatus(register);	
		request().setAttribute("resulttext", "add");
		return list();
	}
	
	/**
	 * 修改病历页面
	 * @param id
	 * @return
	 */
	@RequestMapping("/toedit")
	public String toedit(int id){
		request().setAttribute("doctors",  employeeService.findIsRegister());
		request().setAttribute("diseases", diseaseService.findAll());	
		
		Medicalrecord medicalrecord = medicalrecordService.findById(id);
		RegisterVo register = registerService.findByid(medicalrecord.getRegisterid());
		request().setAttribute("register", register);
		request().setAttribute("medicalrecord", medicalrecord);
		int dtid = employeeService.findById(medicalrecord.getDoctorid()).getDepartmentid();
		String departmentname = departmentService.findById(dtid).getDepartmentname();
		request().setAttribute("departmentname", departmentname);
		return "/doctorworkstation/medicalrecord/medicalrecord_edit";
	}
	
	/**
	 * 修改病历
	 * @param medicalrecord
	 * @param template
	 * @return
	 */
	@RequestMapping("/edit")
	public String edit(Medicalrecord medicalrecord,Medicalrecordtemplate template){
		String name = medicalrecord.getMedicalrecordname();
		Medicalrecordtemplate namevo = medicalrecordtemplateService.findRepetitionByName(name);
		//若病历模板中没有记录该病历，则添加病历模板
		if(namevo == null){
			String templatecode = "BLMB" + new Random().nextInt(99999999);
			Medicalrecordtemplate templatevo = medicalrecordtemplateService.findRepetitionByCode(templatecode);
			do {
				templatecode = "BLMB" + new Random().nextInt(99999999);
				templatevo = medicalrecordtemplateService.findRepetitionByCode(templatecode);
			}while(templatevo != null);
			
			template.setTemplatecode(templatecode);
			template.setTemplatename(name);
			template.setIsvalid(1);
			medicalrecordtemplateService.add(template);
			
			medicalrecordService.edit(medicalrecord);
		}else{
			medicalrecordService.edit(medicalrecord);
		}
		request().setAttribute("resulttext", "edit");
		return list();
	}
	
	/**
	 * 删除病历
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete",produces="application/json")
	public Object delete(Integer id){
		int i = medicalrecordService.delete(id);
		String msg = i > 0 ? "删除成功" : "删除失败";
		return JSONSerializer.toJSON("{'msg':'"+ msg +"'}");
	}
}
