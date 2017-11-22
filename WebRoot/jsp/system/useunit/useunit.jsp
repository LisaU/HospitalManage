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
							软件使用单位资料
							<input id="gritter-light" checked="" type="checkbox" class="ace-switch ace-switch-5" />
						</h1>
					</div><!--/.page-header-->

					<form class="form-horizontal" id="validation-form" action="${ctx}/useunitController/edit.do" method="post">
						<div style="border-bottom:1px dotted #e2e2e2; padding-bottom:13px; margin-bottom:13px;">
							<button class="btn btn-small btn-success btn-edit" type="button" id="edit" onclick="show()">
								<i class="icon-edit"></i>
								编辑
							</button>
							
							<input type="hidden" name="id" value="${useunit.id}"/>
							<button class="btn btn-small btn-primary" type="submit" id="save" style="display:none;">
								<i class="icon-save"></i>
								保存
							</button>
						</div>
							
						<div class="row-fluid">
							<div></div>	
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">单位名称</label>
	
									<div class="controls controls-m">
										<input type="text" name="unitname" value="${useunit.unitname}" readonly="readonly"/>
									</div>
								</div>
							</div><!--/span-->
	
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">邮政编码</label>
	
									<div class="controls controls-m">
										<input type="text" name="postcode" value="${useunit.postcode}" readonly="readonly"/>
									</div>
								</div>	
							</div><!--/span-->
							
							<div class="span4">
								<div class="control-group control-group-m">	
									<label class="control-label control-label-m">邮箱</label>
	
									<div class="controls controls-m">
										<input type="text" name="email" value="${useunit.email}" readonly="readonly"/>
									</div>
								</div>
							</div><!--/span-->
						</div><!--/.row-fluid-->
	
						<div class="row-fluid">
							<div></div>
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">电话</label>
	
									<div class="controls controls-m">
										<input type="text" name="tel" value="${useunit.tel}" readonly="readonly"/>
									</div>
								</div>
							</div><!--/span-->
	
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">手机</label>
	
									<div class="controls controls-m">
										<input type="text" name="phone" value="${useunit.phone}" readonly="readonly"/>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">传真</label>
	
									<div class="controls controls-m">
										<input type="text" name="fax" value="${useunit.fax}" readonly="readonly"/>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
	
						<div class="row-fluid">
							<div></div>	
							<div class="span4">
								<div class="control-group control-group-m">	
									<label class="control-label control-label-m">开户银行</label>
	
									<div class="controls controls-m">
										<div class="chzn-div">
											<select class="chzn-select" data-placeholder="-请选择-" name="bankid" disabled="disabled">
												<option value="" />-请选择-							
												<c:forEach items="${banks}" var="item">
													<option <c:if test="${useunit.bankid == item.id}">selected="selected"</c:if> value="${item.id}" />${item.detailname}
												</c:forEach>
											</select>
										</div>
									</div>
								</div>	
							</div><!--/span-->
							
							<div class="span4">
								<div class="control-group control-group-m">	
									<label class="control-label control-label-m">银行账号</label>
	
									<div class="controls controls-m">
										<input type="text" name="bankaccount" value="${useunit.bankaccount}" readonly="readonly"/>
									</div>
								</div>	
							</div><!--/span-->
							
							<div class="span4">
								<div class="control-group control-group-m">	
									<label class="control-label control-label-m">地址</label>
	
									<div class="controls controls-m">
										<input type="text" name="address" value="${useunit.address}" readonly="readonly"/>
									</div>
								</div>
							</div><!--/span-->
						</div><!--/.row-fluid-->
					</form><!-- /.form -->
				</div><!--/.page-content-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->
		
		<!-- 参数化,应用在custom_pageload.js -->
		<script type="text/javascript">					
			var ctx = "${ctx}";
			var controller = "/useunitController";
		</script>
		
		<script type="text/javascript">
			$(function(){
				//提交返回信息
				if("${resulttext}" == "save"){
					hint("保存成功！");
				}
				
				//开启表单验证
				formValidate();
			});			
			
			//设置各个控件为可用
			function show(){
				$("#edit").css("display","none");
				$("#save").css("display","");
				$("select[name='bankid']").removeAttr("disabled");
				$("select[name='bankid']").trigger("liszt:updated");
           		$("select[name='bankid']").chosen();
           		$("input[name='unitname']").removeAttr("readonly");
           		$("input[name='postcode']").removeAttr("readonly");
           		$("input[name='tel']").removeAttr("readonly");
           		$("input[name='phone']").removeAttr("readonly");
           		$("input[name='fax']").removeAttr("readonly");
           		$("input[name='bankaccount']").removeAttr("readonly");
           		$("input[name='email']").removeAttr("readonly");
           		$("input[name='address']").removeAttr("readonly");
			}
			
			//表单验证
			function formValidate(){
				$("#validation-form").validate({
					errorElement: 'label',
					errorClass: 'help-inline',
					focusInvalid: false,
				    rules: {
				   	  	unitname:"required",
				      	postcode:"required",
				      	email:{
							required: true,
							email:true
						},
				      	tel:"required",
				      	phone:{
				      		required:true,
				      		phone:true
				      	},
				      	bankid:"required",
				      	bankaccount:{
				      		required:true,
				      		rangelength:[16,19]
				      	},
				      	address:"required"
				    },
				    messages:{
				      	bankid:"这是必选字段",
				      	bankaccount:{
				      		required:"这是必填字段",
				      		rangelength:"必须输入合法的银行卡号"
				      	},
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
