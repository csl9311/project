<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, product.model.vo.Product"%>
<%@ include file="/views/common/coinheader.jsp"%>
<%
	ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<link rel="stylesheet" href='<%=request.getContextPath()%>/css/admin/admin.css'>
</head>
<body>
	<div class="emptyHeader"></div>
	<div class="content">
		<%-- 검색 영역 --%>
		<form class="search" action="<%=request.getContextPath()%>/searchProduct.admin" method="get">
			<input type="search" name="search">
			<button type="submit">검색</button>
		</form>
		<div class="emptyHeader"></div>
		<%-- 상품정보조회 --%>
		<%if (list == null) {%>
			<h3>등록된 상품정보가 없습니다.</h3>
		<%} else {%>
			<table class="resultList">
				<tr>
					<th>상품 명</th>
					<th>브랜드</th>
					<th>품목</th>
					<th>가격</th>
					<th>재고</th>
					<th>월 판매량</th>
					<th>월 판매금액</th>
					<th>상품 등록일</th>
				</tr>
			</table>
			<%
				for (int i = 0; i < list.size(); i++) {
						Product p = list.get(i);
			%>
			<form action="" method="get">
				<table class="resultList">
					<tr>
						<td><%=p.getBrand()%></td>
						<td><%=p.getCategory()%></td>
						<td><%=p.getPrice()%></td>
						<td><%=p.getStock()%></td>
						<td><%=p.getSellCount()%></td>
						<td><%=p.getSellCount() * p.getPrice()%></td>
						<td><%=p.getRegDate()%></td>
					</tr>
				</table>
			</form>
			<%
				}
			}
		%>
	</div>
</body>
</html>