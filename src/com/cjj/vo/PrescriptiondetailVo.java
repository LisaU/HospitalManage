package com.cjj.vo;

import java.math.BigDecimal;

import com.cjj.po.Prescriptiondetail;

public class PrescriptiondetailVo extends Prescriptiondetail{
	/**
	 * 药品编号
	 */
	private String drugcode;
	/**
	 * 药品名称
	 */
	private String drugname;
	/**
	 * 零售价
	 */
	private BigDecimal inbulksellprice;
	/**
	 * 剂量单位
	 */
	private String dosageunit;
	/**
	 * 是否医保
	 */
	private Integer ismedicare;
	/**
	 * 药品类型名称
	 */
	private String drugtypename;
	/**
	 * 药品金额
	 */
	private BigDecimal drugsum;
	/**
	 * 用药方式名称
	 */
	private String medicineformname;
	/**
	 * 用药频率名称
	 */
	private String medicinefrequencyname;
	/**
	 * 药品剂型名称
	 */
	private String agenttypename;
	/**
	 * 药品规格
	 */
	private String norms;
	
	public String getDrugcode() {
		return drugcode;
	}
	public void setDrugcode(String drugcode) {
		this.drugcode = drugcode;
	}
	public String getDrugname() {
		return drugname;
	}
	public void setDrugname(String drugname) {
		this.drugname = drugname;
	}
	public BigDecimal getInbulksellprice() {
		return inbulksellprice;
	}
	public void setInbulksellprice(BigDecimal inbulksellprice) {
		this.inbulksellprice = inbulksellprice;
	}
	public String getDosageunit() {
		return dosageunit;
	}
	public void setDosageunit(String dosageunit) {
		this.dosageunit = dosageunit;
	}
	public Integer getIsmedicare() {
		return ismedicare;
	}
	public void setIsmedicare(Integer ismedicare) {
		this.ismedicare = ismedicare;
	}
	public String getDrugtypename() {
		return drugtypename;
	}
	public void setDrugtypename(String drugtypename) {
		this.drugtypename = drugtypename;
	}
	public BigDecimal getDrugsum() {
		return drugsum;
	}
	public void setDrugsum(BigDecimal drugsum) {
		this.drugsum = drugsum;
	}
	public String getMedicineformname() {
		return medicineformname;
	}
	public void setMedicineformname(String medicineformname) {
		this.medicineformname = medicineformname;
	}
	public String getMedicinefrequencyname() {
		return medicinefrequencyname;
	}
	public void setMedicinefrequencyname(String medicinefrequencyname) {
		this.medicinefrequencyname = medicinefrequencyname;
	}
	public String getAgenttypename() {
		return agenttypename;
	}
	public void setAgenttypename(String agenttypename) {
		this.agenttypename = agenttypename;
	}
	public String getNorms() {
		return norms;
	}
	public void setNorms(String norms) {
		this.norms = norms;
	}
}
