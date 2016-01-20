<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link href="${pageContext.request.contextPath}/js/FullPhoto/css/pagestyle.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/js/FullPhoto/css/fullscreenstyle.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/FullPhoto/js/jquery.fullscreenslides.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/ajaxfileupload.js"></script>

<script type="text/javascript">
var options = "<option value='' selected='selected'>请选择</option>";
var inputIndex = 1;

$(function(){

	$('.image img').fullscreenslides();

	var $container = $('#fullscreenSlideshowContainer');

	$container.bind("init", function() {

		$container
		.append('<div class="ui" id="fs-close">&times;</div>')
		.append('<div class="ui" id="fs-loader">Loading...</div>')
		.append('<div class="ui" id="fs-prev">&lt;</div>')
		.append('<div class="ui" id="fs-next">&gt;</div>')
		.append('<div class="ui" id="fs-caption"><span></span></div>');

		$('#fs-prev').click(function(){
			$container.trigger("prevSlide");
		});

		$('#fs-next').click(function(){
			$container.trigger("nextSlide");
		});

		$('#fs-close').click(function(){
			$container.trigger("close");
		});

	})

	.bind("startLoading", function() {
		$('#fs-loader').show();
	})

	.bind("stopLoading", function() {
		$('#fs-loader').hide();
	})

	.bind("startOfSlide", function(event, slide) {

		$('#fs-caption span').text(slide.title);
		$('#fs-caption').show();
	})

	.bind("endOfSlide", function(event, slide) {
		$('#fs-caption').hide();
	});

	setOptions();

});

function setOptions(){
	var fileTypes = JSON.parse($("#fileTypes").val());

	for(var i=0;i<fileTypes.length;i++){
		options += "<option>"+fileTypes[i]+"</option>";
	}
}

function uploadPic(){
	var flag = false;
	$("#form").find("select").each(function(){
		var val = $(this).val();
		if("" == val){
			flag = true;
		}
	});
	if(flag){
		layer.alert("请选择图片类型！！");
		return;
	}
	var applyloanKey = $("#applyloanKey").text();
	$("#form").find("table").each(function(){
		var fileType = $(this).find("select").val();
		$(this).find("input").each(function(){
			var value = $(this).val();
			if("" != value){
				var inputId = $(this).attr("id");
				var inputName = $(this).attr("name");
				fileUpload(inputId,inputName,fileType,applyloanKey);
			}else{
				$(this).parent().parent().find("img").attr("src","${pageContext.request.contextPath}/images/error.jpg");
	        	$(this).parent().parent().find("img").removeAttr("onclick");
			}
		});
	});

}

function fileUpload(id,inputName,fileType,applyloanKey){
	var url = "${pageContext.request.contextPath}/customer/uploadPic.shtml";
	 $.ajaxFileUpload({
        url:url,
        secureuri:false, // 是否启用安全提交，默认为false。
        fileElementId:id, // 需要上传的文件域的ID，即<input type="file">的ID
        dataType: 'json',
        type : 'post',
        data : {'inputName':inputName,'applyloanKey':applyloanKey,'fileType':fileType},
        success: function (data) {
			if("success" == data){
				$("#"+id).parent().parent().find("img").attr("src","${pageContext.request.contextPath}/images/success.jpg");
				$("#"+id).parent().parent().find("img").removeAttr("onclick");
			}
        },error: function(){
        	$("#"+id).parent().parent().find("img").attr("src","${pageContext.request.contextPath}/images/error.jpg");
        	$("#"+id).parent().parent().find("img").removeAttr("onclick");
        }
 });
}

function addItem(item){
	var tr = $("<tr><td></td><td><input type='file' id='pic_"+inputIndex+"' name='pic'/></td><td class='pointer'><img src='${pageContext.request.contextPath}/images/delete.png' width='20px' height='20px' onclick='delItem($(this))'></td></tr>");
	item.parent().parent().parent().parent().append(tr);

	inputIndex ++;
}

function delItem(item){
	item.parent().parent().remove();
}

function delTab(item){
	item.parent().parent().parent().parent().remove();
}

function addTable(){
	var table = $("<table class='uploadPic'></table>");
	var tr1 = $("<tr><td><div class='w70'>选择分类：</div></td><td><select>"+options+"</select></td><td class='pointer'><img src='${pageContext.request.contextPath}/images/delTab.jpg' width='22px' height='22px' onclick='delTab($(this))'></td></tr>");
	var tr2 = $("<tr><td>选择文件：</td><td><input type='file' id='pic_"+inputIndex+"' name='pic'/></td><td class='pointer'><img src='${pageContext.request.contextPath}/images/add.png' width='20px' height='20px' onclick='addItem($(this))'></td></tr>");
	table.append(tr1).append(tr2);
	$("#addPic").append(table);

	inputIndex ++;
}

function exportPic(){
	var picInfosLen = $(".image").length;
	if(picInfosLen == 0){
		layer.alert("暂无图片资料！！");
		return ;
	}
	var applyloanKey = $("#applyloanKey").text();
	//window.location.href = "${pageContext.request.contextPath}/customer/exportAll.shtml?applyloanKey="+applyloanKey;
	window.open("${pageContext.request.contextPath}/customer/exportAll.shtml?applyloanKey="+applyloanKey);
}

</script>

<style type="text/css">
	.info{
		border:1px solid #CAD9EA;
		width:100%;
		font-family: 宋体;
		font-size:14px;
	}
	.info tr{
		border:1px solid #CAD9EA;
		margin:2px 0;
		height:26px;
	}
	.info td{
		border:1px solid #CAD9EA;
	}
	.big-title{
		text-align:left;
		background-color: #858585;
		color:#fff;
		font-size:16px;
		font-family: '黑体';
	}
	.small-title{
		text-align:center;
		background-color: #C7C7C7;
	}
	.link{
		text-align:center;
		background-color: #DCDCDC;
	}

	.uploadPic{
		font-size:14px;
		width: 330px;
		border:1px solid grey;
		float:left;
		margin-bottom:5px;
		margin-left:10px;
	}
	.w70{
		width:70px;
	}
	.pointer{
		cursor: pointer;
	}
	.addPic{
		display:block;
		float:right;
		margin-top:-32px;
	}

	.addPic a{
		font-size:14px;
		color:#fff;
		text-decoration: underline;
	}

	.addPic a:hover{
		color:red;
		text-decoration: underline;
	}
</style>



<%-- <div class="doc-buttons" style="text-align: right;">
	<a class="btn btn-primary marR10" type="button" onclick="exportBaseInfo(${customer.id })">导出客户基本信息</a>
</div> --%>

<input type="hidden" id="fileTypes" value='${fileTypes }'/>

<table class="info">
	<tr class="big-title">
		<td colspan="7">借款标信息</td>
	</tr>
	<tr>
		<td class="small-title">标流水号</td>
		<td id="applyloanKey">${customerLoan.applyloanKey }</td>
		<td class="small-title">标类型</td>
		<td>${customerLoan.applyloanBlx }</td>
		<td class="small-title">借款金额</td>
		<td>${customerLoan.applyloanJkje }(元)</td>
	</tr>
	<tr>
		<td class="small-title">借款期限</td>
		<td>${customerLoan.applyloanJkqx }</td>
		<td class="small-title">最高年利率</td>
		<td>${customerLoan.applyloanZgnll }</td>
		<td class="small-title">还款方式</td>
		<td>${customerLoan.applyloanHkfs }</td>
	</tr>
	<tr>
		<td class="small-title">借款类型</td>
		<td>${customerLoan.applyloanJklx }</td>
		<td class="small-title">借款区域</td>
		<td>${customerLoan.applyloanJkQy }${customerLoan.applyloanJkcs }${customerLoan.applyloanJkqu }</td>
		<td class="small-title">借款目的</td>
		<td>${customerLoan.applyloanJkmd }</td>
	</tr>
	<tr>
		<td class="small-title">所属业务员</td>
		<td>${customerLoan.salesman }</td>
		<c:if test="${null == customerLoan.applyloanlbrs || '' == customerLoan.applyloanlbrs}">
			<td class="small-title">描述信息</td>
			<td colspan="3">${customerLoan.applyloanMsxx }</td>
		</c:if>
		<c:if test="${null != customerLoan.applyloanlbrs && '' != customerLoan.applyloanlbrs}">
			<td class="small-title">联保人数</td>
			<td>${customerLoan.applyloanlbrs }</td>
			<td class="small-title">描述信息</td>
			<td>${customerLoan.applyloanMsxx }</td>
		</c:if>
	</tr>
	<tr class="big-title">
		<td colspan="7">个人信息</td>
	</tr>
	<tr>
		<td class="small-title">姓名</td>
		<td>${customerBasic.name }</td>
		<td class="small-title">手机号码</td>
		<td>${customerBasic.phoneNumber }${phoneInfo.phoneNumber }</td>
		<td class="small-title">年龄</td>
		<td>${customerBasic.age }</td>
	</tr>
	<tr>
		<td class="small-title">性别</td>
		<td>${customerBasic.sex }</td>
		<td class="small-title">身份证号码</td>
		<td>${customerLoan.idCard }</td>
		<td class="small-title">QQ号码</td>
		<td>${customerBasic.qqPhone }</td>
	</tr>
	<tr>
		<td class="small-title">单位电话</td>
		<td>${customerBasic.unitPhone }</td>
		<td class="small-title">单位名称</td>
		<td>${customerBasic.unitName }</td>
		<td class="small-title">单位地址</td>
		<td>${customerBasic.unitAddress }</td>
	</tr>
	<tr>
		<td class="small-title">民族</td>
		<td>${customerBasic.national }</td>
		<td class="small-title">现居住地</td>
		<td>${customerBasic.nowliveAddress }</td>
		<td class="small-title">父母所在地</td>
		<td>${customerBasic.parentsSeat }</td>
	</tr>
	<tr>
		<td class="small-title">婚姻状况</td>
		<td>${customerBasic.maritalStatus }</td>
		<td class="small-title">户籍所在地</td>
		<td colspan="3">${customerBasic.censusSeat }${customerBasic.censusshi }${customerBasic.censusqu }</td>
	</tr>
	<tr>
		<td class="small-title">描述主题</td>
		<td>${customerBasic.descriPtionTheme }</td>
		<td class="small-title">描述信息</td>
		<td colspan="3">${customerBasic.descriPtion }</td>
	</tr>
	<tr class="big-title">
		<td colspan="7">信用信息</td>
	</tr>
	<tr>
		<td class="small-title">工作年限</td>
		<td>${customerBasic.workYear }</td>
		<td class="small-title">商业保险</td>
		<td>${customerBasic.commercial }</td>
		<td class="small-title">职称</td>
		<td>${customerBasic.nickName }</td>
	</tr>
	<tr>
		<td class="small-title">社保年限</td>
		<td>${customerBasic.socialYear }</td>
		<td class="small-title">长期居住地</td>
		<td>${customerBasic.longLive }</td>
		<td class="small-title">房产</td>
		<td>${customerBasic.houserProperty }</td>
	</tr>
	<tr>
		<td class="small-title">征信报告</td>
		<td>${customerBasic.creditReport }</td>
		<td class="small-title">年收入</td>
		<td>${customerBasic.annualIncome }</td>
		<td class="small-title">教育程度</td>
		<td>${customerBasic.educationDegree }</td>
	</tr>
	<tr>
		<td class="small-title">贷款记录</td>
		<td>${customerBasic.loanRecords }</td>
		<td class="small-title">信用卡额度</td>
		<td>${customerBasic.creditCards }</td>
		<td class="small-title">职业</td>
		<td>${customerBasic.professional }</td>
	</tr>
	<tr class="big-title">
		<td colspan="7">紧急联系人</td>
	</tr>
	<tr>
		<td class="small-title">亲人：${customerBasic.relativesName }</td>
		<td>${customerBasic.relativesPhoneNumber }${phoneInfo.relativesPhoneNumber }</td>
		<td class="small-title">社会朋友：${customerBasic.socialFriendsName }</td>
		<td>${customerBasic.socialFriendsPhoneNumber }${phoneInfo.socialFriendsPhoneNumber }</td>
		<td class="small-title">同学：${customerBasic.classmatesName }</td>
		<td>${customerBasic.classmatesPhoneNubmer }${phoneInfo.classmatesPhoneNubmer }</td>
	</tr>
	<tr>
		<td class="small-title">同事：${customerBasic.colleaguesName }</td>
		<td>${customerBasic.colleaguesPhoneNumber }${phoneInfo.colleaguesPhoneNumber }</td>
		<td class="small-title">普通朋友：${customerBasic.simpleFriend }</td>
		<td>${customerBasic.simpleFriendPhoneNumber }${phoneInfo.simpleFriendPhoneNumber }</td>
		<td class="small-title">贷友：${customerBasic.borrowFriendsName }</td>
		<td>${customerBasic.borrowFriendsPhoneNumber }${phoneInfo.borrowFriendsPhoneNumber }</td>
	</tr>
</table>
<p class="big-title">图片资料</p>
<span class="addPic"><a class="pointer" href="javascript:void(0)" onclick="exportPic()">导出图片</a></span>
<div>
	<c:if test="${customerPics.size() == 0 }">
		<span style="color:#FF0000;display: inline-block;text-align: center;width: 100%">暂无图片资料信息</span>
	</c:if>

	<c:forEach var="item" items="${customerPics}" varStatus="i">
		<c:forEach varStatus="j" var="pic" items="${item.value }">
			<c:if test="${j.index == 0 }">
				<div class="image">
					<a rel="gallery${i.index }" title="${item.key }" href="${pageContext.request.contextPath}${pic.filepath}"><img
						src="${pageContext.request.contextPath}${pic.filepath}" width="148px;" height="140px;"></a>
					<div class="caption">
						<span title="${item.key}">
							<c:choose>
							   <c:when test="${fn:length(item.key) > 10}">
							   		<c:out value="${fn:substring(item.key, 0, 10)}..." />
							   </c:when>
							   <c:otherwise>
							        <c:out value="${item.key}" />
							    </c:otherwise>
							</c:choose>
						</span>
					</div>
				</div>
			</c:if>
			<c:if test="${j.index != 0 }">
				<div class="image" style="display:none;">
					<a rel="gallery${i.index }" title="${item.key}" href="${pageContext.request.contextPath}${pic.filepath}"><img
						src="${pageContext.request.contextPath}${pic.filepath}" width="148px;" height="140px;"></a>
					<div class="caption">
						<span title="${item.key}">
							<c:choose>
							   <c:when test="${fn:length(item.key) > 10}">
							   		<c:out value="${fn:substring(item.key, 0, 10)}..." />
							   </c:when>
							   <c:otherwise>
							        <c:out value="${item.key}" />
							    </c:otherwise>
							</c:choose>
						</span>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</c:forEach>
</div>
<p class="big-title" style="clear: both;">补充图片</p>
<span class="addPic"><a class="pointer" href="javascript:void(0)" onclick="addTable()">继续添加</a>&nbsp;&nbsp;<a class="pointer" href="javascript:void(0)" onclick="uploadPic()">保存图片</a></span>

<form id="form" action="${pageContext.request.contextPath}/customer/uploadPic.shtml" enctype="multipart/form-data">
	<div id="addPic">
		<table class="uploadPic">
			<tr>
				<td><div class="w70">选择分类：</div></td>
				<td><select name="fileType0">
					<option value="" selected="selected">请选择</option>
					<c:forEach items="${fileTypes }" var="item">
						<option>${item }</option>
					</c:forEach>
				</select></td>
				<td class="pointer"><img src="${pageContext.request.contextPath}/images/delTab.jpg" width="22px" height="22px" onclick="delTab($(this))"></td>
			</tr>
			<tr>
				<td>选择文件：</td>
				<td><input type="file" id="pic_0" name="pic"/></td>
				<td class="pointer"><img src="${pageContext.request.contextPath}/images/add.png" width="20px" height="20px" onclick="addItem($(this))"></td>
			</tr>
		</table>
	</div>
</form>



