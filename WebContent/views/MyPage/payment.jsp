<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="product.model.vo.*, member.model.vo.*, java.util.*, shop.model.vo.*"%>
<%@ include file="Form.jsp"%>	
<%
	ArrayList<Payment> pay = (ArrayList<Payment>) request.getAttribute("pay");
	String phone = request.getParameter("phone");
	String name = request.getParameter("name"); 
	int point = Integer.parseInt(request.getParameter("point"));
	String email= request.getParameter("email");
	if(email==null){
	  email="-";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<style>
.payadr {
	width: 30vw;
}

.payphone {
	width: 5vw;
}

.delrequest {
	width: 30vw;
}
</style>
</head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/mypage/cart.css">
<body>
    <div id="Index">
	<div id="mypage">
		<!-- 상품목록 -->
		<div style="text-align:left">
		<table class="tab-1">
					<tr>
						<td>이미지</td>
						<td>상품정보</td>
						<td>옵션</td>
						<td width="50px">수량</td>
						<td>상품 금액</td>
						<td>합계</td>
					</tr>
					<%
						for (int i = 0; i < pay.size(); i++) {
							Payment p = pay.get(i);
							if (!p.getpOption().equals("없음")) {
								String[] arr = p.getpOption().split(",");
								for (int j = 0; j < arr.length / 2; j++) {
									if (j % 2 == 0) {
					%>					
					<tr>
						<td>이미지</td>
						<td><%=p.getpName()%></td>
						<%
							for (int k = 0; k < arr.length; k++) {
												if (k % 2 == 0) {
						%>
						<td><%=arr[k]%></td>
						<td><%=arr[k + 1]%></td>
						<td><%=p.getPrice()%></td>
						<td><%=p.getPrice() * p.getAmount()%></td>
						<%
							break;
												}
											}
						%>
					</tr>

					<%
						}%>
					
					<%}
							} else {
					%>
					<tr>
						<td>이미지</td>
						<td><%=p.getpName()%></td>						
						<td><%=p.getpOption()%></td>
						<td><%=p.getAmount()%></td>
						<td><%=p.getPrice()%></td>
						<td><%=p.getPrice() * p.getAmount()%></td>
					</tr>
					<%
						}
						}
					%> 
				</table>목록 -->

		<br> <br>
		<!-- 주문자 정보 -->
		<div id="pay-div1">
			<br>
			<p>주문 정보</p>
			<table class="pay-tab">
				<tr>
					<td>주문하시는 분&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text" id="name" style="width: 10vw" value="<%=name%>"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text">&nbsp;&nbsp;&nbsp;
				</tr>
				<tr>
					<td></td>
					<td><input type="text" class="payadr"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="text" class="payadr"></td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td><input type="text" name="phone" id="phone" value="<%=phone %>"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" id="email" value="<%=email %>">
				</tr>
			</table>
			

			<!-- 주문자정보 끝 -->
			<br> <br>
			<!-- 배송지 정보 -->
			<p>배송지 정보</p>
			<table class="pay-tab">
				<tr>
					<td>배송지 선택</td>
					<td><input type="button" value="주문자 정보와 동일" onclick="copy();">&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td>받는사람&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text" name="name2" id="name2" style="width: 10vw" value=""></td>					
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text">&nbsp;&nbsp;&nbsp;
						<button>주소 찾기</button></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="text" class="payadr"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="text" class="payadr"></td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td><input type="text" name="phone2" id="phone2" value=""></td>
				</tr>
				
				<tr>
					<td>배송시 요청사항</td>
					<td><input type="text" class="delrequest"> <br>
					<label>ex)경비실에 맡겨주세요</label></td>
				</tr>
			</table>
			<!-- 배송지정보 끝 -->
		</div>

		<div id="pay-div1">
			<br>
			<!-- 할인,포인트 -->
			<p>할인 및 포인트</p>
			<table>
				<tr>
					<td>포인트 사용</td>
					<td><input type="text" id="po" value="">원</td>
					<td><input type="button" onclick="all();" value="전액사용"></td>
					<td>(보유 포인트 : <%=point %> 포인트)</td>
				</tr>
			</table>
			<!-- 할인 및 포인트 끝 -->
		</div>
		<div id="pay-div1">
			<!-- 결제정보 -->
			<br> <br>
			<p>결제 정보</p>
			<table class="pay-tab">
				<tr>
					<td>총 주문 금액</td>
					<td>총 할인 + 부가결제 금액</td>
					<td>총 결제예정 금액</td>
				</tr>
				<tr>
					<td>원</td>
					<td>-원</td>
					<td>=원</td>
				</tr>
				<tr>
					<td colspan="3">총 할인금액 0원</td>
				</tr>
				<tr>
					<td colspan="3">총 부가결제금액 0원</td>
				</tr>
			</table>
			<button id="payment">결제하기</button>
		</div>
		<!-- 결제정보끝 -->
		</div>
	</div>
	</div>
	
	<script>
	function copy(){
		$('#name2').attr('value', <%=name%>)
		$('#phone2').attr('value', <%=phone%>)		
	}
	function all(){
		$('#po').attr('value', <%=point%>)
	}
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp03747157');
	
	$('#payment').click(function(){
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : 'ABKO 헤드셋',
	    amount : 500,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456',
	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        
	        
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
	});
	
	
	</script>
</body>
</html>
<%@ include file="/views/common/coinfooter.jsp"%>