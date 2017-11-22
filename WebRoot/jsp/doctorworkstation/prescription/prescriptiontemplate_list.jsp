<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="../../common/quote.jsp" %>
		<%@include file="../../common/list-btn-limit.jsp" %>
	</head>

	<body>
		<div class="main-container container-fluid">			

			<div class="main-content">
				

				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							处方模板
							<input id="gritter-light" checked="" type="checkbox" class="ace-switch ace-switch-5" />
						</h1>
					</div><!--/.page-header-->
					
					<div class="row-fluid">
						<div></div>
						<div class="span4">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">模板名称</label>

								<div class="controls controls-l">
									<input type="text" id="templatename" onkeyup="search()"/>
								</div>
							</div>	
						</div><!--/span-->

						<div class="span4">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">处方类型</label>

								<div class="controls controls-l">
									<select class="chzn-select" id="prescriptiontype" onchange="search()">
										<option value="0" />全部
										<c:forEach var="item" items="${prescriptiontypes}">
											<option value="${item.id}" />${item.detailname}
										</c:forEach>
									</select>
								</div>
							</div>	
						</div><!--/span-->
						
						<div class="span4">
							<div class="control-group control-group-m">	
								<label class="control-label control-label-m">撰写科室</label>
	
								<div class="controls controls-l">
									<select id="department" class="chzn-select" onchange="finddoctor()">
										<option value="0" />全部
										<c:forEach var="item" items="${departments}">
											<option value="${item.id}" />${item.departmentname}
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
					</div><!--/.row-fluid-->
					
					<div class="row-fluid">
						<div></div>
						<div class="span4">
							<div class="control-group control-group-m">								
								<label class="control-label control-label-m">撰写医生</label>

								<div class="controls controls-l">
									<select id="doctor" class="chzn-select" onchange="search()">
										<option id="all" value="0" />全部
										<c:forEach var="item" items="${doctors}">
											<option value="${item.id}" />${item.employeename}
										</c:forEach>
									</select>
								</div>								
								
							</div>	
						</div><!--/span-->
						
						<div class="span4">
							<label class="control-label control-label-m">处方诊断</label>

							<div class="controls controls-l">
								<input type="text" id="diagnosis" onkeyup="search()"/>
							</div>
						</div>
						
						<div class="span4">
							<div class="control-group control-group-m">

								<div class="controls controls-l">
									<button class="btn btn-small btn-success btn-add" 
									onclick="javascript:location.href='${ctx}/prescriptiontemplateController/toadd.do';">
										<i class="icon-share-alt"></i>
										新增
									</button>
								</div>
							</div>	
						</div><!--/span-->
					</div><!--/.row-fluid-->
					
					<div style="border-bottom:1px dotted #e2e2e2; margin-bottom:10px;"></div>
					
					<table class="table" >
						<thead>
							<tr style="background:#fff;">
								<th>模板名称</th>
								<th>科室名称</th>
								<th>医生名称</th>
								<th>处方类型</th>
								<th>模板分类</th>
								<th>处方诊断</th>
								<th>处方备注</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="datas">
							
						</tbody>
					</table>
					<%@include file="../../common/pagingmenu.jsp" %>
					
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
							</tr>
						</thead>
						<tbody id="detailtatas">
							
						</tbody>			
					</table>
				</div><!--/.page-content-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->

		<!-- 参数化,应用在custom_pageload.js -->
		<script type="text/javascript">					
			var ctx = "${ctx}";
			var controller = "/prescriptiontemplateController";
			var sumrow;
			var currentpage;
		</script>

		<!--inline scripts related to this page-->

		<script type="text/javascript">
			$(function(){
				find(1);
				//右上角提示信息
				if("${resulttext}" == "add"){
					hint("新增成功！");
				}else if("${resulttext}" == "edit"){
					hint("修改成功！");
				}
			});
			
			//分页页数
			function find(page){
				var templatename = $("#templatename").val();
				var diagnosis = $("#diagnosis").val();
				var departmentid = $("#department").val();
				var doctorid = $("#doctor").val();
				var prescriptiontypeid = $("#prescriptiontype").val();
				gettable(templatename,diagnosis,departmentid,doctorid,prescriptiontypeid,page);
				getdetailtable(0);
			}
			
			//查询
			function gettable(templatename,diagnosis,departmentid,doctorid,prescriptiontypeid,page){
				$.post(ctx + controller + "/datalist.do",
				{templatename:templatename, diagnosis:diagnosis, departmentid:departmentid,
				doctorid:doctorid, prescriptiontypeid:prescriptiontypeid,pagesize:$("#pagesize").val(),
				currentpage:page},
				function(data){
					$("#datas").html(data);
				});
			}
			
			//搜索
			function search(){
				find(1);
			}
			
			//根据科室部门查询医生
			function getselect(){
				$("#all").nextAll().remove();
				$.post(ctx + "/passController/getdoctorbydptid.do",
				{id:$("#department").val()},
				function(data){					
					$.each(data,function(name,value) {
						$("#doctor").append("<option value='"+value['id']+"'>"+value['employeename'] + "</option>");
					});
					$("#doctor").val(0);
					$("#doctor").trigger("liszt:updated");
            		$("#doctor").chosen();
				});
			}
			
			//根据科室部门查询医生
			function finddoctor(){
				getselect();
				search();
			}
			
			//点击处方模板获取处方模板明细
			function getdetailtable(id){
				$.post(ctx + controller + "/detailtablelist.do",
				{id:id},
				function(data){
					$("#detailtatas").html(data);
				});
			}
			
			//点击处方模板获取处方模板明细
			function getdetaildatas(id){
				getdetailtable(id);
			}
			
			//删除确认提示
		  	function deleteprescription(id){
		  		swal({
				  	title: "是否删除?",
				  	text: "",
				  	type: "warning",
				  	showCancelButton: true,
				  	cancelButtonText: "否",
				  	confirmButtonClass: "btn-danger",
				  	confirmButtonColor: "#b74635",
				  	confirmButtonText: "是",
				  	closeOnConfirm: true
				},
				function(){
					$.post(ctx + controller + "/delete.do",
					{id:id},
					function(data){
		  				hint(data.msg);
						search();
					});
				});
		  	}
		</script>
	</body>
</html>
