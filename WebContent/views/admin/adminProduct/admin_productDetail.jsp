<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, product.model.vo.Product"%>
<%@ include file="/views/common/coinheader.jsp"%>
<%
	Product p = (Product)request.getAttribute("product");
	String alert = (String) request.getAttribute("alert");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<link rel="stylesheet" href='<%=request.getContextPath()%>/css/admin/admin.css'>
</head>
<body>
	<%
		if (loginUser.getGrade().equals("관리자")) {
	%>
	<div class="emptyHeader"></div>
	<div class="content">
		<%-- 검색 영역 --%>
			
		<div class="emptyHeader"></div>
		<%-- 상품정보조회 --%>
		<table class="resultList" style="color: white; width:40vw;">
			<tr>
				<th>상품 명</th>
				<td>
					<input id="pId" type="hidden" name="pId" value="<%=p.getpId()%>">
					<input class="center" id="pName" type="text" name="pName" value="<%=p.getpName()%>">
				</td>
			</tr>
			<tr>
				<th>브랜드</th>
				<td>
					<select id="brand" name="brandNo" class="pSelect">
						<option value="10">아이리버</option>
						<option value="20">브리츠</option>
						<option value="30">삼성전자</option>
						<option value="40">ABKO</option>
						<option value="50">APPLE</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
					<select name="categoryNo" class="pSelect category">
						<option value="10">스피커</option>
						<option value="20">헤드셋</option>
						<option value="30">헤드폰이어폰</option>
						<option value="40">블루투스사운드</option>
						<option value="50">마이크</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>세부카테고리</th>
				<td><select id="subCate" name="subCategoryNo" class="pSelect"><option>카테고리를 먼저 선택해주세요.</option></select></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input class="center" id="price" type="number" min="0" step="100" name="price" value="<%=p.getPrice()%>"></td>
			</tr>
			<tr>
				<th>재고</th>
				<td><input class="center" id="stock" type="number" min="0" name="stock" value="<%=p.getStock()%>"></td>
			</tr>
			<tr>
				<th>월 판매량</th>
				<td><%=p.getSellCount()%></td>
			</tr>
			<tr>
				<th>월 판매금액</th>
				<td><%=p.getSellCount() * p.getPrice()%></td>
			</tr>
			<tr>
				<th>상품 등록일</th>
				<td><input class="center" type="text" name="regDate" value="<%=p.getRegDate()%>" readonly></td>
			</tr>
			<tr><td colspan="2"><br><br><br><br></td></tr>
			<tr>
				<td><input id= "updateBtn" class="adminButton" type="button" value="삭제" onclick="delete();"></td>
				<td><input id= "updateBtn" class="adminButton" type="button" value="수정" onclick="update();"></td>
			</tr>
		</table>

		<script>
			var $select = $('.category');
			$select.change(function(){
				$.ajax({
					url: "<%=request.getContextPath()%>/product.getSubCategory",
					type : 'post',
					data : {select : $select.val()},
					success : function(data) {
						var $select = $('#subCate');
						$select.find('option').remove();
						for ( var i in data) {
							var $option = $('<option>');
							$option.val(data[i].subCategoryNo);
							$option.text(data[i].subCategory);
							$select.append($option);
						}
					}
				});
			});
			function update(){
				var $pId = $('#pId').val();
				console.log($pId);
				$.ajax({
					url: "<%=request.getContextPath()%>/product.update",
					type : 'post',
					data : {pId : $pId},
					success : function(data) {
						console.log(data);
						alert("수정되었습니다.");
						location.href.go('-1');
					}
				});
			}
		</script>
		<%
			} else { // !loginUser.equals("관리자");
		%>
		<script>
			alert("관리자 계정으로 로그인해주세요.");
		</script>
		<% } %>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/admin/adminProduct.js"></script>
</body>
</html>