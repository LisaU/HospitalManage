package com.cjj.vo;

import java.math.BigDecimal;

import com.cjj.po.Prescription;

public class PrescriptionVo extends Prescription{
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
	 * 处方分类名称
	 */
	private String classifyname;
	/**
	 * 挂号状态
	 */
	private int registerstatus;
	/**
	 * 性别
	 */
	private String sex;
	/**
	 * 年龄
	 */
	private String age;
	/**
	 * 保险类型名称
	 */
	private String insuretypename;
	/**
	 * 会员类型名称
	 */
	private String viptypename;
	/**
	 * 类别折扣
	 */
	private int typediscount;
	/**
	 * 折前金额
	 */
	private BigDecimal beforediscountsum;
	/**
	 * 医保支付
	 */
	private BigDecimal medicarepay;
	/**
	 * 折后金额
	 */
	private BigDecimal behinddiscountsum;
	/**
	 * 优惠
	 */
	private int privilege;
	/**
	 * 退款
	 */
	private BigDecimal refund;
	/**
	 * 收据号
	 */
	private String receiptcode;
		
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
	public int getRegisterstatus() {
		return registerstatus;
	}
	public void setRegisterstatus(int registerstatus) {
		this.registerstatus = registerstatus;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
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
	public int getTypediscount() {
		return typediscount;
	}
	public void setTypediscount(int typediscount) {
		this.typediscount = typediscount;
	}
	public BigDecimal getBeforediscountsum() {
		return beforediscountsum;
	}
	public void setBeforediscountsum(BigDecimal beforediscountsum) {
		this.beforediscountsum = beforediscountsum;
	}
	public BigDecimal getMedicarepay() {
		return medicarepay;
	}
	public void setMedicarepay(BigDecimal medicarepay) {
		this.medicarepay = medicarepay;
	}
	public BigDecimal getBehinddiscountsum() {
		return behinddiscountsum;
	}
	public void setBehinddiscountsum(BigDecimal behinddiscountsum) {
		this.behinddiscountsum = behinddiscountsum;
	}
	public int getPrivilege() {
		return privilege;
	}
	public void setPrivilege(int privilege) {
		this.privilege = privilege;
	}
	public BigDecimal getRefund() {
		return refund;
	}
	public void setRefund(BigDecimal refund) {
		this.refund = refund;
	}
	public String getReceiptcode() {
		return receiptcode;
	}
	public void setReceiptcode(String receiptcode) {
		this.receiptcode = receiptcode;
	}
}
