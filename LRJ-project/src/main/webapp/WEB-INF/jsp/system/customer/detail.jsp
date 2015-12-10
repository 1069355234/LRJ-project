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

<script type="text/javascript">
function exportBaseInfo(){
	window.location.href = "${pageContext.request.contextPath}/customer/exportBaseInfo.shtml";
}
</script>

<div class="doc-buttons" style="text-align: right;">
	<button class="btn btn-primary marR10" type="button" onclick="exportBaseInfo()">导出客户基本信息</button>
</div>

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
		<td colspan="2">杜美玉</td>
	</tr>
	<tr>
		<td class="small-title">金额</td>
		<td>40000.0</td>
		<td class="small-title">年利率</td>
		<td>14.0%</td>
		<td class="small-title">期数</td>
		<td colspan="2">3</td>
	</tr>
	<tr>
		<td class="small-title">借款类型</td>
		<td>宜车贷</td>
		<td class="small-title">标模式</td>
		<td>满标</td>
		<td class="small-title">还款方式</td>
		<td colspan="2">还本付息</td>
	</tr>
	<tr>
		<td class="small-title">完成进度</td>
		<td>90.0</td>
		<td class="small-title">发布时间</td>
		<td>2015-12-09 12:23:34</td>
		<td class="small-title">结束时间</td>
		<td colspan="2">2015-12-09 12:23:34</td>
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
		<td>张三</td>
		<td class="small-title">手机号码</td>
		<td>15651829776</td>
		<td class="small-title">身份证号码</td>
		<td colspan="2">365655221654131654</td>
	</tr>
	<tr>
		<td class="small-title">性别</td>
		<td>男</td>
		<td class="small-title">单位电话</td>
		<td>1564621316</td>
		<td class="small-title">单位名称</td>
		<td colspan="2">深圳华东</td>
	</tr>
	<tr>
		<td class="small-title">年龄</td>
		<td>33</td>
		<td class="small-title">家庭电话</td>
		<td>3453534</td>
		<td class="small-title">单位地址</td>
		<td colspan="2">江苏南京建邺区新城科技园</td>
	</tr>
	<tr>
		<td class="small-title">民族</td>
		<td>汉</td>
		<td class="small-title">电子邮件</td>
		<td>345345@qq.com</td>
		<td class="small-title">现居住地</td>
		<td colspan="2">江苏南京</td>
	</tr>
	<tr>
		<td class="small-title">户籍</td>
		<td>江苏南京</td>
		<td class="small-title">QQ号码</td>
		<td>1069355234</td>
		<td class="small-title">父母所在地</td>
		<td colspan="2">江苏徐州</td>
	</tr>
	<tr>
		<td class="small-title">从事行业</td>
		<td>商业地产</td>
		<td class="small-title">个人描述</td>
		<td>************</td>
		<td class="small-title">风险类别</td>
		<td colspan="2">大额标未结清</td>
	</tr>
	<tr class="big-title">
		<td colspan="7">信用信息</td>
	</tr>
	<tr>
		<td class="small-title">工作年限</td>
		<td>5年以上</td>
		<td class="small-title">商业保险</td>
		<td>有</td>
		<td class="small-title">职称</td>
		<td colspan="2">行业人员、学生</td>
	</tr>
	<tr>
		<td class="small-title">社保年限</td>
		<td>未缴纳</td>
		<td class="small-title">长期居住地</td>
		<td>江苏南京</td>
		<td class="small-title">房产</td>
		<td colspan="2">自有未按揭，价值100万</td>
	</tr>
	<tr>
		<td class="small-title">婚姻状况</td>
		<td>已婚</td>
		<td class="small-title">年收入</td>
		<td>20万</td>
		<td class="small-title">教育程度</td>
		<td colspan="2">本科</td>
	</tr>
	<tr>
		<td class="small-title">贷款记录</td>
		<td>1-3年</td>
		<td class="small-title">信用卡额度</td>
		<td>100000</td>
		<td class="small-title">职业</td>
		<td colspan="2">其他职业</td>
	</tr>
	<tr>
		<td rowspan="2" class="small-title">紧急联系人</td>
		<td class="link">亲人：张三</td>
		<td>1595154254</td>
		<td class="link">社会朋友：王婷</td>
		<td>464646454</td>
		<td class="link">同学：毒药</td>
		<td>16546551315</td>
	</tr>
	<tr>
		<td class="link">同事：张三</td>
		<td>1595154254</td>
		<td class="link">普通朋友：王婷</td>
		<td>464646454</td>
		<td class="link">贷友：李四</td>
		<td>16546551315</td>
	</tr>
</table>