<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.model.vo.*, java.util.*, shop.model.vo.*" %>
    <%
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>	
</style>
<%@  include file="Form.jsp"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/mypage/cart.css">
</head>
<body>
<div id="index">
<div id="mypage">
	
<div><!-- 상품목록 -->
	<p>장바구니</p>
	<table class="tab-1">
		<tr >
			<td width="100px">전체선택&nbsp;<input type="checkbox"></td>
			<td>이미지</td>
			<td colspan="3">상품정보</td>
			<td width="50px">수량</td>
			<td>상품 금액</td>			
			<td>배송비</td>
			<td>합계</td>
			<td>선택</td>
		</tr>
		<tr>
			<td><input type="checkbox">
			<td></td>
			<td colspan="3">z</td>
			<td><input type="Number" min="1" id="quantity"></td>
			<td>10000원</td>			
			<td>3000원</td>
			<td>9900원</td>
			<td><br>
				<button class="cartBtn">주문하기</button><br>
				<button class="cartBtn">삭제</button>
			</td>
		</tr>
		<tr>
		<td colspan="5" style="text-align:left">ㅋㅋㅋ</td>
		<td colspan="5">상품구매가격</td>
		</tr>	
	</table>
	</div>
	<!-- 상품목록 끝 -->
	<br>
	<br><br>
	<div>
	<!-- 금액  -->
	<table class="tab-2">
	<tr>
	<td>총 상품금액
	</td>
	<td>총 배송비
	</td>
	<td>결제예정금액
	</td>
	</tr>
	<tr>
	<td class="pay1">10000원</td>
	<td class="pay1">3000원</td>
	<td class="pay1">13000원	</td>	
	</tr>
	</table>
	<!-- 금액 끝 -->
	<br>
	<button onclick="allpayment()">전체상품주문</button>&nbsp;&nbsp;<button onclick="selectpayment()">선택상품주문</button>
	<script>
	function allpayment(){
		location.href="<%= request.getContextPath()%>/views/MyPage/payment.jsp";
	}
	function selectpaymnet(){
		location.href="<%= request.getContextPath()%>/views/MyPage/payment.jsp";
	}
	
	</script>
	</div>
	<div>
	<br>
	<br>
	장바구니 이용안내
<p>해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.</p>
<p>해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다.</p>
<p>장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.</p>
<p>무이자할부 이용안내</p>
<p>상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</p>
<p>[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.</p>
<p>단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</p>
	</div>


</div>
</div>
</body>
<%@ include file="/views/common/coinfooter.jsp"%>
</html>