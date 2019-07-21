<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopListView</title>
<%@ include file="/views/common/coinheader.jsp"%>
<link href="<%=request.getContextPath()%>/css/shop/shopListView.css"
	rel="stylesheet">
</head>
<body>
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
			<p>카테고리 별 리스트 뷰</p>
			<div id="items">
				<ul>
				<% for(int i = 0; i < 50; i++){ %>
					<li>
						<div>
							<a href="<%=request.getContextPath()%>/views/shop/shopDetailView.jsp">
								<img alt="" src="<%=request.getContextPath()%>/img/shopImg/다운로드.jpg">
							</a>
						</div>
					</li>
					<%} %>
				</ul>
			</div>
		</div>
	</div>
	<%@ include file="/views/common/coinfooter.jsp"%>
</body>
</html>