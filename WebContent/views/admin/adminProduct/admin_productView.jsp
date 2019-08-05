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
		<form class="search center" action="<%=request.getContextPath()%>/searchProduct.admin" method="get">
			<input type="search" name="search">
			<button type="submit">검색</button>
		</form>
		<div class="emptyHeader"></div>
		<div id="productUpdate" class="center none">
			<form action="" method="post">
				<table>
					<tr>
						<td ><label>상품명</label></td>
						<td colspan="3" style="width: 300px;"><input name="name" type="text"></td>
					</tr>
					<tr>
						<td><label>브랜드</label></td>
						<td colspan="3"><input name="brand" type="text"></td>
					</tr>
					<tr>
						<td><label>카테고리</label></td>
						<td colspan="3"><input name="category" type="text"></td>
					</tr>
					<tr>
						<td><label>세부카테고리</label></td>
						<td colspan="3"><input name="subCate" type="text"></td>
					</tr>
					<tr>
						<td><label>가격</label></td>
						<td colspan="3"><input name="price" type="text"></td>
					</tr>
					<tr>
						<td><label>재고</label></td>
						<td colspan="3"><input name="stock" type="text"></td>
					</tr>
					<tr>
						<td><label>옵션</label></td>
						<td>
							<input name="option" id="optionCheckY" type="radio" value="Y" style="width:15px; height:15px; background:white;">
							<label>있음</label>
						</td>
						<td>
							<input name="option" id="optionCheckN" type="radio" value="N" style="width:15px; height:15px; background:white;">
							<label>없음</label>
						</td>
					</tr>
					<tr class="option1 none">
						<td class="option1Detail"><label>옵션1</label></td>
						<td class="option1Detail"><input name="option1" type="text"></td>
						<td class="option1Detail"><input id="addOption1" class="adminButton" type="button" value="옵션 추가"></td>
						<td class="option1Detail"><input id="delOption1" class="adminButton" type="button" value="옵션 삭제"></td>
					</tr>
					
					<tr class="option2 none">
						<td class="option2Detail"><label>옵션2</label></td>
						<td class="option2Detail"><input name="option2" type="text"></td>
						<td class="option2Detail"><input id="addOption2" class="adminButton" type="button" value="옵션 추가"></td>
						<td class="option2Detail"><input id="delOption2" class="adminButton" type="button" value="옵션 삭제"></td>
					</tr>
				</table>
				<input class="adminButton" style="margin:10px;"type="submit" value="등록">
			</form>
		</div>
		<script>
			$('#optionCheckY').click(function(){
				$('#optionCheckY').css('background', 'black');
				$('#optionCheckN').css('background', 'white');
				$('.option1').css('display', 'table-row');
				$('.option1Detail').css('display', 'table-cell');
			});
			$('#optionCheckN').click(function(){
				$('#optionCheckN').css('background', 'black');
				$('#optionCheckY').css('background', 'white');
				$('.option1').css('display', 'none');
				$('.option1Detail').css('display', 'table-cell');
			});
			
			$('#addOption1').click(function(){
				$('.option2').css('display', 'table-row');
				$('.option2Detail').css('display', 'table-cell');
			});
			$('#delOption1').click(function(){
				$('.option1').css('display', 'none');
				$('#optionCheckN').css('background', 'black');
				$('#optionCheckY').css('background', 'white');
			});
		</script>
		<div class="center">
			<button class="center adminButton" id="areaActive_productUpdate">상품  추가</button>
		</div>
		
		<div class="emptyHeader"></div>
		<%-- 상품정보조회 --%>
		<%if (list == null) {%>
			<h3>등록된 상품정보가 없습니다.</h3>
		<%} else {%>
			<table class="resultList" style="color: white; width:90vw;">
				<tr>
					<th>상품 명</th>
					<th>브랜드</th>
					<th>카테고리</th>
					<th>세부카테고리</th>
					<th>가격</th>
					<th>재고</th>
					<th>월 판매량</th>
					<th>월 판매금액</th>
					<th>상품 등록일</th>
					<th>수정</th>
				</tr>
			</table>
			<%
				for (int i = 0; i < list.size(); i++) {
					Product p = list.get(i);
			%>
			<form action="" method="get">
				<table class="resultList" style="color: white; width:90vw;">
					<tr>
						<td>
							<input type="hidden" name="cid" value="<%=p.getpId()%>">
							<%=p.getpName() %>
						</td>
						<td><%=p.getBrand()%></td>
						<td><%=p.getCategory()%></td>
						<td><%=p.getSubCategory()%></td>
						<td><%=p.getPrice()%></td>
						<td><%=p.getStock()%></td>
						<td><%=p.getSellCount()%></td>
						<td><%=p.getSellCount() * p.getPrice()%></td>
						<td><%=p.getRegDate()%></td>
						<td style="padding-bottom: 10px;">
							<input class="adminButton" type="submit" value="수정">
						</td>
					</tr>
				</table>
			</form>
			<%
				}
			}
		%>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/admin/admin.js"></script>
</body>
</html>