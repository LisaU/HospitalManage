package com.cjj.dao.baseinfo;

import java.util.List;

import com.cjj.po.Viptype;

public interface ViptypeMapper {
    /**
     * 查询会员类别
     * @return
     */
    List<Viptype> findAll();
}