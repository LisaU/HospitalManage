﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="../../common/quote.jsp" %>
		<link href="${ctx}/assets/custom/css/custom-part-style.css" rel="stylesheet" />
		<style type="text/css">
			.date-picker{display:block !important;}
			.add-on{position: relative; top:-30px; left:84%; z-index:3000;}
		</style>
	</head>

	<body>
		<div class="main-container container-fluid">
			<div class="main-content">
				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							药品档案
							<small>
								<i class="icon-double-angle-right"></i>
								修改药品信息
							</small>
						</h1>
					</div><!--/.page-header-->

					<form id="validation-form" class="form-horizontal" action="${ctx}/drugController/edit.do" method="post" enctype="multipart/form-data">
						<div style="border-bottom:1px dotted #e2e2e2; padding-bottom:13px; margin-bottom:13px;">
							<button class="btn btn-small" type="button" onclick="javascript:location.href='${ctx}/drugController/list.do';">
								<i class="icon-undo"></i>
								返回
							</button>

							<input type="hidden" name="id" value="${drug.id}">
							<button class="btn btn-small btn-primary" type="submit">
								<i class="icon-save"></i>
								保存
							</button>
						</div>
						
						<div class="row-fluid">
							<div></div>
							<div class="span4" style="width:73.7%;">
								
								<div class="row-fluid">
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">药品名称</label>
											<div class="controls controls-m">
												<input type="text" id="drugname" name="drugname" value="${drug.drugname}" onkeyup="getpinyin()"/>
											</div>
										</div>		
									</div><!--/span-->
			
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">英文名称</label>
											<div class="controls controls-m">
												<input type="text" name="enname" value="${drug.enname}"/>
											</div>
										</div>	
									</div><!--/span-->
			
									
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">费用类别</label>
											<div class="controls controls-m">
												<select class="chzn-select" data-placeholder="-请选择-" name="chargetypeid">
													<option value="0" />
													<c:forEach var="item" items="${chargetypes}">
														<option <c:if test="${drug.chargetypeid == item.id}">selected="selected"</c:if> value="${item.id}" />${item.typename}
													</c:forEach>
												</select>
											</div>
										</div>
									</div><!--/span-->
								</div><!--/.row-fluid-->
							
								<div class="row-fluid">
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">药品编码</label>
											<div class="controls controls-m">
												<input type="text" name="drugcode" value="${drug.drugcode}"/>
											</div>
										</div>		
									</div><!--/span-->
			
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">条形编码</label>
											<div class="controls controls-m">
												<input type="text" name="barcode" value="${drug.barcode}"/>
											</div>
										</div>	
									</div><!--/span-->
			
									
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">医学编码</label>
											<div class="controls controls-m">
												<input type="text" name="medicalsciencecode" value="${drug.medicalsciencecode}"/>
											</div>
										</div>
									</div><!--/span-->
								</div><!--/.row-fluid-->
			
								<div class="row-fluid">
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">拼音简码</label>
			
											<div class="controls controls-m">
												<input type="text" id="pinyincode" name="pinyincode" readonly="readonly" value="${drug.pinyincode}"/>
											</div>
										</div>	
									</div><!--/span-->
			
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">药品类型</label>
			
											<div class="controls controls-m">
												<select class="chzn-select" data-placeholder="-请选择-" name="drugtypeid">
													<option value="0" />
													<c:forEach var="item" items="${drugtypes}">
														<option <c:if test="${drug.drugtypeid == item.id}">selected="selected"</c:if> value="${item.id}" />${item.detailname}
													</c:forEach>
												</select>
											</div>
										</div>	
									</div><!--/span-->
			
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">药品剂型</label>
			
											<div class="controls controls-m">
												<select class="chzn-select" data-placeholder="-请选择-" name="agenttypeid">
													<option value="0" />
													<c:forEach var="item" items="${agenttypes}">
														<option <c:if test="${drug.agenttypeid == item.id}">selected="selected"</c:if> value="${item.id}" />${item.detailname}
													</c:forEach>
												</select>
											</div>
										</div>	
									</div><!--/span-->
								</div><!--/.row-fluid-->
			
								<div class="row-fluid">
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">剂量单位</label>
			
											<div class="controls controls-m">
												<input type="text" name="dosageunit" value="${drug.dosageunit}"/>
											</div>
										</div>		
									</div><!--/span-->
			
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">单位剂量</label>
			
											<div class="controls controls-m">
												<input type="text" name="unitdosage" value="${drug.unitdosage}"/>
											</div>
										</div>	
									</div><!--/span-->
			
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">药品规格</label>
			
											<div class="controls controls-m">
												<input type="text" name="norms" value="${drug.norms}"/>
											</div>
										</div>	
									</div><!--/span-->
								</div><!--/.row-fluid-->
			
								<div class="row-fluid">
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">散装进价</label>
			
											<div class="controls controls-m">
												<input type="text" name="inbulkbuyprice" value="${drug.inbulkbuyprice}"/>
											</div>
										</div>		
									</div><!--/span-->
			
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">散装售价</label>
			
											<div class="controls controls-m">
												<input type="text" name="inbulksellprice" value="${drug.inbulksellprice}"/>
											</div>
										</div>	
									</div><!--/span-->
			
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">散会员价</label>
			
											<div class="controls controls-m">
												<input type="text" name="inbulkvipprice" value="${drug.inbulkvipprice}"/>
											</div>
										</div>	
									</div><!--/span-->
								</div><!--/.row-fluid-->
			
								<div class="row-fluid">
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">件装进价</label>
			
											<div class="controls controls-m">
												<input type="text" name="packagebuyprice" value="${drug.packagebuyprice}"/>
											</div>
										</div>		
									</div><!--/span-->
			
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">件装售价</label>
			
											<div class="controls controls-m">
												<input type="text" name="packagesellprice" value="${drug.packagesellprice}"/>
											</div>
										</div>	
									</div><!--/span-->
			
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">件会员价</label>
			
											<div class="controls controls-m">
												<input type="text" name="packagevipprice" value="${drug.packagevipprice}"/>
											</div>
										</div>	
									</div><!--/span-->
								</div><!--/.row-fluid-->			
														
							</div>
							
							<div class="span4" style=" width:18%; margin-left: 0px;">
								<div class="control-group control-group-m">
									<div id="drugimgdiv" class="controls controls-m">
										<input type="file" name="file" id="btn_file" style="display: none">
										<img style="width:97.5%; height:260px; min-width:250px;" id="img_file" onclick="F_Open_dialog()" src="${drug.picture}">
										<c:if test="${drug.picture == null}">
											<a id="a_file" href="#" style="position:relative; left:90px; top:-145px; text-decoration:none;" onclick="F_Open_dialog()">点击添加图片</a>
											
										</c:if>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row-fluid">
							<div></div>
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">是否医保</label>
	
									<div class="controls controls-m">
										<div class="controls-radio">
											<label style="display:inline-block;">
												<input name="ismedicare" type="radio" <c:if test="${drug.ismedicare == 1}">checked="true"</c:if> value="1"/>
												<span class="lbl"> 是</span>
											</label>
		
											<label style="display:inline-block;">
												<input name="ismedicare" type="radio" <c:if test="${drug.ismedicare == 2}">checked="true"</c:if> value="2"/>
												<span class="lbl"> 否</span>
											</label>
										</div>
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">医保类别</label>
	
									<div class="controls controls-m">
										<select class="chzn-select" data-placeholder="-请选择-" name="medicaretypeid">
											<option value="0" />
											<c:forEach var="item" items="${medicaretypes}">
												<option <c:if test="${drug.medicaretypeid == item.id}">selected="selected"</c:if> value="${item.id}" />${item.detailname}
											</c:forEach>
										</select>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">医保编码</label>
	
									<div class="controls controls-m">
										<input type="text" name="medicarecode" value="${drug.medicarecode}"/>
									</div>
								</div>	
							</div><!--/span-->
							
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">录入人员</label>

									<div class="controls controls-m">
										<input type="text" disabled="" style="text-align:center;" value="${drug.employeename}"/>
									</div>
								</div>	
							</div><!--/span-->
							
						</div><!--/.row-fluid-->
						
						<div class="row-fluid">
							<div></div>
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">医保价格</label>
	
									<div class="controls controls-m">
										<input type="text" name="medicareprice" value="${drug.medicareprice}"/>
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">特殊药品</label>
									
									<div class="controls controls-m">
										<div class="controls-radio">
											<label style="display:inline-block;">
												<input name="isspecialdrug" type="radio" <c:if test="${drug.isspecialdrug == 1}">checked="true"</c:if> value="1"/>
												<span class="lbl"> 是</span>
											</label>
		
											<label style="display:inline-block;">
												<input name="isspecialdrug" type="radio" <c:if test="${drug.isspecialdrug == 2}">checked="true"</c:if> value="2"/>
												<span class="lbl"> 否</span>
											</label>
										</div>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">是否加水</label>
	
									<div class="controls controls-m">
										<div class="controls-radio">
											<label style="display:inline-block;">
												<input name="isaddwater" type="radio" <c:if test="${drug.isaddwater == 1}">checked="true"</c:if> value="1"/>
												<span class="lbl"> 是</span>
											</label>
		
											<label style="display:inline-block;">
												<input name="isaddwater" type="radio" <c:if test="${drug.isaddwater == 2}">checked="true"</c:if> value="2"/>
												<span class="lbl"> 否</span>
											</label>
										</div>
									</div>
								</div>	
							</div><!--/span-->
							
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">录入日期</label>
	
									<div class="controls controls-m">
										<input type="text" disabled="" style="text-align:center;" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${drug.typeindatetime}"/>'/>
									</div>	
								</div>	
							</div><!--/span-->							
						</div><!--/.row-fluid-->
						
						<div class="row-fluid">
							<div></div>
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">是否皮试</label>
	
									<div class="controls controls-m">
										<div class="controls-radio">
											<label style="display:inline-block;">
												<input name="isst" type="radio" <c:if test="${drug.isst == 1}">checked="true"</c:if> value="1"/>
												<span class="lbl"> 是</span>
											</label>
		
											<label style="display:inline-block;">
												<input name="isst" type="radio" <c:if test="${drug.isst == 2}">checked="true"</c:if> value="2"/>
												<span class="lbl"> 否</span>
											</label>
										</div>
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">供应商名</label>
	
									<div class="controls controls-m">
										<select class="chzn-select" data-placeholder="-请选择-" name="supplierid">
											<option value="0" />
											<c:forEach var="item" items="${suppliers}">
												<option <c:if test="${drug.supplierid == item.id}">selected="selected"</c:if> value="${item.id}" />${item.suppliername}
											</c:forEach>
										</select>												
									</div>
								</div>	
							</div><!--/span-->
							
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">使用状态</label>
	
									<div class="controls controls-m">
										<select class="chzn-select" data-placeholder="-请选择-" name="usestatus">
											<option value="0" />
											<option <c:if test="${drug.usestatus == 1}">selected="selected"</c:if> value="1" />正常使用
											<option <c:if test="${drug.usestatus == 2}">selected="selected"</c:if> value="2" />停用
											<option <c:if test="${drug.usestatus == 3}">selected="selected"</c:if> value="3" />只销
											<option <c:if test="${drug.usestatus == 4}">selected="selected"</c:if> value="4" />停销
										</select>
									</div>
								</div>		
							</div><!--/span-->
							
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">录入时间</label>
	
									<div class="controls controls-m">
										<input type="text" disabled="" style="text-align:center;" value='<fmt:formatDate pattern="HH:mm:ss" value="${drug.typeindatetime}"/>'/>
									</div>
								</div>		
							</div><!--/span-->
						</div><!--/.row-fluid-->
						
						<div class="row-fluid">
							<div></div>
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">厂商名称</label>
	
									<div class="controls controls-m">
										<input type="text" name="manufacturer" value="${drug.manufacturer}"/>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">适用症状</label>
	
									<div class="controls controls-m">
										<input type="text" name="applysymptom" value="${drug.applysymptom}"/>
									</div>
								</div>	
							</div><!--/span-->
							
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">主要功效</label>
	
									<div class="controls controls-m">
										<input type="text" name="mainefficacy" value="${drug.mainefficacy}"/>
									</div>
								</div>	
							</div><!--/span-->
							
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">修改人员</label>
	
									<div class="controls controls-m">
										<input type="text" disabled="" style="text-align:center;"/>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
						
						<div class="row-fluid">
							<div></div>
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">批准文号</label>
	
									<div class="controls controls-m">
										<input type="text" name="approvalnumber" value="${drug.approvalnumber}"/>
									</div>
								</div>
							</div><!--/span-->
									
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">生产日期</label>
	
									<div class="controls controls-m">
										<span class="text-m" >
											<div class="row-fluid input-append">
												<input class="date-picker" name="productiondata" type="text" data-date-format="yyyy-mm-dd" 
												value='<fmt:formatDate pattern="yyyy-MM-dd" value="${drug.productiondata}"/>'/>
												<span class="add-on" style="position: relative; right:27px; z-index:3000;">
													<i class="icon-calendar"></i>
												</span>
											</div>
										</span>
									</div>
								</div>
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">保质期</label>
	
									<div class="controls controls-m">
										<input type="text" name="expiration" value="${drug.expiration}"/>
									</div>
								</div>
							</div><!--/span-->
							
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">修改日期</label>
	
									<div class="controls controls-m">
										<input id="currentdata" type="text" disabled="" style="text-align:center;"/>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
						
						<div class="row-fluid">
							<div></div>	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">货架编码</label>
	
									<div class="controls controls-m">
										<input type="text" name="shelfcode" value="${drug.shelfcode}"/>
									</div>
								</div>
							</div><!--/span-->
							
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">入库数量</label>
	
									<div class="controls controls-m">
										<input type="text" name="inventoryquantity" value="${drug.inventoryquantity}"/>
									</div>
								</div>	
							</div><!--/span-->
							
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">入库单价</label>
	
									<div class="controls controls-m">
										<input type="text" name="inventoryprice" value="${drug.inventoryprice}"/>
									</div>
								</div>	
							</div><!--/span-->
							
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">修改时间</label>
	
									<div class="controls controls-m">
										<input id="currenttime" type="text" disabled="" style="text-align:center;"/>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->				
					</form><!-- /.form -->
				</div><!--/.page-content-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->

		<script type="text/javascript">
			$(function() {
				//图片转换
				$("#btn_file").change(function() {
					var $file = $(this);
					var fileValue = document.getElementById("btn_file").value;
					var fileObj = $file[0];
					var windowURL = window.URL || window.webkitURL;
					var dataURL;
					var $img = $("#img_file");
					var patn = /\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/;
					if(fileValue=="") return;
					if(patn.test(fileValue)){
						if(fileObj && fileObj.files && fileObj.files[0]){
							dataURL = windowURL.createObjectURL(fileObj.files[0]);
							$img.attr('src',dataURL);
						}else{
							dataURL = $file.val();
							var imgObj = document.getElementById("img_file");
							imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
							imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
						}
						$("#a_file").css('display','none');
					}
					else{
						swal({ 
							    title: "这货不是图片",
							    text: "图片类型必须是(gif、jpeg、jpg、png)其中一种", 
							    type: "warning",   
							    timer: 3000
							});
					}
				});
				
				//开启表单验证
				formValidate()
			});
			
			//图片点击事件
			function F_Open_dialog() 
			{ 
				$("#btn_file").click(); 
			}
			
			//获取拼音码
			function getpinyin(){
				$.post("${ctx}/passController/getpinyin.do",
				{zhname:$("#drugname").val()},
				function(data){	
					$("#pinyincode").val(data.pinyincode);
				});
			}
			
			//表单验证
			function formValidate(){
				$("#validation-form").validate({
					errorElement: 'label',
					errorClass: 'help-inline',
					focusInvalid: false,
				    rules: {
				   	  	drugname:"required",
				   	  	chargetypeid:"required",
				   	  	drugcode:{
				   	  		required:true,
				   	  		codeChar:true
				   	  	},
				   	  	barcode:{
				   	  		required:true,
				   	  		codeChar:true
				   	  	},
				   	  	medicalsciencecode:{
				   	  		required:true,
				   	  		codeChar:true
				   	  	},
				   	  	drugtypeid:"required",
				   	  	agenttypeid:"required",
				   	  	dosageunit:"required",
				   	  	unitdosage:"required",
				   	  	norms:"required",
				   	  	inbulkbuyprice:{
				   	  		required:true,
				   	  		number:true
				   	  	},
				   	  	inbulksellprice:{
				   	  		required:true,
				   	  		number:true
				   	  	},
				   	  	inbulkvipprice:{
				   	  		required:true,
				   	  		number:true
				   	  	},
				   	  	packagebuyprice:{
				   	  		required:true,
				   	  		number:true
				   	  	},
				   	  	packagesellprice:{
				   	  		required:true,
				   	  		number:true
				   	  	},
				   	  	packagevipprice:{
				   	  		required:true,
				   	  		number:true
				   	  	},
				   	  	ismedicare:"required",
				   	  	isspecialdrug:"required",
				   	  	isaddwater:"required",
				   	  	isst:"required",
				   	  	supplierid:"required",
				   	  	usestatus:"required",
				   	  	manufacturer:"required",
				   	  	applysymptom:"required",
				   	  	mainefficacy:"required",
				   	  	approvalnumber:"required",
				   	  	productiondata:"required",
				   	  	expiration:"required",
				   	  	inventoryquantity:"required",
				   	  	inventoryprice:"required"
				    },
				    messages:{
				      	chargetypeid:"这是必选字段",
				      	drugtypeid:"这是必选字段",
				      	agenttypeid:"这是必选字段",
				      	ismedicare:"这是必选字段",
				      	isspecialdrug:"这是必选字段",
				      	isaddwater:"这是必选字段",
				      	isst:"这是必选字段",
				      	supplierid:"这是必选字段",
				      	usestatus:"这是必选字段",
				      	productiondata:"这是必选字段"		      	
				    },
				    
				    highlight: function (e) {
						$(e).closest('.control-group').removeClass('info').addClass('error');
					},
			
					success: function (e) {
						$(e).closest('.control-group').removeClass('error').addClass('info');
						$(e).remove();
					},
					//重写提交方式
					submitHandler:function(){
						formSubmit();
					}
			    });
			}
			
			//表单提交
			function formSubmit(){
				swal({
				  	title: "是否保存?",
				  	text: "",
				  	type: "warning",
				  	showCancelButton: true,
				  	cancelButtonText: "否",
				  	confirmButtonClass: "btn-danger",
				  	confirmButtonText: "是",
				  	closeOnConfirm: true
				},
				function(){
					document.forms[0].submit();
				});
			}
		</script>
	</body>
</html>
