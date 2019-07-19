<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, member.model.vo.*, common.PageInfo"%>

<%
	ArrayList<Member> list = new ArrayList<>();/*  (ArrayList<Member>) request.getAttribute("member"); */
	Member member = new Member();
	list.add(member);
	list.add(member);
	list.add(member);
	list.add(member);
	list.add(member);
	list.add(member);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<%-- css 호출 --%>
<link rel="stylesheet" href='<%=request.getContextPath()%>/css/admin.css'>
<%-- jQuery 호출 --%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

	<%-- 헤더 여백 --%>
	<div class="emptyHeader"></div>
	
	<%-- 검색 기능 영역 --%>
	<form class="search" action="<%=request.getContextPath()%>/searchMem.admin" method="post">
		<input type="search" name="search">
		<button type="submit">검색</button>
	</form>
	
	<br><br>
	
	<%-- 회원정보조회, 등급 수정, 관리자 권한부여 --%>
	<div class="resultArea">
		<%-- 회원정보조회 실패 --%>
		<% if (list.isEmpty()) {%>
		조회 결과가 없습니다.
		<%} else {%>
			<%-- 회원정보조회, 10개 ~ 15개 보이게끔 페이징 처리 --%>
			<table class="memList">
				<tr>
					<th class="th">ID</th>
					<th class="th">이름</th>
					<th class="th">생년월일</th>
					<th class="th">연락처</th>
					<th class="th">성별</th>
					<th class="th">주소</th>
					<th class="th">등급</th>
					<th class="th">회원가입일</th>
					<th>작업</th>
				</tr>
			<%for (int i = 0; i < list.size(); i++) {%>
				<tr>
					<td>
						<input type="hidden" value="<%=member.getId()%>">
						<%=member.getId()%>
					</td>
					<td><%=member.getName()%></td>
					<td><%=member.getBirth()%></td>
					<td><%=member.getPhone()%></td>
					<td><%=member.getAddress()%></td>
					<td><%=member.getGender()%></td>
					<td><%=member.getGrade()%></td>
					<td><%=member.getRegDate()%></td>
					<td>
						<%-- 디테일 뷰 짜야함. --%>
						<select class="select">
							<option value="0">-----</option>
							<option value="1">상세정보조회</option>
							<option value="2">회원정보수정</option>
							<option value="3">등급변경</option>
							<option value="4">관리자 권한부여</option>
						</select>
					</td>
				</tr>
			<%}%>
			</table>
			<%-- 페이징처리해야함 --%>
			<script>
				$('.select').on('change', function(){
					console.log("123");
				})
			</script>
		<%}%>
	</div>
</body>
</html>