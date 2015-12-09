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
			colkey : "customer_id",
			name : "操作",
			renderData : function(rowindex,data, rowdata, column) {
				return "<a href='javascript:void(0)' onclick='detail("+data+")' style='color:blue'>详情</a>";
			}
		}],
		jsonUrl : rootPath + '/customer/findByPage.shtml',
		checkbox : true,
		serNumber : true
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJson();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});

});


function detail(data){
	var li = $("<li>><a href='javascript:void(0)'>客户详情</a></li>");
	$("#topli").append(li);
	var tb = $("#loadhtml");
	tb.html(CommnUtil.loadingImg());
	tb.load(rootPath+"/customer/detail.shtml",{"customer_id":data});
}


function editAccount() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("只能选中一个");
		return;
	}
	pageii = layer.open({
		title : "编辑",
		type : 2,
		area : [ "600px", "80%" ],
		content : rootPath + '/user/editUI.shtml?id=' + cbox
	});
}
function addAccount() {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "600px", "80%" ],
		content : rootPath + '/user/addUI.shtml'
	});
}
function delAccount() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/user/deleteEntity.shtml';
		var s = CommnUtil.ajax(url, {
			ids : cbox.join(",")
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else {
			layer.msg('删除失败');
		}
	});
}
function permissions() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("请选择一个对象！");
		return;
	}
	var url = rootPath + '/resources/permissions.shtml?userId='+cbox;
	pageii = layer.open({
		title : "分配权限",
		type : 2,
		area : [ "700px", "80%" ],
		content : url
	});
}