package com.cjj.vo;

import com.cjj.po.Patient;

public class PatientVo extends Patient{
	/**
	 * 病人类型名称
	 */
	private String patienttypename;
	/**
	 * 婚姻状况名称
	 */
	private String maritalstatusname;
	/**
	 * 参保类型名称
	 */
	private String insuretypename;
	/**
	 * 会员类型名称
	 */
	private String viptypename;
	
	public String getPatienttypename() {
		return patienttypename;
	}
	public void setPatienttypename(String patienttypename) {
		this.patienttypename = patienttypename;
	}
	public String getMaritalstatusname() {
		return maritalstatusname;
	}
	public void setMaritalstatusname(String maritalstatusname) {
		this.maritalstatusname = maritalstatusname;
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
}
