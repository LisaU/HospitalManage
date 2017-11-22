package com.cjj.po;

import java.math.BigDecimal;

public class Department {
    private Integer id;

    private String departmentcode;

    private String departmentname;

    private String pinyincode;

    private String wubicode;

    private BigDecimal registersum;

    private String site;

    private Integer isregister;

    private Integer isvalid;

    private String note;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDepartmentcode() {
        return departmentcode;
    }

    public void setDepartmentcode(String departmentcode) {
        this.departmentcode = departmentcode == null ? null : departmentcode.trim();
    }

    public String getDepartmentname() {
        return departmentname;
    }

    public void setDepartmentname(String departmentname) {
        this.departmentname = departmentname == null ? null : departmentname.trim();
    }

    public String getPinyincode() {
        return pinyincode;
    }

    public void setPinyincode(String pinyincode) {
        this.pinyincode = pinyincode == null ? null : pinyincode.trim();
    }

    public String getWubicode() {
        return wubicode;
    }

    public void setWubicode(String wubicode) {
        this.wubicode = wubicode == null ? null : wubicode.trim();
    }

    public BigDecimal getRegistersum() {
        return registersum;
    }

    public void setRegistersum(BigDecimal registersum) {
        this.registersum = registersum;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site == null ? null : site.trim();
    }

    public Integer getIsregister() {
        return isregister;
    }

    public void setIsregister(Integer isregister) {
        this.isregister = isregister;
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