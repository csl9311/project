<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta charset="utf-8">
<title>마이페이지</title>


<style>
<%@include file="../../css/sub.css" %>
</style>
</head>
<body>



	<aside class="menu left none">
		<button id="lCate" class="btn lCate" type="button">aaa</button>
		<br> <br>
		<div id="mCate" class="absolute none">
			<button class="btn mCate" type="button">1</button>
			<button class="btn mCate" type="button">2</button>
			<button class="btn mCate" type="button">3</button>
		</div>
	</aside>	
	<div class="search">
		<button class="btn" onclick="update()">개인정보수정</button>
		<button class="btn" >예약내역</button>
		<button class="btn" >작성글 목록</button>
		<button class="btn" >장바구니</button>
		<button class="btn" >문의 목록</button>
		<button class="btn" >회원탈퇴</button>
		
	</div>
	
	
	
	
</body>
</html>
