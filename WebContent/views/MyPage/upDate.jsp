<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.myUpdate{
	text-align: none;
}
</style>

</head>
<body>
<%@ include file="Form.jsp"%>
	<section class="result border">		
		
		<div class="myUpdate">
				
		<label>아이디 : </label><input type="text" name="id" readonly><br><br>
		<label>비밀번호 : </label><input type="password" name="pwd"><br><br>
		<label>비밀번호확인 : </label><input type="password" name="pwd2" ><br><br>
		<label>이름 : </label><input type="text" name="id" readonly><br><br>
		<label>닉네임 : </label><input type="text" name="id" ><br><br>
		<label>연락처 : </label><input type="text" name="id" ><br><br>
		<label>이메일 : </label><input type="text" name="id" ><br><br>
		<label>주소 : </label><input type="text" name="id" ><br><br>
		
		
		</div>
	
		
	</section>

	<footer class="border">하단 영역</footer>

</body>
</html>