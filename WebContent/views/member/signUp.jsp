<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String idCheckMsg = (String) request.getAttribute("idCheck");
	String nickCheckMsg = (String) request.getAttribute("pwCheck");
%>
<%@ include file="/views/common/coinheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
input[type=password] {
	width: auto;
	height: 3vh;
	font-size: 14px;
	margin: 0px;
	border: none;
}
</style>
</head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin/admin.css">
<body>
	<%--
	우편번호 검색 DB 짜야함. pk : 우편번호, address : text
	아이디, 비밀번호, 닉네임, 본인인증, 우편번호 DB, 주소 자동 완성, 이메일 중복체크, 뉴스메일 & 이벤트 선택여부
	--%>
	<div class="content">
		<form action="<%=request.getContextPath()%>/member.signUp" method="post">
			<table class="signUpTable">
				<tr>
					<td class="rowTitle">아이디</td>
					<td><input type="text" name="id" id="id" onfocus="true"></td>
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
					<td colspan="2" id="pwResultTd"></td>
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
					<td><select name="tel">
							<option value="KT">KT</option>
							<option value="LG U+">LG U+</option>
							<option value="SKT">SKT</option>
						</select>
						<input type="text" id="phone" name="phone" class="phone">
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
						for (i = start; i >= end; i--) {
							document.write('<option value="' + i + '">' + i + '</option>');
						}
						document.write("</select><label class='description'>년 </label>");

						document.write("<select name='birth'>");
						for (i = 1; i <= 12; i++) {
							document.write('<option value="' + i + '">' + i + '</option>');
						}
						document.write("</select><label class='description'>월 </label>  ");

						document.write("<select name='birth'>");
						for (i = 1; i <= 31; i++) {
							document.write('<option value="' + i + '">' + i + '</option>');
						}
						document.write("</select><label class='description'>일</label>");
					</script></td>
				</tr>
				<tr>
					<td class="rowTitle">성별</td>
					<td>
						<input class="radioM" type="radio" name="gender" value="M"><label class='description'>남</label>
						<input class="radioW" type="radio" name="gender" value="W"><label class='description'>여</label>
					</td>
				</tr>
				<tr>
					<td class="rowTitle">우편번호</td>
					<td>
						<input type="text" name="postNum">
						<button type="button" id="postNum" onclick="">우편번호 검색</button>
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
					<td><input type="email" name="email"></td>
				</tr>
				<tr class="resultLabel">
					<td></td>
					<td><label id="emailCheck">이미 사용 중인 이메일 주소입니다.</label></td>
				</tr>
				<tr>
					<td class="rowTitle">뉴스메일</td>
					<td class="description">
						<input class="news" type="radio" name="news" value="0">
						<label>동의</label>
						<input class="news" type="radio" name="news" value="1">
						<label>동의하지 않음</label></td>
				</tr>
				<tr>
					<td class="rowTitle">SMS안내 (이벤트)</td>
					<td class="description">
						<input class="sms" type="radio" name="sms" value="0">
						<label>동의</label>
						<input class="sms" type="radio" name="sms" value="1">
						<label>동의하지 않음</label>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="submit">
						<button id="submit" type="submit">회원가입</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script>
	<%-- 모든 조건 충족 시 버튼 활성화 --%>
	function buttonActive() {
		if (idUsable && pwUsable && nickUsable) {
			$('#submit').removeAttr('disabled').css({'background' : 'green'});
		}
	}
	
	<%-- 아이디 사용 가능 여부 (정규식 및 중복확인) --%>
		var $id = $('#id');
		// 페이지 입장 시 id태그에 focus
		$id.focus();
		// 사용가능여부 : 사용 가능 할 때 true 반환
		var idUsable = false;
		// 중복체크 : 사용 가능 할 때 true 반환
		var idChecked = false;
		
		// 정규식
		// 첫 글자는 [a-zA-Z0-9]로 시작하고
		// 문장 내에 [a-zA-Z0-9_]를 사용 가능하다
		// 4자리 이상, 11자리 이하
		var regId = /^{a-zA-Z0-9_}+$/;
		$id.change(function() {
			if(!idUsable || !idChecked){
				$id.focus();
				// 둘 중 하나만 false여도 둘 다 false
				idUsable = false;
				idChecked = false;
				// 에러메시지 띄울 tr css 변경
				$('#idResultTr').css({ 'color' : 'red', 'display' : 'table-row', 'height' : '1vh' });
				
				if($id.val().length == 0){
					$('#idResultTd').text('아이디를 입력해주세요.');
				} else if ($id.val().length < 6) {
					$('#idResultTd').text('아이디는 최소 6자리 이상이어야 합니다.');
				} else if (!regId.test($id.val())){
					console.log($id.val().length);
					$('#idResultTd').text('아이디에 사용 불가능한 문자가 포함되어 있습니다.');
				} else if(!idChecked) {
					// 중복확인 ajax
					$.ajax({
						url: "<%=request.getContextPath()%>/member.idCheck",
						type: 'post',
						data:{id:$id.val()},
						success: function(data){
							if(data == "success"){
								idChecked = true;
							} else {
								isUsable = false;
								isIdChecked = false;
								$('#idResultTd').text('이미 사용중인 아이디입니다.');
							}
						}
					});
				} else {
					idUsable = true;
					idChecked = true;
				}
			} else {
				$('#idResultTd').text('사용 가능한 아이디입니다.');
				$('#idResultTr').css({ 'color' : 'white', 'display' : 'table-row', 'height' : '1vh'});
				buttonActive();
			}
		});
	<%-- 비밀번호 사용 가능 여부 (정규식, 일치) --%>
		var $pw = $('#pw');
		var $pwCheck = $('#pwCheck');
		var regPw = /^.*(?=^.{6,}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		var pwUsable = false;
		var pwUsable1 = false;
		var pwUsable2 = false;

		$pw.on("change paste keyup", function() {
			if (!pwUsable1 || !pwUsable) {
				$('#pwResultTr').css({ 'color' : 'white', 'display' : 'table-row', 'height' : '1vh' });
			} else {
				$('#pwResultTd').text('사용 가능한 비밀번호입니다.');
				pwUsable1 = true;
				if (pwUsable2) {
					pwUsable = true;
					buttonActive();
				}
			}
			
			
			if ($pw.val().length < 6) {
				$('#pwResultTd').text('6자리 이상의 비밀번호를 입력해주세요.');
				
				pwUsable = false;
				pwUsable1 = false;
				$pw.focus();
			} else if (!regPw.test($pw.val())) {
				$('#pwResultTd').text('영문과 숫자, 특수문자가 각 1회 이상 사용되어야합니다.');
				
				pwUsable = false;
				pwUsable1 = false;
				$pw.focus();
			} else {
				
			}
		});
		$pwCheck.on('change paste keyup', function() {
			if (pwUsable1 == true && $pw.val() == $pwCheck.val()) {
				$('#pwCheckResultTd').text('사용 가능한 비밀번호입니다.');
				$('#pwCheckResultTr').css({
					'color' : 'white',
					'display' : 'table-row',
					'height' : '1vh'
				});
				pwUsable2 = true;
				if (pwUsable1) {
					pwUsable = true;
					buttonActive();
				}
			} else {
				$('#pwCheckResultTd').text('입력하신 두 비밀번호가 같지 않습니다.');
				$('#pwCheckResultTr').css({
					'color' : 'red',
					'display' : 'table-row',
					'height' : '1vh'
				});
				pwUsable = false;
				pwUsable2 = false;
				$pwCheck.focus();
			}
		});
	<%-- 닉네임 사용 가능 여부 (중복확인 및 정규식) --%>
		var $nickName = $('#nickName');
		var nickUsable = false;
		var nickCheck = false;

		$nickName.change(function() {
			if ($nickName.val().length == 0) {
				$('#idResultTd').text('아이디를 입력해주세요.');
				$('#idResultTr').css({
					'color' : 'red',
					'display' : 'table-row',
					'height' : '1vh'
				});
				$nickName.focus();
			} /* else if (!regNick.test($nickName)) {
				$('#nickNameResultTd').text('닉네임에 사용 불가능한 문자가 포함되어있습니다.');
				$('#nickNameResultTr').css({
					'color' : 'red',
					'display' : 'table-row',
					'height' : '1vh'
				});
				nickUsable = false;
				$nickName.focus();
			} */
				else if(!nickChecked) {
					// 중복확인 ajax
					$.ajax({
						url: "<%=request.getContextPath()%>/member.nickCheck",
						type: 'post',
						data:{nickName:$nickName.val()},
						success: function(data){
							if(data == "success"){
								idChecked = true;
							} else {
								isUsable = false;
								isIdChecked = false;
								$('#idResultTd').text('이미 사용중인 아이디입니다.');
							}
						}
					});
				}
			 else {
				$('#nickNameResultTd').text('사용 가능한 아이디입니다.');
				$('#nickNameResultTr').css({
					'color' : 'white',
					'display' : 'table-row',
					'height' : '1vh'
				});
				nickUsable = true;
				buttonActive();
			}
		});
	
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
</body>
</html>
