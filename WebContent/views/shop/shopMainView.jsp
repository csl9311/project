<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopMainView</title>
</head>
<body>
	<%@ include file="/views/common/coinheader.jsp"%>
	<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
	<img src="<%= request.getContextPath() %>/img/shopImg/photo3.jpg" onclick="goDetail();" width="50%" height="50%">
	<script>
		function goDetail(){
			location.href="<%= request.getContextPath()%>/views/shop/shopDetailView.jsp"
		}
	</script>
</body>
</html>