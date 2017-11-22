package com.cjj.po;

import java.math.BigDecimal;
import java.util.Date;

public class Charge {
    private Integer id;

    private Integer prescriptionid;

    private String receiptcode;

    private String invoicecode;

    private Integer chargestatus;

    private Integer discount;

    private Integer privilege;

    private BigDecimal beforereceivable;

    private BigDecimal afterreceivable;

    private BigDecimal medicarecanpay;

    private BigDecimal cost;

    private Integer operationpersonid;

    private Date chargetime;

    private Integer isvalid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPrescriptionid() {
        return prescriptionid;
    }

    public void setPrescriptionid(Integer prescriptionid) {
        this.prescriptionid = prescriptionid;
    }

    public String getReceiptcode() {
        return receiptcode;
    }

    public void setReceiptcode(String receiptcode) {
        this.receiptcode = receiptcode == null ? null : receiptcode.trim();
    }

    public String getInvoicecode() {
        return invoicecode;
    }

    public void setInvoicecode(String invoicecode) {
        this.invoicecode = invoicecode == null ? null : invoicecode.trim();
    }

    public Integer getChargestatus() {
        return chargestatus;
    }

    public void setChargestatus(Integer chargestatus) {
        this.chargestatus = chargestatus;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    public Integer getPrivilege() {
        return privilege;
    }

    public void setPrivilege(Integer privilege) {
        this.privilege = privilege;
    }

    public BigDecimal getBeforereceivable() {
        return beforereceivable;
    }

    public void setBeforereceivable(BigDecimal beforereceivable) {
        this.beforereceivable = beforereceivable;
    }

    public BigDecimal getAfterreceivable() {
        return afterreceivable;
    }

    public void setAfterreceivable(BigDecimal afterreceivable) {
        this.afterreceivable = afterreceivable;
    }

    public BigDecimal getMedicarecanpay() {
        return medicarecanpay;
    }

    public void setMedicarecanpay(BigDecimal medicarecanpay) {
        this.medicarecanpay = medicarecanpay;
    }

    public BigDecimal getCost() {
        return cost;
    }

    public void setCost(BigDecimal cost) {
        this.cost = cost;
    }

    public Integer getOperationpersonid() {
        return operationpersonid;
    }

    public void setOperationpersonid(Integer operationpersonid) {
        this.operationpersonid = operationpersonid;
    }

    public Date getChargetime() {
        return chargetime;
    }

    public void setChargetime(Date chargetime) {
        this.chargetime = chargetime;
    }

    public Integer getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }
}