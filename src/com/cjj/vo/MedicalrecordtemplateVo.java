package com.cjj.vo;

import com.cjj.po.Medicalrecordtemplate;

public class MedicalrecordtemplateVo extends Medicalrecordtemplate{
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
	 * 疾病类型名称
	 */
	private String diseasename;
	
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
	public String getDiseasename() {
		return diseasename;
	}
	public void setDiseasename(String diseasename) {
		this.diseasename = diseasename;
	}	
}
