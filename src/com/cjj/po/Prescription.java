package com.cjj.po;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Prescription {
    private Integer id;

    private Integer registerid;

    private String prescriptioncode;

    private String prescriptionname;

    private Integer doctorid;

    private Integer natureid;

    private Integer prescriptiontypeid;

    private Integer classifyid;

    private String note;

    private String diagnosis;

    private Date prescriptiontime;

    private Integer isvalid;
    
    private List<Prescriptiondetail> detail = new ArrayList<Prescriptiondetail>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRegisterid() {
        return registerid;
    }

    public void setRegisterid(Integer registerid) {
        this.registerid = registerid;
    }

    public String getPrescriptioncode() {
        return prescriptioncode;
    }

    public void setPrescriptioncode(String prescriptioncode) {
        this.prescriptioncode = prescriptioncode == null ? null : prescriptioncode.trim();
    }

    public String getPrescriptionname() {
        return prescriptionname;
    }

    public void setPrescriptionname(String prescriptionname) {
        this.prescriptionname = prescriptionname == null ? null : prescriptionname.trim();
    }

    public Integer getDoctorid() {
        return doctorid;
    }

    public void setDoctorid(Integer doctorid) {
        this.doctorid = doctorid;
    }

    public Integer getNatureid() {
        return natureid;
    }

    public void setNatureid(Integer natureid) {
        this.natureid = natureid;
    }

    public Integer getPrescriptiontypeid() {
        return prescriptiontypeid;
    }

    public void setPrescriptiontypeid(Integer prescriptiontypeid) {
        this.prescriptiontypeid = prescriptiontypeid;
    }

    public Integer getClassifyid() {
        return classifyid;
    }

    public void setClassifyid(Integer classifyid) {
        this.classifyid = classifyid;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis == null ? null : diagnosis.trim();
    }

    public Date getPrescriptiontime() {
        return prescriptiontime;
    }

    public void setPrescriptiontime(Date prescriptiontime) {
        this.prescriptiontime = prescriptiontime;
    }

    public Integer getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }

	public List<Prescriptiondetail> getDetail() {
		return detail;
	}

	public void setDetail(List<Prescriptiondetail> detail) {
		this.detail = detail;
	}
}