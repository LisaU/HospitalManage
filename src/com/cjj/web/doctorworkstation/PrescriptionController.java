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
import com.cjj.po.Prescription;
import com.cjj.po.Prescriptiondetail;
import com.cjj.po.Prescriptiontemplate;
import com.cjj.po.Prescriptiontemplatedetail;
import com.cjj.po.Register;
import com.cjj.service.baseinfo.AttributedetailService;
import com.cjj.service.personnelmanage.DepartmentService;
import com.cjj.service.personnelmanage.EmployeeService;
import com.cjj.service.doctorworkstation.PrescriptionService;
import com.cjj.service.doctorworkstation.PrescriptiondetailService;
import com.cjj.service.doctorworkstation.PrescriptiontemplateService;
import com.cjj.service.doctorworkstation.PrescriptiontemplatedetailService;
import com.cjj.service.registermanage.RegisterService;
import com.cjj.vo.PrescriptionVo;
import com.cjj.vo.PrescriptiondetailVo;
import com.cjj.vo.PrescriptiontemplateVo;
import com.cjj.vo.RegisterVo;

@Controller
@RequestMapping("/prescriptionController")
public class PrescriptionController extends BaseController{

	@Autowired
	private PrescriptionService prescriptionService;
	@Autowired
	private AttributedetailService attributedetailService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private PrescriptiondetailService prescriptiondetailService;
	@Autowired
	private PrescriptiontemplateService prescriptiontemplateService;
	@Autowired
	private RegisterService registerService;
	@Autowired
	private PrescriptiontemplatedetailService prescriptiontemplatedetailService;
	
	/**
	 * 处方页面
	 * @return
	 */
	@RequestMapping("/list")
	public String list(){
		request().setAttribute("departments", departmentService.findIsRgs());
		request().setAttribute("doctors", employeeService.findIsRegister());
		return "/doctorworkstation/prescription/prescription_list";
	}
	
	/**
	 * 模糊查询
	 * @param bo
	 * @param pagesize
	 * @param currentpage
	 * @return
	 */
	@RequestMapping("/datalist")
	public String datalist(PrescriptionVo bo,Integer pagesize, Integer currentpage){		
		//获取总行数
		int sumrow = prescriptionService.manyConditionsFind(bo, 0, 99999999).size();
		//设置分页参数
		setPaging(pagesize, sumrow, currentpage);
		//获取分页后的数据
		List<PrescriptionVo> list = prescriptionService.manyConditionsFind(bo,pagingVo.getCurrentpage(),pagesize);
		request().setAttribute("prescriptions", list);
		return "/doctorworkstation/prescription/table/prescriptiontable";
	}
	
	/**
	 * 查询处方明细
	 * @param id
	 * @return
	 */
	@RequestMapping("/detailtablelist")
	public String detailtablelist(int id){
		List<PrescriptiondetailVo> list = prescriptiondetailService.findByPrescriptionid(id);
		request().setAttribute("details", list);
		return "/doctorworkstation/prescription/table/prescriptiontemplatedetailtable";
	}

	/**
	 * 收费页面查询处方明细
	 * @param id
	 * @param status
	 * @return
	 */
	@RequestMapping("/chargedetailtablelist")
	public String chargedetailtablelist(int id,int status){
		String link = "";
		List<PrescriptiondetailVo> list = prescriptiondetailService.findByPrescriptionid(id);
		request().setAttribute("details", list);
		if(status == 1){
			link = "/chargemanage/table/prescriptiondetailtable";
		}else{
			link = "/chargemanage/table/chargehistorydetailtable";
		}
		return link;
	}
	
	/**
	 * 查询各类信息，用于绑定下拉框
	 * @param link
	 * @return
	 */
	public String toset(String link){
		request().setAttribute("naturenames", attributedetailService.findByAttributeid(14));
		request().setAttribute("prescriptiontypes", attributedetailService.findByAttributeid(15));
		request().setAttribute("classifynames", attributedetailService.findByAttributeid(16));
		request().setAttribute("doctors", employeeService.findIsRegister());
		request().setAttribute("medicineforms", attributedetailService.findByAttributeid(24));
		request().setAttribute("medicinefrequencys", attributedetailService.findByAttributeid(25));
		return link;
	}
	
	/**
	 * 开出方页面
	 * @return
	 */
	@RequestMapping("/toadd")
	public String toadd(){
		return toset("/doctorworkstation/prescription/prescription_add");
	}
	
	/**
	 * 模糊查询处方模板
	 * @param contant
	 * @return
	 */
	@RequestMapping("/templatetablelist")
	public String templatetablelist(String contant){
		List<PrescriptiontemplateVo> list = prescriptiontemplateService.vagueFind(contant);
		request().setAttribute("templates", list);
		return "/doctorworkstation/prescription/table/templatetable";
	}
	
	/**
	 * 模糊查询挂号信息
	 * @param contant
	 * @return
	 */
	@RequestMapping("/registertablelist")
	public String registertablelist(String contant){
		RegisterVo bo = new RegisterVo();
		bo.setRegisterstatus(2);
		bo.setCardcode(contant);
		bo.setPatientname(contant);
		List<RegisterVo> list = registerService.vagueFind(bo);
		request().setAttribute("registers", list);
		return "/doctorworkstation/medicalrecord/table/registertable";
	}
	
	/**
	 * 新增处方信息
	 * @param bo
	 */
	public void addPrescription(Prescription bo){
		String code = "CFD" + new Random().nextInt(99999999);
		Prescription vo = prescriptionService.findRepetitionByCode(code);
		do {
			code = "CFD" + new Random().nextInt(99999999);
			vo = prescriptionService.findRepetitionByCode(code);
		}while(vo != null);
		
		bo.setPrescriptioncode(code);
		bo.setPrescriptiontime(DateUtil.timestamp());
		bo.setIsvalid(1);
		int i = prescriptionService.add(bo);
		for (Prescriptiondetail dbo : bo.getDetail()) {
			if(dbo.getDrugid() != null){
				dbo.setPrescriptionid(i);
				dbo.setIsvalid(1);
				prescriptiondetailService.add(dbo);
			}
		}
	}
	
	/**
	 * 新增处方模板信息
	 * @param prescription
	 * @param template
	 */
	public void addPrescriptiontemplate(Prescription prescription, Prescriptiontemplate template){
		template.setTemplatename(prescription.getPrescriptionname());
		template.setIsvalid(1);
		int i = prescriptiontemplateService.add(template);
		for (Prescriptiontemplatedetail tdbo : template.getDetail()) {
			if(tdbo.getDrugid() != null){
				tdbo.setPrescriptiontemplateid(i);
				tdbo.setIsvalid(1);
				prescriptiontemplatedetailService.add(tdbo);
			}
		}
	}
	
	/**
	 * 开处方
	 * @param prescription
	 * @param template
	 * @return
	 */
	@RequestMapping("/add")
	public String add(Prescription prescription, Prescriptiontemplate template){
		String name = prescription.getPrescriptionname();
		Prescriptiontemplate namevo = prescriptiontemplateService.findRepetitionByName(name);
		//若处方模板中没有该处方记录，则添加处方模板
		if(namevo == null){
			addPrescriptiontemplate(prescription,template);
			
			addPrescription(prescription);
		}else{
			addPrescription(prescription);			
		}
		Register register = new Register();
		register.setId(prescription.getRegisterid());
		register.setRegisterstatus(3);
		registerService.updatestatus(register);
		request().setAttribute("resulttext", "add");
		return list();
	}	
	
	/**
	 * 修改处方页面
	 * @param id
	 * @return
	 */
	@RequestMapping("/toedit")
	public String toedit(int id){
		PrescriptionVo vo = prescriptionService.findByid(id);
		request().setAttribute("prescription", vo);
		request().setAttribute("register", registerService.findByid(vo.getRegisterid()));
		request().setAttribute("details", prescriptiondetailService.findByPrescriptionid(id));
		return toset("/doctorworkstation/prescription/prescription_edit");
	}
	
	/**
	 * 修改处方信息
	 * @param bo
	 */
	public void editPrescription(Prescription bo){
		int i = prescriptionService.edit(bo);
		prescriptiondetailService.deleteByPrescriptionid(i);
		for (Prescriptiondetail dbo : bo.getDetail()) {
			if(dbo.getDrugid() != null){
				dbo.setPrescriptionid(i);
				dbo.setIsvalid(1);
				prescriptiondetailService.add(dbo);
			}
		}
	}
	
	/**
	 * 修改处方
	 * @param prescription
	 * @param template
	 * @return
	 */
	@RequestMapping("/edit")
	public String edit(Prescription prescription, Prescriptiontemplate template){	
		String name = prescription.getPrescriptionname();
		Prescriptiontemplate namevo = prescriptiontemplateService.findRepetitionByName(name);
		//若处方模板中没有该处方记录，则添加处方模板
		if(namevo == null){
			addPrescriptiontemplate(prescription,template);
			
			editPrescription(prescription);
		}else{
			editPrescription(prescription);
		}
		Register register = new Register();
		register.setId(prescription.getRegisterid());
		register.setRegisterstatus(3);
		registerService.updatestatus(register);
		request().setAttribute("resulttext", "edit");
		return list();
	}
	
	/**
	 * 删除处方
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete",produces="application/json")
	public Object delete(Integer id){
		//删除处方
		int i = prescriptionService.delete(id);
		//根据处方id删除处方明细
		prescriptiondetailService.deleteByPrescriptionid(i);
		String msg = i > 0 ? "删除成功" : "删除失败";
		return JSONSerializer.toJSON("{'msg':'"+ msg +"'}");
	}
}
