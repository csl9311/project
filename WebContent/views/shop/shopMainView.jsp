<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="product.model.vo.*, java.util.*,common.PageInfo"%>
<%
	ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");

	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<%@ include file="/views/common/coinheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopMainView</title>
<link href="<%=request.getContextPath()%>/css/shop/shopMainView.css"
	rel="stylesheet">
</head>
<body>
	<!-- 
	
	해야할 것 : 마지막 페이지인데도 넘어가고 페이징 버튼이 사라지는거 수정하기

 -->
	<!-- 상세 페이지 전체 감싸는 div -->
	<div id="Index">
		<!-- 소분류 카테고리 -->
		<nav id="shopCategory">
			<ul id="sct_ul">
				<li>
					<div class="sct_btn">
						<a href="<%=request.getContextPath()%>/shopList.do?cid=10"><span>스피커</span></a>
					</div>
				</li>
				<li>
					<div class="sct_btn">
						<a href="<%=request.getContextPath()%>/shopList.do?cid=20"><span>헤드셋</span></a>
					</div>
				</li>
				<li>
					<div class="sct_btn">
						<a href="<%=request.getContextPath()%>/shopList.do?cid=30"><span>헤드폰 / 이어폰</span></a>
					</div>
				</li>
				<li>
					<div class="sct_btn">
						<a href="<%=request.getContextPath()%>/shopList.do?cid=40"><span>블루투스 사운드</span></a>
					</div>
				</li>
				<li>
					<div class="sct_btn">
						<a href="<%=request.getContextPath()%>/shopList.do?cid=50"><span>마이크</span></a>
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
							for (Product p : list) {
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
										<span class="pointer"><b>[<%=p.getBrand()%>]
										</b></span><br> <span class="pointer"><%=p.getpName()%></span><br>
										<br> <span class="pointer"><%=p.getPrice()%></span>
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
					<%
						if (!list.isEmpty()) {
					%>
					<p>
						<a href="<%=request.getContextPath()%>/shopMain.do?currentPage=1">&lt;&lt;</a>
					</p>
					<p id="bfBtn">
						<a
							href="<%=request.getContextPath()%>/shopMain.do?currentPage=<%=currentPage - 1%>">&lt;</a>
					</p>
					<script>
						if (
					<%=currentPage%>
						<= 1) {
							$('#bfBtn').css('display', 'none');
						}
					</script>
					<%
						for (int i = startPage; i <= endPage; i++) {
								if (i == currentPage) {
					%>
					<ol class="flex">
						<li><a href="#" class="this"><span><%=i%></span></a></li>
						<%
							} else {
						%>
						<li><a
							href="<%=request.getContextPath()%>/shopMain.do?currentPage=<%=i%>"
							class="other"><%=i%></a></li>
					</ol>
					<%
						}
							}
					%>
					<p id="afBtn">
						<a
							href="<%=request.getContextPath()%>/shopMain.do?currentPage=<%=currentPage + 1%>">&gt;</a>
					</p>
					<script>
						if (<%=currentPage%> >= <%=maxPage%>) {
							$('#afBtn').css('display', 'none');
						}
					</script>
					<p>
						<a
							href="<%=request.getContextPath()%>/shopMain.do?currentPage=<%=maxPage%>">&gt;&gt;</a>
					</p>
					<%
						}
					%>
				</div>


			</div>
		</div>
	</div>
	<script>
		
	</script>
	<%@ include file="/views/common/coinfooter.jsp"%>
</body>
</html>