<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
							病历
							<small>
								<i class="icon-double-angle-right"></i>
								录入病历
							</small>
						</h1>
					</div><!--/.page-header-->

					<form id="validation-form" class="form-horizontal" action="${ctx}/medicalrecordController/add.do" method="post">
						<div style="border-bottom:1px dotted #e2e2e2; padding-bottom:13px; margin-bottom:13px;">
							<button type="button" class="btn btn-small" onclick="javascript:location.href='${ctx}/medicalrecordController/list.do';">
								<i class="icon-undo"></i>
								返回
							</button>
							<button type="submit" class="btn btn-small btn-primary">
								<i class="icon-save"></i>
								保存
							</button>
						</div>
						
						<div style="border-bottom:1px dotted #e2e2e2; margin-bottom:10px; padding-bottom:10px;">
							<span style="margin-left:15px;">挂号信息</span>
						</div>					
	
						<div class="row-fluid row1">
							<div></div>
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">挂号单号</label>
	
									<div class="controls controls-m">
										<input id="registerid" type="hidden" name="registerid">
										<input id="registercode" name="registercodeid" type="text" onfocus="findregister()"/>
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">病人姓名</label>
	
									<div class="controls controls-m">
										<input id="patientname" type="text" readonly="readonly"/>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">性别</label>
	
									<div class="controls controls-m">
										<input id="sex" type="text" readonly="readonly"/>
									</div>
								</div>	
							</div><!--/span-->						
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">年龄</label>
	
									<div class="controls controls-m">
										<input id="age" type="text" readonly="readonly"/>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
	
						<div class="row-fluid row1">
							<div></div>
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">挂号类型</label>
	
									<div class="controls controls-m">
										<input id="typename" type="text" readonly="readonly"/>
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">参保类型</label>
	
									<div class="controls controls-m">
										<input id="insuretypename" type="text" readonly="readonly"/>
									</div>
								</div>	
							</div><!--/span-->
							
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">药过敏史</label>
	
									<div class="controls controls-m">
										<input id="drugallergyhistory" type="text" readonly="readonly"/>
									</div>
								</div>		
							</div><!--/span-->
							
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">挂号备注</label>
	
									<div class="controls controls-m">
										<input id="registernote" type="text" readonly="readonly"/>
									</div>
								</div>		
							</div><!--/span-->
						</div><!--/.row-fluid-->						
						
						<!-- ------------------------------------------------割割----------------------------------------------------- -->
						
						<div style="border-bottom:1px dotted #e2e2e2; margin-bottom:10px;"></div>					

						<div class="row-fluid">
							<div class="span3">
								<div class="control-group control-group-m">
	
									<div class="controls controls-m" style="margin-left:0 !important; margin-bottom:20px;">
										<button type="button" class="btn btn-small btn-success" style="width:auto;" onclick="findtemplate()">
											<i class="icon-check"></i>
											选择病历模板
										</button>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
						
						<div class="row-fluid row1">
							<div></div>	
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">病历名称</label>
	
									<div class="controls controls-m">
										<input id="medicalrecordname" type="text" name="medicalrecordname"/>
									</div>
								</div>	
							</div><!--/span-->
							
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">录入医生</label>
	
									<div class="controls controls-m">
										<select id="doctor" class="chzn-select" data-placeholder="-请选择-" name="doctorid" onchange="finddepartment()">
											<option value="" />
											<c:forEach var="item" items="${doctors}">
												<option value="${item.id}" />${item.employeename}
											</c:forEach>
										</select>
									</div>
								</div>		
							</div><!--/span-->
							
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">录入科室</label>
	
									<div class="controls controls-m">
										<input id="department" type="text" readonly="readonly"/>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
						
						<div class="row-fluid row1">
							<div></div>	
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">病历类型</label>
	
									<div class="controls controls-m">
										<select id="disease" class="chzn-select" data-placeholder="-请选择-" name="diseaseid">
											<option value="" />
											<c:forEach var="item" items="${diseases}">
												<option value="${item.id}" />${item.diseasename}
											</c:forEach>
										</select>
									</div>
								</div>	
							</div><!--/span-->
							
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">病历备注</label>
	
									<div class="controls controls-m">
										<input id="medicalrecordnote" type="text" name="note"/>
									</div>
								</div>	
							</div><!--/span-->
							
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">适用情况</label>
	
									<div class="controls controls-m">
										<input id="fitstatus" type="text" name="fitstatus"/>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->							
	
						<div class="row-fluid row2">
							<div></div>
							<div class="span10">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">病人主诉</label>
	
									<div class="controls controls-m">
										<textarea class="span12 textarea-c" id="patientappeal" name="patientappeal"></textarea>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
	
						<div class="row-fluid row2">
							<div></div>
							<div class="span10">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">病人病史</label>
	
									<div class="controls controls-m">
										<textarea class="span12 textarea-c" id="medicalhistory" name="medicalhistory"></textarea>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
	
						<div class="row-fluid row2">
							<div></div>
							<div class="span10">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">体检情况</label>
	
									<div class="controls controls-m">
										<textarea class="span12 textarea-c" id="physicalstatus" name="physicalstatus"></textarea>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
	
						<div class="row-fluid row2">
							<div></div>
							<div class="span10">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">初步诊断</label>
	
									<div class="controls controls-m">
										<textarea class="span12 textarea-c" id="primarydiagnosis" name="primarydiagnosis"></textarea>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
	
						<div class="row-fluid row2">
							<div></div>
							<div class="span10">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">处理意见</label>
	
									<div class="controls controls-m">
										<textarea class="span12 textarea-c" id="opinion" name="opinion"></textarea>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->						
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
									<th>病人卡号</th>
									<th>病人名称</th>
									<th>性别</th>
									<th>年龄</th>
									<th>参保类型</th>
									<th>挂号时间</th>
									<th>联系电话</th>
								</tr>
							</thead>
							<tbody id="registerdatas">
								
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
							选择病历模板
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
									<th>模板编号</th>
									<th>模板名称</th>
									<th>模板类别</th>
									<th>撰写医生</th>
									<th>撰写科室</th>
									<th>适合情况</th>
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

		<script type="text/javascript">
			$(function(){
				//开启表单验证
				formValidate();
			});
			
			//打开挂号单模态框
			function findregister(){
				getregistertable("");
				$('#registerModal').modal('show');
				$(".modal-backdrop").css("z-index","5000");
				$("#registerModal").css("z-index","6000");
			}
			
			//打开病历模板模态框
			function findtemplate(){
				gettemplatetable("");
				$('#templateModal').modal('show');
				$(".modal-backdrop").css("z-index","5000");
				$("#templateModal").css("z-index","6000");
			}
			
			//加载挂号单列表
			function getregistertable(str){
				$.post("${ctx}/medicalrecordController/registertablelist.do",
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
			
			//根据医生查询相应科室并回填
			function finddepartment(){
				$.post("${ctx}/departmentController/findbydid.do",
				{did:$("#doctor").val()},
				function(data){
					$("#department").val(data.dpname);
				});
			}
			
			//加载病历模板列表
			function gettemplatetable(str){
				$.post("${ctx}/medicalrecordController/templatetablelist.do",
				{contant:str},
				function(data){
					$("#templatedatas").html(data);
				});
			}
			
			//病历模板搜索
			function templatesearch(){
				gettemplatetable($("#templatecontant").val());
			}
			
			//病历模板数据回填
			function selecttemplate(templatename,doctorid,departmentname,diseaseid,
				note,fitstatus,patientappeal,medicalhistory,physicalstatus,primarydiagnosis,opinion){
				$("#medicalrecordname").val(templatename);
				$("#doctor option[value='"+doctorid+"']").attr("selected","selected");  
				$("#doctor").trigger("liszt:updated");
				$("#doctor").chosen();
				$("#department").val(departmentname);
				$("#disease option[value='"+diseaseid+"']").attr("selected","selected"); 
				$("#disease").trigger("liszt:updated");
				$("#disease").chosen();
				$("#medicalrecordnote").val(note);
				$("#fitstatus").val(fitstatus);
				$("#patientappeal").val(patientappeal);
				$("#medicalhistory").val(medicalhistory);
				$("#physicalstatus").val(physicalstatus);
				$("#primarydiagnosis").val(primarydiagnosis);
				$("#opinion").val(opinion);
				$('#templateModal').modal('hide');
			}
			
			//表单验证
			function formValidate(){
				$("#validation-form").validate({
					errorElement: 'label',
					errorClass: 'help-inline',
					focusInvalid: false,
				    rules: {
				   	  	registercodeid:"required",
				   	  	medicalrecordname:"required",
				   	  	doctorid:"required",
				   	  	diseaseid:"required",
				   	  	fitstatus:"required",
				   	  	patientappeal:"required",
				   	  	medicalhistory:"required",
				   	  	physicalstatus:"required",
				   	  	primarydiagnosis:"required",
				   	  	opinion:"required"
				    },
				    messages:{
				    	registercodeid:"这是必选字段",
				      	doctorid:"这是必选字段",
				      	diseaseid:"这是必选字段"		      	
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
