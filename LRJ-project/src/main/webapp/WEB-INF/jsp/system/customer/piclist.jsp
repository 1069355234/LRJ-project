<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
</script>

<script type="text/javascript">
function exportAll(applyloanKey){
	window.location.href = "${pageContext.request.contextPath}/customer/exportAll.shtml?applyloanKey="+applyloanKey;
}
</script>

<div class="doc-buttons" style="text-align: right;">
	<c:if test="${customerPics.size() != 0 }">
		<button class="btn btn-primary marR10" type="button" onclick="exportAll('${applyloanKey}')">全部导出</button>
	</c:if>
</div>
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
						${item.key }
					</div>
				</div>
			</c:if>
			<c:if test="${j.index != 0 }">
				<div class="image" style="display:none;">
					<a rel="gallery${i.index }" title="${pic.filename }" href="${pageContext.request.contextPath}${pic.filepath}"><img
						src="${pageContext.request.contextPath}${pic.filepath}" width="148px;" height="140px;"></a>
					<div class="caption">
						${item.key }
					</div>
				</div>
			</c:if>
		</c:forEach>
	</c:forEach>

</div>