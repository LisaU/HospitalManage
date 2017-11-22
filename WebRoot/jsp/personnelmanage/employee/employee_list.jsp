<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
							员工档案
							<input id="gritter-light" checked="" type="checkbox" class="ace-switch ace-switch-5" />
						</h1>
					</div><!--/.page-header-->
					
					<div class="nav-search" id="nav-search" style="margin-top:5px;">
						<form class="form-search"/>
							<span class="input-icon">
								<input type="text" placeholder="编号/名称/身份证" class="input-small nav-search-input" id="nav-search-input" autocomplete="off" onkeyup="search()"/>
								<i class="icon-search nav-search-icon"></i>
							</span>
						</form>
					</div><!--#nav-search-->
					
					<div class="row-fluid">					
						<div class="span4">
							<div class="control-group control-group-m">
								<div class="controls controls-l">
									<button class="btn btn-small btn-success btn-add" onclick="javascript:location.href='${ctx}/employeeController/toadd.do';">
										<i class="icon-share-alt"></i>
										新增
									</button>
								</div>
							</div>
						</div><!--/span-->
					</div><!--/.row-fluid-->					
					
					<div style="border-bottom:1px dotted #e2e2e2; margin-bottom:10px;"></div>
					
					<table id="imgtable" class="table">
						<thead>
							<tr style="background:#fff;">
								<th>头像</th>
								<th>人员编号</th>
								<th>人员姓名</th>
								<th>性别</th>
								<th>身份证</th>
								<th>出生日期</th>
								<th>医务职称</th>
								<th>职务</th>
								<th>学历</th>
								<th>专业</th>					
								<th>入职时间</th>
								<th>联系电话</th>
								<th>联系地址</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="datas">
																			
						</tbody>		
					</table>
					<%@include file="../../common/pagingmenu.jsp" %>
				</div><!--/.page-content-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->

		<!-- 参数化,应用在custom_pageload.js -->
		<script type="text/javascript">					
			var ctx = "${ctx}";
			var controller = "/employeeController";
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
			
			//跳转页数
			function find(page){
				gettable(page);
			}
			
			//查询
		  	function gettable(page){
		  		//获取数据
		  		$.post(ctx + controller + "/datalist.do",
					{contant:$("#nav-search-input").val(),
					 pagesize:$("#pagesize").val(), 
					 currentpage:page},
					function(data){
		  				$("#datas").html(data);
					});
		  	}
		  	
		  	//搜索
		  	function search(){
		  		find(1);
		  	}
		  	
		  	//重置密码
		  	function resetpsw(id){
		  		swal({
				  	title: "是否重置密码?",
				  	text: "",
				  	type: "warning",
				  	showCancelButton: true,
				  	cancelButtonText: "否",
				  	confirmButtonClass: "btn-danger",
				  	confirmButtonText: "是",
				  	closeOnConfirm: true
				},
				function(){
					$.post(ctx + controller + "/resetpsw.do",
					{id:id,psw:"123"},
					function(data){
		  				hint(data.msg);
					});
				});
		  	}
		  	
		  	//删除确认提示
		  	function deleteemp(id){
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
