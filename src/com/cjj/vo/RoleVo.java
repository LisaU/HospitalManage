package com.cjj.vo;

import com.cjj.po.Role;

public class RoleVo extends Role{
	/**
	 * id和r组合而成，用于生成树
	 */
	private String rid;
	/**
	 * 父级rid，用于生成树
	 */
	private String frid;

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getFrid() {
		return frid;
	}

	public void setFrid(String frid) {
		this.frid = frid;
	}
}
