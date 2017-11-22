package com.cjj.web.dispensingmanage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cjj.core.common.BaseController;
import com.cjj.core.util.DateUtil;
import com.cjj.po.Dispensing;
import com.cjj.po.Drug;
import com.cjj.po.Prescriptiondetail;
import com.cjj.po.Register;
import com.cjj.service.personnelmanage.DepartmentService;
import com.cjj.service.dispensingmanage.DrugService;
import com.cjj.service.personnelmanage.EmployeeService;
import com.cjj.service.dispensingmanage.DispensingService;
import com.cjj.service.doctorworkstation.PrescriptiondetailService;
import com.cjj.service.registermanage.RegisterService;
import com.cjj.vo.DispensingVo;
import com.cjj.vo.PrescriptiondetailVo;

@Controller
@RequestMapping("/dispensingController")
public class DispensingController extends BaseController{

	@Autowired
	private DispensingService dispensingService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private PrescriptiondetailService prescriptiondetailService;
	@Autowired
	private RegisterService registerService;
	@Autowired
	private DrugService drugService;
	
	/**
	 * 发药页面，查询科室部门和医生信息
	 * @return
	 */
	@RequestMapping("/list")
	public String list(){
		request().setAttribute("departments", departmentService.findAll());
		request().setAttribute("doctors",  employeeService.findIsRegister());
		return "/dispensingmanage/dispensing/dispensing";
	}
	
	/**
	 * 模糊查询
	 * @param bo
	 * @param pagesize
	 * @param currentpage
	 * @return
	 */
	@RequestMapping("/datalist")
	public String datelist(DispensingVo bo,Integer pagesize, Integer currentpage){
		//获取总行数
		int sumrow = dispensingService.manyConditionsFind(bo, 0, 99999999).size();
		//设置分页参数
		setPaging(pagesize, sumrow, currentpage);
		//获取分页后的数据
		List<DispensingVo> list = dispensingService.manyConditionsFind(bo,pagingVo.getCurrentpage(),pagesize);
		request().setAttribute("dispensings", list);
		return "/dispensingmanage/dispensing/table/dispensingtable";
	}
	
	/**
	 * 查询中药明细
	 * @param prescriptionid
	 * @return
	 */
	@RequestMapping("/zydetailtablelist")
	public String zydetailtablelist(Integer prescriptionid){
		List<PrescriptiondetailVo> zylist = prescriptiondetailService.findZyByPrescriptionId(prescriptionid);
		request().setAttribute("zydetail", zylist);
		return "/dispensingmanage/dispensing/table/zydetailtable";
	}
	
	/**
	 * 查询西药明细
	 * @param prescriptionid
	 * @return
	 */
	@RequestMapping("/xydetailtablelist")
	public String xydetailtablelist(Integer prescriptionid){
		List<PrescriptiondetailVo> xylist = prescriptiondetailService.findXyByPrescriptionId(prescriptionid);
		request().setAttribute("xydetail", xylist);
		return "/dispensingmanage/dispensing/table/xydetailtable";
	}
	
	/**
	 * 发药
	 * @param chargeid
	 * @param registerid
	 * @return
	 */
	@RequestMapping("/dispensing")
	public String dispensing(Integer chargeid,Integer registerid){
		Register register = new Register();
		register.setId(registerid);
		register.setRegisterstatus(5);
		registerService.updatestatus(register);
		Dispensing dispensing = new Dispensing();
		dispensing.setDispensingstatus(2);
		dispensing.setDispensingtime(DateUtil.timestamp());
		dispensing.setChargeid(chargeid);
		dispensingService.updatedispensingstatus(dispensing);
		List<Prescriptiondetail> list = prescriptiondetailService.findByRegisterid(registerid);
		for (Prescriptiondetail pd : list) {
			Integer count = pd.getMedicineamount();
			Integer id = pd.getDrugid();
			Drug drug = drugService.findById(id);
			drug.setInventoryquantity(drug.getInventoryquantity() - count);
			drugService.updateInventoryquantity(drug);
		}
		request().setAttribute("resulttext", "add");
		return list();
	}
	
	/**
	 * 退药
	 * @param chargeid
	 * @param registerid
	 * @return
	 */
	@RequestMapping("/dispensingout")
	public String dispensingout(Integer chargeid,Integer registerid){
		Register register = new Register();
		register.setId(registerid);
		register.setRegisterstatus(6);
		registerService.updatestatus(register);
		Dispensing dispensing = new Dispensing();
		dispensing.setDispensingstatus(3);
		dispensing.setDispensingtime(DateUtil.timestamp());
		dispensing.setChargeid(chargeid);
		dispensingService.updatedispensingstatus(dispensing);
		List<Prescriptiondetail> list = prescriptiondetailService.findByRegisterid(registerid);
		for (Prescriptiondetail pd : list) {
			Integer count = pd.getMedicineamount();
			Integer id = pd.getDrugid();
			Drug drug = drugService.findById(id);
			drug.setInventoryquantity(drug.getInventoryquantity() + count);
			drugService.updateInventoryquantity(drug);
		}
		request().setAttribute("resulttext", "edit");
		return list();
	}
}
