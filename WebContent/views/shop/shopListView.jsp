<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/coinheader.jsp"%>
<%@page import="product.model.vo.*, java.util.*,common.PageInfo"%>
<%
	ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	ArrayList<Product> rankList = (ArrayList<Product>) request.getAttribute("rankList");

	String str = request.getParameter("cid");
	int cid = Integer.parseInt(str);

	String sort = request.getParameter("sort");

	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>shopListView</title>
<link href="<%=request.getContextPath()%>/css/shop/shopListView.css?ver=1" rel="stylesheet">
</head>
<body>

	<div id="Index" class="flex column">
		<!-- 상세 페이지 전체 감싸는 div -->
		<!-- 소분류 카테고리 -->
		<nav id="shopCategory" class="flex">
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
		<div id="best_item" class=" flex column">
			<span id="rank"><b>RANKING</b></span>
			<ul class="flex">
				<%
					int count = 0;
					for (Product p : rankList) {
						count++;
						if (count > 5)
							break;
				%>
				<li>
					<div class="item_border flex">
						<div class="item flex column">
							<div class="item_top">
								<a href="<%=request.getContextPath()%>/views/shop/shopDetailView.jsp"> <img alt="" src="<%=request.getContextPath()%>/img/shopImg/다운로드.jpg">
								</a>
							</div>
							<div class="item_bottom">
								<span class="pointer"><b>[<%=p.getBrand()%>]
								</b></span><br> <span class="pointer"><%=p.getpName()%></span><br> <br> <span class="pointer"><%=p.getPrice()%></span>
							</div>
						</div>
					</div>
				</li>
				<%
					System.out.println(count);
					}
				%>
			</ul>
		</div>
		<div id="content" class="flex column">
			<div id="search_bar_top">
				<span>Total: <b><%=listCount%></b> items
				</span>
				<ul class="flex" id="sortBy">
					<li>품절포함&nbsp;<input type="checkbox" id="stock"></li>
					<li id="regdate" class="pointer">신상품순</li>
					<li id="sellCount" class="pointer">판매순</li>
					<li id="lowPrice" class="pointer">낮은가격</li>
					<li id="highPrice" class="pointer">높은가격</li>
					<li id="pName" class="pointer">상품명</li>
				</ul>
				<script>
						$('#sortBy li').on('click', function(e){
							var sort = e.target.id;
							location.href="<%=request.getContextPath()%>/shopList.do?cid=<%=cid%>&sort="+sort;
						});
					</script>
			</div>
			<hr>
			<div id="search_bar_bottom" class="flex">
				<input type="text" placeholder="s e a r c h">
				<select id="selectBox">
					<option value="8">8개씩 정렬</option>
					<option value="12">12개씩 정렬</option>
					<option value="16">16개씩 정렬</option>
				</select>
			</div>
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
								<img alt="" src="<%=request.getContextPath()%>/img/shopImg/다운로드.jpg" class="pointer">
							</div>
							<div class="item_bottom">
								<input type="hidden" id="pId" name="pId" value="<%=p.getpId()%>"> 
								<span class="pointer"><b>[<%=p.getBrand()%>]</b></span><br> 
								<span class="pointer"><%=p.getpName()%></span><br>
								<br> <span><%=p.getPrice()%></span>
							</div>
						</div>
					</div>
				</li>
				<%
					}
				%>
			</ul>
			<script>
				$('.item .pointer').on('click', function(e){
					var pId = $(this).parents('.item').children().children('input').val();
					location.href="<%=request.getContextPath()%>/shopDetail.do?pId="+pId;
				});
			</script>
		</div>
		<div id="paging" class="flex">
			<%
				if (!list.isEmpty()) {
			%>
			<p>
				<a href="<%=request.getContextPath()%>/shopList.do?cid=<%=cid%>&currentPage=1&sort=<%=sort%>">&lt;&lt;</a>
			</p>
			<p id="bfBtn">
				<a href="<%=request.getContextPath()%>/shopList.do?cid=<%=cid%>&currentPage=<%=currentPage - 1%>&sort=<%=sort%>">&lt;</a>
			</p>
			<script>
				if (<%=currentPage%> <= 1) {
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
				<li><a href="<%=request.getContextPath()%>/shopList.do?cid=<%=cid%>&currentPage=<%=i%>&sort=<%=sort%>" class="other"><%=i%></a></li>
			</ol>
			<%
				}
					}
			%>
			<p id="afBtn">
				<a href="<%=request.getContextPath()%>/shopList.do?cid=<%=cid%>&currentPage=<%=currentPage + 1%>&sort=<%=sort%>">&gt;</a>
			</p>
			<script>
				if (<%=currentPage%> >= <%=maxPage%> ) {
					$('#afBtn').css('display', 'none');
				}
			</script>
			<p>
				<a href="<%=request.getContextPath()%>/shopList.do?cid=<%=cid%>&currentPage=<%=maxPage%>&sort=<%=sort%>">&gt;&gt;</a>
			</p>
			<%
				}
			%>
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
		$(function(){
			var str = "<%=sort%>";
			var str2 = "stock";
			if (str == str2) {
				$('#stock').prop('checked', true);
			}
		});
	</script>

	<%@ include file="/views/common/coinfooter.jsp"%>
</body>
</html>