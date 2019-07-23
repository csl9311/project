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
</head>
<body>
	<!-- 상세 페이지 전체 감싸는 div -->
	<div id="Index" class="flex column">
		<!-- 소분류 카테고리 -->
		<nav id="shopCategory" class="flex">
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
		<div id="best_item" class=" flex column">
			<span id="rank"><b>RANKING</b></span>
			<ul class="flex">
				<%
					for (int i = 0; i < 5; i++) {
				%>
				<li>
					<div class="item_border flex">
						<!-- <input type="checkbox" name="checkBox" class="pointer"> -->
						<div class="item flex column">
							<div class="item_top">
								<a
									href="<%=request.getContextPath()%>/views/shop/shopDetailView.jsp">
									<img alt=""
									src="<%=request.getContextPath()%>/img/shopImg/다운로드.jpg">
								</a>
							</div>
							<div class="item_bottom">
								<span class="pointer"><b>[아스트로]</b></span><br>
								<span>아스트로 A40+ MixAmp</span><br>
								<span class="pointer">169,000원</span>
							</div>

						</div>
					</div>
				</li>
				<%
					}
				%>
			</ul>
		</div>
		<div id="content" class="flex column">
			<div id="search_bar_top">
				<span>Total: <b> 8390</b> items
				</span>
				<ul class="flex" id="range">
					<li>품절포함&nbsp;<input type="checkbox"></li>
					<li>신상품순</li>
					<li>클릭많은순</li>
					<li>낮은가격</li>
					<li>높은가격</li>
					<li>상품명</li>
				</ul>
			</div>
				<hr>
			<div id="search_bar_bottom" class="flex">
				<input type="text" placeholder="s e a r c h"> 
				<select>
					<option>10개씩 정렬</option>
					<option>20개씩 정렬</option>
					<option>50개씩 정렬</option>
				</select>
			</div>
		</div>
		<div id="items">
			<ul class="flex">
				<%
					for (int i = 0; i < 8; i++) {
				%>
				<li>
					<div class="item_border flex">
						<input type="checkbox" name="checkBox" class="pointer">
						<div class="item flex column">
							<div class="item_top">
								<a
									href="<%=request.getContextPath()%>/views/shop/shopDetailView.jsp">
									<img alt=""
									src="<%=request.getContextPath()%>/img/shopImg/다운로드.jpg">
								</a>
							</div>
							<div class="item_bottom">
								<span class="pointer"><b>[아스트로]</b></span><br> <span
									class="pointer">아스트로 A40+ MixAmp</span><br> <br> <span
									class="pointer">169,000원</span>
							</div>

						</div>
					</div>
				</li>
				<%
					}
				%>
			</ul>
		</div>
		<div id="paging" class="flex">
			<p><a href="#">&lt;&lt;</a></p>
			<p><a href="#">&lt;</a></p>
			<ol class="flex">
			<li>
			<a href="#" class="this"><span>1</span></a>
			</li>
			
			<li>
			<a href="#" class="other">2</a>
			</li>
			<li>
			<a href="#" class="other">3</a>
			</li>
			<li>
			<a href="#" class="other">3</a>
			</li>
			<li>
			<a href="#" class="other">4</a>
			</li>
			<li>
			<a href="#" class="other">5</a>
			</li>
			<li>
			<a href="#" class="other">6</a>
			</li>
			<li>
			<a href="#" class="other">7</a>
			</li>
			<li>
			<a href="#" class="other">8</a>
			</li>
			
			</ol>
			<p><a href="#">&gt;</a></p>
			<p><a href="#">&gt;&gt;</a></p>
		</div>
	</div>
	<script>
		var windowWidth = $(window).width();
		function cssResize() {
			/* if (windowWidth >= 1800) {
				$('#items li').css('width', '22.9%').css('margin-left','2%');
			} else if (windowWidth >= 1100) {
				$('#items li').css('width', '').css('margin-left','');
			} else {
				$('#items li').css('width', '45%').css('margin-left','4.9%');
			} */
		}
		$(function() {
			cssResize();
		});
		$(window).resize(function() {
			windowWidth = $(window).width();
			cssResize();
		});

	</script>
	<%@ include file="/views/common/coinfooter.jsp"%>
</body>
</html>