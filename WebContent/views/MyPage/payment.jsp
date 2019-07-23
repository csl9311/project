<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<%@ include file="Form.jsp"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/mypage/cart.css">
<body>

<div>
<section>
<div id="mypage">
	<table class="tab-1">
		<tr>
			<td>상품</td>
			<td colspan="3">상품정보</td>
			<td width="50px">수량</td>
			<td>상품 금액</td>			
			<td>배송비</td>
			<td>합계</td>
		</tr>
		<tr>
			<td><img></td>
			<td colspan="3">zz</td>
			<td>1</td>
			<td>10000원</td>	
			<td>3000원</td>
			<td>9900원</td>
			</tr>
	</table>
	<br>
	<p>주문자 정보 입력</p>
	<table>
	<tr>
	<td>주문자정보</td>
	<td></td>
	</tr>
	<tr>
	<td>주소</td>
	<td><input type="text">&nbsp;<button>주소 찾기</button></td>
	</tr>
	
	</table>
	</div>



</section>
</div>

</body>
<%@ include file="/views/common/coinfooter.jsp"%>
</html>