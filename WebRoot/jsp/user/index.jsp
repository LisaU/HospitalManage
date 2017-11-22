<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="../common/quote-index.jsp" %>
	</head>

	<body>
		<div id="navbar" class="navbar">
			<div class="navbar-inner">
				<div class="container-fluid">
					<a href="#" class="brand">
						<small>
							<i class="icon-leaf"></i>
							医院管理系统
							<input id="gritter-light" checked="" type="checkbox" class="ace-switch ace-switch-5" />
						</small>
					</a><!--/.brand-->

					<ul class="nav ace-nav pull-right">	

						<li class="light-black">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img style="width:36px;height:36px;" class="nav-user-photo" src="${pfuserinfo.picture}" alt="" />
								<span class="user-info">
									<small>欢迎您,</small>
									${pfuserinfo.employeename}
								</span>

								<i class="icon-caret-down"></i>
							</a>

							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
								<li>
									<a href="#" onclick="show(this,'${ctx}/userinfoController/finduser.do')">
										<i class="icon-user"></i>
										个人信息
									</a>
								</li>
								
								<li>
									<a href="#" onclick="show(this,'${ctx}/userinfoController/toeditpsw.do')">
										<i class="icon-key"></i>
										修改密码
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="#" onclick="javascript:location.href='${ctx}/indexController/loginout.do';">
										<i class="icon-off"></i>
										退出
									</a>
								</li>
							</ul>
						</li>
					</ul><!--/.ace-nav-->
				</div><!--/.container-fluid-->
			</div><!--/.navbar-inner-->
		</div>

		<div class="main-container container-fluid" style="height: calc(100% - 45px);">
			<a class="menu-toggler" id="menu-toggler" href="#">
				<span class="menu-text"></span>
			</a>

			<div class="sidebar" id="sidebar">
				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">						
						<h3>导航菜单</h3>
					</div>
				</div><!--#sidebar-shortcuts-->

				<ul class="nav nav-list" onresize="ulresize()" style="overflow:auto;">
					<c:forEach var="menus" items="${pfuserinfo.menulist}">
						<c:if test="${empty menus.resourceurl || menus.resourceurl == ''}">
							<li>							
								<a href="#" class="dropdown-toggle" >
									<i class="${menus.resourceicon}"></i>
									<span class="menu-text"> ${menus.resourcename} </span>
		
									<b class="arrow icon-angle-down"></b>
								</a>
								<ul class="submenu">
									<c:forEach var="item" items="${pfuserinfo.resources}">
										<c:if test="${item.resourcesuperiorid != 0 && item.resourcesuperiorid == menus.id}">
											<li>
												<a href="#" onclick="show(this,'${ctx}${item.resourceurl}')">
													<i class="icon-double-angle-right"></i>
													${item.resourcename}
												</a>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</li>
						</c:if>
						<c:if test="${!empty menus.resourceurl}">
							<li>
								<a href="#" onclick="show(this,'${ctx}${menus.resourceurl}')">
									<i class="${menus.resourceicon}"></i>
									<span class="menu-text"> ${menus.resourcename} </span>
								</a>
							</li>
						</c:if>
					</c:forEach>

				</ul><!--/.nav-list-->

				<div class="sidebar-collapse" id="sidebar-collapse">
					<i id="hidemenu" class="icon-double-angle-left"></i>
				</div>
			</div>

			<div class="main-content" style="height:100%;">
				<div class="breadcrumbs" id="breadcrumbs">
					<ul id="breadcrumb" class="breadcrumb">
						<li>
							<i class="icon-home home-icon"></i>
							<a href="javascript:location.href='${ctx}/indexController/toinitial.do';">首页</a>
						</li>
						<li></li>
					</ul><!--.breadcrumb-->
				</div>
				<!-- iframe 内容显示  -->
				<iframe id="iframe_web" class="iframe"></iframe>
			</div><!--/.main-content-->
		</div><!--/.main-container-->
		
		<script>
			$(function(){
				//左侧菜单一级菜单子菜单的字体颜色
				$(".threemenu").children().children("a").click(function(){
					$(".threemenu").children().children("a").css("color","#777");
					$(this).css("color","#316292");
				});
				
				//收缩菜单按钮单击事件
				$("#hidemenu").click(function(){
					var val = $("#hidemenu").attr("class");
					if(val == "icon-double-angle-left"){
						$(".nav-list").css("overflow", "initial");
					}else{
						$(".nav-list").css("overflow", "auto");
					}
				});
			});
			
			//面包屑导航-无子节点
			function firstnav(obj){
				//获取点击菜单时的文本
				var nav = $.trim($(obj).text());
				//删除符号 >
				$("#navspan1").remove();
				//清空除首页以外的文本
				$("#breadcrumb li:not('#breadcrumb li:first')").remove();
				//添加符号  >
				$("#breadcrumb li:first").append('<span id="navspan1" class="divider"><i class="icon-angle-right arrow-icon"></i></span>');
				//添加文本
				$("#breadcrumb").append(
					'<li id="navli1">'
						+'<a href="#">'+ nav +'</a>'
					+'</li>'
				);
			}
			
			//面包屑导航-有子节点
			function secondnav(obj){
				//获取点击菜单时父节点的文本
				var nav_f = $.trim($(obj).parent().parent().siblings("a").text());
				//获取点击菜单时子节点的文本
				var nav = $.trim($(obj).text());
				//删除符号 >
				$("#navspan1").remove();
				//清空除首页以外的文本
				$("#breadcrumb li:not('#breadcrumb li:first')").remove();
				//添加符号 >
				$("#breadcrumb li:first").append('<span id="navspan1" class="divider"><i class="icon-angle-right arrow-icon"></i></span>');
				//添加父节点文本、符号 > 和子节点文本
				$("#breadcrumb").append(
					'<li id="navli1">'
						+'<a href="#">'+ nav_f +'</a>'
						+'<span class="divider"><i class="icon-angle-right arrow-icon"></i></span>'
					+'</li>'
					+'<li>'
						+'<a href="#">'+ nav +'</a>'
					+'</li>'
				);
			}
			
			//iframe加载内容
			function onSrc(src){
				$("#iframe_web").attr("src",src);
			}
			
			//点击菜单获取相应路径
			function show(obj,link){
				$("li").removeClass("active");
				$(obj).parent().attr("class","active");
				$(obj).parent().siblings().removeClass("open");
				$(obj).parent().siblings().children("ul").css("display","none");
				$(".threemenu").children().children("a").css("color","#777");								
				if($.trim($(obj).parent().parent().attr("class")) == "submenu"){
					secondnav(obj);
				}else{
					firstnav(obj);
				}
				onSrc(link);
			}
			
			//当打开一个二级菜单，其它二级菜单都关闭
			function notopen(obj,link){
				$("li").removeClass("active");
				$(obj).parent().attr("class","active");
				$(obj).siblings().removeClass("open");
				$(obj).siblings().children("ul").css("display","none");
				onSrc(link);
			}
			
			//ul窗口大小改变事件
			function ulresize(){
				$("#maincontainer").css("height", window.innerHeight-$("#navbar").height()+'px');
				$(".nav-list").css("max-height", window.innerHeight-$("#navbar").height()-$("#sidebar-shortcuts").height()-$("#sidebar-collapse").height()-10 + 'px');				
			}
		</script>		
	</body>
</html>
