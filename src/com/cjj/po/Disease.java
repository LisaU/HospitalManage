package com.cjj.po;

public class Disease {
    private Integer id;

    private String diseasecode;

    private String diseasename;

    private String diseaseexplain;

    private Integer isvalid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDiseasecode() {
        return diseasecode;
    }

    public void setDiseasecode(String diseasecode) {
        this.diseasecode = diseasecode == null ? null : diseasecode.trim();
    }

    public String getDiseasename() {
        return diseasename;
    }

    public void setDiseasename(String diseasename) {
        this.diseasename = diseasename == null ? null : diseasename.trim();
    }

    public String getDiseaseexplain() {
        return diseaseexplain;
    }

    public void setDiseaseexplain(String diseaseexplain) {
        this.diseaseexplain = diseaseexplain == null ? null : diseaseexplain.trim();
    }

    public Integer getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }
}