<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member"%>
<%
	Member member = (Member) request.getAttribute("member");
	String[] checked = new String[2];
	String[] selected = new String[5];
	String[] phone = {};
	if (member != null) {
		phone = member.getPhone().split("-");
		
		if(member.getGender().equals("남")){
			checked[0] = "checked";
		} else if (member.getGender().equals("여")){
			checked[1] = "checked";
		}
		
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
<style type="text/css">

#memberDetail tr td,td {
	height: 5vh;
	border: 1px solid white;
}
</style>
</head>
<body>
	<div class="content">
		<form action="<%=request.getContextPath()%>/admin.MemberUpdate" method="post">
			<table id="memberDetail">
				<tr>
					<td class="rowTitle">아이디</td>
					<td colspan="2"><input name="id" class="readonly" type="text" value="<%=member.getId()%>" readonly></td>
					<td class="rowTitle" rowspan="2">등급</td>
					<td rowspan="2">
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
					<td rowspan="2"><input type="text" class="readonly" value="<%=member.getRegDate()%>" readonly></td>
				</tr>
				<tr>
					<td class="rowTitle">성별</td>
					<td><input type="radio" name="gender" value="남" <%=checked[0]%>>&nbsp;&nbsp;남</td>
					<td><input type="radio" name="gender" value="여" <%=checked[1]%>>&nbsp;&nbsp;여</td>
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
					<td rowspan="2"><input class="readonly" name="modifyDate" type="text" value="<%=member.getModifyDate() %>" readonly></td>
				</tr>
				<tr>
					<td class="rowTitle">이메일 <!-- 카카오톡 ID? --></td>
					<td colspan="2"><input type="email" name="email" value="<%=member.getEmail()%>"></td>
				</tr>
				<tr>
					<td class="rowTitle">주소</td>
					<td colspan="2"><input type="text" name="address" value="<%=member.getAddress()%>"></td>
					<td class="rowTitle">포인트</td>
					<td colspan="2"><input class="readonly" name="point" type="text" value="<%=member.getPoint()%>" readonly></td>
				</tr>
				<tr>
					<td colspan="3"><button type="submit">수정완료</button></td>
					<td colspan="2"><button type="button" onclick="location.href='javascript:history.go(-1)'">취소</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>