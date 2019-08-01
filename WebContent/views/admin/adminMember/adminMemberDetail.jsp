<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.*, java.util.ArrayList"%>
<%@ include file="/views/common/coinheader.jsp"%>
<%
	Member member = (Member) request.getAttribute("member");
	ArrayList<Address> addressList = (ArrayList<Address>)request.getAttribute("addressList");
	String[] genderChecked = new String[2];
	String[] smsChecked = new String[2];
	String[] newsChecked = new String[2];
	String[] selected = new String[5];
	String[] phone = {};
	if (member != null) {
		// phone
		phone = member.getPhone().split("-");
		// 성별
		if(member.getGender().equals("M")){
			genderChecked[0] = "checked";
		} else if (member.getGender().equals("W")){
			genderChecked[1] = "checked";
		}
		// sms 수신 여부
		if(member.getSms() == 0){
			smsChecked[0] = "checked";
		} else {
			smsChecked[1] = "checked";
		}
		// news 수신 여부
		if(member.getNews() == 0){
			newsChecked[0] = "checked";
		} else {
			newsChecked[1] = "checked";
		}
		// 등급
		switch(member.getGrade()){
			case "일반": selected[0] = "selected"; break;
			case "사장님": selected[1] = "selected"; break;
			case "관리자": selected[2] = "selected"; break;
			case "휴면": selected[3] = "selected"; break;
			case "블랙": selected[4] = "selected"; break;
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보조회</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin/admin.css">
</head>
<body>
	<div class="emptyHeader"></div>
	<div id="center">
	<% if (loginUser != null) { %>
		<% String msg = (String)request.getAttribute("msg");
			if(msg != null) {
		%>
			<script>
				alert('<%=msg%>');
			</script>
		<%}%>
		<form action="<%=request.getContextPath()%>/admin.MemberUpdate" method="post">
			<table border="1" style="border: 1px solid white;">
				<tr>
					<td class="rowTitle">아이디</td>
					<td colspan="2"><input name="id" class="adminInput readonly" type="text" value="<%=member.getId()%>" readonly></td>
					<td class="rowTitle" rowspan="2">등급</td>
					<td rowspan="2" colspan="2">
						<select class="grade" name="grade">
							<option <%=selected[0]%> value="일반">일반</option>
							<%-- 등급 세분화 할 예정 --%>
							<option <%=selected[1]%> value="사장님">사장님</option>
							<option <%=selected[2]%> value="관리자">관리자</option>
							<option <%=selected[3]%> value="휴면">휴면</option>
							<option <%=selected[4]%> value="블랙">블랙</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="rowTitle">이름</td>
					<td colspan="2"><input class="adminInput" name="name" type="text"  value="<%=member.getName()%>"></td>
				</tr>
				<tr>
					<td class="rowTitle">생년월일</td>
					<td colspan="2"><input class="adminInput readonly" name="birth" type="text" value="<%=member.getBirth()%>" readonly></td>

					<td class="rowTitle" rowspan="2">회원가입일</td>
					<td rowspan="2" colspan="2"><input class="adminInput readonly" type="text" value="<%=member.getRegDate()%>" readonly></td>
				</tr>
				<tr>
					<td class="rowTitle">성별</td>
					<td class="center"><input class="adminInput" type="radio" name="gender" value="M" <%=genderChecked[0]%>><label>남</label></td>
					<td class="center"><input class="adminInput" type="radio" name="gender" value="W" <%=genderChecked[1]%>><label>여</label></td>
				</tr>
				<tr>
					<td class="rowTitle">연락처</td>
					<td colspan="2">
						<select name="tel">
							<option value="KT">KT</option>
							<option value="LG U+">LG U+</option>
							<option value="SKT">SKT</option>
						</select>
						<input class="adminInput phone" name="phone" type="text" value="<%=phone[0]%>">
						<label class="dash">-</label>
						<input class="adminInput phone" name="phone" type="text" value="<%=phone[1]%>">
						<label class="dash">-</label>
						<input class="adminInput phone" name="phone" type="text" value="<%=phone[2]%>">
					</td>
					<td class="rowTitle" rowspan="2">정보수정일</td>
					<td rowspan="2" colspan="2"><input class="adminInput readonly" name="modifyDate" type="text" value="<%=member.getModifyDate() %>" readonly></td>
				</tr>
				<tr>
					<td class="rowTitle">닉네임</td>
					<td colspan="2"><input class="adminInput" type="text" name="nickName" value="<%=member.getNickName()%>"></td>
				</tr>
				<tr>
					<td class="rowTitle">이메일</td>
					<td colspan="2"><input class="adminInput" type="email" name="email" value="<%=member.getEmail()%>"></td>
					
					<td class="rowTitle">포인트</td>
					<td colspan="2"><input class="adminInput readonly" name="point" type="text" value="<%=member.getPoint()%>" readonly></td>
				</tr>
				<tr>
					<td class="rowTitle">sms 수신 여부</td>
					<td class="center">
						<input class="adminInput" type="radio" name="sms" <%=smsChecked[0]%> value="0">
						<label>동의</label>
						</td><td>
						<input class="adminInput" type="radio" name="sms" <%=smsChecked[1]%> value="1">
						<label>동의하지 않음</label>
					</td>
					<td class="rowTitle">news 수신 여부</td>
					<td class="center">
						<input class="adminInput" type="radio" name="news" <%=newsChecked[0]%> value="0">
						<label>동의</label>
						</td><td>
						<input class="adminInput" type="radio" name="news" <%=newsChecked[1]%> value="1">
						<label>동의하지 않음</label>
					</td>
				</tr>
				<tr class="center">
					<td colspan="3"><button class="adminButton" type="submit">수정완료</button></td>
					<td colspan="3"><button class="adminButton" type="button" onclick="location.href='javascript:history.go(-1)'">취소</button></td>
				</tr>
			</table>
		</form>
		<div class="emptyHeader"></div>
		
		<% 
			for (int i = 0 ; i < addressList.size(); i ++){ 
				Address address = addressList.get(i);
		%>
		<form action="<%=request.getContextPath()%>/address.update" method="post">
			<table border="1" style="border: 1px solid white;">
			
				<tr>
					<td colspan="2"><%=i+1 %> 번째 주소
					<input type="hidden" name="address_code" value="<%=address.getAddress_code()%>">
					<input type="hidden" name="member_id" value="<%=member.getId()%>">
					</td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input class="adminInput" type="text" name="postNum" value="<%=address.getPostNum()%>"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input class="adminInput" type="text" name="address" value="<%=address.getAddress()%>"></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><input class="adminInput" type="text" name="address_detail" value="<%=address.getAddress_detail()%>"></td>
				</tr>
				<tr>
					<td colspan="2"><input class="adminButton" type="submit" value="해당 주소 수정"></td>
				</tr>
			</table>
			<br><br>
		</form>
		<%}} %>
	</div>
</body>
</html>