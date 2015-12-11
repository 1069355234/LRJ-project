var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "customer_id",
			name : "id",
			hide : true
		}, {
			colkey : "customer_name",
			name : "客户名",
			isSort:true,
		}, {
			colkey : "customer_sex",
			name : "性别",
			isSort:true,
		}, {
			colkey : "customer_age",
			name : "年龄",
			isSort:true,
		}, {
			colkey : "product_name",
			name : "产品"
		}, {
			colkey : "employee_id",
			name : "业务员"
		}, {
			colkey : "customer_time",
			name : "创建时间",
			isSort:true,
			renderData : function(rowindex,data, rowdata, column) {
				return new Date(data).format("yyyy-MM-dd hh:mm:ss");
			}
		}, {
			colkey : "customer_phone",
			name : "操作",
			renderData : function(rowindex,data, rowdata, column) {
				return "<a href='javascript:void(0)' onclick='detail("+data+")' style='color:blue'>详细信息</a>&nbsp;|&nbsp;<a href='javascript:void(0)' onclick='piclist("+data+")' style='color:blue'>资料照片</a>";
			}
		}],
		jsonUrl : rootPath + '/customer/findByPage.shtml',
		checkbox : true,
		serNumber : true,
		checkValue : "customer_id"
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJson();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});

	$("#allExport").click("click", function() {// 绑定查询按扭
		allExport();
	});

	$("#chooseExport").click("click", function() {// 绑定查询按扭
		chooseExport();
	});

});


function detail(data){
	var li = $("<li>><a href='javascript:void(0)'>客户详细信息</a></li>");
	$("#topli").append(li);
	var tb = $("#loadhtml");
	tb.html(CommnUtil.loadingImg());
	tb.load(rootPath+"/customer/detail.shtml",{"customer_id":data});
}

function piclist(data){
	var li = $("<li>><a href='javascript:void(0)'>资料照片</a></li>");
	$("#topli").append(li);
	var tb = $("#loadhtml");
	tb.html(CommnUtil.loadingImg());
	tb.load(rootPath+"/customer/piclist.shtml",{"customerPhone":data});
}

function allExport(){
	window.location.href = rootPath + "/customer/exportBaseInfo.shtml";
}

function chooseExport(){
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择要导出的客户！");
		return;
	}
	window.location.href = rootPath + "/customer/exportBaseInfo.shtml?customerIds="+cbox.join(",");
}
