package com.cjj.po;

import java.util.ArrayList;
import java.util.List;

public class Prescriptiontemplate {
    private Integer id;

    private String templatename;

    private Integer doctorid;

    private Integer natureid;

    private Integer prescriptiontypeid;

    private Integer classifyid;

    private String note;

    private String diagnosis;

    private Integer isvalid;
    
    private List<Prescriptiontemplatedetail> detail = new ArrayList<Prescriptiontemplatedetail>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTemplatename() {
        return templatename;
    }

    public void setTemplatename(String templatename) {
        this.templatename = templatename == null ? null : templatename.trim();
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

    public Integer getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }

	public List<Prescriptiontemplatedetail> getDetail() {
		return detail;
	}

	public void setDetail(List<Prescriptiontemplatedetail> detail) {
		this.detail = detail;
	}
}