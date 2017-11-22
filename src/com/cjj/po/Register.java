package com.cjj.po;

import java.math.BigDecimal;
import java.util.Date;

public class Register {
    private Integer id;

    private Integer patientid;

    private Integer registertypeid;

    private String registercode;

    private Integer departmentid;

    private Integer doctorid;

    private BigDecimal registersum;

    private Date registertime;

    /**
     * 1已挂号、2就诊中、3已就诊、4已付款、5已发药、6已退药、7已退款
     */
    private Integer registerstatus;

    private Integer registerpersonid;

    private Integer isvalid;

    private String note;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPatientid() {
        return patientid;
    }

    public void setPatientid(Integer patientid) {
        this.patientid = patientid;
    }

    public Integer getRegistertypeid() {
        return registertypeid;
    }

    public void setRegistertypeid(Integer registertypeid) {
        this.registertypeid = registertypeid;
    }

    public String getRegistercode() {
        return registercode;
    }

    public void setRegistercode(String registercode) {
        this.registercode = registercode == null ? null : registercode.trim();
    }

    public Integer getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(Integer departmentid) {
        this.departmentid = departmentid;
    }

    public Integer getDoctorid() {
        return doctorid;
    }

    public void setDoctorid(Integer doctorid) {
        this.doctorid = doctorid;
    }

    public BigDecimal getRegistersum() {
        return registersum;
    }

    public void setRegistersum(BigDecimal registersum) {
        this.registersum = registersum;
    }

    public Date getRegistertime() {
        return registertime;
    }

    public void setRegistertime(Date registertime) {
        this.registertime = registertime;
    }

    public Integer getRegisterstatus() {
        return registerstatus;
    }

    public void setRegisterstatus(Integer registerstatus) {
        this.registerstatus = registerstatus;
    }

    public Integer getRegisterpersonid() {
        return registerpersonid;
    }

    public void setRegisterpersonid(Integer registerpersonid) {
        this.registerpersonid = registerpersonid;
    }

    public Integer getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }
}