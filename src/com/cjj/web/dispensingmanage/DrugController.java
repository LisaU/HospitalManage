package com.cjj.web.dispensingmanage;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONSerializer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cjj.core.common.BaseController;
import com.cjj.core.util.DateUtil;
import com.cjj.core.util.FileLoadUtil;
import com.cjj.po.Drug;
import com.cjj.service.baseinfo.AttributedetailService;
import com.cjj.service.baseinfo.ChargetypeService;
import com.cjj.service.dispensingmanage.DrugService;
import com.cjj.service.baseinfo.SupplierService;
import com.cjj.vo.DrugVo;

@Controller
@RequestMapping("/drugController")
public class DrugController extends BaseController{
	
	@Autowired
	private DrugService drugService;
	@Autowired
	private ChargetypeService chargetypeService;
	@Autowired
	private AttributedetailService attributedetailService;
	@Autowired
	private SupplierService supplierService;
	
	/**
	 * 药品页面，查询收费类别和供应商
	 * @return
	 */
	@RequestMapping("/list")
	public String list(){
		request().setAttribute("chargetypes", chargetypeService.findAll());
		request().setAttribute("suppliers", supplierService.findAll());
		return "/dispensingmanage/drug/drug_list";
	}
	
	/**
	 * 模糊查询药品
	 * @param contant
	 * @return
	 */
	@RequestMapping("/drugtablelist")
	public String drugtablelist(String contant){
		List<DrugVo> list = drugService.vagueFind(contant);
		request().setAttribute("drugs", list);
		return "/doctorworkstation/prescription/table/drugtable";
	}
	
	/**
	 * 分页查询
	 * @param bo
	 * @param pagesize
	 * @param currentpage
	 * @return
	 */
	@RequestMapping("/datalist")
	public String datalist(DrugVo bo,Integer pagesize, Integer currentpage){
		//获取总行数
		int sumrow = drugService.manyConditionsFind(bo, 0, 99999999).size();
		//设置分页参数
		setPaging(pagesize, sumrow, currentpage);
		//获取分页后的数据
		List<DrugVo> list = drugService.manyConditionsFind(bo,pagingVo.getCurrentpage(),pagesize);
		request().setAttribute("drugs", list);
		return "/dispensingmanage/drug/table/drugtable";
	}
	
	/**
	 * 添加药品页面
	 * @return
	 */
	@RequestMapping("/toadd")
	public String toadd(){
		request().setAttribute("chargetypes", chargetypeService.findAll());
		request().setAttribute("drugtypes", attributedetailService.findByAttributeid(6));
		request().setAttribute("agenttypes", attributedetailService.findByAttributeid(7));
		request().setAttribute("medicaretypes", attributedetailService.findByAttributeid(8));
		request().setAttribute("suppliers", supplierService.findAll());
		return "/dispensingmanage/drug/drug_add";
	}
	
	/**
	 * 添加药品
	 * @param bo
	 * @param myfile
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/add")
	public String add(Drug bo,@RequestParam(value="file",required=true)MultipartFile myfile) throws IOException{
		if(!myfile.isEmpty()){
			String picture = FileLoadUtil.file_load(myfile,request());
			bo.setPicture(picture);
		}else{
			bo.setPicture("http://127.0.0.1:8089/hospitalmanage/initial1.jpg");
		}
		
		bo.setTypeinpersonnelid(5);
		bo.setTypeindatetime(DateUtil.timestamp());
		bo.setIsvalid(1);
		drugService.add(bo);
		request().setAttribute("resulttext", "add");		
		return list();
	}
	
	/**
	 * 自动装载格式化日期
	 * @param binder
	 * @throws Exception
	 */
	@InitBinder
	protected void initBinder(ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(Date.class, new DateUtil());
	}
	
	/**
	 * 修改药品页面
	 * @param id
	 * @return
	 */
	@RequestMapping("/toedit")
	public String toedit(int id){
		request().setAttribute("chargetypes", chargetypeService.findAll());
		request().setAttribute("drugtypes", attributedetailService.findByAttributeid(6));
		request().setAttribute("agenttypes", attributedetailService.findByAttributeid(7));
		request().setAttribute("medicaretypes", attributedetailService.findByAttributeid(8));
		request().setAttribute("suppliers", supplierService.findAll());
		request().setAttribute("drug", drugService.findById(id));
		return "/dispensingmanage/drug/drug_edit";
	}
	
	/**
	 * 修改药品
	 * @param bo
	 * @param myfile
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/edit")
	public String edit(Drug bo,@RequestParam(value="file",required=true)MultipartFile myfile) throws IOException{
		if(!myfile.isEmpty()){
			String picture = FileLoadUtil.file_load(myfile,request());
			bo.setPicture(picture);
		}
		bo.setAlterpersonnelid(5);
		bo.setAlterdatetime(DateUtil.timestamp());
		drugService.edit(bo);
		request().setAttribute("resulttext", "edit");
		return list();
	}
	
	/**
	 * 添加库存
	 * @param bo
	 * @return
	 */
	@RequestMapping("/addInventoryquantity")
	public String addInventoryquantity(Drug bo){
		Drug drug = drugService.findById(bo.getId());
		bo.setInventoryquantity(drug.getInventoryquantity() + bo.getInventoryquantity());
		drugService.updateInventoryquantity(bo);
		request().setAttribute("resulttext", "addCount");
		return list();
	}
	
	/**
	 * 库存报损
	 * @param bo
	 * @return
	 */
	@RequestMapping("/reduceInventoryquantity")
	public String reduceInventoryquantity(Drug bo){
		Drug drug = drugService.findById(bo.getId());
		bo.setInventoryquantity(drug.getInventoryquantity() - bo.getInventoryquantity());
		drugService.updateInventoryquantity(bo);
		request().setAttribute("resulttext", "reduceCount");
		return list();
	}
	
	/**
	 * 删除药品
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete",produces="application/json")
	public Object delete(Integer id){
		int i = drugService.delete(id);
		String msg = i > 0 ? "删除成功" : "删除失败";
		return JSONSerializer.toJSON("{'msg':'"+ msg +"'}");
	}
}
