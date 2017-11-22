package com.cjj.po;

public class Prescriptiontemplatedetail {
    private Integer id;

    private Integer prescriptiontemplateid;

    private Integer drugid;

    private Integer eachdosage;

    private Integer dosagequantity;

    private Integer medicineformid;

    private Integer medicinefrequencyid;

    private Integer medicineamount;

    private String note;

    private Integer isvalid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPrescriptiontemplateid() {
        return prescriptiontemplateid;
    }

    public void setPrescriptiontemplateid(Integer prescriptiontemplateid) {
        this.prescriptiontemplateid = prescriptiontemplateid;
    }

    public Integer getDrugid() {
        return drugid;
    }

    public void setDrugid(Integer drugid) {
        this.drugid = drugid;
    }

    public Integer getEachdosage() {
        return eachdosage;
    }

    public void setEachdosage(Integer eachdosage) {
        this.eachdosage = eachdosage;
    }

    public Integer getDosagequantity() {
        return dosagequantity;
    }

    public void setDosagequantity(Integer dosagequantity) {
        this.dosagequantity = dosagequantity;
    }

    public Integer getMedicineformid() {
        return medicineformid;
    }

    public void setMedicineformid(Integer medicineformid) {
        this.medicineformid = medicineformid;
    }

    public Integer getMedicinefrequencyid() {
        return medicinefrequencyid;
    }

    public void setMedicinefrequencyid(Integer medicinefrequencyid) {
        this.medicinefrequencyid = medicinefrequencyid;
    }

    public Integer getMedicineamount() {
        return medicineamount;
    }

    public void setMedicineamount(Integer medicineamount) {
        this.medicineamount = medicineamount;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public Integer getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }
}