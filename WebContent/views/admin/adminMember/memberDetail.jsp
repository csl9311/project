<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member"%>
<%
	Member member = (Member)request.getAttribute("member");
	String gender = "";
	String checked = "";
	String selected = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세정보조회</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin/admin.css" />
</head>
<body>
	<div class="emptyHeader">헤더여백</div>
	<form action="">
		<table class="memberDetail">
			<tr>
				<td>아이디</td>
				<td><input type="text" value="<%-- <%=member.getId()%> --%>" disabled="disabled"></td>
				<td rowspan="2">등급</td>
				<td rowspan="2">
					<select>
						<option>사용자</option>
						<%-- 추후 등급 세분화 할 예정 --%>
						<option>사장님</option>
						<option>관리자</option>
						<option>블랙</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" value=""></td>
				
			</tr>
			<tr>
				<td>생일</td>
				<td><input type="text" value="" disabled="disabled"></td>
				
				<td rowspan="2">회원가입일</td>
				<td rowspan="2"><input type="text" value="" disabled="disabled"></td>
				
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="남">남
					<input type="radio" name="gender" value="여">여
				</td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" value=""></td>
				<td rowspan="2">정보수정일</td>
				<td rowspan="2"><input type="text" value="" disabled="disabled"></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="tel" value=""></td>
			</tr>
			<tr>
				<td>이메일 <!-- 카카오톡 ID? --></td>
				<td><input type="text" value=""></td>
			</tr>
			<tr>
				<td colspan="2"><button type="submit">수정완료</button></td>
				<td colspan="2"><button type="submit">취소</button></td>
			</tr>
		</table>
	</form>
</body>
</html>