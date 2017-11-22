package com.cjj.vo;

import com.cjj.po.Drug;

public class DrugVo extends Drug{
	/**
	 * 收费类别名称
	 */
	private String chargetypename;
	/**
	 * 药品类别名称
	 */
	private String drugtypename;
	/**
	 * 药品剂型名称 
	 */
	private String agenttypename;
	/**
	 * 医保名称
	 */
	private String medicaretypename;
	/**
	 * 供应商名称
	 */
	private String suppliername;
	/**
	 * 员工名称
	 */
	private String employeename;
	/**
	 * 当前页
	 */
	private Integer nowpage;
	/**
	 * 每页显示数
	 */
	private Integer pagesize;
	/**
	 * 虚拟盘
	 */
	private Integer virtualinventory;
	
	public String getChargetypename() {
		return chargetypename;
	}
	public void setChargetypename(String chargetypename) {
		this.chargetypename = chargetypename;
	}
	public String getDrugtypename() {
		return drugtypename;
	}
	public void setDrugtypename(String drugtypename) {
		this.drugtypename = drugtypename;
	}
	public String getAgenttypename() {
		return agenttypename;
	}
	public void setAgenttypename(String agenttypename) {
		this.agenttypename = agenttypename;
	}
	public String getMedicaretypename() {
		return medicaretypename;
	}
	public void setMedicaretypename(String medicaretypename) {
		this.medicaretypename = medicaretypename;
	}
	public String getSuppliername() {
		return suppliername;
	}
	public void setSuppliername(String suppliername) {
		this.suppliername = suppliername;
	}
	public String getEmployeename() {
		return employeename;
	}
	public void setEmployeename(String employeename) {
		this.employeename = employeename;
	}
	public Integer getNowpage() {
		return nowpage;
	}
	public void setNowpage(Integer nowpage) {
		this.nowpage = nowpage;
	}
	public Integer getPagesize() {
		return pagesize;
	}
	public void setPagesize(Integer pagesize) {
		this.pagesize = pagesize;
	}
	public Integer getVirtualinventory() {
		return virtualinventory;
	}
	public void setVirtualinventory(Integer virtualinventory) {
		this.virtualinventory = virtualinventory;
	}	
}
