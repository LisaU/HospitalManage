package com.cjj.po;

public class Attributedetail {
    private Integer id;

    private Integer attributeid;

    private String detailname;

    private String detailenname;

    private String note;

    private Integer isvalid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAttributeid() {
        return attributeid;
    }

    public void setAttributeid(Integer attributeid) {
        this.attributeid = attributeid;
    }

    public String getDetailname() {
        return detailname;
    }

    public void setDetailname(String detailname) {
        this.detailname = detailname == null ? null : detailname.trim();
    }

    public String getDetailenname() {
        return detailenname;
    }

    public void setDetailenname(String detailenname) {
        this.detailenname = detailenname == null ? null : detailenname.trim();
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