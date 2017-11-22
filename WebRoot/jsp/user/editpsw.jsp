<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="../common/quote.jsp" %>
		<style type="text/css">
			#validation-form2{display: none;}
		</style>
	</head>

	<body>
		<div class="main-container container-fluid">
			<div class="main-content">
				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							修改密码
							<input id="gritter-light" checked="" type="checkbox" class="ace-switch ace-switch-5" />
						</h1>
					</div><!--/.page-header-->
					
					<form id="validation-form1" class="form-horizontal">
						<div style="border-bottom:1px dotted #e2e2e2; padding-bottom:13px; margin-bottom:13px;">
							<button class="btn btn-small" type="button" onclick="javascript:location.href='${ctx}/indexController/toinitial.do';">
								<i class="icon-undo"></i>
								返回
							</button>
							
							<button class="btn btn-small btn-success" type="submit">
								<i class="icon-share-alt"></i>
								下一步
							</button>
						</div>
						
						<div class="row-fluid">
							<div></div>
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">原密码</label>
									
									<div class="controls controls-l">
										<input type="password" id="formerpsw" name="formerpsw"/>
									</div>
								</div>		
							</div><!--/span-->
						</div><!--/.row-fluid-->
					</form><!-- /.form -->

					<form id="validation-form2" class="form-horizontal">
						<div style="border-bottom:1px dotted #e2e2e2; padding-bottom:13px; margin-bottom:13px;">							
							<button class="btn btn-small" type="button" onclick="last()">
								<i class="icon-reply"></i>
								上一步
							</button>
							
							<input type="hidden" name="id" value="${userid}">
							<button class="btn btn-small btn-primary" type="submit">
								<i class="icon-save"></i>
								保存
							</button>
						</div>
						
						<div class="row-fluid">
							<div></div>
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">新密码</label>
									
									<div class="controls controls-l">
										<input type="password" name="loginpsw" id="loginpsw"/>
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">确认密码</label>
									
									<div class="controls controls-l">
										<input type="password" name="psw"/>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
						
					</form><!-- /.form -->
				</div><!--/.page-content-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->

		<script type="text/javascript">
			$(function(){
				//开启表单验证
				formValidate1();
				formValidate2();
				//原密码文本框获得焦点
				$("#formerpsw")[0].focus();
			});
			
			//表单验证
			function formValidate1(){
				$("#validation-form1").validate({
					errorElement: 'label',
					errorClass: 'help-inline',
					focusInvalid: false,
				    rules: {
				   	  	formerpsw:"required"
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
						next();
					}
			    });
			}
			
			//下一步
			function next(){
				$.post("${ctx}/userinfoController/editpswnext.do",
					{psw:$("#formerpsw").val()},
					function(data){
						if(data.msg == "true"){
							$("#validation-form1").hide();
							$("#validation-form2").show();
							$("#loginpsw")[0].focus();
						}else{
							hint(data.msg);
							$("#formerpsw").val("");
						}
					});				
			}
			
			//上一步
			function last(){
				$("#validation-form1").show();
				$("#validation-form2").hide();
				$("#formerpsw")[0].focus();
			}
			
			//表单验证
			function formValidate2(){
				$("#validation-form2").validate({
					errorElement: 'label',
					errorClass: 'help-inline',
					focusInvalid: false,
				    rules: {
				   	  	loginpsw:{
				   	  		required: true,
				   	  		passChar: true,
					        minlength:3,
					        maxlength:16
				   	  	},
				   	  	psw:{
				   	  		required:true,
				   	  		equalTo:"#loginpsw"
				   	  	}
				    },
				    messages:{
				      	psw:{
				      		equalTo:"两次密码输入不一致"
				      	}	
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
						formSubmit2();
					}
			    });
			}
			
			//ajax提交，保存新密码
			function formSubmit2(){
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
					$.post("${ctx}/userinfoController/editpsw.do",
					{psw:$("input[name='psw']").val()},
					function(data){
						$("#validation-form1").show();
						$("#validation-form2").hide();
						$("#formerpsw").val("");
						hint(data.msg);
					});	
				});
			}
		</script>
	</body>
</html>
