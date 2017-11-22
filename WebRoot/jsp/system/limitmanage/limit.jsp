<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="../../common/quote.jsp" %>
		<%@include file="../../common/list-btn-limit.jsp" %>
		<link href="${ctx}/assets/custom/css/custom-system-style.css" rel="stylesheet" />	
	</head>

	<body>
		<div class="main-container container-fluid">			

			<div class="main-content">
				

				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							权限管理
							<input id="gritter-light" checked="" type="checkbox" class="ace-switch ace-switch-5" />
						</h1>
					</div><!--/.page-header-->
					
					<div class="row-fluid">
						<div class="span3">
							<div class="titlediv">
								<span>选择角色</span>
							</div>
							<div class="control-group control-group-m">
								<ul id="roletree" class="ztree" style="overflow:auto;"></ul>
							</div>
						</div><!--/span-->									

						<div class="span9">
							<div class="btndiv">
								<span>分配角色资源</span>
								<button id="btnsavetree" class="btn btn-small btn-primary btn-add" type="button" onclick="saveTree()">
									<i class="icon-save"></i>
									保存
								</button>
							</div>
							<div class="control-group control-group-m">
								<ul id="resourcetree" class="ztree" style="overflow:auto;"></ul>
							</div>
						</div><!--/span-->
					</div><!--/.row-fluid-->
				</div><!--/.page-content-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->

		<!-- 参数化  -->
		<script type="text/javascript">					
			var ctx = "${ctx}";
			var controller = "/roleController";
		</script>

		<script type="text/javascript">
			var nowNodeId = 0;
			$(function(){
				//加载角色树
				loadRoleTree();
			});
			
			//zTree角色树使用的配置
			var setting = {
	   			view: {
					autoCancelSelected: false,
					selectedMulti: false,
					showLine:false
				},
	           	data: {
	               	simpleData: {
	                  	enable: true,
	                  	idKey: "id"
	               	},
	               	key: {
              			name:"rolename"
	               	} 
	           	},
	           	callback:{
	           		onClick: zTreeOnClick
	           	}
	       };
		   
           //加载当前项目的树形结构（角色树）信息列表  
		   function loadRoleTree() {
			    $.ajax({  
			        type: "POST",  
			        dataType: "json",  
			        url: ctx + controller + "/findrole.do",  
			        data: {},  
			        success: function (data) {
			        	//zTree初始化
			            $.fn.zTree.init($("#roletree"), setting, data.length > 0 ? data : []);
			            $("#btnsavetree").prop('disabled', true);//禁用按钮
			        },  
			        error: function () {  
			            hint("载入角色列表出现问题！");
			        }  
			    });  
			}
			
			//角色树节点单击事件
			function zTreeOnClick(event, treeId, treeNode){
				nowNodeId = treeNode.id;
				loadResourceTree(treeNode);
			}
						
			//资源树勾选已有节点
			function check(treeNode){
				if(treeNode.resourceid != null && treeNode.resourceid.length > 0 ){
					var zTree_Menu = $.fn.zTree.getZTreeObj("resourcetree");//获取树
					var resourceids = treeNode.resourceid.split(',');
					for ( var index = 0; index < resourceids.length; index++) {
						node = zTree_Menu.getNodeByParam("id",resourceids[index]);//根据ID获取节点
						if(node != null){
							zTree_Menu.expandNode(node, true, false);//指定选中ID节点展开
							zTree_Menu.checkNode(node, true, false);//参数：1节点，2是否勾选，3是否联动子节点，4是否触发单击
						}
					}
				}
			}
			
			//zTree资源树使用的配置
			var resourceSetting = {
				check: {
					enable:true
				},
	           	data: {
	               	simpleData: {
	                  	enable: true,
	                  	idKey: "id",
	                  	pIdKey: "resourcesuperiorid",
	                  	rootPId: 0
	               	},
	               	key: {
	              		name:"resourcename"
	               	} 
	           	},
               	callback:{
               		onCheck: zTreeOnCheck
               	}
			}
			
			//加载当前项目的树形结构（资源树）信息列表  
			function loadResourceTree(treeNode) {
			    $.ajax({  
			        type: "POST",  
			        dataType: "json",  
			        url: ctx + "/resourceController/findresource.do",  
			        data: {},  
			        success: function (data) {
			        	ids = ""; 
			            $.fn.zTree.init($("#resourcetree"), resourceSetting, data.length > 0 ? data : []);
			            var zTree_Menu = $.fn.zTree.getZTreeObj("resourcetree");//获取树
						var node = zTree_Menu.getNodeByParam("id",0);//根据ID获取节点
						zTree_Menu.expandNode(node, true, false);//指定选中ID节点展开
						//勾选已有节点
						check(treeNode);
						$("#btnsavetree").prop('disabled', false);//启用按钮
						getCheckNode();
			        },  
			        error: function () {  
			            hint("载入资源列表出现问题！");
			        }  
			    });  
			}
			
			//资源树节点选择事件
			function zTreeOnCheck(){
				getCheckNode();
			}
			
			var ids = "";
			//获取资源树勾选节点的id拼接的字符串
			function getCheckNode(){
				var zTreeObj = $.fn.zTree.getZTreeObj("resourcetree");
				var nodes = zTreeObj.getCheckedNodes(true);
				ids = "";
				for(var i = 0;i < nodes.length; i++){
					ids += nodes[i].id + ",";
				}
				ids = ids.length > 0 ? ids.substr(0, ids.length - 1) : "";
			}
			
			//保存资源树
			function saveTree(){
				//开始保存
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
				    $.post(ctx + controller + "/addChild.do",
						{id:nowNodeId, resourceid:ids},
						function(data){
				            hint(data.msg);
				            loadRoleTree();
						});
				});
			}
		</script>
	</body>
</html>
