<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src=""></script>

<style type="text/css">
	table{
		border:1px solid #CAD9EA;
		width:100%;
		font-family: 宋体;
		font-size:14px;
	}
	tr{
		border:1px solid #CAD9EA;
		margin:2px 0;
		height:26px;
	}
	td{
		border:1px solid #CAD9EA;
	}
	.big-title{
		text-align:left;
		background-color: #808000;
		color:#fff;
		font-size:16px;
	}
	.small-title{
		text-align:center;
		background-color: #F5DEB3;
	}
	.link{
		text-align:center;
		background-color: #DCDCDC;
	}
</style>



<%-- <div class="doc-buttons" style="text-align: right;">
	<a class="btn btn-primary marR10" type="button" onclick="exportBaseInfo(${customer.id })">导出客户基本信息</a>
</div> --%>

<table>
	<tr class="big-title">
		<td colspan="7">借款标信息</td>
	</tr>
	<tr>
		<td class="small-title">标流水号</td>
		<td>14438524824</td>
		<td class="small-title">标题</td>
		<td>车辆抵押贷款</td>
		<td class="small-title">借款人</td>
		<td>杜美玉</td>
	</tr>
	<tr>
		<td class="small-title">金额</td>
		<td>40000.0</td>
		<td class="small-title">年利率</td>
		<td>14.0%</td>
		<td class="small-title">期数</td>
		<td>3</td>
	</tr>
	<tr>
		<td class="small-title">借款类型</td>
		<td>宜车贷</td>
		<td class="small-title">标模式</td>
		<td>满标</td>
		<td class="small-title">还款方式</td>
		<td>还本付息</td>
	</tr>
	<tr>
		<td class="small-title">完成进度</td>
		<td>90.0</td>
		<td class="small-title">发布时间</td>
		<td>2015-12-09 12:23:34</td>
		<td class="small-title">结束时间</td>
		<td>2015-12-09 12:23:34</td>
	</tr>
	<tr>
		<td class="small-title">详细描述</td>
		<td colspan="6">本人资金周转用车辆抵押贷款在南京运营中心保证按时还款</td>
	</tr>
	<tr class="big-title">
		<td colspan="7">个人信息</td>
	</tr>
	<tr>
		<td class="small-title">姓名</td>
		<td>${customer.name }</td>
		<td class="small-title">手机号码</td>
		<td>${customer.phoneNumber }</td>
		<td class="small-title">年龄</td>
		<td>${customer.age }</td>
	</tr>
	<tr>
		<td class="small-title">性别</td>
		<td>${customer.sex }</td>
		<td class="small-title">户籍所在地</td>
		<td>${customer.censusSeat }</td>
		<td class="small-title">QQ号码</td>
		<td>${customer.qqPhone }</td>
	</tr>
	<tr>
		<td class="small-title">单位电话</td>
		<td>${customer.unitPhone }</td>
		<td class="small-title">单位名称</td>
		<td>${customer.unitName }</td>
		<td class="small-title">单位地址</td>
		<td>${customer.unitAddress }</td>
	</tr>
	<tr>
		<td class="small-title">民族</td>
		<td>${customer.national }</td>
		<td class="small-title">现居住地</td>
		<td>${customer.nowliveAddress }</td>
		<td class="small-title">父母所在地</td>
		<td>${customer.parentsSeat }</td>
	</tr>
	<tr>
		<td class="small-title">婚姻状况</td>
		<td>${customer.maritalStatus }</td>
		<td class="small-title">个人描述</td>
		<td colspan="3">${customer.descriPtion }</td>
	</tr>
	<tr class="big-title">
		<td colspan="7">信用信息</td>
	</tr>
	<tr>
		<td class="small-title">工作年限</td>
		<td>${customer.workYear }</td>
		<td class="small-title">商业保险</td>
		<td>${customer.commercial }</td>
		<td class="small-title">职称</td>
		<td>${customer.nickName }</td>
	</tr>
	<tr>
		<td class="small-title">社保年限</td>
		<td>${customer.socialYear }</td>
		<td class="small-title">长期居住地</td>
		<td>${customer.longLive }</td>
		<td class="small-title">房产</td>
		<td>${customer.houserProperty }</td>
	</tr>
	<tr>
		<td class="small-title">征信报告</td>
		<td>${customer.creditReport }</td>
		<td class="small-title">年收入</td>
		<td>${customer.annualIncome }</td>
		<td class="small-title">教育程度</td>
		<td>${customer.educationDegree }</td>
	</tr>
	<tr>
		<td class="small-title">贷款记录</td>
		<td>${customer.loanRecords }</td>
		<td class="small-title">信用卡额度</td>
		<td>${customer.creditCards }</td>
		<td class="small-title">职业</td>
		<td>${customer.professional }</td>
	</tr>
	<tr class="big-title">
		<td colspan="7">紧急联系人</td>
	</tr>
	<tr>
		<td class="small-title">亲人：${customer.relativesName }</td>
		<td>${customer.relativesPhoneNumber }</td>
		<td class="small-title">社会朋友：${customer.socialFriendsName }</td>
		<td>${customer.socialFriendsPhoneNumber }</td>
		<td class="small-title">同学：${customer.classmatesName }</td>
		<td>${customer.classmatesPhoneNubmer }</td>
	</tr>
	<tr>
		<td class="small-title">同事：${customer.colleaguesName }</td>
		<td>${customer.colleaguesPhoneNumber }</td>
		<td class="small-title">普通朋友：${customer.simpleFriend }</td>
		<td>${customer.simpleFriendPhoneNumber }</td>
		<td class="small-title">贷友：${customer.borrowFriendsName }</td>
		<td>${customer.borrowFriendsPhoneNumber }</td>
	</tr>
</table>