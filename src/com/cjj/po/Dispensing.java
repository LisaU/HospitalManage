package com.cjj.po;

import java.util.Date;

public class Dispensing {
    private Integer id;

    private Integer chargeid;

    private Integer dispensingstatus;

    private Date dispensingtime;

    private Integer isvalid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getChargeid() {
        return chargeid;
    }

    public void setChargeid(Integer chargeid) {
        this.chargeid = chargeid;
    }

    public Integer getDispensingstatus() {
        return dispensingstatus;
    }

    public void setDispensingstatus(Integer dispensingstatus) {
        this.dispensingstatus = dispensingstatus;
    }

    public Date getDispensingtime() {
        return dispensingtime;
    }

    public void setDispensingtime(Date dispensingtime) {
        this.dispensingtime = dispensingtime;
    }

    public Integer getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }
}