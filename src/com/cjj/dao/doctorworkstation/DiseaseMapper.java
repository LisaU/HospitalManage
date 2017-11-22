package com.cjj.dao.doctorworkstation;

import java.util.List;

import com.cjj.po.Disease;

public interface DiseaseMapper {
    /**
     * 查询疾病类型
     * @return
     */
    List<Disease> findAll();
}