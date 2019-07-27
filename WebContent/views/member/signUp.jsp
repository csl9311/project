<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String idCheckMsg = (String)request.getAttribute("idCheck");
	String nickCheckMsg = (String)request.getAttribute("pwCheck");
%>

<%@ include file="/views/common/coinheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
</style>
</head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin/admin.css">
<body>
<!--
	input태그 이미지 구한 후 스타일 날리기.(라디오버튼 css 날리고 이미지파일로 대체)
	우편번호 검색 DB 짜야함. pk : 우편번호, address : text
	아이디, 비밀번호, 닉네임, 본인인증, 우편번호 DB, 주소 자동 완성, 이메일 중복체크, 뉴스메일 & 이벤트 선택여부

 -->
	<div class="content">
		<form action="<%=request.getContextPath()%>/member.signUp" method="post">
			<table class="signUpTable">
				<tr>
					<td class="rowTitle">아이디</td>
					<td><input type="text" name="id" id="id"></td>
				</tr>
				<tr class="resultLabel" id="idResultTr">
					<td></td>
					<td colspan="2" id="idResultTd"></td>
				</tr>
				<tr>
					<td class="rowTitle">비밀번호</td>
					<td><input type="password" name="pw" id="pw"></td>
				</tr>
				<tr class="resultLabel" id="pwResultTr">
					<td></td>
					<td><label class="description small" id="pwResultTd"></label></td>
				</tr>
				<tr>
					<td class="rowTitle">비밀번호 확인</td>
					<td><input type="password" name="pwCheck" id="pwCheck"></td>
				</tr>
				<tr class="resultLabel" id="pwCheckResultTr">
					<td></td>
					<td colspan="2" id="pwCheckResultTd"></td>
				</tr>
				<tr>
					<td class="rowTitle">닉네임</td>
					<td><input type="text" name="nickName" id="nickName"></td>
				</tr>
				<tr class="resultLabel" id="nickNameResultTr">
					<td></td>
					<td><label id="nickNameResultTd"></label></td>
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
						<button id="submit" type="submit" disabled="disabled">회원가입</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script>
		// 아이디 js
		var $id = $('#id');
		var idUsable = false;
		$id.change(function(){
			var regExpId = /^[0-9a-zA-Z]+$/;
			var idChecked = false;
			
			
			if(regExpId.test($id)){
				$('#idResultTd').text('아이디에 사용 불가능한 문자가 포함되어있습니다.');
				$('#idResultTr').css({'color':'red', 'display':'table-row', 'height' : '1vh'});
			} else if($id.val().length < 6){
				$('#idResultTd').text('아이디는 최소 6자리 이상이어야 합니다.');
				$('#idResultTr').css({'color':'red', 'display':'table-row', 'height' : '1vh'});
				
			} else if(idChecked){
				$('#idResultTd').text('이미 사용중인 아이디입니다.');
				$('#idResultTr').css({'color':'red', 'display':'table-row', 'height' : '1vh'});
			} else {
				$('#idResultTd').text('사용 가능한 아이디입니다.');
				$('#idResultTr').css({'color':'white', 'display':'table-row', 'height' : '1vh'});
				idUsable = true;
			}
		});

		// 비밀번호 js
		// 참조 : https://hee-kkk.tistory.com/22
		var $pw = $('#pw');
		var pwUsable1 = false;
		var pwUsable2 = false;

		$pw.on("change paste keyup", function(){
			if($pw.val().length < 8) {
				$('#pwResultTd').text('8자리 이상의 비밀번호를 입력해주세요.');
				$('#pwResultTr').css({'color':'red', 'display':'table-row', 'height' : '1vh'});
				pwUsable1 = false;
				
			} else if(checkNumber < 0 || checkEnglish < 0){
				$('#pwResultTd').text('숫자와 영문자를 혼용하여야 합니다.');
				$('#pwResultTr').css({'color':'red', 'display':'table-row', 'height' : '1vh'});
				pwUsable1 = false;
			} else {
				$('#pwResultTd').text('사용 가능한 비밀번호입니다.');
				$('#pwResultTr').css({'color':'white', 'display':'table-row', 'height' : '1vh'});
				pwUsable1 = true;
			}
		});
		
		// 비밀번호 확인 js
		var $pwCheck = $('#pwCheck');
		$pwCheck.on('change paste keyup', function(){
			if ($pw.val() != $pwCheck.val()){
				$('#pwCheckResultTd').text('입력하신 두 비밀번호가 같지 않습니다.');
				$('#pwCheckResultTr').css({'color':'red', 'display':'table-row', 'height' : '1vh'});
				pwUsable2 = false;
			} else {
				$('#pwCheckResultTd').text('사용 가능한 비밀번호입니다.');
				$('#pwCheckResultTr').css({'color':'white', 'display':'table-row', 'height' : '1vh'});
				pwUsable2 = true;
			}
		});
		
		if(pwUsable1 && pwUsable2){
			
		}
		
		// 닉네임 js
		var $nickName = $('#nickName');
		$nickName.change(function(){
			var nickCheck = function(){
				
			};
			var nickUsable = false;
			var regExpId = /^[0-9a-zA-Z]+$/;
			
			if(regExpNick.test($nickName)){
				$('#nickNameResultTd').text('닉네임에 사용 불가능한 문자가 포함되어있습니다.');
				$('#nickNameResultTr').css({'color':'red', 'display':'table-row', 'height' : '1vh'});
				var nickUsable = false;
			} else if(nickCheck){
				$('#nickNameResultTd').text('이미 사용중인 닉네임입니다.');
				$('#nickNameResultTr').css({'color':'red', 'display':'table-row', 'height' : '1vh'});
				var nickUsable = false;
			} else {
				$('#nickNameResultTd').text('사용 가능한 아이디입니다.');
				$('#nickNameResultTr').css({'color':'white', 'display':'table-row', 'height' : '1vh'});
				idUsable = true;
			}
		});
		
		
		if(idUsable && pwUseable){
			$('#submit').removeAttr('disabled');
		}
		
		
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
</body>
</html>
