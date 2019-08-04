<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="Form.jsp"%>
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
				<td>상품</td>
				<td colspan="3">상품정보ㅋㅋ</td>
				<td width="50px">수량</td>
				<td>상품 금액</td>
				<td>배송비</td>
				<td>합계</td>
			</tr>
			<tr>
				<td><img></td>
				<td colspan="3">z</td>
				<td>1</td>
				<td>10000원</td>
				<td>3000원</td>
				<td>9900원</td>
			</tr>
			<tr>
				<td colspan="8" style="text-align: right">상품 구매 가격 : 10000 +
					배송비 : 3000 = 합계 : 1300원</td>
			</tr>
		</table>
		<!-- 상품목록 -->

		<br> <br>
		<!-- 주문자 정보 -->
		<div id="pay-div1">
			<br>
			<p>주문 정보</p>
			<table class="pay-tab">
				<tr>
					<td>주문하시는 분&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text" style="width: 10vw"></td>
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
					<td><input type="text" name="smartPhone1" class="payphone">-
						<input type="text" name="smartPhone1" class="payphone">- <input
						type="text" name="smartPhone2" class="payphone"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" id="email" size="10">
						@ <input type="text" name="email2" id="email2" style="width: 15vw">
						<select id="email2" style="width: 5vw">
							<option value=""></option>
							<option value="1">직접 입력</option>
							<option value="google.com">google.com</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.com">daum.com</option>
					</select></td>
				</tr>
			</table>
			

			<!-- 주문자정보 끝 -->
			<br> <br>
			<!-- 배송지 정보 -->
			<p>배송지 정보</p>
			<table class="pay-tab">
				<tr>
					<td>배송지 선택</td>
					<td><input type="button" value="주문자 정보와 동일" onclick="">&nbsp;&nbsp;&nbsp;
						<input type="button" value="배송지 목록" onclick=""></td>
				</tr>
				<tr>
					<td>받는 사람&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text" style="width: 10vw"></td>
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
					<td><input type="text" name="smartPhone1" class="payphone">-
						<input type="text" name="smartPhone1" class="payphone">- <input
						type="text" name="smartPhone2" class="payphone"></td>
				</tr>
				<tr>
					<td>배송시 요청사항</td>
					<td><input type="text" class="delrequest"> <br> <label>ex)
							경비실에 맡겨주세요</label></td>
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
					<td>쿠폰 할인</td>
					<td><input type="text"><label>원</label></td>
					<td><input type="button" value="쿠폰사용"></td>
					<td>(사용가능 쿠폰 : 0장)</td>
				</tr>
				<tr>
					<td>포인트 사용</td>
					<td><input type="text"><label>원</label></td>
					<td><input type="button" value="전액사용"></td>
					<td>(보유 포인트 : 0 포인트)</td>
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