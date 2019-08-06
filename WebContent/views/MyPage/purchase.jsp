<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.Location, payment.model.vo.*, shop.model.vo.*, java.util.ArrayList"%>
<%
	
	ArrayList<Payment> pList = (ArrayList<Payment>)request.getAttribute("pList");
	ArrayList<PAttachment> picList = (ArrayList<PAttachment>)request.getAttribute("picList");
	System.out.println(pList.size());
	System.out.println(picList.size());
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="Form.jsp"%>
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/mypage/cart.css">
<style>
.nav {
	margin: auto;
	width: 80%;
	font-size: 20px;
}

.p {
	font-size: small;
}
#empty{
	height: 30vh;
}
#index{
	min-height : 70vh;
}
</style>
</head>
<body>
	<div id="index">
		<div id="mypage">
			<div>
				<ul class="nav nav-pills">
					<li class="nav-item"><a class="nav-link active"
						href="purchase.jsp">구매내역</a></li>
					<li class="nav-item"><a class="nav-link" href="purchase2.jsp">반품,교환내역</a>
					</li>
				</ul>
			</div>
			<div id="pay-div1">
				<p class="p">주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</p>
				<p class="p">정상적으로 결제후 주문취소 및 반품/교환의 경우 게시글로 문의를 남겨주셔야 처리가능합니다.</p>
				<p class="p">위 사항 관련하여, 게시판 문의없이 요청하신 경우 교환/반품처리지연, 출고된 이 후에
					발생되는 배송비는 고객님 부담이오니 교환/반품 접수시에 유의하시기 바랍니다.</p>
				<br> <br>
				<table class="tab-1">
					<tr>
						<td>주문번호</td>
						<td>상품</td>
						<td colspan="3">상품정보</td>
						<td width="50px">수량</td>
						<td>상품 금액</td>
						<td>주문처리상태</td>
						<td>상품평등록</td>
					</tr>
						<% for(Payment p : pList) { 
							int i = 0;
						%>
							
					<tr>
						<td><%=p.getoNo() %></td>
						<% for(PAttachment pic : picList) {
							if(pic.getpId() == p.getpId()){ %>
							<td><img src="<%=pic.getFilePAth()%>"></td>
						<% }}%>
						<td colspan="3"><%=p.getpName()%>
						<p id="prdInfo<%=i%>"></p>
						<% if(p.getpOption() != null) {%>
							<script>
							$('#prdInfo'+<%=i%>).text(<%=p.getpOption()%>);
							</script>
						</td>	
						<%} %>
						<td><%=p.getAmount()%></td>
						<td><%=p.getAmount()%>*<%=p.getPrice()%></td>
						<td></td>
						<td><button onclick="review();">상품평 등록</button></td>
					</tr>
							
					<% i++; }%>
				</table>
			</div>
		</div>
	</div>
	<script>
	function review(){
		window.open("<%=request.getContextPath()%>/views/shop/shopReviewInsertView.jsp","상품평 입력창","width=600px, height=680px, left=500, top=50, toolbar=0, resizable=0, status=0, menubar=0, scrollbars=0");
	}
	</script>
	

</body>
<%@ include file="/views/common/coinfooter.jsp"%>
</html>

