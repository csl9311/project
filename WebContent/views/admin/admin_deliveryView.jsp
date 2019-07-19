<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송관리</title>
</head>
<body>
	주문목록조회, 주문관리, 새로운 주문 알람
	<!-- 주문목록조회 -->
	<div class="deliveryMenu" onclick="deliverySearch">주문목록조회</div>
	주문번호 구매자정보 수령자정보 상품명 개수 총가격
	<!-- 주문관리 -->
	<div class="deliveryMenu" onclick="deliveryManage">배송관리</div>
	<button>배송완료</button>
	<div class="deliveryMenu" onclick="deleveryManage">배송완료</div>
	<!-- 새로운 주문 알람 -->
	<div class="deliveryMenu" onclick="deliveryAlarm">공지,QNA</div>


</body>
</html>