<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/customer/listAll.js"></script>
	<div class="m-b-md">
		<form class="form-inline" role="form" id="searchForm"
			name="searchForm">
			<div class="form-group">
				<label class="control-label"> <span
					class="h6 font-thin v-middle">客户名:</span></label> <input
					class="input-medium ui-autocomplete-input" placeholder="请输入客户姓名" id=""
					name="customerLoanFormMap.name">

				<label class="control-label"> <span
					class="h6 font-thin v-middle">所属业务员:</span></label>
					<select name="customerLoanFormMap.salesman">
						<option value="">全部</option>
						<c:forEach items="${lowerUser }" var="item">
							<option>${item.accountName }</option>
						</c:forEach>
					</select>

				<label class="control-label"> <span
					class="h6 font-thin v-middle">借款区域:</span></label> <input
					class="input-medium ui-autocomplete-input" placeholder="请输入区域" id=""
					name="customerLoanFormMap.applyloanJkQy">

				<label class="control-label"> <span
					class="h6 font-thin v-middle">借款金额:</span></label>
					<select name="customerLoanFormMap.applyloanJkje">
						<option selected="selected" value="0">全部</option>
						<option value="1">10000以下</option>
						<option value="2">10000-50000</option>
						<option value="3">50000-100000</option>
						<option value="4">100000以上</option>
					</select>
				<br/><br/>
				<label class="control-label"> <span
					class="h6 font-thin v-middle">创建时间:</span></label>
				<input class="Wdate" name="customerLoanFormMap.begin" placeholder="起始时间" type="text" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">~
				<input class="Wdate" name="customerLoanFormMap.end" placeholder="结束时间" type="text" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
			</div>

		</form>
	</div>
	<header class="panel-heading">
	<div class="doc-buttons">
	<a href="javascript:void(0)" class="btn btn-default" id="search">查询</a>
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
