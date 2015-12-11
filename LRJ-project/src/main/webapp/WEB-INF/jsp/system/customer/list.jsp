<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/customer/list.js"></script>
	<div class="m-b-md">
		<form class="form-inline" role="form" id="searchForm"
			name="searchForm">
			<div class="form-group">
				<label class="control-label"> <span
					class="h6 font-thin v-middle">客户名:</span></label> <input
					class="input-medium ui-autocomplete-input" placeholder="请输入客户姓名" id=""
					name="customerFormMap.name">

				<label class="control-label"> <span
					class="h6 font-thin v-middle">所属业务员:</span></label> <input
					class="input-medium ui-autocomplete-input" placeholder="请输入业务员姓名" id=""
					name="customerFormMap.salesman">

				<label class="control-label"> <span
					class="h6 font-thin v-middle">创建时间:</span></label>
				<input class="Wdate" name="customerFormMap.begin" placeholder="起始时间" type="text" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">~
				<input class="Wdate" name="customerFormMap.end" placeholder="结束时间" type="text" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
			</div>
			<a href="javascript:void(0)" class="btn btn-default" id="search">查询</a>
		</form>
	</div>
	<header class="panel-heading">
	<div class="doc-buttons">
		<c:forEach items="${res}" var="key">
			${key.description}
		</c:forEach>
	</div>
	</header>
	<div class="table-responsive">
		<div id="paging" class="pagclass"></div>
	</div>

	<div class="table-responsive">
		<div id="paging2" class="pagclass"></div>
	</div>
