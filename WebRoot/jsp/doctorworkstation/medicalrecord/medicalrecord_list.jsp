<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="../../common/quote.jsp" %>
		<%@include file="../../common/list-btn-limit.jsp" %>
	</head>

	<body resize="resize()">
		<div class="main-container container-fluid">			

			<div class="main-content">
				

				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							病历
							<input id="gritter-light" checked="" type="checkbox" class="ace-switch ace-switch-5" />
						</h1>
					</div><!--/.page-header-->
					
					<div class="row-fluid">
						<div></div>
						<div class="span4">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">病人编号</label>

								<div class="controls controls-l">
									<input id="cardcode" type="text" onkeyup="search()"/>
								</div>
							</div>	
						</div><!--/span-->

						<div class="span4">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">病人姓名</label>

								<div class="controls controls-l">
									<input id="patientname" type="text" onkeyup="search()"/>
								</div>
							</div>	
						</div><!--/span-->
						
						<div class="span4">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">病历名称</label>

								<div class="controls controls-l">
									<input id="medicalrecordname" type="text" onkeyup="search()"/>
								</div>
							</div>	
						</div><!--/span-->
					</div><!--/.row-fluid-->
					
					<div class="row-fluid">
						<div></div>
						<div class="span4">
							<div class="control-group control-group-m">	
								<label class="control-label control-label-m">录入科室</label>
	
								<div class="controls controls-l">
									<select id="department" class="chzn-select" onchange="finddoctor()">
										<option value="0" />全部
										<c:forEach var="item" items="${departments}">
											<option value="${item.id}"  />${item.departmentname}
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="span4">
							<div class="control-group control-group-m">								
								<label class="control-label control-label-m">录入医生</label>
	
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
							<div class="control-group control-group-m">

								<div class="controls controls-l">
									<button class="btn btn-small btn-success btn-add" 
									onclick="javascript:location.href='${ctx}/medicalrecordController/toadd.do';">
										<i class="icon-edit"></i>
										病历录入
									</button>
								</div>
							</div>	
						</div><!--/span-->
					</div><!--/.row-fluid-->
					
					<div style="border-bottom:1px dotted #e2e2e2; margin-bottom:10px;"></div>	

					<div class="row-fluid">

						<div id="tableleft" class="span4" style="width:53.5%;overflow:auto;min-width:230px; height:300px;">							
							<table class="table" style="overflow:auto;">
								<thead>
									<tr style="background:#fff;">
										<th>病人编号</th>
										<th>病人名称</th>
										<th>挂号编号</th>
										<th>病历名称</th>
										<th>科室名称</th>
										<th>医生名称</th>
										<th>类别名称</th>
										<th>病历备注</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="datas">
									
								</tbody>			
							</table>
							<%@include file="../../common/pagingmenu.jsp" %>
						</div><!--/span-->
						

						<div id="tableright" class="span4" style="width:43.5%;">
							<div class="control-group control-group-m">
								<div style="width:93.5%; text-align:center;">
									<h2>门诊病历</h2>
								</div>
								<label class="control-label control-label-m">病人主诉</label>

								<div class="controls controls-l">
									<textarea class="span12 textarea-c" id="patientappeal" style="width:76.8%; height:70px; min-width:220px;" readonly="readonly"></textarea>
								</div>

								<label class="control-label control-label-m">病人病史</label>

								<div class="controls controls-l">
									<textarea class="span12 textarea-c" id="medicalhistory" style="width:76.8%; height:90px; min-width:220px;" readonly="readonly"></textarea>
								</div>
								
								<label class="control-label control-label-m">体检情况</label>

								<div class="controls controls-l">
									<textarea class="span12 textarea-c" id="physicalstatus" style="width:76.8%; height:90px; min-width:220px;" readonly="readonly"></textarea>
								</div>
								
								<label class="control-label control-label-m">初步诊断</label>

								<div class="controls controls-l">
									<textarea class="span12 textarea-c" id="primarydiagnosis" style="width:76.8%; height:90px; min-width:220px;" readonly="readonly"></textarea>
								</div>
								
								<label class="control-label control-label-m">处理意见</label>

								<div class="controls controls-l" style="margin:0">
									<textarea class="span12 textarea-c" id="opinion" style="width:76.8%; height:90px; min-width:220px;" readonly="readonly"></textarea>
								</div>
							</div>	
						</div><!--/span-->
					</div><!--/.row-fluid-->

				</div><!--/.page-content-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->

		<!-- 参数化,应用在custom_pageload.js -->
		<script type="text/javascript">					
			var ctx = "${ctx}";
			var controller = "/medicalrecordController";
			var sumrow;
			var currentpage;
		</script>

		<!--inline scripts related to this page-->

		<script type="text/javascript">
			$(function() {
				$("#tableleft").css("height", $("#tableright").height() - 10 + "px");
				$("#tableleft").css("max-height", $("#tableright").height() - 10 + "px");
				find(1);
				//右上角提示信息
				if("${resulttext}" == "add"){
					hint("录入成功！");
				}else if("${resulttext}" == "edit"){
					hint("修改成功！");
				}			
			});
			
			//窗口大小改变事件
			function resize(){
				$("#tableleft").css("height", $("#tableright").height() - 10 + "px");
				$("#tableleft").css("max-height", $("#tableright").height() - 10 + "px");
			}
			
			//分页页数
			function find(page){
				var cardcode = $("#cardcode").val();
				var patientname = $("#patientname").val();
				var medicalrecordname = $("#medicalrecordname").val();
				var doctorid = $("#doctor").val();
				var departmentid = $("#department").val();
				gettable(cardcode,patientname,medicalrecordname,doctorid,departmentid,page);
			}
			
			//查询
			function gettable(cardcode,patientname,medicalrecordname,doctorid,departmentid,page){
				$.post(ctx + controller + "/datalist.do",
				{cardcode:cardcode, patientname:patientname, medicalrecordname:medicalrecordname,
				doctorid:doctorid, departmentid:departmentid,pagesize:$("#pagesize").val(),
				currentpage:page},
				function(data){					
					$("#datas").html(data);
				});
				finddetail('','','','','');
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
			
			//查询医生
			function finddoctor(){
				getselect();
				search();
			}
			
			//查询明细
			function finddetail(patientappeal,medicalhistory,physicalstatus,primarydiagnosis,opinion){				
				$("#patientappeal").val(patientappeal);
				$("#medicalhistory").val(medicalhistory);
				$("#physicalstatus").val(physicalstatus);
				$("#primarydiagnosis").val(primarydiagnosis);
				$("#opinion").val(opinion);
			}
			
			//删除确认提示
		  	function deletetemplates(id){
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
		  				find(1);
					});
				});
		  	}
		</script>
	</body>
</html>
