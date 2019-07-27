<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member"%>
<%@ include file="/views/common/coinheader.jsp"%>
<%
	Member member = (Member) request.getAttribute("member");
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
		<form action="<%=request.getContextPath()%>/admin.MemberUpdate" method="post">
			<table border="1">
				<tr>
					<td class="rowTitle">아이디</td>
					<td colspan="2"><input name="id" class="readonly" type="text" value="<%=member.getId()%>" readonly></td>
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
					<td colspan="2"><input name="name" type="text"  value="<%=member.getName()%>"></td>
				</tr>
				<tr>
					<td class="rowTitle">생년월일</td>
					<td colspan="2"><input name="birth" type="text" class="readonly" value="<%=member.getBirth()%>" readonly></td>

					<td class="rowTitle" rowspan="2">회원가입일</td>
					<td rowspan="2" colspan="2"><input type="text" class="readonly" value="<%=member.getRegDate()%>" readonly></td>
				</tr>
				<tr>
					<td class="rowTitle">성별</td>
					<td class="center"><input type="radio" name="gender" value="M" <%=genderChecked[0]%>><label>남</label></td>
					<td class="center"><input type="radio" name="gender" value="W" <%=genderChecked[1]%>><label>여</label></td>
				</tr>
				<tr>
					<td class="rowTitle">연락처</td>
					<td colspan="2">
						<input class="phone" name="phone" type="text" value="<%=phone[0]%>">
						<label class="dash">-</label>
						<input class="phone" name="phone" type="text" value="<%=phone[1]%>">
						<label class="dash">-</label>
						<input class="phone" name="phone" type="text" value="<%=phone[2]%>">
					</td>
					<td class="rowTitle" rowspan="2">정보수정일</td>
					<td rowspan="2" colspan="2"><input class="readonly" name="modifyDate" type="text" value="<%=member.getModifyDate() %>" readonly></td>
				</tr>
				<tr>
					<td class="rowTitle">닉네임</td>
					<td colspan="2"><input type="text" name="nickName" value="<%=member.getNickName()%>"></td>
				</tr>
				<tr>
					<td class="rowTitle">이메일 <!-- 카카오톡 ID? --></td>
					<td colspan="2"><input type="email" name="email" value="<%=member.getEmail()%>"></td>
					
					<td class="rowTitle" rowspan="2">포인트</td>
					<td rowspan="2" colspan="2"><input class="readonly" name="point" type="text" value="<%=member.getPoint()%>" readonly></td>
				</tr>
				<tr>
					<td class="rowTitle">우편번호</td>
					<td colspan="2"><input type="text" name="postNum" value="<%=member.getPostNum()%>"></td>
					
				</tr>
				<tr>
					<td class="rowTitle">주소</td>
					<td colspan="2"><input type="text" name="address" value="<%=member.getAddress()%>"></td>
					<td class="rowTitle">sms 수신 여부</td>
					<td  class="center">
						<input type="radio" name="sms" <%=smsChecked[0]%> value="0">
						<label>동의</label>
						</td><td>
						<input type="radio" name="sms" <%=smsChecked[1]%> value="1">
						<label>동의하지 않음</label>
					</td>
				</tr>
				<tr>
					<td class="rowTitle">상세주소</td>
					<td colspan="2"><input type="text" name="addressDetail" value="<%=member.getAddressDetail()%>"></td>
					<td class="rowTitle">news 수신 여부</td>
					<td class="center">
						<input type="radio" name="news" <%=newsChecked[0]%> value="0">
						<label>동의</label>
						</td><td>
						<input type="radio" name="news" <%=newsChecked[1]%> value="1">
						<label>동의하지 않음</label>
					</td>
				</tr>
				<tr class="center">
					<td colspan="3"><button type="submit">수정완료</button></td>
					<td colspan="2"><button type="button" onclick="location.href='javascript:history.go(-1)'">취소</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>