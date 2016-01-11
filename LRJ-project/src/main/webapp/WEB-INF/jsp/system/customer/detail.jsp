<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link href="${pageContext.request.contextPath}/js/FullPhoto/css/pagestyle.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/js/FullPhoto/css/fullscreenstyle.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/FullPhoto/js/jquery.fullscreenslides.js"></script>

<script type="text/javascript">
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

});

function uploadPic(){

}

function addItem(){
	var tr = $("<tr><td></td><td><input type='file' name=''/></td><td class='pointer'><img src='${pageContext.request.contextPath}/images/delete.png' width='20px' height='20px' onclick='delItem($(this))'></td></tr>");
	$("#uploadPic").append(tr);
}

function delItem(item){
	item.parent().parent().remove();
}

function delTab(item){
	item.parent().parent().parent().remove();
}

function addTable(){
	var table = $("<table class='uploadPic' id='uploadPic'></table>");
	var tr1 = $("<tr><td>选择分类：</td><td><select></select></td></tr>");
	var tr2 = $("<tr><td>选择文件：</td><td><input type='file' name=''/></td><td class='pointer'><img src='${pageContext.request.contextPath}/images/add.png' width='20px' height='20px' onclick='addItem()'></td></tr>");
	table.append(tr1).append(tr2);
	$("#addPic").append(table);
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
		background-color: #808000;
		color:#fff;
		font-size:16px;
		font-family: '黑体';
	}
	.small-title{
		text-align:center;
		background-color: #F5DEB3;
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

<table class="info">
	<tr class="big-title">
		<td colspan="7">借款标信息</td>
	</tr>
	<tr>
		<td class="small-title">标流水号</td>
		<td>${customerLoan.applyloanKey }</td>
		<td class="small-title">标类型</td>
		<td>${customerLoan.applyloanBlx }</td>
		<td class="small-title">借款金额</td>
		<td>${customerLoan.applyloanJkje }</td>
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
		<td>${customerLoan.applyloanJkQy }</td>
		<td class="small-title">借款目的</td>
		<td>${customerLoan.applyloanJkmd }</td>
	</tr>
	<tr>
		<td class="small-title">所属业务员</td>
		<td>${customerLoan.salesman }</td>
		<c:if test="${null == customerLoan.applloanlbrs }">
			<td class="small-title">描述信息</td>
			<td colspan="3">${customerLoan.applyloanMsxx }</td>
		</c:if>
		<c:if test="${null != customerLoan.applloanlbrs }">
			<td class="small-title">联保人数</td>
			<td>${customerLoan.applloanlbrs }</td>
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
		<td>${customerBasic.phoneNumber }</td>
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
		<td>${customerBasic.censusSeat }</td>
		<td class="small-title">个人描述</td>
		<td>${customerBasic.descriPtion }</td>
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
		<td>${customerBasic.relativesPhoneNumber }</td>
		<td class="small-title">社会朋友：${customerBasic.socialFriendsName }</td>
		<td>${customerBasic.socialFriendsPhoneNumber }</td>
		<td class="small-title">同学：${customerBasic.classmatesName }</td>
		<td>${customerBasic.classmatesPhoneNubmer }</td>
	</tr>
	<tr>
		<td class="small-title">同事：${customerBasic.colleaguesName }</td>
		<td>${customerBasic.colleaguesPhoneNumber }</td>
		<td class="small-title">普通朋友：${customerBasic.simpleFriend }</td>
		<td>${customerBasic.simpleFriendPhoneNumber }</td>
		<td class="small-title">贷友：${customerBasic.borrowFriendsName }</td>
		<td>${customerBasic.borrowFriendsPhoneNumber }</td>
	</tr>
</table>
<p class="big-title">图片资料</p>
<div>
	<c:if test="${customerPics.size() == 0 }">
		<span style="color:#FFD700;display: inline-block;text-align: center;width: 100%">暂无图片资料信息</span>
	</c:if>

	<c:forEach var="item" items="${customerPics}" varStatus="i">
		<c:forEach varStatus="j" var="pic" items="${item.value }">
			<c:if test="${j.index == 0 }">
				<div class="image">
					<a rel="gallery${i.index }" title="${pic.filename }" href="${pageContext.request.contextPath}${pic.filepath}"><img
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
					<a rel="gallery${i.index }" title="${pic.filename }" href="${pageContext.request.contextPath}${pic.filepath}"><img
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
<span class="addPic"><a class="pointer" href="javascript:void(0)" onclick="addTable()">继续添加</a>&nbsp;&nbsp;<a class="pointer" href="javascript:void(0)">保存图片</a></span>

<div id="addPic">
	<table class="uploadPic" id="uploadPic">
		<tr>
			<td>选择分类：</td>
			<td><select>
				<option>身份证</option>
				<option>房产证</option>
			</select></td>
			<td class="pointer"><img src="${pageContext.request.contextPath}/images/delTab.jpg" width="22px" height="22px" onclick="delTab($(this))"></td>
		</tr>
		<tr>
			<td>选择文件：</td>
			<td><input type="file" name=""/></td>
			<td class="pointer"><img src="${pageContext.request.contextPath}/images/add.png" width="20px" height="20px" onclick="addItem()"></td>
		</tr>
	</table>
</div>



