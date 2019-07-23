<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopListView</title>
<%@ include file="/views/common/coinheader.jsp"%>
<link
	href="<%=request.getContextPath()%>/css/shop/shopListView.css?ver=1"
	rel="stylesheet">
	<script>
	var windowWidth = $(window).width();
	function cssResize() {
		if(windowWidth >= 1800) {
			$('#items li').css('width','23%'); 
		} else if(windowWidth >= 1100){
			$('#items li').css('width','');
		} else {
			$('#items li').css('width','45%');
		}
	}
	$(function() {
		cssResize();
	});
	$(window).resize(function() {
		windowWidth = $(window).width();
		cssResize();
	});
/* 	$('.item_top').hover(function(){
		$('.icons').css('display', 'block');
	}); */
	</script>
</head>
<body>
	<!-- 상세 페이지 전체 감싸는 div -->
	<div id="Index" class="flex column">
		<!-- 소분류 카테고리 -->
		<nav id="shopCategory" class="flex">
			<ul id="sct_ul">
				<li>
					<div class="sct_btn pointer">
						<a
							href="<%=request.getContextPath()%>/views/shop/shopListView.jsp"><span>CATEGORY1</span></a>
					</div>
				</li>
				<li>
					<div class="sct_btn">
						<a
							href="<%=request.getContextPath()%>/views/shop/shopListView.jsp"><span>CATEGORY2</span></a>
					</div>
				</li>
				<li>
					<div class="sct_btn">
						<a
							href="<%=request.getContextPath()%>/views/shop/shopListView.jsp"><span>CATEGORY3</span></a>
					</div>
				</li>
				<li>
					<div class="sct_btn">
						<a
							href="<%=request.getContextPath()%>/views/shop/shopListView.jsp"><span>CATEGORY4</span></a>
					</div>
				</li>
				<li>
					<div class="sct_btn">
						<a
							href="<%=request.getContextPath()%>/views/shop/shopListView.jsp"><span>CATEGORY5</span></a>
					</div>
				</li>
			</ul>
		</nav>
		<!-- 상단 nav 제외 전체 감싸는 div -->
		<div id="best_item">
			베스트 아이템 걸릴 부분
		</div>
		<div id="content" class="flex">
			<div id="items">
				<ul class="flex ">
					<%
						for (int i = 0; i < 50; i++) {
					%>
					<li>
						<div class="item_border flex">
								<input type="checkbox" name="checkBox" class="pointer">
							<div class="item flex column">
								<div class="item_top">
									<a
										href="<%=request.getContextPath()%>/views/shop/shopDetailView.jsp">
										<img class="pointer" alt=""
										src="<%=request.getContextPath()%>/img/shopImg/다운로드.jpg">
									</a>
									<div class="icons">
									</div>
								</div>
								<div class="item_bottom">
									<span class="pointer">커세어 K70 RGB MK.2 게이밍 기계식 키보드</span><br> <span
										class="pointer">219,000원</span>
								</div>
							</div>
						</div>
					</li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</div>
	<%@ include file="/views/common/coinfooter.jsp"%>
</body>
</html>