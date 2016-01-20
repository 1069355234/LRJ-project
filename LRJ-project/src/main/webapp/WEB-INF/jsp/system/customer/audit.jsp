<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
.big-title{
		text-align:left;
		background-color: #858585;
		color:#fff;
		font-size:16px;
		font-family: '黑体';
	}
.pointer{
	cursor: pointer;
}
.oper{
	display:block;
	float:right;
	margin-top:-32px;
}
.oper a{
		font-size:14px;
		color:#fff;
		text-decoration: underline;
	}

a:hover{
	color:red;
	text-decoration: underline;
}
table{
	width: 100%;
	font-size: 12px;
}
</style>

<p class="big-title">材料审核区</p>
<span class="oper"><a class="pointer" href="javascript:void(0)" onclick="exportPic()">继续添加</a></span>
<p>[<span style="color:green">2条同意</span>]-[<span style="color:red">1条不同意</span>]</p>
<table border="1">
	<tr style="text-align: center;font-size: 15px;font-weight: bold;">
		<td style="width:3%;">序号</td>
		<td style="width:20%;">综合意见</td>
		<td style="width:20%;">补充材料意见</td>
		<td style="width:20%;">后续意见</td>
		<td style="width:3%;">状态</td>
		<td style="width:6%;">是否同意</td>
		<td style="width:5%;">更新时间</td>
		<td style="width:5%;">审核人帐号</td>
		<td style="width:5%;">审核人姓名</td>
		<td style="width:5%;">审核人角色</td>
		<td style="width:8%;">操作</td>
	</tr>
	<tr class="aa">
		<td style="text-align: center;">1</td>
		<td>借款人信誉良好，家庭和睦，无不良嗜好</td>
		<td>暂无补充材料意见</td>
		<td>暂无后续意见</td>
		<td style="text-align: center;">可用</td>
		<td style="text-align: center;">同意</td>
		<td>2016-01-19 22:22:33</td>
		<td style="text-align: center;">manager</td>
		<td style="text-align: center;">张三</td>
		<td style="text-align: center;">内审</td>
		<td style="text-align: center;"><a class="pointer" href="javascript:void(0)" onclick="update($(this))">修改</a>|<a class="pointer" href="javascript:void(0)" onclick="">保存</a>|<a class="pointer" href="javascript:void(0)" onclick="">删除</a></td>
	</tr>
	<tr>
		<td style="text-align: center;">2</td>
		<td><textarea style="width: 100%;resize: none;"></textarea></td>
		<td><textarea style="width: 100%;resize: none;"></textarea></td>
		<td><textarea style="width: 100%;resize: none;"></textarea></td>
		<td style="text-align: center;">
			<select>
				<option>请选择</option>
				<option>可用</option>
				<option>不可用</option>
			</select>
		</td>
		<td style="text-align: center;">
			<select>
				<option>请选择</option>
				<option>同意</option>
				<option>不同意</option>
				<option>有条件</option>
			</select>
		</td>
		<td>2016-01-19 22:22:33</td>
		<td style="text-align: center;">manager</td>
		<td style="text-align: center;">张三</td>
		<td style="text-align: center;">内审</td>
		<td style="text-align: center;"><a class="pointer" href="javascript:void(0)" onclick="">修改</a>|<a class="pointer" href="javascript:void(0)" onclick="">保存</a>|<a class="pointer" href="javascript:void(0)" onclick="">删除</a></td>
	</tr>
</table>

<script>
	function update(td){
		var tr = td.parent().parent();
		var tds = tr.children();
		
		var text1 = tds.eq(1).text();
		var text2 = tds.eq(2).text();
		var text3 = tds.eq(3).text();
		var text4 = tds.eq(4).text();
		var text5 = tds.eq(5).text();
		
		var textarea1 = $("<textarea style='width: 100%;resize: none;''>"+text1+"</textarea>");
		tds.eq(1).empty().append(textarea1);
		
		var textarea2 = $("<textarea style='width: 100%;resize: none;''>"+text2+"</textarea>");
		tds.eq(2).empty().append(textarea2);
		
		var textarea3 = $("<textarea style='width: 100%;resize: none;''>"+text3+"</textarea>");
		tds.eq(3).empty().append(textarea3);
		
	}
</script>







