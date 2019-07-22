<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member"%>
<%
	Member member = new Member();
	String checked = "";
	String selected = "";
	/* String[] phone = {}; */
	if (member != null) {
		checked = member.getGender() != null ? "checked" : "";
		selected = member.getGrade() != null ? "selected" : "";
		/* phone = member.getPhone().split("-"); */
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세정보조회</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin/admin.css" />
</head>
<body>
	<div class="content">
		<div class="emptyHeader"></div>
		<form action="" method="post">
			<table id="memberDetail">
				<tr>
					<th>아이디</th>
					<td colspan="2"><input class="disabled" type="text" value="<%=member.getId()%>" disabled="disabled"></td>
					<th rowspan="3">등급</th>
					<td rowspan="3">
						<select class="grade">
							<option <%=selected%>>사용자</option>
							<%-- 추후 등급 세분화 할 예정 --%>
							<option <%=selected%>>사장님</option>
							<option <%=selected%>>관리자</option>
							<option <%=selected%>>블랙</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td colspan="2"><input type="text" value="<%=member.getName()%>"></td>

				</tr>
				<tr>
					<th>생일</th>
					<td colspan="2"><input class="disabled" type="text" value="<%=member.getBirth()%>" disabled="disabled"></td>

				</tr>
				<tr>
					<th>성별</th>
					<th><input type="radio" name="gender" value="남" <%=checked%>>&nbsp;&nbsp;남</th>
					<th><input type="radio" name="gender" value="여" <%=checked%>>&nbsp;&nbsp;여</th>

					<th rowspan="2">회원가입일</th>
					<td rowspan="2"><input class="disabled" type="text" value="<%=member.getRegDate()%>" disabled="disabled"></td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td colspan="2">
						<input class="phone" type="text" value="<%-- <%=phone[0]%> --%>">
						<label class="dash">-</label>
						<input class="phone" type="text" value="<%-- <%=phone[1]%> --%>">
						<label class="dash">-</label>
						<input class="phone" type="text" value="<%-- <%=phone[2]%> --%>">
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td colspan="2"><input type="tel" value=""></td>

					<th rowspan="2">정보수정일</th>
					<td rowspan="2"><input class="disabled" type="text" value="<%=member.getModifyDate() %>" disabled="disabled"></td>
				</tr>
				<tr>
					<th>이메일 <!-- 카카오톡 ID? --></th>
					<td colspan="2"><input type="text" value="<%=member.getEmail()%>"></td>
				</tr>
				<tr>
					<td colspan="5"></td>
				</tr>
				<tr>
					<td colspan="3"><button type="submit">수정완료</button></td>
					<td colspan="2"><button type="submit">취소</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>