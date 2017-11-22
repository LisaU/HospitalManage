<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">  
	<head>
		<%@include file="../common/quote-login.jsp" %>
	</head>
  	
  	<body class="login1">
    	<!-- Login Screen -->
    	<div class="login-wrapper">
    		<input id="gritter-light" checked="" type="checkbox" class="ace-switch ace-switch-5" />
      		<div class="login-container">
        		<h1>用户登录</h1>
        		<form id="validation-form" >
          			<div class="form-group">
		           		<input class="form-control" placeholder="用户名" type="text" name="employeecode">
		         	</div>
          			<div class="form-group">
		            	<input class="form-control" placeholder="密码" type="password" name="psw">
		          	</div>
          			<div class="form-options clearfix">
            			<a class="pull-right" href="#" onclick="spsw()">忘记密码?</a>
           				<div class="text-left">
              				<label class="checkbox"><input type="checkbox"><span>记住密码</span></label>
            			</div>
          			</div>
          			<button id="btnsubmit" type="submit" style="display: none;">隐藏的提交按钮</button>
        		</form>                         
        		<div class="social-login clearfix">
          			<a class="btn btn-primary pull-left facebook" onclick="isubmit()">登陆</a>
        		</div>
        		<form action="${ctx}/indexController/toindex.do" method="post"></form>
      		</div>
    	</div>
    <!-- End Login Screen -->
  	</body>
  	<script type="text/javascript">
	  	$(function(){
	  		//开启表单验证
	  		formValidate();
	  		$("input[name='employeecode']")[0].focus();
	  	}); 
	  	
	  	function spsw(){
	  		hint("请联系管理员");
	  	}	
	  	
	  	//弹出框提示
		function hint(result){
			$.gritter.add({
				// (string | mandatory) the heading of the notification
				title: '温馨提示',
				// (string | mandatory) the text inside the notification
				text: result,
				class_name: 'gritter-success' + (!$('#gritter-light').get(0).checked ? 'gritter-light' : '')
			});
			return false;
		}
	  	
	  	//表单验证
		function formValidate(){
			$("#validation-form").validate({
			    rules: {
			   	  	employeecode:{
			   	  		required:true,
			   	  		codeChar:true,
			   	  		minlength:3,
			        	maxlength:16,
			        	remote: {
					    	url: "${ctx}/indexController/verify.do",     //后台处理程序
						    type: "post",               //数据发送方式
						    dataType: "json",           //接受数据格式   
						    data: {                     //要传递的数据
						        employeecode: $("#employeecode").val()
						    },
			                dataFilter: function (data, type) {
			                //判断控制器返回的内容
			                var json=JSON.parse(data);
		                    	if (json.valid == "1") {
		                        	return true;   
		                    	}
		                    	else if(json.valid == "0"){
		                        	return false;
		                    	}
		                 	}
						}
			   	  	},
			   	  	psw:{
				        required: true,
			   	  		passChar: true,
				        minlength:3,
				        maxlength:16
			   	  	}
			    },
			    messages:{
			    	employeecode:{
			    		required:"请输入用户名",
			    		remote:"用户名不存在"
			    	},
			    	psw: {
			        	required: "请输入密码"
			      	}
			    },
				//重写提交方式
				submitHandler:function(){
					formSubmit();
				}		    
		    });
		}
		
		
	  	//提交事件
	  	function isubmit(){
	  		$("#btnsubmit").click();
	  	}
	  	
	  	//ajax提交
	  	function formSubmit(){
	  		$.post("${ctx}/indexController/login.do",
			{employeecode:$("input[name='employeecode']").val(),
			 psw:$("input[name='psw']").val()},
			function(data){
				if(data.msg == "1"){
					document.forms[1].submit();
	 			}else{ 				
	 				hint(data.msg);
	 				$("input[name='psw']").val("");
	 			}
			});
	  	}  	
  	</script>
</html>