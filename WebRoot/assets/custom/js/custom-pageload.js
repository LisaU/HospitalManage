function loadfunction(){
	//获取分页信息
	$.post(ctx + "/passController/getpaging.do",{},
		function(data){
 			$("#paging").html(data);
		});
	
	//获取总行数
    $("#sumrow").html(sumrow);
	//设置当前页
	$("#currentpage").html(currentpage);
    //设置当前显示行数
	var size = parseInt($("#pagesize").val());
	var sumpage = 0;
	if(sumrow != size){
		var sumpage = parseInt(sumrow / size);
	}
	
	var begin = (currentpage - 1) * size + 1;
	var end = currentpage * size;
	var currentrow =  begin + "-" + end;
	$("#currentrow").html(currentrow);
    //设置分页序号是否可见，当只有1页时不可见
    if(sumpage != 0){
    	$("#pagecode").css("visibility","visible");
    }else{
    	$("#pagecode").css("visibility","hidden");
    }
}