<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.payadr{
 width: 30vw;
}
.payphone{
	width: 5vw;
}
.delrequest{
	width:30vw;
}
</style>
</head>
<%@ include file="Form.jsp"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/mypage/cart.css">
<body>


<div>
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
	</div>
	<br>
	<br>
	<div id="pay-div1">
	<p>주문 정보</p>
	<table class="pay-tab">
	<tr>
	<td>주문하시는 분&nbsp;&nbsp;&nbsp;</td>
	<td><input type="text" style="width: 10vw"></td>
	</tr>
	<tr>
	<td>주소</td>
	<td><input type="text">&nbsp;&nbsp;&nbsp;<button>주소 찾기</button></td>
	</tr>
	<tr><td></td>
	<td><input type="text" class="payadr"></td>
	</tr>
	<tr><td></td>
	<td><input type="text" class="payadr"></td>
	</tr>
	<tr><td>휴대전화</td>
	<td>
			<input type="text" name="smartPhone1" class="payphone">-
            <input type="text" name="smartPhone1" class="payphone">-
            <input type="text" name="smartPhone2" class="payphone">	
    </td>
    </tr>
    <tr>
    <td>이메일</td>
    <td>
     	 <input type="text" name="email" id="email" size="10"> @
     	 <input type="text" name="email2" id="email2" style="width:15vw">
     	 <select id="email2" style="width: 5vw">
     	   <option value=""></option>
           <option value="1">직접 입력</option>
           <option value="google.com">google.com</option>
           <option value="naver.com">naver.com</option>
           <option value="daum.com">daum.com</option>
     	</select>
      </td>
     </tr>    	
	</table>
	<br>
	<br>
	<p>배송지 정보</p>
	<table class="pay-tab">
	<tr><td>배송지 선택	</td>
	<td><input type="button" value="주문자 정보와 동일" onclick="">&nbsp;&nbsp;&nbsp;<input type="button" value="배송지 목록" onclick=""></td>
	</tr>
	<tr>
	<td>&nbsp;받는 사람&nbsp;&nbsp;&nbsp;</td>
	<td><input type="text" style="width: 10vw"></td>
	</tr>
	<tr>
	<td>주소</td>
	<td><input type="text">&nbsp;&nbsp;&nbsp;<button>주소 찾기</button></td>
	</tr>
	<tr><td></td>
	<td><input type="text" class="payadr"></td>
	</tr>
	<tr><td></td>
	<td><input type="text" class="payadr"></td>
	</tr>
	<tr><td>휴대전화</td>
	<td>
			<input type="text" name="smartPhone1" class="payphone">-
            <input type="text" name="smartPhone1" class="payphone">-
            <input type="text" name="smartPhone2" class="payphone">	
    </td>
    </tr>
    <tr>
    <td>배송시 요청사항</td>
    <td><input type="text" class="delrequest">
    <br><label>ex) 경비실에 맡겨주세요</label>    	
    </td>
     </tr>    	
	</table>
</div>

</div>


</body>
<%@ include file="/views/common/coinfooter.jsp"%>
</html>