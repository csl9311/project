<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.check{
	width: 40%;
	margin: auto;
}
</style>
</head>
<%@ include file="Form.jsp"%>
<body>

<div id="mypage">


<section>	
<form>
	<br><br>
	<h2  id="la1">개인정보 변경</h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>고객님의 개인정보보호를 위해 최선을 다하겠습니다</label>
	<br><br>
	
	<div class="check border">
	<br>
	<p>개인정보 변경을 위해 비밀번호를 다시 한번 입력해 주세요.</p>	
	<br>	
	<label>비밀번호 확인 : &nbsp;</label><input type="password" id="pwd" style="width:20vw"><br><br>
	<div>
	
	<input type="button" onclick="check();" id="ch" value="확인"> &nbsp;&nbsp;&nbsp;
	<input type="button" onclick="check();" id="che" value="취소">

	</div>
	<p></p>
	</div>
</form>
</section>
<script>
	function check(){
		location.href="<%= request.getContextPath()%>/views/MyPage/upDate.jsp";
	}

	

</script>

</div>
</body>

<%@ include file="/views/common/coinfooter.jsp"%>
</html>