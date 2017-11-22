package com.cjj.po;

import java.util.Date;

public class Medicalrecord {
    private Integer id;

    private Integer registerid;

    private String medicalrecordcode;

    private String medicalrecordname;

    private Integer doctorid;

    private Integer diseaseid;

    private String note;

    private String patientappeal;

    private String medicalhistory;

    private String physicalstatus;

    private String primarydiagnosis;

    private String opinion;

    private Date recordtime;

    private Integer isvalid;

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

    public String getMedicalrecordcode() {
        return medicalrecordcode;
    }

    public void setMedicalrecordcode(String medicalrecordcode) {
        this.medicalrecordcode = medicalrecordcode == null ? null : medicalrecordcode.trim();
    }

    public String getMedicalrecordname() {
        return medicalrecordname;
    }

    public void setMedicalrecordname(String medicalrecordname) {
        this.medicalrecordname = medicalrecordname == null ? null : medicalrecordname.trim();
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

    public Date getRecordtime() {
        return recordtime;
    }

    public void setRecordtime(Date recordtime) {
        this.recordtime = recordtime;
    }

    public Integer getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }
}