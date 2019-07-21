<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, product.model.vo.Product"%>
<%
	ArrayList<Product> list = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
</head>
<body>
	<%-- 지점정보 받아와야함 --%>
	<div class="emptyHeader">헤더여백</div>
	<aside>
		<a href="">상품목록</a>
		<a href="">상품추가</a>
	</aside>
	
	<%-- 검색 영역 --%>
	<form class="search" action="<%=request.getContextPath()%>/searchMem.admin" method="get">
		<input type="search" name="search">
		<button type="submit">검색</button>
	</form>
	<%-- 상품정보조회 --%>
	<%
		if (list.isEmpty()) {
	%>
	<h3>등록된 상품정보가 없습니다.</h3>
	<%
		} else {
	%>
	<table>
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
		<%
			for (int i = 0; i < list.size(); i++) {
				Product p = list.get(i);
		%>
		<tr>
			<td><%=p.getName()%></td>
			<td><%=p.getBrand()%></td>
			<td><%=p.getCategory()%></td>
			<td><%=p.getPrice()%></td>
			<td><%=p.getStock()%></td>
			<td><%=p.getSellCount()%></td>
			<td><%=p.getSellCount() * p.getPrice()%></td>
			<td><%=p.getRegDate()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		}
	%>
	상품정보 수정, 상품 검색, 정렬 상품명 상품코드 카테고리 가격 재고
</body>
</html>