<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopMainView</title>
<%@ include file="/views/common/coinheader.jsp"%>
<link href="<%=request.getContextPath()%>/css/shop/shopMainView.css"
	rel="stylesheet">
</head>
<body>
	<!-- <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script> -->
	<!-- 상세 페이지 전체 감싸는 div -->
	<div id="Index">
		<!-- 소분류 카테고리 -->
		<nav id="shopCategory">
			<ul id="sct_ul">
				<li>
					<div class="sct_btn">
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
		<div id="content">
			<img src="<%=request.getContextPath()%>/img/shopImg/photo3.jpg"
				onclick="goDetail();" width="50%" height="50%" style="margin: auto">
		</div>
	</div>
	<script>
		function goDetail(){
			location.href="<%=request.getContextPath()%>/views/shop/shopDetailView.jsp"
		}
	</script>
	<%@ include file="/views/common/coinfooter.jsp"%>
</body>
</html>