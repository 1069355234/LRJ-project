var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
			hide : true
		}, {
			colkey : "applyloanKey",
			name : "标流水号",
			isSort:true,
		}, {
			colkey : "applyloanBlx",
			name : "标类型",
			isSort:true,
		}, {
			colkey : "name",
			name : "客户名",
			isSort:true,
		}, {
			colkey : "salesman",
			name : "所属业务员",
			isSort:true,
		}, {
			colkey : "applyloanJkQy",
			name : "借款区域",
			isSort:true,
		}, {
			colkey : "applyloanJkje",
			name : "借款金额"
		}, {
			colkey : "createTime",
			name : "创建时间",
			isSort:true
		}, {
			colkey : "applyloanKey",
			name : "操作",
			renderData : function(rowindex,data, rowdata, column) {
				return "<a href='javascript:void(0)' onclick='detail(\""+data+"\")' style='color:blue'>详细信息</a>&nbsp;|&nbsp;<a href='javascript:void(0)' onclick='' style='color:blue'>审核</a>";
			}
		}],
		jsonUrl : rootPath + '/customer/findByPage.shtml?flag=byRole',
		checkbox : true,
		serNumber : true,
		checkValue : "id"
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJson();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});

	$("#allExport").click("click", function() {
		allExport();
	});

	$("#chooseExport").click("click", function() {
		chooseExport();
	});

});


function detail(data){
	var li = $("<li>><a href='javascript:void(0)'>客户详细信息</a></li>");
	$("#topli").append(li);
	var tb = $("#loadhtml");
	tb.html(CommnUtil.loadingImg());
	tb.load(rootPath+"/customer/detail.shtml",{"applyloanKey":data});
}

//此方法无用了
function piclist(data){
	var li = $("<li>><a href='javascript:void(0)'>资料照片</a></li>");
	$("#topli").append(li);
	var tb = $("#loadhtml");
	tb.html(CommnUtil.loadingImg());
	tb.load(rootPath+"/customer/piclist.shtml",{"applyloanKey":data});
}

function allExport(){
	window.location.href = rootPath + "/customer/exportBaseInfo.shtml";
}

function chooseExport(){
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择要导出的记录！");
		return;
	}
	window.location.href = rootPath + "/customer/exportBaseInfo.shtml?loanIds="+cbox.join(",");
}
