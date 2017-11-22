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
							角色职务
							<input id="gritter-light" checked="" type="checkbox" class="ace-switch ace-switch-5" />
						</h1>
					</div><!--/.page-header-->
					
					<div class="row-fluid">
						<div class="span3">
							<div class="titlediv">
								<span>选择角色</span>
							</div>
							<div class="control-group control-group-m">
								<ul id="roleTree" class="ztree"></ul>
							</div>
						</div><!--/span-->									

						<div class="span9">
							<div class="btndiv">
								<span>分配角色职务</span>
								<button id="btnsavetree" class="btn btn-small btn-primary btn-add" type="button" onclick="saveTree()">
									<i class="icon-save"></i>
									保存
								</button>
							</div>
							<div class="control-group control-group-m" >
								<ul id="positionTree" class="ztree"></ul>
							</div>
						</div><!--/span-->
					</div><!--/.row-fluid-->
				</div><!--/.page-content-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->
		
		<!-- 参数化 -->
		<script type="text/javascript">					
			var ctx = "${ctx}";
			var controller = "/roleController";
		</script>
		
		<script type="text/javascript">
			var nowNodeId = 0;
			
			$(function(){
				//加载角色树
				loadRoleTree();
				//加载职务树
				loadPositionTree();
			});
		
			//zTree角色树使用的配置
			var setting = {
	   			view: {
					autoCancelSelected: false,
					selectedMulti: false
				},
	           	data: {
	               	simpleData: {
	                  	enable: true,
	                  	idKey: "rid",
	                  	pIdKey: "frid",
	                  	rootPId: 0
	               	},
	               	key: {
	              		name:"rolename"
	               	} 
	           	},  
			   	callback: {  
			   	   	onClick: zTreeOnClick
			   	}
	       	};
		   
           //加载当前项目的树形结构（角色树）信息列表  
		   function loadRoleTree() {  
			    $.ajax({  
			        type: "POST",  
			        dataType: "json",  
			        url: ctx + controller + "/findrolepositon.do",
			        data: {},  
			        success: function (data) {  
			            $.fn.zTree.init($("#roleTree"), setting, data.length > 0 ? data : []);
			            var zTree_Menu = $.fn.zTree.getZTreeObj("roleTree");//获取树
						var node = zTree_Menu.getNodeByParam("id",nowNodeId);//根据ID获取节点
						zTree_Menu.expandNode(node, true, false);//指定选中ID节点展开
						zTree_Menu.selectNode(node,true);//指定选中ID的节点
			        },  
			        error: function () {  
			            hint("载入角色列表出现问题！");
			        }  
			    });  
			}
			
			//角色树节点单击事件
			function zTreeOnClick(event, treeId, treeNode) {
				clearcheck();
				if(treeNode.frid == '0'){
					nowNodeId = treeNode.id;
					check(treeNode);
			    	$("#positionTree").show();
			    	$("#btnsavetree").prop('disabled', false);//启用按钮	    	
			    }		    
			};
			
			//职务树勾选已有节点
			function check(treeNode){
				//勾选节点
				if(treeNode.positionid != null && treeNode.positionid.length > 0 ){
					var zTree_Menu = $.fn.zTree.getZTreeObj("positionTree");//获取树
					var resourceids = treeNode.positionid.split(',');
					for ( var index = 0; index < resourceids.length; index++) {
						node = zTree_Menu.getNodeByParam("id",resourceids[index]);//根据ID获取节点
						zTree_Menu.expandNode(node, true, false);//指定选中ID节点展开
						zTree_Menu.checkNode(node, true, false);//参数：1节点，2是否勾选，3是否联动子节点，4是否触发单击
					}
				}
			}
			
			//清空职务树已勾选节点
			function clearcheck(){			
				$("#btnsavetree").prop('disabled', true);//禁用按钮
				$("#positionTree").hide();
			    $.fn.zTree.init($("#positionTree"), positionSetting, positionTreeData);
			}
			
			//zTree职务树使用的配置
			var positionSetting = {
				check: {
					enable:true
				},
	           	data: {
	               	simpleData: {
	                  	enable: true,
	                  	idKey: "id"
	               	},
	               	key: {
	              		name:"detailname"
	               	} 
	           	}
			};
			
			var positionTreeData = [];
			//加载当前项目的树形结构（职务树）信息列表  
			function loadPositionTree() {  
			    $.ajax({  
			        type: "POST",  
			        dataType: "json",  
			        url: ctx + controller + "/findposition.do",  
			        data: {},  
			        success: function (data) {  
			        	positionTreeData = data.length > 0 ? data : [];
						clearcheck();
			        },  
			        error: function () {  
			        	
			        }  
			    });  
			}
			
			//保存职务树
			function saveTree(){
				//获取资源ID集合
				 var treeObj = $.fn.zTree.getZTreeObj("positionTree");//获取职务树
			     var nodes = treeObj.getCheckedNodes(true);
			     ids = "";
			     for(var i=0;i<nodes.length;i++){
			     	ids += nodes[i].id + ",";
			     }
			     ids = ids.length > 0 ? ids.substr(0, ids.length - 1) : "";
			     
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
						{id:nowNodeId, positionid:ids},
						function(data){
				            hint(data.msg);				            
							loadRoleTree();
						});
				});
			}
		</script>
	</body>
</html>
