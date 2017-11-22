package com.cjj.po;

public class Patient {
    private Integer id;

    private String cardcode;

    private String patientname;

    private Integer sex;

    private Integer maritalstatusid;

    private String job;

    private Integer patienttypeid;

    private Integer age;

    private Integer insuretypeid;

    private String medicarecode;

    private Integer viptypeid;

    private String tel;

    private String address;

    private String taboo;

    private String drugallergyhistory;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCardcode() {
        return cardcode;
    }

    public void setCardcode(String cardcode) {
        this.cardcode = cardcode == null ? null : cardcode.trim();
    }

    public String getPatientname() {
        return patientname;
    }

    public void setPatientname(String patientname) {
        this.patientname = patientname == null ? null : patientname.trim();
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getMaritalstatusid() {
        return maritalstatusid;
    }

    public void setMaritalstatusid(Integer maritalstatusid) {
        this.maritalstatusid = maritalstatusid;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job == null ? null : job.trim();
    }

    public Integer getPatienttypeid() {
        return patienttypeid;
    }

    public void setPatienttypeid(Integer patienttypeid) {
        this.patienttypeid = patienttypeid;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getInsuretypeid() {
        return insuretypeid;
    }

    public void setInsuretypeid(Integer insuretypeid) {
        this.insuretypeid = insuretypeid;
    }

    public String getMedicarecode() {
        return medicarecode;
    }

    public void setMedicarecode(String medicarecode) {
        this.medicarecode = medicarecode == null ? null : medicarecode.trim();
    }

    public Integer getViptypeid() {
        return viptypeid;
    }

    public void setViptypeid(Integer viptypeid) {
        this.viptypeid = viptypeid;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getTaboo() {
        return taboo;
    }

    public void setTaboo(String taboo) {
        this.taboo = taboo == null ? null : taboo.trim();
    }

    public String getDrugallergyhistory() {
        return drugallergyhistory;
    }

    public void setDrugallergyhistory(String drugallergyhistory) {
        this.drugallergyhistory = drugallergyhistory == null ? null : drugallergyhistory.trim();
    }
}