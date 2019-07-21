<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta charset="utf-8">
<title>서브화면</title>
</head>
<body>
	<header class='border'>
		<nav>
			<button type="button" id="cateImg" class="btn btn-sm left">
				<img src="" alt="카테고리">
			</button>
			<div class="right">
				<button type="button" class="login btn btn-sm">로그인</button>
				<button type="button" class="logout btn btn-sm none">로그아웃</button>
				<button type="button" class="profile btn btn-sm none">프로필</button>
			</div>
			<h1 class="logo">로고</h1>
		</nav>
	</header>


	<aside class="menu left none">
		<button id="lCate" class="btn lCate" type="button">aaa</button>
		<br> <br>
		<div id="mCate" class="absolute none">
			<button class="btn mCate" type="button">1</button>
			<button class="btn mCate" type="button">2</button>
			<button class="btn mCate" type="button">3</button>
		</div>
	</aside>


	<div class="search border">
		검색 영역 <input type="text" name="search">
		<button type="submit" class="btn" type="button">검색</button>
	</div>
	<section class="result border">
	<div>
	결과 영역
	</div>
	
	
	</section>

	<footer class="border">하단 영역</footer>

	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
