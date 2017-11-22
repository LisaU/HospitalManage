package com.cjj.po;

public class Medicalrecordtemplate {
    private Integer id;

    private String templatecode;

    private String templatename;

    private Integer doctorid;

    private Integer diseaseid;

    private String fitstatus;

    private String note;

    private String patientappeal;

    private String medicalhistory;

    private String physicalstatus;

    private String primarydiagnosis;

    private String opinion;

    private Integer isvalid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTemplatecode() {
        return templatecode;
    }

    public void setTemplatecode(String templatecode) {
        this.templatecode = templatecode == null ? null : templatecode.trim();
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

    public Integer getDiseaseid() {
        return diseaseid;
    }

    public void setDiseaseid(Integer diseaseid) {
        this.diseaseid = diseaseid;
    }

    public String getFitstatus() {
        return fitstatus;
    }

    public void setFitstatus(String fitstatus) {
        this.fitstatus = fitstatus == null ? null : fitstatus.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getPatientappeal() {
        return patientappeal;
    }

    public void setPatientappeal(String patientappeal) {
        this.patientappeal = patientappeal == null ? null : patientappeal.trim();
    }

    public String getMedicalhistory() {
        return medicalhistory;
    }

    public void setMedicalhistory(String medicalhistory) {
        this.medicalhistory = medicalhistory == null ? null : medicalhistory.trim();
    }

    public String getPhysicalstatus() {
        return physicalstatus;
    }

    public void setPhysicalstatus(String physicalstatus) {
        this.physicalstatus = physicalstatus == null ? null : physicalstatus.trim();
    }

    public String getPrimarydiagnosis() {
        return primarydiagnosis;
    }

    public void setPrimarydiagnosis(String primarydiagnosis) {
        this.primarydiagnosis = primarydiagnosis == null ? null : primarydiagnosis.trim();
    }

    public String getOpinion() {
        return opinion;
    }

    public void setOpinion(String opinion) {
        this.opinion = opinion == null ? null : opinion.trim();
    }

    public Integer getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }
}