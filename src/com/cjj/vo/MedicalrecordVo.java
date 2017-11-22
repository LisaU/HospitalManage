package com.cjj.vo;

import com.cjj.po.Medicalrecord;

public class MedicalrecordVo extends Medicalrecord{
	/**
	 * 挂号单号
	 */
	private String registercode;
	/**
	 * 病人卡号
	 */
	private String cardcode;
	/**
	 * 病人名称
	 */
	private String patientname;
	/**
	 * 员工名称
	 */
	private String employeename;
	/**
	 * 科室名称
	 */
	private String departmentname;
	/**
	 * 疾病类型名称
	 */
	private String diseasename;
	/**
	 * 科室id
	 */
	private int departmentid;
	
	public String getRegistercode() {
		return registercode;
	}
	public void setRegistercode(String registercode) {
		this.registercode = registercode;
	}
	public String getCardcode() {
		return cardcode;
	}
	public void setCardcode(String cardcode) {
		this.cardcode = cardcode;
	}
	public String getPatientname() {
		return patientname;
	}
	public void setPatientname(String patientname) {
		this.patientname = patientname;
	}
	public String getEmployeename() {
		return employeename;
	}
	public void setEmployeename(String employeename) {
		this.employeename = employeename;
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
	public int getDepartmentid() {
		return departmentid;
	}
	public void setDepartmentid(int departmentid) {
		this.departmentid = departmentid;
	}
}
