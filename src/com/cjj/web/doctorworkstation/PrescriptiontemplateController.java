package com.cjj.web.doctorworkstation;

import java.util.List;

import net.sf.json.JSONSerializer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjj.core.common.BaseController;
import com.cjj.po.Prescriptiontemplate;
import com.cjj.po.Prescriptiontemplatedetail;
import com.cjj.service.baseinfo.AttributedetailService;
import com.cjj.service.personnelmanage.DepartmentService;
import com.cjj.service.personnelmanage.EmployeeService;
import com.cjj.service.doctorworkstation.PrescriptiontemplateService;
import com.cjj.service.doctorworkstation.PrescriptiontemplatedetailService;
import com.cjj.vo.PrescriptiontemplateVo;
import com.cjj.vo.PrescriptiontemplatedetailVo;

@Controller
@RequestMapping("/prescriptiontemplateController")
public class PrescriptiontemplateController extends BaseController{

	@Autowired
	private PrescriptiontemplateService prescriptiontemplateService;
	@Autowired
	private AttributedetailService attributedetailService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private PrescriptiontemplatedetailService prescriptiontemplatedetailService;
	
	/**
	 * 处方模板页面
	 * @return
	 */
	@RequestMapping("/list")
	public String list(){
		request().setAttribute("prescriptiontypes", attributedetailService.findByAttributeid(15));
		request().setAttribute("departments", departmentService.findIsRgs());
		request().setAttribute("doctors", employeeService.findIsRegister());
		return "/doctorworkstation/prescription/prescriptiontemplate_list";
	}
	
	/**
	 * 分页查询
	 * @param bo
	 * @param pagesize
	 * @param currentpage
	 * @return
	 */
	@RequestMapping("/datalist")
	public String datalist(PrescriptiontemplateVo bo,Integer pagesize, Integer currentpage){		
		//获取总行数
		int sumrow = prescriptiontemplateService.manyConditionsFind(bo, 0, 99999999).size();
		//设置分页参数
		setPaging(pagesize, sumrow, currentpage);
		//获取分页后的数据
		List<PrescriptiontemplateVo> list = prescriptiontemplateService.manyConditionsFind(bo,pagingVo.getCurrentpage(),pagesize);
		request().setAttribute("templates", list);
		return "/doctorworkstation/prescription/table/prescriptiontemplatetable";
	}
	
	/**
	 * 查询处方模板明细
	 * @param id
	 * @return
	 */
	@RequestMapping("/detailtablelist")
	public String detailtablelist(int id){
		List<PrescriptiontemplatedetailVo> list = prescriptiontemplatedetailService.findByTemplateid(id);
		request().setAttribute("details", list);
		return "/doctorworkstation/prescription/table/prescriptiontemplatedetailtable";
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
	 * 新增处方模板页面
	 * @return
	 */
	@RequestMapping("/toadd")
	public String toadd(){
		return toset("/doctorworkstation/prescription/prescriptiontemplate_add");
	}
	
	/**
	 * 新增处方模板
	 * @param bo
	 * @return
	 */
	@RequestMapping("/add")
	public String add(Prescriptiontemplate bo){		
		bo.setIsvalid(1);
		int i = prescriptiontemplateService.add(bo);
		//新增处方模板明细
		for (Prescriptiontemplatedetail dbo : bo.getDetail()) {
			if(dbo.getDrugid() != null){
				dbo.setPrescriptiontemplateid(i);
				dbo.setIsvalid(1);
				prescriptiontemplatedetailService.add(dbo);
			}
		}
		request().setAttribute("resulttext", "add");
		return list();
	}
	
	/**
	 * 修改处方模板页面
	 * @param id
	 * @return
	 */
	@RequestMapping("/toedit")
	public String toedit(int id){
		request().setAttribute("prescription", prescriptiontemplateService.findByid(id));
		request().setAttribute("details", prescriptiontemplatedetailService.findByTemplateid(id));
		return toset("/doctorworkstation/prescription/prescriptiontemplate_edit");
	}
	
	/**
	 * 修改处方模板
	 * @param bo
	 * @return
	 */
	@RequestMapping("/edit")
	public String edit(Prescriptiontemplate bo){		
		int i = prescriptiontemplateService.edit(bo);
		//删除原处方模板明细
		prescriptiontemplatedetailService.deleteByPrescriptionid(i);
		//新增处方模板明细
		for (Prescriptiontemplatedetail dbo : bo.getDetail()) {
			if(dbo.getDrugid() != null){
				dbo.setPrescriptiontemplateid(i);
				dbo.setIsvalid(1);
				prescriptiontemplatedetailService.add(dbo);
			}
		}
		request().setAttribute("resulttext", "edit");
		return list();
	}
	
	/**
	 * 删除处方模板
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete",produces="application/json")
	public Object delete(Integer id){
		int i = prescriptiontemplateService.delete(id);
		//根据处方模板id删除处方模板明细
		prescriptiontemplatedetailService.deleteByPrescriptionid(i);
		String msg = i > 0 ? "删除成功" : "删除失败";
		return JSONSerializer.toJSON("{'msg':'"+ msg +"'}");
	}
	
	/**
	 * 查询处方明细
	 * @param id
	 * @return
	 */
	@RequestMapping("/prescriptdetailtablelist")
	public String prescriptdetailtablelist(int id){
		List<PrescriptiontemplatedetailVo> list = prescriptiontemplatedetailService.findByTemplateid(id);
		request().setAttribute("details", list);
		return "/doctorworkstation/prescription/table/detailtable";
	}
}
