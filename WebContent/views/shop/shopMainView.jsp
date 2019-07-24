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
			<div id="main_top" class="flex column">
				<!-- 광고나 탑3 걸 곳 -->
				<div id="main_top_1" class="flex">
					<div class="main_top_1_img">
						<a href=""><img alt=""
							src="<%=request.getContextPath()%>/img/shopImg/다운로드.jpg"></a>
					</div>
					<div class="main_top_1_img">
						<a href=""><img alt=""
							src="<%=request.getContextPath()%>/img/shopImg/다운로드.jpg"></a>
					</div>
					<div class="main_top_1_img">
						<a href=""><img alt=""
							src="<%=request.getContextPath()%>/img/shopImg/다운로드.jpg"></a>
					</div>
				</div>
				<!-- 유명 브랜드 -->
				<div id="main_top_2" class="flex">
					<div class="main_top_2_img">
						<a href=""><img alt=""
							src="<%=request.getContextPath()%>/img/shopImg/다운로드.jpg"></a>
					</div>
					<div class="main_top_2_img">
						<a href=""><img alt=""
							src="<%=request.getContextPath()%>/img/shopImg/다운로드.jpg"></a>
					</div>
					<div class="main_top_2_img">
						<a href=""><img alt=""
							src="<%=request.getContextPath()%>/img/shopImg/다운로드.jpg"></a>
					</div>
					<div class="main_top_2_img">
						<a href=""><img alt=""
							src="<%=request.getContextPath()%>/img/shopImg/다운로드.jpg"></a>
					</div>
					<div class="main_top_2_img">
						<a href=""><img alt=""
							src="<%=request.getContextPath()%>/img/shopImg/다운로드.jpg"></a>
					</div>
				</div>
			</div>
			<!-- 중간 -->

			<div id="main_middle">
				<!-- 신상품 -->
				<div id="new_item" class="flex column">
					<span class="mb_text"><b>NEW ARRIVAL</b></span>
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
										<span class="pointer"><b>[아스트로]</b></span><br> <span>아스트로
											A40+ MixAmp</span><br> <span class="pointer">169,000원</span>
									</div>

								</div>
							</div>
						</li>
						<%
							}
						%>
					</ul>
					</div>
					<!-- 베스트 상품 -->
					
					<div id="best_item" class=" flex column">
						<span class="mb_text"><b>RANKING</b></span>
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
											<span class="pointer"><b>[아스트로]</b></span><br> <span>아스트로
												A40+ MixAmp</span><br> <span class="pointer">169,000원</span>
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
			<div id="main_bottom" class="flex column">
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
					<input type="text" placeholder="s e a r c h"> <select>
						<option>20개씩 정렬</option>
						<option>40개씩 정렬</option>
						<option>60개씩 정렬</option>
					</select>
				</div>

				<div id="items">
					<ul class="flex">
						<%
							for (int i = 0; i < 8; i++) {
						%>
						<li>
							<div class="item_border flex">
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
			<p>
				<a href="#">&lt;&lt;</a>
			</p>
			<p>
				<a href="#">&lt;</a>
			</p>
			<ol class="flex">
				<li><a href="#" class="this"><span>1</span></a></li>

				<li><a href="#" class="other">2</a></li>
				<li><a href="#" class="other">3</a></li>
				<li><a href="#" class="other">3</a></li>
				<li><a href="#" class="other">4</a></li>
				<li><a href="#" class="other">5</a></li>
				<li><a href="#" class="other">6</a></li>
				<li><a href="#" class="other">7</a></li>
				<li><a href="#" class="other">8</a></li>

			</ol>
			<p>
				<a href="#">&gt;</a>
			</p>
			<p>
				<a href="#">&gt;&gt;</a>
			</p>
		</div>
				
			</div>
		</div>
	</div>
	<script>
		
	</script>
	<%@ include file="/views/common/coinfooter.jsp"%>
</body>
</html>