<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 分页菜单模块 -->
<div class="row-fluid">
	<div >
		<div style="padding-left:15px; display:inline-block; float:right;">
      		<span style="margin-top:5px; color:#777">每页行数：</span>
        	<!-- initialized 另一种样式
		    <select id="pagesize" style=" width: 60px;" class="browser-default" onchange="setpagesize($(this).val())">
		      	<option value="1">1</option>
		      	<option value="2">2</option>
		      	<option value="5">5</option>
		      	<option selected="selected" value="10">10</option>
		      	<option value="15">15</option>
		      	<option value="20">20</option>
		      	<option value="50">50</option>
		      	<option value="100">100</option>
		      	<option value="500">500</option>
		    </select>-->
	    	<input type="text" id="pagesize" style="width: 30px; min-width:30px; margin:0;" class="browser-default" value="10"/>
	    	<button class="btn btn-small btn-info" onclick="search()" style="width:auto !important;border-width:2px;">设置</button>
      	</div>
      	<div style="padding-left:15px; display:inline-block; float:right; line-height:30px;">
      		<span style="margin-top:5px; color:#777">当前显示：</span>
	    	<span id="currentrow" style=" margin-top:5px; color:black"></span>
      	</div>
      	<div style="padding-left:15px; display:inline-block; float:right; line-height:30px;">
      		<span style="margin-top:5px; color:#777">当前页：</span>
	    	<span id="currentpage" style=" margin-top:5px; color:black"></span>
      	</div>
      	<div style="padding-left:15px; display:inline-block; float:right; line-height:30px;margin-bottom:5px;">
		    <span style="margin-top:5px; color:#777">总行数：</span>
		    <span id="sumrow" style=" margin-top:5px; color:black"></span>
    	</div>
    	<div id="pagecode" class="dataTables_paginate paging_bootstrap pagination">
			<ul id="paging">
				
			</ul>
		</div>
	</div>
</div>