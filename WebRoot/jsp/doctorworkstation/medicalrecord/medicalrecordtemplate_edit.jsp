<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
							病历模板
							<small>
								<i class="icon-double-angle-right"></i>
								新增病历模板
							</small>
						</h1>
					</div><!--/.page-header-->

					<form id="validation-form" class="form-horizontal" action="${ctx}/medicalrecordtemplateController/edit.do" method="post">
						<div style="border-bottom:1px dotted #e2e2e2; padding-bottom:13px; margin-bottom:13px;">
							<button type="button" class="btn btn-small" onclick="javascript:location.href='${ctx}/medicalrecordtemplateController/list.do';">
								<i class="icon-undo"></i>
								返回
							</button>
							
							<input type="hidden" name="id" value="${medicalrecordtemples.id}"/>
							<button type="submit" class="btn btn-small btn-primary">
								<i class="icon-save"></i>
								保存
							</button>
						</div>

						<div class="row-fluid row1">
							<div></div>
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">模板编号</label>
	
									<div class="controls controls-m">
										<input type="text" readonly="readonly" value="${medicalrecordtemples.templatecode}"/>
										
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">模板名称</label>
	
									<div class="controls controls-m">
										<input type="text" name="templatename" value="${medicalrecordtemples.templatename}"/>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">模板类型</label>
	
									<div class="controls controls-m">
										<select class="chzn-select" data-placeholder="-请选择-" name="diseaseid">
											<option value="0" />
											<c:forEach var="item" items="${diseases}">
												<option <c:if test="${medicalrecordtemples.diseaseid == item.id}">selected="selected"</c:if> value="${item.id}"/>${item.diseasename}
											</c:forEach>
										</select>
									</div>
								</div>	
							</div><!--/span-->							
							
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">撰写医生</label>
	
									<div class="controls controls-m">
										<select id="doctor" class="chzn-select" data-placeholder="-请选择-" name="doctorid" onchange="finddepartment()">
											<option value="0" />
											<c:forEach var="item" items="${doctors}">
												<option <c:if test="${medicalrecordtemples.doctorid == item.id}">selected="selected"</c:if> value="${item.id}" />${item.employeename}
											</c:forEach>
										</select>
									</div>
								</div>		
							</div><!--/span-->	
						</div><!--/.row-fluid-->
	
						<div class="row-fluid row1">
							<div></div>
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">撰写科室</label>
	
									<div class="controls controls-m">
										<input id="department" type="text" readonly="readonly" value="${departmentname}"/>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">模板备注</label>
	
									<div class="controls controls-m">
										<input type="text" name="note" value="${medicalrecordtemples.note}"/>
									</div>
								</div>
							</div><!--/span-->
							
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">适合情况</label>
	
									<div class="controls controls-m">
										<input type="text" name="fitstatus" value="${medicalrecordtemples.fitstatus}"/>
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
										<textarea class="span12 textarea-c" name="patientappeal">${medicalrecordtemples.patientappeal}</textarea>
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
										<textarea class="span12 textarea-c" name="medicalhistory">${medicalrecordtemples.medicalhistory}</textarea>
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
										<textarea class="span12 textarea-c" name="physicalstatus">${medicalrecordtemples.physicalstatus}</textarea>
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
										<textarea class="span12 textarea-c" name="primarydiagnosis">${medicalrecordtemples.primarydiagnosis}</textarea>
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
										<textarea class="span12 textarea-c" name="opinion">${medicalrecordtemples.opinion}</textarea>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
					</form>
				</div><!--/.page-content-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->

		<script type="text/javascript">
			$(function(){
				//开启表单验证
				formValidate();				
			});
		
			//根据医生查询相应科室并回填
			function finddepartment(){
				$.post("${ctx}/departmentController/findbydid.do",
				{did:$("#doctor").val()},
				function(data){
					$("#department").val(data.dpname);
				});
			}
			
			//表单验证
			function formValidate(){
				$("#validation-form").validate({
					errorElement: 'label',
					errorClass: 'help-inline',
					focusInvalid: false,
				    rules: {
				   	  	templatename:"required",
				   	  	diseaseid:"required",
				   	  	doctorid:"required",
				   	  	fitstatus:"required",
				   	  	patientappeal:"required",
				   	  	medicalhistory:"required",
				   	  	physicalstatus:"required",
				   	  	primarydiagnosis:"required",
				   	  	opinion:"required"
				    },
				    messages:{
				      	diseaseid:"这是必选字段",
				      	doctorid:"这是必选字段"		      	
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
