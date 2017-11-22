package com.cjj.po;

import java.math.BigDecimal;
import java.util.Date;

public class Drug {
    private Integer id;

    private Integer chargetypeid;

    private String drugname;

    private String drugcode;

    private String barcode;

    private String medicalsciencecode;

    private String enname;

    private String origin;

    private String approvalnumber;

    private String pinyincode;

    private String wubicode;

    private Integer drugtypeid;

    private Integer agenttypeid;

    private String dosageunit;

    private String unitdosage;

    private String norms;

    private BigDecimal inbulkbuyprice;

    private BigDecimal inbulkvipprice;

    private BigDecimal inbulksellprice;

    private BigDecimal packagebuyprice;

    private BigDecimal packagesellprice;

    private BigDecimal packagevipprice;

    private Integer ismedicare;

    private Integer medicaretypeid;

    private Integer medicarecode;

    private String medicareprice;

    private Integer isaddwater;

    private Integer isst;

    private Integer isspecialdrug;

    private String shelfcode;

    private Date productiondata;

    private Integer expiration;

    private Integer supplierid;

    private Integer usestatus;

    private String manufacturer;

    private String applysymptom;

    private String mainefficacy;

    private Integer inventoryquantity;

    private BigDecimal inventoryprice;

    private Integer typeinpersonnelid;

    private Date typeindatetime;

    private Integer alterpersonnelid;

    private Date alterdatetime;

    private String picture;

    private Integer isvalid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getChargetypeid() {
        return chargetypeid;
    }

    public void setChargetypeid(Integer chargetypeid) {
        this.chargetypeid = chargetypeid;
    }

    public String getDrugname() {
        return drugname;
    }

    public void setDrugname(String drugname) {
        this.drugname = drugname == null ? null : drugname.trim();
    }

    public String getDrugcode() {
        return drugcode;
    }

    public void setDrugcode(String drugcode) {
        this.drugcode = drugcode == null ? null : drugcode.trim();
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode == null ? null : barcode.trim();
    }

    public String getMedicalsciencecode() {
        return medicalsciencecode;
    }

    public void setMedicalsciencecode(String medicalsciencecode) {
        this.medicalsciencecode = medicalsciencecode == null ? null : medicalsciencecode.trim();
    }

    public String getEnname() {
        return enname;
    }

    public void setEnname(String enname) {
        this.enname = enname == null ? null : enname.trim();
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin == null ? null : origin.trim();
    }

    public String getApprovalnumber() {
        return approvalnumber;
    }

    public void setApprovalnumber(String approvalnumber) {
        this.approvalnumber = approvalnumber == null ? null : approvalnumber.trim();
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

    public Integer getDrugtypeid() {
        return drugtypeid;
    }

    public void setDrugtypeid(Integer drugtypeid) {
        this.drugtypeid = drugtypeid;
    }

    public Integer getAgenttypeid() {
        return agenttypeid;
    }

    public void setAgenttypeid(Integer agenttypeid) {
        this.agenttypeid = agenttypeid;
    }

    public String getDosageunit() {
        return dosageunit;
    }

    public void setDosageunit(String dosageunit) {
        this.dosageunit = dosageunit == null ? null : dosageunit.trim();
    }

    public String getUnitdosage() {
        return unitdosage;
    }

    public void setUnitdosage(String unitdosage) {
        this.unitdosage = unitdosage == null ? null : unitdosage.trim();
    }

    public String getNorms() {
        return norms;
    }

    public void setNorms(String norms) {
        this.norms = norms == null ? null : norms.trim();
    }

    public BigDecimal getInbulkbuyprice() {
        return inbulkbuyprice;
    }

    public void setInbulkbuyprice(BigDecimal inbulkbuyprice) {
        this.inbulkbuyprice = inbulkbuyprice;
    }

    public BigDecimal getInbulkvipprice() {
        return inbulkvipprice;
    }

    public void setInbulkvipprice(BigDecimal inbulkvipprice) {
        this.inbulkvipprice = inbulkvipprice;
    }

    public BigDecimal getInbulksellprice() {
        return inbulksellprice;
    }

    public void setInbulksellprice(BigDecimal inbulksellprice) {
        this.inbulksellprice = inbulksellprice;
    }

    public BigDecimal getPackagebuyprice() {
        return packagebuyprice;
    }

    public void setPackagebuyprice(BigDecimal packagebuyprice) {
        this.packagebuyprice = packagebuyprice;
    }

    public BigDecimal getPackagesellprice() {
        return packagesellprice;
    }

    public void setPackagesellprice(BigDecimal packagesellprice) {
        this.packagesellprice = packagesellprice;
    }

    public BigDecimal getPackagevipprice() {
        return packagevipprice;
    }

    public void setPackagevipprice(BigDecimal packagevipprice) {
        this.packagevipprice = packagevipprice;
    }

    public Integer getIsmedicare() {
        return ismedicare;
    }

    public void setIsmedicare(Integer ismedicare) {
        this.ismedicare = ismedicare;
    }

    public Integer getMedicaretypeid() {
        return medicaretypeid;
    }

    public void setMedicaretypeid(Integer medicaretypeid) {
        this.medicaretypeid = medicaretypeid;
    }

    public Integer getMedicarecode() {
        return medicarecode;
    }

    public void setMedicarecode(Integer medicarecode) {
        this.medicarecode = medicarecode;
    }

    public String getMedicareprice() {
        return medicareprice;
    }

    public void setMedicareprice(String medicareprice) {
        this.medicareprice = medicareprice == null ? null : medicareprice.trim();
    }

    public Integer getIsaddwater() {
        return isaddwater;
    }

    public void setIsaddwater(Integer isaddwater) {
        this.isaddwater = isaddwater;
    }

    public Integer getIsst() {
        return isst;
    }

    public void setIsst(Integer isst) {
        this.isst = isst;
    }

    public Integer getIsspecialdrug() {
        return isspecialdrug;
    }

    public void setIsspecialdrug(Integer isspecialdrug) {
        this.isspecialdrug = isspecialdrug;
    }

    public String getShelfcode() {
        return shelfcode;
    }

    public void setShelfcode(String shelfcode) {
        this.shelfcode = shelfcode == null ? null : shelfcode.trim();
    }

    public Date getProductiondata() {
        return productiondata;
    }

    public void setProductiondata(Date productiondata) {
        this.productiondata = productiondata;
    }

    public Integer getExpiration() {
        return expiration;
    }

    public void setExpiration(Integer expiration) {
        this.expiration = expiration;
    }

    public Integer getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(Integer supplierid) {
        this.supplierid = supplierid;
    }

    public Integer getUsestatus() {
        return usestatus;
    }

    public void setUsestatus(Integer usestatus) {
        this.usestatus = usestatus;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer == null ? null : manufacturer.trim();
    }

    public String getApplysymptom() {
        return applysymptom;
    }

    public void setApplysymptom(String applysymptom) {
        this.applysymptom = applysymptom == null ? null : applysymptom.trim();
    }

    public String getMainefficacy() {
        return mainefficacy;
    }

    public void setMainefficacy(String mainefficacy) {
        this.mainefficacy = mainefficacy == null ? null : mainefficacy.trim();
    }

    public Integer getInventoryquantity() {
        return inventoryquantity;
    }

    public void setInventoryquantity(Integer inventoryquantity) {
        this.inventoryquantity = inventoryquantity;
    }

    public BigDecimal getInventoryprice() {
        return inventoryprice;
    }

    public void setInventoryprice(BigDecimal inventoryprice) {
        this.inventoryprice = inventoryprice;
    }

    public Integer getTypeinpersonnelid() {
        return typeinpersonnelid;
    }

    public void setTypeinpersonnelid(Integer typeinpersonnelid) {
        this.typeinpersonnelid = typeinpersonnelid;
    }

    public Date getTypeindatetime() {
        return typeindatetime;
    }

    public void setTypeindatetime(Date typeindatetime) {
        this.typeindatetime = typeindatetime;
    }

    public Integer getAlterpersonnelid() {
        return alterpersonnelid;
    }

    public void setAlterpersonnelid(Integer alterpersonnelid) {
        this.alterpersonnelid = alterpersonnelid;
    }

    public Date getAlterdatetime() {
        return alterdatetime;
    }

    public void setAlterdatetime(Date alterdatetime) {
        this.alterdatetime = alterdatetime;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture == null ? null : picture.trim();
    }

    public Integer getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }
}