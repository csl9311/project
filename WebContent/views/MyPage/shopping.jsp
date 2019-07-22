<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.sdiv{
		
	}
	.tab-1 {
		
		margin:auto;
		width: 80vw;
		height: auto;
		border: 1px solid white"
	}
	
</style>
</head>
<body>
<%@  include file="Form.jsp"%>
<section class="result">	
<div class=".sdiv">
	<table class="tab-1">
		<tr >
			<td><input type="checkbox">전체선택</td>
			<td>이미지</td>
			<td colspan="3">상품정보</td>
			<td>상품 금액></td>
			<td>수량</td>
			<td>배송비</td>
			<td>합계</td>
			<td>선택</td>
		</tr>
		<tr>
			<td rowspan ="3"><input type="checkbox">
			<td></td>
			<td colspan="3">zz</td>
			<td>10000원</td>
			<td><input type="Number" min="1"></td>
			<td>3000원</td>
			<td>9900원</td>
			<td><button>주문하기</button><br>
				<button>관심상품등록</button><br>
				<button>삭제</button>
			</td>
		</tr>
		<tr>
		<td colspan="5" style="text-align:left">ㅋㅋㅋ</td>
		<td colspan="3">상품구매가격</td>
		</tr>	
	</table>
	</div>
	<br>
	<br>
	선택상품을&nbsp; <button>삭제하기</button>&nbsp; &nbsp; <button>관심상품등록</button> 
	<br><br>
	<div>
	<table style="margin:auto">
	<tr>
	<td>총 상품금액
	</td>
	<td>총 배송비
	</td>
	<td>결제예정금액
	</td>
	</tr>
	</table>
	</div>

</section>
<%@ include file="/views/common/coinfooter.jsp"%>
</body>
</html>