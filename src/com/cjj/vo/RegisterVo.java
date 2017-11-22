package com.cjj.vo;

import java.math.BigDecimal;

import com.cjj.po.Register;

public class RegisterVo extends Register{
	/**
	 * 病人卡号
	 */
	private String cardcode;
	/**
	 * 病人名称
	 */
	private String patientname;
	/**
	 * 性别
	 */
	private int sex;
	/**
	 * 年龄
	 */
	private int age;
	/**
	 * 电话
	 */
	private String tel;
	/**
	 * 保险类型名称
	 */
	private String insuretypename;
	/**
	 * 药过敏史
	 */
	private String drugallergyhistory;
	/**
	 * 类型名称
	 */
	private String typename;
	/**
	 * 类型金额
	 */
	private BigDecimal typesum;
	/**
	 * 科室名称
	 */
	private String departmentname;
	/**
	 * 医生名称
	 */
	private String doctorname;
	/**
	 * 挂号人员姓名
	 */
	private String registerpersonname;
	/**
	 * 总挂号金额
	 */
	private BigDecimal sumregistersum;
	/**
	 * 挂号人数
	 */
	private int countregister;
	/**
	 * 查询时段，起
	 */
	private String begintime;
	/**
	 * 查询时段，止
	 */
	private String endtime;
	
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
	public String getDrugallergyhistory() {
		return drugallergyhistory;
	}
	public void setDrugallergyhistory(String drugallergyhistory) {
		this.drugallergyhistory = drugallergyhistory;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public BigDecimal getTypesum() {
		return typesum;
	}
	public void setTypesum(BigDecimal typesum) {
		this.typesum = typesum;
	}
	public String getDepartmentname() {
		return departmentname;
	}
	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}
	public String getDoctorname() {
		return doctorname;
	}
	public void setDoctorname(String doctorname) {
		this.doctorname = doctorname;
	}
	public String getRegisterpersonname() {
		return registerpersonname;
	}
	public void setRegisterpersonname(String registerpersonname) {
		this.registerpersonname = registerpersonname;
	}
	public BigDecimal getSumregistersum() {
		return sumregistersum;
	}
	public void setSumregistersum(BigDecimal sumregistersum) {
		this.sumregistersum = sumregistersum;
	}
	public int getCountregister() {
		return countregister;
	}
	public void setCountregister(int countregister) {
		this.countregister = countregister;
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
