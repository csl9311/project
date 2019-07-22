<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, member.model.vo.*, common.PageInfo"%>

<%
	ArrayList<Member> list = new ArrayList<>();/*  Member loginUser = request.getAttribute("loginUser"); */
	Member member1 = null;
	for (int i = 0; i < 10; i++) {
		member1 = new Member();
		member1.setId("a" + i);
		list.add(member1);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<%-- css 호출 --%>
<link rel="stylesheet" href='<%=request.getContextPath()%>/css/admin/admin.css'>
<%-- jQuery 호출 --%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<%@include file="/views/common/coinheader.jsp"%>
<body>

	<%-- 헤더 여백 --%>
	<div class="emptyHeader"></div>
	
	<%-- 검색 영역 --%>
	<div class="content">
	<form class="search" action="<%=request.getContextPath()%>/searchMem.admin" method="get">
		<input type="search" name="search">
		<button type="submit">검색</button>
	</form>

	<br>
	<br>

	<%-- 회원정보조회, 등급 수정, 관리자 권한부여 --%>
	<div>
		<%-- 회원정보조회 --%>
		<%
			if (list.isEmpty()) {
		%>
		<h3>조회 결과가 없습니다.</h3>
		<%
			} else {
		%>
		<table class="memberList">
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>연락처</th>
				<th>성별</th>
				<th>주소</th>
				<th>등급</th>
				<th>회원가입일</th>
				<!-- 영역 클릭 시 정렬 -->
			</tr>
		</table>
		<%
			for (int i = 0; i < list.size(); i++) {
					Member member = list.get(i);
		%>
		<form action="" method="post">
			<table class="memberList">
				<tr onclick="trClick<%=i%>();">
					<td><input id="memberId<%=i%>" type="hidden" value="<%=member.getId()%>"><%=member.getId()%></td>
					<td><%=member.getName()%></td>
					<td><%=member.getBirth()%></td>
					<td><%=member.getPhone()%></td>
					<td><%=member.getAddress()%></td>
					<td><%=member.getGender()%></td>
					<td><%=member.getGrade()%></td>
					<td><%=member.getRegDate()%></td>
					<%-- 클릭 시 상세정보조회, 회원정보수정, 등급변경, 관리자 권한부여 --%>
				</tr>
			</table>
		</form>
		<%
			}
		%>

		<%
			}
		%>
	</div>
	<script>
		<%for (int i = 0; i < list.size(); i++) {
				Member member = list.get(i);%>
			function trClick<%=i%>(){
				var id = document.getElementById("memberId<%=i%>");
				if('<%=member.getId()%>' == id.value) {
					<%
						request.setAttribute("member", member);
					%>
					location.href="<%=request.getContextPath()%>/views/admin/adminMember/memberDetail.jsp";
				}
			}
		<%}%>
	</script>
	</div>
</body>
</html>
