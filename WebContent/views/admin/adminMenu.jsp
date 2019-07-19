<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/admin.css" />
</head>
<body>

	<div class="emptyHeader">
		헤더여백
	</div>
	<div>
		<nav>
			<!-- 회원관리 : 회원정보 RUD, 등급 설정, 블랙리스트 등록 및 해제 -->
			<div class="menu" onclick="location.href='<%=request.getContextPath()%>/views/admin/admin_memberView.jsp'">회원관리</div>
			<!-- 상픔목록 CRUD -->
			<div class="menu" onclick="location.href='<%=request.getContextPath()%>/views/admin/admin_productView.jsp'">상품관리</div>
			<!-- 배송관리 -->
			<div class="menu" onclick="location.href='<%=request.getContextPath()%>/views/admin/admin_deliveryView.jsp'">배송관리</div>
			<!-- 공지 CRUD, QNA CRUD -->
			<div class="menu" onclick="location.href='<%=request.getContextPath()%>/views/admin/admin_noticeView.jsp'">공지,QNA</div>
			<!-- 신고 된 게시글 조회, 삭제 -->
			<div class="menu" onclick="location.href='<%=request.getContextPath()%>/views/admin/admin_reportedView.jsp'">게시물 관리</div>
			<!-- 통계 : 광고 재생 수, 기간 별 신규 가입 -->
			<div class="menu" onclick="location.href='<%=request.getContextPath()%>/views/admin/admin_statsView.jsp'">통계</div>
			<!-- 결제정보조회 -->
			<!-- 사업장 정보 조회 수정 삭제 -->
		</nav>
	</div>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</body>
</html>