package com.cjj.vo;

import com.cjj.po.Dispensing;

public class DispensingVo extends Dispensing{
	/**
	 * 收费状态
	 */
	private int chargestatus;
	/**
	 * 处方id
	 */
	private int prescriptionid;
	/**
	 * 挂号id
	 */
	private int registerid;
	/**
	 * 处方单号
	 */
	private String prescriptioncode;
	/**
	 * 病人卡号
	 */
	private String cardcode;
	/**
	 * 病人名称
	 */
	private String patientname;
	/**
	 * 员工姓名
	 */
	private String employeename;
	/**
	 * 科室id
	 */
	private int departmentid;
	/**
	 * 医生id
	 */
	private int doctorid;
	/**
	 * 查询时段，起
	 */
	private String begintime;
	/**
	 * 查询时段，止
	 */
	private String endtime;
	
	public int getChargestatus() {
		return chargestatus;
	}
	public void setChargestatus(int chargestatus) {
		this.chargestatus = chargestatus;
	}
	public int getPrescriptionid() {
		return prescriptionid;
	}
	public void setPrescriptionid(int prescriptionid) {
		this.prescriptionid = prescriptionid;
	}
	public int getRegisterid() {
		return registerid;
	}
	public void setRegisterid(int registerid) {
		this.registerid = registerid;
	}
	public String getPrescriptioncode() {
		return prescriptioncode;
	}
	public void setPrescriptioncode(String prescriptioncode) {
		this.prescriptioncode = prescriptioncode;
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
	public int getDepartmentid() {
		return departmentid;
	}
	public void setDepartmentid(int departmentid) {
		this.departmentid = departmentid;
	}
	public int getDoctorid() {
		return doctorid;
	}
	public void setDoctorid(int doctorid) {
		this.doctorid = doctorid;
	}
	public String getBegintime() {
		return begintime;
	}
	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
}
