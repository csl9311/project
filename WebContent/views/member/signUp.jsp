<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String idCheckMsg = (String)request.getAttribute("idCheckMsg");
	String pwdCheckMsg1 = (String)request.getAttribute("pwCheckMsg");
	String pwdCheckMsg2 = (String)request.getAttribute("idCheckMsg");
	String nickCheckMsg = (String)request.getAttribute("nickCheckMsg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
.signUpTable tr {
	height: 5vh;
}
</style>
</head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin/admin.css">
<body>
<%@ include file="../../views/common/coinheader.jsp" %>
<!--
	input태그 이미지 구한 후 스타일 날리기.(라디오버튼 css 날리고 이미지파일로 대체)
	우편번호 검색 DB 짜야함. pk : 우편번호, address : text
	아이디, 비밀번호, 닉네임, 본인인증, 우편번호 DB, 주소 자동 완성, 이메일 중복체크, 뉴스메일 & 이벤트 선택여부
	
 -->
	<div>
		<form action="<%=request.getContextPath()%>/member.signUp" method="post">
			<table class="signUpTable">
				<tr>
					<td class="rowTitle">아이디</td>
					<td><input type="text" name="id" id="id"></td>
				</tr>
				<tr class="resultLabel" id="idResult">
					
				</tr>
				<tr>
					<td class="rowTitle">비밀번호</td>
					<td><input type="text" name="pw"></td>
				</tr>
				<tr class="resultLabel">
					<td></td>
					<td><label class="description small"><%=pwdCheckMsg1 %></label><!-- * 영문/숫자/특수문자 중 2가지 이상 혼용하여 8자 이상 --></td>
				</tr>
				<tr>
					<td class="rowTitle">비밀번호 확인</td>
					<td><input type="text" name="pwCheck"></td>
				</tr>
				<tr class="resultLabel">
					<td></td>
					<td><label><%=pwdCheckMsg2 %></label></td>
				</tr>
				<tr>
					<td class="rowTitle">닉네임</td>
					<td><input type="text" name="nickName"></td>
				</tr>
				<tr class="resultLabel">
					<td></td>
					<td><label><%=nickCheckMsg %></label></td>
				</tr>
				<tr>
					<td class="rowTitle">이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td class="rowTitle">연락처</td>
					<td>
						<select>
							<option value="KT">KT</option>
							<option value="LG U+">LG U+</option>
							<option value="SKT">SKT</option>
						</select>
						<input type="text" name="phone" class="phone">
						<label class='description'>-</label>
						<input type="text" name="phone" class="phone">
						<label class='description'>-</label>
						<input type="text" name="phone" class="phone">
					</td>
				</tr>
				<tr>
					<td class="rowTitle">생년월일</td>
					<td>
						<script type="text/javascript">
							var today = new Date();
							var toyear = parseInt(today.getFullYear());
							var start = toyear;
							var end = toyear - 100;
		
							document.write("<select name='birth'> ");
							for (i = start; i >= end; i--){
								document.write('<option value="' + i + '">' + i + '</option>');
							}
							document.write("</select><label class='description'>년 </label>");
		
							document.write("<select name='birth'>");
							for (i = 1; i <= 12; i++){
								document.write('<option value="' + i + '">' + i + '</option>');
							}
							document.write("</select><label class='description'>월 </label>  ");
		
							document.write("<select name='birth'>");
							for (i = 1; i <= 31; i++){
								document.write('<option value="' + i + '">' + i + '</option>');
							}
							document.write("</select><label class='description'>일</label>");
						</script> 
					</td>
				</tr>
				<tr>
				
				<td class="rowTitle">성별</td>
				<td>
					<input type="radio" name="gender" value="M"><label class='description'>남</label>
					<input type="radio" name="gender" value="W"><label class='description'>여</label>
				</td>
				</tr>
				<tr>
					<td class="rowTitle">우편번호</td>
					<td>
						<input type="text" name="postNum">
						<button type="button" id="postNum">우편번호 검색</button>
					</td>
				</tr>
				<tr>
					<td class="rowTitle">주소</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td class="rowTitle">상세주소</td>
					<td><input type="text" name="addressDetail"></td>
				</tr>
				<tr>
					<td class="rowTitle">이메일</td>
					<td>
						<input type="email" name="email">
					</td>
				</tr>
				<tr class="resultLabel">
					<td></td>
					<td><label id="emailCheck">이미 사용 중인 이메일 주소입니다.</label></td>
				</tr>
				<tr>
					<td class="rowTitle">뉴스메일</td>
					<td class="description">
						<input type="radio" name="news" value="0">
						<label>동의</label>
						<input type="radio" name="news" value="1">
						<label>동의하지 않음</label>
					</td>
				</tr>
				<tr>
					<td class="rowTitle">SMS안내 (이벤트)</td>
					<td class="description">
						<input type="radio" name="sms" value="0">
						<label>동의</label>
						<input type="radio" name="sms" value="1">
						<label>동의하지 않음</label>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="submit">
						<button type="submit">회원가입</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script>
		var usable = false;
		var isIdChecked = false;
		$('#id').change(function(){
			var $id = $('#id');
			if($id.val().length < 6){
				$('#idResult').html('<td></td><td>아이디는 최소 6자리 이상이어야 합니다.</td>');
				$('#idResult').css({'color':'red', 'display':'inline-block'});
			}
		});
	</script>
</body>
</html>