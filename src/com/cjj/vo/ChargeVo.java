package com.cjj.vo;

import java.math.BigDecimal;

import com.cjj.po.Charge;

public class ChargeVo extends Charge{
	/**
	 * 处方单号
	 */
	private String prescriptioncode;
	/**
	 * 处方时间
	 */
	private String prescriptiontime;
	/**
	 * 病人卡号
	 */
	private String cardcode;
	/**
	 * 病人姓名
	 */
	private String patientname;
	/**
	 * 病人性别
	 */
	private int sex;
	/**
	 * 病人年龄
	 */
	private int age;
	/**
	 * 联系电话
	 */
	private String tel;
	/**
	 * 参保类型
	 */
	private String insuretypename;
	/**
	 * 会员类型
	 */
	private String viptypename;
	/**
	 * 医生名称
	 */
	private String doctorname;
	/**
	 * 科室部门
	 */
	private String departmentname;
	/**
	 * 操作人员
	 */
	private String operationpersonname;
	/**
	 * 合计人数
	 */
	private int totalcount;
	/**
	 * 合计金额
	 */
	private BigDecimal totalsum;
	/**
	 * 开始时间
	 */
	private String begintime;
	/**
	 * 结束时间
	 */
	private String endtime;
	
	public String getPrescriptioncode() {
		return prescriptioncode;
	}
	public void setPrescriptioncode(String prescriptioncode) {
		this.prescriptioncode = prescriptioncode;
	}
	public String getPrescriptiontime() {
		return prescriptiontime;
	}
	public void setPrescriptiontime(String prescriptiontime) {
		this.prescriptiontime = prescriptiontime;
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
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getInsuretypename() {
		return insuretypename;
	}
	public void setInsuretypename(String insuretypename) {
		this.insuretypename = insuretypename;
	}
	public String getViptypename() {
		return viptypename;
	}
	public void setViptypename(String viptypename) {
		this.viptypename = viptypename;
	}
	public String getDoctorname() {
		return doctorname;
	}
	public void setDoctorname(String doctorname) {
		this.doctorname = doctorname;
	}
	public String getDepartmentname() {
		return departmentname;
	}
	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}
	public String getOperationpersonname() {
		return operationpersonname;
	}
	public void setOperationpersonname(String operationpersonname) {
		this.operationpersonname = operationpersonname;
	}
	public int getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	public BigDecimal getTotalsum() {
		return totalsum;
	}
	public void setTotalsum(BigDecimal totalsum) {
		this.totalsum = totalsum;
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
