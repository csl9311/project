<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.ArrayList, member.model.vo.*, common.PageInfo"%>

<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("memberList");
	String msg = (String)request.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<%-- css 호출 --%>
<link rel="stylesheet" href='<%=request.getContextPath()%>/css/admin/admin.css'>
<style type="text/css">
.resultList tr :hover {
	cursor: pointer;
	color: gray;
}

.resultList tr th,td {
	width: 12vw;
	font-size: 12px;
	padding: 0px;
	color: white;
}
</style>

<%-- jQuery 호출 --%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<%-- <%@include file="/views/common/coinheader.jsp"%> --%>
<body>
	<div class="content">

		<%-- 헤더 여백 --%>
		<div class="emptyHeader"></div>

		<%-- 검색 영역 --%>
		<form class="search" action="<%=request.getContextPath()%>/searchMem.admin" method="get">
			<input type="search" name="search">
			<button type="submit">검색</button>
		</form>

		<br> <br>

		<%-- 회원정보조회, 등급 수정, 관리자 권한부여 --%>
		<div class="memberList">
			<%-- 회원정보조회 --%>
			<% if (list.isEmpty()) {%>
				<h3>조회 결과가 없습니다.</h3>
			<%} else {%>
			<table class="resultList">
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>연락처</th>
					<th>성별</th>
					<th>주소</th>
					<th>등급</th>
					<th>회원가입일</th>
					<th>포인트</th>
					<!-- 영역 클릭 시 정렬 -->
				</tr>
			</table>
			<%
				for (int i = 0; i < list.size(); i++) {
						Member member = list.get(i);
			%>
			<hr>
			<table class="resultList">
				<tr onclick="trClick<%=i%>();">
					<td><input id="memberId<%=i%>" name = "name" type="hidden" value="<%=member.getId()%>"><%=member.getId()%></td>
					<td><%=member.getName()%></td>
					<td><%=member.getBirth()%></td>
					<td><%=member.getPhone()%></td>
					<td><%=member.getAddress()%></td>
					<td><%=member.getGender()%></td>
					<td><%=member.getGrade()%></td>
					<td><%=member.getRegDate()%></td>
					<td><%=member.getPoint()%></td>
					<%-- 클릭 시 상세정보조회, 회원정보수정, 등급변경, 관리자 권한부여 --%>
				</tr>
			</table>
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
					location.href="<%=request.getContextPath()%>/admin.memberDetail?memberId=<%=member.getId()%>";
				}
			}
		<%}%>
		
		(function(){
			if(<%=msg != null%>){
				alert("<%=msg%>");
			}
		})();
	</script>
	</div>
</body>
</html>
