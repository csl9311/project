<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="Form.jsp"%>

<form>

	<br><br>
	<h2  id="la1">정말로 탈퇴하시겠습니까?</h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label></label>
	<br><br>
	
	<div class="check border">
	<br>
	<p>탈퇴를 위하여 비밀번호를 다시 입력해주세요.</p>	
	<br>	
	<label>비밀번호 확인 : &nbsp;</label><input type="password" id="pwd" style="width:20vw"><br><br>
	<div>
	
	<input type="button" onclick="check();" id="ch" value="확인"> &nbsp;&nbsp;&nbsp;
	<input type="button" onclick="check();" id="che" value="취소">

	</div>
	
	</div>
</form>

	

</body>
</html>  