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
							资源管理
							<input id="gritter-light" checked="" type="checkbox" class="ace-switch ace-switch-5" />
						</h1>
					</div><!--/.page-header-->
					
					<div class="row-fluid">
						<div class="span3">
							<div class="titlediv">
								<span>选择资源</span>
							</div>
							<div class="control-group control-group-m">
								<ul id="resourceTree" class="ztree"></ul>
							</div>
						</div><!--/span-->									

						<div class="span9">
							<div id="btndiv" class="btndiv">
								<button id="btnsavetree" class="btn btn-small btn-success btn-add" type="button" onclick="add()">
									<i class="icon-share-alt"></i>
									新增
								</button>
								<button class="btn btn-small btn-primary btn-edit" type="button" onclick="edit()">
									<i class="icon-edit"></i>
									修改
								</button>
								<button class="btn btn-small btn-danger btn-dangerone btn-deleteone" type="button" onclick="deleteone()">
									<i class="icon-trash"></i>
									删除
								</button>
								<button class="btn btn-small btn-danger btn-dangermore btn-deletemore" type="button" onclick="deletemore()">
									<i class="icon-trash"></i>
									删除勾选
								</button>
							</div>
							<div id="textdiv">
								<table>
									<tr>
										<td class="td-l">所属资源：</td>
										<td id="resourcesuperior" class="td-r"></td>
									</tr>
									<tr>
										<td class="td-l">资源名称：</td>
										<td id="resourcename" class="td-r"></td>
									</tr>
									<tr>
										<td class="td-l">资源路径：</td>
										<td id="resourceurl" class="td-r"></td>
									</tr>
									<tr>
										<td class="td-l">资源图标：</td>
										<td id="resourceicon" class="td-r"></td>
									</tr>
								</table>
							</div>
							
							<form id="validation-form" >
								<div id="inputdiv" style="width:100%; display: none;">
									<table>
										<tr>
											<td class="td-l">所属资源：</td>
											<td class="td-r-i td-r-i1">
												<div class="control-group">
													<input type="text" id="iresourcesuperior" name="resourcesuperior" placeholder="请选择资源" readonly="readonly"/>
												</div>
											</td>
										</tr>
										<tr>
											<td class="td-l td-l2">资源名称：</td>
											<td class="td-r-i">
												<div class="control-group">
													<input type="text" id="iresourcename" name="resourcename"/>
												</div>
											</td>
										</tr>
										<tr>
											<td class="td-l td-l2">资源路径：</td>
											<td class="td-r-i">
												<div class="control-group">
													<input type="text" id="iresourceurl"/>
												</div>
											</td>
										</tr>
										<tr>
											<td class="td-l td-l2">资源图标：</td>
											<td class="td-r-i">
												<input type="text" id="iresourceicon"/>
												<div class="divsave">
													<button class="btn btn-small" type="button" onclick="toout()">
														<i class="icon-undo"></i>
														返回
													</button>
													<button class="btn btn-small btn-info" type="submit">
														<i class="icon-save"></i>
														保存
													</button>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</form>
						</div><!--/span-->
					</div><!--/.row-fluid-->
				</div><!--/.page-content-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->
		
		<!-- 参数化 -->
		<script type="text/javascript">					
			var ctx = "${ctx}";
			var controller = "/resourceController";
		</script>
	
		<script type="text/javascript">
			var nowNodeId = 0;
			var nowNodepId = 0;
			var nowNodeSp = "";
			var nowNodeName = "";
			var nowNodeUrl = "";
			var nowNodeIcon = "";
			var clickstatus = 0;
			
			$(function(){
				//加载资源树
				loadResourceTree();
				//开启表单验证
				formValidate();
			});
			
			//zTree资源树使用的配置
			var setting = {
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
			   	callback: {
			   	   	onClick: zTreeOnClick,
			   	   	onCheck: zTreeOnCheck
			   	}
	       	};
		   
           //加载当前项目的树形结构（资源树）信息列表  
		   function loadResourceTree() {
			    $.ajax({  
			        type: "POST",  
			        dataType: "json",  
			        url: ctx + controller + "/findresource.do",  
			        data: {},  
			        success: function (data) {
			        	ids = "";  
			            $.fn.zTree.init($("#resourceTree"), setting, data.length > 0 ? data : []);
			            var zTree_Menu = $.fn.zTree.getZTreeObj("resourceTree");//获取树
						var node = zTree_Menu.getNodeByParam("id",nowNodeId);//根据ID获取节点
						zTree_Menu.expandNode(node, true, false);//指定选中ID节点展开
						if(nowNodeId != 0){
							zTree_Menu.selectNode(node,true);//指定选中ID的节点
						}
			        },  
			        error: function () {  
			            hint("载入角色列表出现问题！", 4000);
			        }  
			    });  
			}			
			
			//清空显示资源的数据
			function cleardata(){
				$("#resourcesuperior").html("");
				$("#resourcename").html("");
				$("#resourceurl").html("");
				$("#resourceicon").html("");
				$("#iresourcesuperior").val("");
				$("#iresourcename").val("");
				$("#iresourceurl").val("");
				$("#iresourceicon").val("");
				ids = "";
			}
			
			//节点单击事件
			function zTreeOnClick(event, treeId, treeNode) {
				nowNodeId = treeNode.id;
				nowNodepId = treeNode.resourcesuperiorid;
				nowNodeSp = treeNode.resourcesuperior;
				nowNodeName = treeNode.resourcename;
				nowNodeUrl = treeNode.resourceurl;
				nowNodeIcon = treeNode.resourceicon;
				if(clickstatus == 0){
					cleardata();
					$("#resourcesuperior").html(treeNode.resourcesuperior);
					$("#resourcename").html(nowNodeId == 0 ? "" : nowNodeName);
					$("#resourceurl").html(nowNodeUrl);
					$("#resourceicon").html('<i class="'+ nowNodeIcon +'"></i>')
				}else if(clickstatus == 1){
					$("#iresourcesuperior").val(nowNodeId == 0 ? "无" : nowNodeName);
				}
			};
			
			//节点选择事件
			function zTreeOnCheck(){
				getCheckNode();
			}
			
			//编辑返回
			function toout(){
				$("#textdiv").show();
				$("#inputdiv").hide();
				clickstatus = 0;
				cleardata();
			}			
			
			//显示新增
			function add(){
				clickstatus = 1;
				$("#textdiv").hide();
				$("#inputdiv").show();
				cleardata();
			}
			
			//显示修改并回填数据
			function edit(){
				if(nowNodeId < 1){
					hint("请选择需要修改的资源！");
					return;
				}
				clickstatus = 2;
				$("#textdiv").hide();
				$("#inputdiv").show();
				cleardata();
				$("#iresourcesuperior").val(nowNodeSp);
				$("#iresourcename").val(nowNodeName);
				$("#iresourceurl").val(nowNodeUrl);
				$("#iresourceicon").val(nowNodeIcon);
			}
			
			//表单验证
			function formValidate(){
				$("#validation-form").validate({
					errorElement: 'label',
					errorClass: 'help-inline',
				    rules: {
				    	resourcesuperior:"required",
				   	  	resourcename:"required"
				    },
				    messages:{
				    	resourcesuperior:"这是必选字段"
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
				    	//执行提交方法
				    	saveresource();
				    }
			    });
			}
			
			//保存资源树
			function saveresource(){				
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
					if(clickstatus == 1){
						//新增保存
						if(nowNodeId < 0){
							hint("请选择资源！");
							return;
						}
								
						$.post(ctx + controller + "/add.do",
							{resourcesuperiorid:nowNodeId, 
							resourcename:$("#iresourcename").val(),
							resourceurl:$("#iresourceurl").val()},
							function(data){
					            hint(data.msg);	
								loadResourceTree();
								toout();
							});
					}else if(clickstatus == 2){
						//修改保存
						$.post(ctx + controller + "/edit.do",
							{id:nowNodeId,
							resourcesuperiorid:nowNodepId, 
							resourcename:$("#iresourcename").val(),
							resourceurl:$("#iresourceurl").val()},
							function(data){
					            hint(data.msg);	
								loadResourceTree();
								toout();
							});
					}
				});
			}
			
			//删除当前
			function deleteone(){
				if(nowNodeId < 1){
					hint("请选择需要删除的资源！");
					return;
				}
				
		  		swal({
				  	title: "是否删除资源【"+ nowNodeName +"】?",
				  	text: "将删除该资源下的所有子资源！",
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
						{id:nowNodeId},
						function(data){
				            hint(data.msg);
				            nowNodeId = 0;
							loadResourceTree();
							cleardata();
						});
				});
			}
			
			var ids = "";
			//获取资源树勾选节点的id拼接的字符串
			function getCheckNode(){
				var zTreeObj = $.fn.zTree.getZTreeObj("resourceTree");
				var nodes = zTreeObj.getCheckedNodes(true);
				ids = "";
				for(var i = 0; i < nodes.length; i++){
					ids += nodes[i].id + ",";
				}
				ids = ids.length > 0 ? ids.substr(0, ids.length - 1) : "";
			}
			
			//删除勾选
			function deletemore(){
				if(ids.length < 1){
					hint("请勾选需要删除的资源！");
					return;
				}
				
		  		swal({
				  	title: "是否删除已勾选的资源?",
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
		  			$.post(ctx + controller + "/deletemore.do",
						{ids:ids},
						function(data){
				            hint(data.msg);
				            nowNodeId = 0;
							loadResourceTree();
							cleardata();							
						});
				});
			}
		</script>
	</body>
</html>
