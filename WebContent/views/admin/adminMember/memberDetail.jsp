<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member"%>
<%
	Member member = (Member) request.getAttribute("loginUser");
	String gender = "";
	String grade = "";
	if (member != null) {
		gender = member.getGender() != "-" ? "checked" : "";
		grade = member.getGrade() != "-" ? "selected" : "";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세정보조회</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin/admin.css" />
</head>
<%@include file="/views/common/coinheader.jsp"%>
<body>
	<div class="emptyHeader"></div>
	<div class="content">
	<form action="">
		<table class="memberDetail">
			<tr>
				<th>아이디</th>
				<td colspan="2"><input type="text" value="<%-- <%=member.getId()%> --%>"
					disabled="disabled"></td>
				<th rowspan="2">등급</th>
				<td rowspan="2"><select>
						<option <%=grade%>>사용자</option>
						<%-- 추후 등급 세분화 할 예정 --%>
						<option <%=grade%>>사장님</option>
						<option <%=grade%>>관리자</option>
						<option <%=grade%>>블랙</option>
				</select></td>
			</tr>
			<tr>
				<th>이름</th>
				<td colspan="2"><input type="text" value=""></td>

			</tr>
			<tr>
				<th>생일</th>
				<td colspan="2"><input type="text" value="" disabled="disabled"></td>

				<th rowspan="2">회원가입일</th>
				<td rowspan="2"><input type="text" value="" disabled="disabled"></td>

			</tr>
			<tr>
				<th>성별</th>
				<th><input type="radio" name="gender" value="남" <%=gender%>>&nbsp;&nbsp;남</th>
				<th><input type="radio" name="gender" value="여" <%=gender%>>&nbsp;&nbsp;여</th>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td colspan="2">
					<input class="phone" type="text" value="">
					<label class="dash">-</label>
					<input class="phone" type="text" value="">
					<label class="dash">-</label>
					<input class="phone" type="text" value="">
				</td>
				<th rowspan="2">정보수정일</th>
				<td rowspan="2"><input type="text" value="" disabled="disabled"></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td colspan="2"><input type="tel" value=""></td>
			</tr>
			<tr>
				<th>이메일 <!-- 카카오톡 ID? --></th>
				<td colspan="2"><input type="text" value=""></td>
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