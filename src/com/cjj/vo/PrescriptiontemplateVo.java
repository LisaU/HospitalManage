package com.cjj.vo;

import com.cjj.po.Prescriptiontemplate;

public class PrescriptiontemplateVo extends Prescriptiontemplate{
	/**
	 * 员工名称
	 */
	private String employeename;
	/**
	 * 科室id
	 */
	private int departmentid;
	/**
	 * 科室名称
	 */
	private String departmentname;
	/**
	 * 模板性质名称
	 */
	private String naturename;
	/**
	 * 处方类型名称
	 */
	private String prescriptiontypename;
	/**
	 * 模板分类名称
	 */
	private String classifyname;
	
	public String getEmployeename() {
		return employeename;
	}
	public void setEmployeename(String employeename) {
		this.employeename = employeename;
	}
	public int getDepartmentid() {
		return departmentid;
	}
	public void setDepartmentid(int departmentid) {
		this.departmentid = departmentid;
	}
	public String getDepartmentname() {
		return departmentname;
	}
	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}
	public String getNaturename() {
		return naturename;
	}
	public void setNaturename(String naturename) {
		this.naturename = naturename;
	}
	public String getPrescriptiontypename() {
		return prescriptiontypename;
	}
	public void setPrescriptiontypename(String prescriptiontypename) {
		this.prescriptiontypename = prescriptiontypename;
	}
	public String getClassifyname() {
		return classifyname;
	}
	public void setClassifyname(String classifyname) {
		this.classifyname = classifyname;
	}	
}
