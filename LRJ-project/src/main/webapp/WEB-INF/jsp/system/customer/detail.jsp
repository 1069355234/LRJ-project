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
		<td class="small-title">描述信息</td>
		<td colspan="3">${customerLoan.applyloanMsxx }</td>
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