package com.cjj.po;

import java.util.Date;

public class Employee {
    private Integer id;

    private String employeecode;

    private String employeename;

    private String psw;

    private String pinyincode;

    private String wubicode;

    private Integer jobtitleid;

    private Integer positionid;

    private Integer sex;

    private String tel;

    private Integer departmentid;

    private String email;

    private String idcard;

    private String address;

    private Date birthday;

    private Date inductiontime;

    private Date dimissiontime;

    private Integer maxeducationid;

    private Integer majorid;

    private Integer politicsstatusid;

    private Integer isoperator;

    private Integer isdoctor;

    private Integer isnurse;

    private Integer workstatus;

    private String picture;

    private String note;

    private Integer isvalid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmployeecode() {
        return employeecode;
    }

    public void setEmployeecode(String employeecode) {
        this.employeecode = employeecode == null ? null : employeecode.trim();
    }

    public String getEmployeename() {
        return employeename;
    }

    public void setEmployeename(String employeename) {
        this.employeename = employeename == null ? null : employeename.trim();
    }

    public String getPsw() {
        return psw;
    }

    public void setPsw(String psw) {
        this.psw = psw == null ? null : psw.trim();
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

    public Integer getJobtitleid() {
        return jobtitleid;
    }

    public void setJobtitleid(Integer jobtitleid) {
        this.jobtitleid = jobtitleid;
    }

    public Integer getPositionid() {
        return positionid;
    }

    public void setPositionid(Integer positionid) {
        this.positionid = positionid;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public Integer getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(Integer departmentid) {
        this.departmentid = departmentid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getInductiontime() {
        return inductiontime;
    }

    public void setInductiontime(Date inductiontime) {
        this.inductiontime = inductiontime;
    }

    public Date getDimissiontime() {
        return dimissiontime;
    }

    public void setDimissiontime(Date dimissiontime) {
        this.dimissiontime = dimissiontime;
    }

    public Integer getMaxeducationid() {
        return maxeducationid;
    }

    public void setMaxeducationid(Integer maxeducationid) {
        this.maxeducationid = maxeducationid;
    }

    public Integer getMajorid() {
        return majorid;
    }

    public void setMajorid(Integer majorid) {
        this.majorid = majorid;
    }

    public Integer getPoliticsstatusid() {
        return politicsstatusid;
    }

    public void setPoliticsstatusid(Integer politicsstatusid) {
        this.politicsstatusid = politicsstatusid;
    }

    public Integer getIsoperator() {
        return isoperator;
    }

    public void setIsoperator(Integer isoperator) {
        this.isoperator = isoperator;
    }

    public Integer getIsdoctor() {
        return isdoctor;
    }

    public void setIsdoctor(Integer isdoctor) {
        this.isdoctor = isdoctor;
    }

    public Integer getIsnurse() {
        return isnurse;
    }

    public void setIsnurse(Integer isnurse) {
        this.isnurse = isnurse;
    }

    public Integer getworkstatus() {
        return workstatus;
    }

    public void setworkstatus(Integer workstatus) {
        this.workstatus = workstatus;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture == null ? null : picture.trim();
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