<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	background-color: rgb(40, 44, 52) !important;
}
.mainArea{
	width: 
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1.0">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<%@include file="../common/coinheader.jsp" %>
<body>
<div class="mainArea">
	<div class="container">
		 <div class="row">
		 	<form method="post" action="writeAction.jsp">
			 	<table class="table table-striped" style="text-align:center; border:1px; solid #dddddd">
			 		<thead>
						<tr>
							<th colspan="1" style="background-color:#eeeeee; text-align: center;">게시글 작성</th>
						</tr>		 		
			 		</thead>
			 		<tbody>
			 			<tr>
			 				<td><input type="text" class="form-control" placeholder="글제목" name="bbsTitle" maxlength="50"></td>
			 			</tr>
			 			<tr>	
			 				<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px"></textarea> </td>
			 			</tr>	
			 		</tbody>
			 	</table>
				 	<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>
		 </div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
<script src="js/bootstrap.min.js"></script> 
</body>

<%@ include file="../common/coinfooter.jsp"%>
<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/header.js"></script>
</html>