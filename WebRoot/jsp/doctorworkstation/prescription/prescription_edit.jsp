<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="../../common/quote.jsp" %>
		<link href="${ctx}/assets/custom/css/custom-part-style.css" rel="stylesheet" />
	</head>

	<body>
		<div class="main-container container-fluid">			

			<div class="main-content">
				

				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							处方
							<small>
								<i class="icon-double-angle-right"></i>
								修改处方
							</small>
						</h1>
					</div><!--/.page-header-->

					<form id="validation-form" class="form-horizontal" action="${ctx}/prescriptionController/edit.do" method="post">
						<div style="border-bottom:1px dotted #e2e2e2; padding-bottom:13px; margin-bottom:13px;">
							<button type="button" class="btn btn-small" onclick="javascript:location.href='${ctx}/prescriptionController/list.do';">
								<i class="icon-undo"></i>
								返回
							</button>
							
							<input type="hidden" name="id" value="${prescription.id}">
							<button type="submit" class="btn btn-small btn-primary">
								<i class="icon-save"></i>
								保存
							</button>
						</div>
						
						<div style="border-bottom:1px dotted #e2e2e2; margin-bottom:10px; padding-bottom:10px;">
							<span style="margin-left:15px;">挂号信息</span>
						</div>					
	
						<div class="row-fluid">
							<div></div>
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">挂号单号</label>
	
									<div class="controls controls-m">
										<input id="registerid" type="hidden" name="registerid" value="${prescription.registerid}">
										<input id="registercode" name="registercodeid" type="text" value="${register.registercode}" onfocus="findregister()"/>
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">病人姓名</label>
	
									<div class="controls controls-m">
										<input id="patientname" type="text" readonly="readonly" value="${register.patientname}"/>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">性别</label>
	
									<div class="controls controls-m">
										<input id="sex" type="text" readonly="readonly" value="${register.sex == 1 ? '男' : '女'}"/>
									</div>
								</div>	
							</div><!--/span-->						
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">年龄</label>
	
									<div class="controls controls-m">
										<input id="age" type="text" readonly="readonly" value="${register.age}"/>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
	
						<div class="row-fluid">
							<div></div>
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">挂号类型</label>
	
									<div class="controls controls-m">
										<input id="typename" type="text" readonly="readonly" value="${register.typename}"/>
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">参保类型</label>
	
									<div class="controls controls-m" >
										<input id="insuretypename" type="text" readonly="readonly" value="${register.insuretypename}"/>
									</div>
								</div>	
							</div><!--/span-->
							
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">药过敏史</label>
	
									<div class="controls controls-m">
										<input id="drugallergyhistory" type="text" readonly="readonly" value="${register.drugallergyhistory}"/>
									</div>
								</div>		
							</div><!--/span-->
							
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">挂号备注</label>
	
									<div class="controls controls-m">
										<input id="registernote" type="text" readonly="readonly" value="${register.note}"/>
									</div>
								</div>		
							</div><!--/span-->
						</div><!--/.row-fluid-->
						
						<!-- ------------------------------------------------割割----------------------------------------------------- -->
						
						<div style="border-bottom:1px dotted #e2e2e2; margin-bottom:10px;">
							<span style="margin-left:15px;">处方信息</span>
						</div>
						
						<div class="row-fluid">
							<div class="span3">
								<div class="control-group control-group-m">
	
									<div class="controls controls-m">
										<button type="button" class="btn btn-small btn-success" style="width:auto;" onclick="findtemplate()">
											<i class="icon-check"></i>
											选择处方模板
										</button>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->				
						
						<div class="row-fluid">
							<div></div>
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">处方名称</label>
	
									<div class="controls controls-m">
										<input id="prescriptionname" name="prescriptionname" type="text" value="${prescription.prescriptionname}"/>
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">医生名称</label>
	
									<div class="controls controls-m">
										<select class="chzn-select" id="doctor" name="doctorid" data-placeholder="-请选择-" onchange="finddepartment()">
											<option value="0" />
											<c:forEach var="item" items="${doctors}">
												<option <c:if test="${prescription.doctorid == item.id}">selected="selected"</c:if> value="${item.id}" />${item.employeename}
											</c:forEach>
										</select>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">处方性质</label>
	
									<div class="controls controls-m">
										<select class="chzn-select" id="nature" name="natureid" data-placeholder="-请选择-">
											<option value="0" />
											<c:forEach var="item" items="${naturenames}">
												<option <c:if test="${prescription.natureid == item.id}">selected="selected"</c:if> value="${item.id}" />${item.detailname}
											</c:forEach>
										</select>
									</div>
								</div>	
							</div><!--/span-->						
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">处方类型</label>
	
									<div class="controls controls-m">
										<select class="chzn-select" id="prescriptiontype" name="prescriptiontypeid" data-placeholder="-请选择-">
											<option value="0" />
											<c:forEach var="item" items="${prescriptiontypes}">
												<option <c:if test="${prescription.prescriptiontypeid == item.id}">selected="selected"</c:if> value="${item.id}" />${item.detailname}
											</c:forEach>
										</select>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
	
						<div class="row-fluid">
							<div></div>
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">科室名称</label>
	
									<div class="controls controls-m">									
										<input id="department" type="text" readonly="readonly" value="${prescription.departmentname}"/>
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">处方分类</label>
	
									<div class="controls controls-m">
										<select class="chzn-select" id="classify" name="classifyid" data-placeholder="-请选择-">
											<option value="0" />
											<c:forEach var="item" items="${classifynames}">
												<option <c:if test="${prescription.classifyid == item.id}">selected="selected"</c:if> value="${item.id}" />${item.detailname}
											</c:forEach>
										</select>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">处方备注</label>
	
									<div class="controls controls-m">
										<input id="prescriptionnote" name="note" type="text" value="${prescription.note}"/>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">处方诊断</label>
	
									<div class="controls controls-m">
										<input id="diagnosis" name="diagnosis" type="text" value="${prescription.diagnosis}"/>
									</div>
								</div>
							</div><!--/span-->
						</div><!--/.row-fluid-->
						
						<!-- ------------------------------------------------割割----------------------------------------------------- -->		
										
						<div style="border-bottom:1px dotted #e2e2e2; margin-bottom:10px;"></div>
						
						<div class="row-fluid">
							<div></div>
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">药品编号</label>
	
									<div class="controls controls-m">
										<input id="drugcode" type="text" onclick="finddrug()"/>
										<input id="drugid" type="hidden">
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">药品名称</label>
	
									<div class="controls controls-m">
										<input id="drugname" type="text" readonly="readonly"/>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">药品规格</label>
	
									<div class="controls controls-m">
										<input id="norms" type="text" readonly="readonly"/>
									</div>
								</div>	
							</div><!--/span-->						
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">剂数</label>
	
									<div class="controls controls-m">
										<input id="dosagequantity" name="dosagequantityid" type="text" onkeyup="countmd()"/>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
						
						<div class="row-fluid">
							<div></div>
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">每剂用量</label>
	
									<div class="controls controls-m">
										<input id="eachdosage" name="eachdosageid" type="text" onkeyup="countmd()"/>
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">用药方式</label>
	
									<div class="controls controls-m">
										<select class="chzn-select" id="medicineform" data-placeholder="-请选择-">
											<option value="0" />
											<c:forEach var="item" items="${medicineforms}">
												<option value="${item.id}" />${item.detailname}
											</c:forEach>
										</select>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">用药频率</label>
	
									<div class="controls controls-m">
										<select class="chzn-select" id="medicinefrequency" data-placeholder="-请选择-">
											<option value="0" />
											<c:forEach var="item" items="${medicinefrequencys}">
												<option value="${item.id}" />${item.detailenname}
											</c:forEach>
										</select>
									</div>
								</div>	
							</div><!--/span-->						
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">发药总量</label>
	
									<div class="controls controls-m">
										<input id="medicineamount" type="text" />
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->	
	
						<div class="row-fluid">
							<div></div>
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">明细备注</label>
	
									<div class="controls controls-m">
										<input id="detailnote" type="text"/>
									</div>
								</div>	
							</div><!--/span-->
							
							<div class="span3"></div>
							<div class="span3"></div>
							
							<div class="span3">
								<div class="control-group control-group-m">
	
									<div class="controls controls-m">
										<button type="button" class="btn btn-small btn-success" style="width:auto;" onclick="addtable()">
											<i class="icon-exchange"></i>
											添加到表格
										</button>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->					
								
						<div>
							<table class="table">
								<thead>
									<tr style="background:#fff;">
										<th>药品编号</th>
										<th>药品名称</th>
										<th>每剂用量</th>
										<th>用药方式</th>
										<th>用药频率</th>
										<th>剂数</th>
										<th>用药总量</th>
										<th>备注</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="detaildatas">
									<c:forEach var="item" items="${details}" varStatus="status">
										<tr>
											<td><input name="detail[${status.index}].id" type="hidden" value="${item.id}"/>${item.drugcode}</td>
											<td><input name="detail[${status.index}].drugid" type="hidden" value="${item.drugid}"/>${item.drugname}</th>
											<td><input name="detail[${status.index}].eachdosage" type="hidden" value="${item.eachdosage}"/>${item.eachdosage}</td>
											<td><input name="detail[${status.index}].medicineformid" type="hidden" value="${item.medicineformid}"/>${item.medicineformname}</td>
											<td><input name="detail[${status.index}].medicinefrequencyid" type="hidden" value="${item.medicinefrequencyid}"/>${item.medicinefrequencyname}</td>
											<td><input name="detail[${status.index}].dosagequantity" type="hidden" value="${item.dosagequantity}"/>${item.dosagequantity}</td>
											<td><input name="detail[${status.index}].medicineamount" type="hidden" value="${item.medicineamount}"/>${item.medicineamount}</td>
											<td><input name="detail[${status.index}].note" type="hidden" value="${item.note}"/>${item.note}</td>
											<td>
												<a class="btn btn-link" href="#" onclick="deletedrug(this)">删除</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>			
							</table>
						</div>
					</form>		
				</div><!--/.page-content-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->
		
		<!-- ----------------------------------------------------------------------模态框-------------------------------------------------------------------- -->
		
		<div  class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:60%;min-width:220px;">
			<div class="modal-dialog">	
				<div class="modal-content form-horizontal">
					<div class="modal-header">
						<h3 class="modal-title" id="myModalLabel">
							选择挂号病人
						</h3>
						<div class="nav-search" id="nav-search" style="margin-top:5px;">
							<form class="form-search" />
								<span class="input-icon">
									<input type="text" placeholder="搜索..." class="input-small nav-search-input" id="registercontant" autocomplete="off" onkeyup="registersearch()" />
									<i class="icon-search nav-search-icon"></i>
								</span>
							</form>
						</div><!--#nav-search-->
					</div>
					<div style="padding-bottom:0;overflow:auto; max-height:300px;" class="modal-body">
				    	<table class="table">
							<thead>
								<tr style="background:#fff;">
									<th>挂号编号</th>
									<th>编号</th>
									<th>病人名称</th>
									<th>性别</th>
									<th>年龄</th>
									<th>参保类型</th>
									<th>挂号时间</th>
									<th>联系电话</th>
								</tr>
							</thead>
							<tbody id="registerdatas">
								<!--<c:forEach var="item" items="${patients}">
									<tr class="trbc trbc1" >
										<td>${item.cardcode}</td>
										<td>${item.patientname}</td>
										<td>${item.sex == 1 ? "男" : "女"}</td>
										<td>${item.age}</td>
										<td>${item.insuretypename}</td>
										<td>${item.patienttypename}</td>
										<td>${item.tel}</td>
										<td>${item.drugallergyhistory}</td>
									</tr>
								</c:forEach>-->									
							</tbody>			
						</table>
					</div>
					<div class="modal-footer">
						<button style="width:110px;" type="button" class="btn btn-small btn-default" data-dismiss="modal">取消</button>
						<button style="width:110px;" class="btn btn-small btn-primary" data-dismiss="modal" onclick="openhintModal()">确定</button>
					</div>
				</div>
			</div>
  		</div>
  		
  		<!-- ----------------------------------------------------------------------模态框-------------------------------------------------------------------- -->
  		
  		<div  class="modal fade" id="templateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:60%;min-width:220px;">
			<div class="modal-dialog">	
				<div class="modal-content form-horizontal">
					<div class="modal-header">
						<h3 class="modal-title" id="myModalLabel">
							选择处方模板
						</h3>
						<div class="nav-search" id="nav-search" style="margin-top:5px;">
							<form class="form-search" />
								<span class="input-icon">
									<input type="text" placeholder="搜索..." class="input-small nav-search-input" id="templatecontant" autocomplete="off" onkeyup="templatesearch()"/>
									<i class="icon-search nav-search-icon"></i>
								</span>
							</form>
						</div><!--#nav-search-->
					</div>
					<div style="padding-bottom:0;overflow:auto; max-height:300px;" class="modal-body">
				    	<table class="table">
							<thead>
								<tr style="background:#fff;">
									<th>模板名称</th>
									<th>科室名称</th>
									<th>模板性质</th>
									<th>处方类型</th>
									<th>模板分类</th>
									<th>处方诊断</th>
									<th>处方备注</th>
								</tr>
							</thead>
							<tbody id="templatedatas">
								
							</tbody>			
						</table>
					</div>
					<div class="modal-footer">
						<button style="width:110px;" type="button" class="btn btn-small btn-default" data-dismiss="modal">取消</button>
						<button style="width:110px;" class="btn btn-small btn-primary" data-dismiss="modal" onclick="openhintModal()">确定</button>
					</div>
				</div>
			</div>
  		</div>
  		
  		<!-- ----------------------------------------------------------------------模态框-------------------------------------------------------------------- -->
  		
  		<div  class="modal fade" id="drugModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:60%;min-width:220px;">
			<div class="modal-dialog">	
				<div class="modal-content form-horizontal">
					<div class="modal-header">
						<h3 class="modal-title" id="myModalLabel">
							选择药品
						</h3>
						<div class="nav-search" id="nav-search" style="margin-top:5px;">
							<form class="form-search" />
								<span class="input-icon">
									<input type="text" placeholder="搜索..." class="input-small nav-search-input" id="drugcontant" autocomplete="off" onkeyup="drugsearch()"/>
									<i class="icon-search nav-search-icon"></i>
								</span>
							</form>
						</div><!--#nav-search-->
					</div>
					<div style="padding-bottom:0;overflow:auto; max-height:300px;" class="modal-body">
				    	<table class="table">
							<thead>
								<tr style="background:#fff;">
									<th>药品编号</th>
									<th>药品名称</th>
									<th>拼音简码</th>
									<th>药品类型</th>
									<th>规格</th>
									<th>库存数</th>
									<th>零售价</th>
								</tr>
							</thead>
							<tbody id="drugdatas">								
							</tbody>			
						</table>
					</div>
					<div class="modal-footer">
						<button style="width:110px;" type="button" class="btn btn-small btn-default" data-dismiss="modal">取消</button>
						<button style="width:110px;" class="btn btn-small btn-primary" data-dismiss="modal" onclick="openhintModal()">确定</button>
					</div>
				</div>
			</div>
  		</div>

		<script type="text/javascript">
			$(function() {
				//开启表单验证
				formValidate();
			});
			
			//打开挂号单模态框
			function findregister(){
				getregistertable('');
				$('#registerModal').modal('show');
				$(".modal-backdrop").css("z-index","5000");
				$("#registerModal").css("z-index","6000");
			}
			
			//打开处方模板模态框
			function findtemplate(){
				gettemplatetable('');
				$('#templateModal').modal('show');
				$(".modal-backdrop").css("z-index","5000");
				$("#templateModal").css("z-index","6000");
			}
			
			//打开药品模态框
			function finddrug(){
				getdrugtable('');
				$('#drugModal').modal('show');
				$(".modal-backdrop").css("z-index","5000");
				$("#drugModal").css("z-index","6000");
			}
			
			//根据医生查询相应科室并回填
			function finddepartment(){
				$.post("${ctx}/departmentController/findbydid.do",
				{did:$("#doctor").val()},
				function(data){
					$("#department").val(data.dpname);
				});
			}
			
			//加载挂号单列表
			function getregistertable(str){
				$.post("${ctx}/prescriptionController/registertablelist.do",
				{contant:str},
				function(data){
					$("#registerdatas").html(data);
				});
			}
			
			//挂号单搜索
			function registersearch(){
				getregistertable($("#registercontant").val());
			}
			
			//挂号数据回填
			function selectregister(registerid,registercode,patientname,sex,age,
				typename,insuretypename,drugallergyhistory,note){
				$("#registerid").val(registerid);
				$("#registercode").val(registercode);
				$("#patientname").val(patientname);
				$("#sex").val(sex == 1 ? "男" : "女");
				$("#age").val(age);
				$("#typename").val(typename);
				$("#insuretypename").val(insuretypename);
				$("#drugallergyhistory").val(drugallergyhistory);
				$("#registernote").val(note);
				$('#registerModal').modal('hide');
			}
			
			//加载处方模板列表
			function gettemplatetable(str){
				$.post("${ctx}/prescriptionController/templatedatalist.do",
				{contant:str},
				function(data){
					$("#templatedatas").html(data);
				});
			}
			
			//处方模板搜索
			function templatesearch(){
				var contant = $("#templatecontant").val();
				gettemplatetable(contant);
			}
			
			//处方模板数据回填
			function templatebackfill(id,templatename,doctorid,natureid,
				prescriptiontypeid,departmentname,classifyid,note,diagnosis){
				$("#prescriptionname").val(templatename);
				$("#doctor").val(doctorid);
				$("#doctor").trigger("liszt:updated");
           		$("#doctor").chosen();
				$("#nature").val(natureid);
				$("#nature").trigger("liszt:updated");
           		$("#nature").chosen();
				$("#prescriptiontype").val(prescriptiontypeid);
				$("#prescriptiontype").trigger("liszt:updated");
           		$("#prescriptiontype").chosen();
				$("#department").val(departmentname);
				$("#classify").val(classifyid);
				$("#classify").trigger("liszt:updated");
           		$("#classify").chosen();
				$("#prescriptionnote").val(note);
				$("#diagnosis").val(diagnosis);
				$.post("${ctx}/prescriptiontemplateController/prescriptdetailtablelist.do",
				{id:id},
				function(data){
					$("#detaildatas").html(data);
				});
				$('#templateModal').modal('hide');				
			}
			
			//加载药品列表
			function getdrugtable(str){
				$.post("${ctx}/drugController/druglist.do",
				{contant:str},
				function(data){
					$("#drugdatas").html(data);
				});
			}
			
			//药品搜索
			function drugsearch(){
				var contant = $("#drugcontant").val();
				getdrugtable(contant);
			}
			
			//药品数据回填
			function drugbackfill(drugid,drugcode,drugname,norms,inventoryquantity){
				$("#drugid").val(drugid);
				$("#drugcode").val(drugcode);
				$("#drugname").val(drugname);
				$("#norms").val(norms);
				$("#dosagequantity").val('');
				$("#eachdosage").val('');
				$("#medicineform").val(0);
				$("#medicineform").trigger("liszt:updated");
           		$("#medicineform").chosen();
				$("#medicinefrequency").val(0);
				$("#medicinefrequency").trigger("liszt:updated");
           		$("#medicinefrequency").chosen();
				$("#medicineamount").val('');
				$("#detailnote").val('');
				$('#drugModal').modal('hide');
			}
			
			//计算发药总量
			function countmd(){
				if($("#drugcode").val() == ""){
					swal({
					  	title: "温馨提示",
					  	text: "请单击药品编号文本框选择药品！",
					  	type: "warning",
					  	confirmButtonClass: "btn-danger",
					  	confirmButtonText: "是",
					  	closeOnConfirm: true
					},
					function(){
						$("#dosagequantity").val("");
						$("#eachdosage").val("");
					});
				}else{
					var dq = $("#dosagequantity").val();
					var ed = $("#eachdosage").val();
					$("#medicineamount").val(isNaN(dq*ed)?0:dq*ed);
					var max = itqt/dq;
					//若发药量大于库存量，则不予添加，需重新填写
					if((dq*ed)>itqt){
						swal({
						  	title: "温馨提示",
						  	text: "该药品库存只有【"+itqt+"】不足【"+(dq*ed)+"】，请重新填写！",
						  	type: "warning",
						  	confirmButtonClass: "btn-danger",
						  	confirmButtonText: "是",
						  	closeOnConfirm: true
						},
						function(){
							$("#eachdosage").val(parseInt(max));
							$("#medicineamount").val(parseInt(max)*dq);
						});
					}
				}
			}
			
			var row = ${not empty details ? fn:length(details) : 0};
			//把药品暂时添加到处方明细列表，以待保存
			function addtable(){
				var drugid = $("#drugid").val();
				var drugcode = $("#drugcode").val();
				var drugname = $("#drugname").val();
				var dosagequantity = $("#dosagequantity").val();
				var eachdosage = $("#eachdosage").val();				
				var medicineformid = $("#medicineform").val();
				var medicineform = $("#medicineform").find("option:selected").text();
				var medicinefrequencyid = $("#medicinefrequency").val();
				var medicinefrequency = $("#medicinefrequency").find("option:selected").text();
				var medicineamount = $("#medicineamount").val();
				var note = $("#detailnote").val();
				$("#detaildatas").append(
					'<tr class="trbc trbc1">'
						+'<td><input name="detail[' + row + '].drugid" type="hidden" value="'+ drugid +'"/>'+ drugcode +'</td>'
						+'<td>'+ drugname +'</td>'
						+'<td><input name="detail[' + row + '].eachdosage" type="hidden" value="'+ eachdosage +'"/>'+ eachdosage +'</td>'
						+'<td><input name="detail[' + row + '].medicineformid" type="hidden" value="'+ medicineformid +'"/>'+ medicineform +'</td>'
						+'<td><input name="detail[' + row + '].medicinefrequencyid" type="hidden" value="'+ medicinefrequencyid +'"/>'+ medicinefrequency +'</td>'
						+'<td><input name="detail[' + row + '].dosagequantity" type="hidden" value="'+ dosagequantity +'"/>'+ dosagequantity +'</td>'
						+'<td><input name="detail[' + row + '].medicineamount" type="hidden" value="'+ medicineamount +'"/>'+ medicineamount +'</td>'
						+'<td><input name="detail[' + row + '].note" type="hidden" value="'+ note +'"/>'+ note +'</td>'
						+'<td><a class="btn btn-link" href="#" onclick="deletedrug(this)">删除</a></td>'+
					'</tr>');
					row++;
			}
			
			//从处方明细列表中删除药品
			function deletedrug(obj){
				$(obj).parent().parent("tr").remove();
			}
			
			//表单验证
			function formValidate(){
				$("#validation-form").validate({
					errorElement: 'label',
					errorClass: 'help-inline',
					focusInvalid: false,
				    rules: {
				   	  	registercodeid:"required",
				   	  	prescriptionname:"required",
				   	  	doctorid:"required",
				   	  	natureid:"required",
				   	  	prescriptiontypeid:"required",
				   	  	classifyid:"required",
				   	  	diagnosis:"required",
				   	  	dosagequantityid:"digits",
				   	  	eachdosageid:"digits"
				    },
				    messages:{
				      	registercodeid:"这是必选字段",
				      	doctorid:"这是必选字段",
				      	natureid:"这是必选字段",
				      	prescriptiontypeid:"这是必选字段",
				      	classifyid:"这是必选字段"		      	
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
