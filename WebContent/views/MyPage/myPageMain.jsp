<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta charset="utf-8">
<title>마이페이지</title>
<script src="../../js/jquery-3.4.1.min.js"></script>
<%@ include file="/views/common/coinheader.jsp"%>
<%@ include file="Form.jsp"%>
<style>

</style>
</head>
<body >
<div id="mypage">
      <img src="../../img/mypageImg/personal.png" onclick="update()">
      <button class="btn" >작성글 목록</button><br>
      <button class="btn" onclick="shopping()">장바구니</button>
      <button class="btn" >문의 목록</button>
</div>

   
   <script>
      function update(){
         location.href="<%= request.getContextPath()%>/views/MyPage/check.jsp";
      }
      function shopping(){
         location.href="<%= request.getContextPath()%>/views/MyPage/shopping.jsp"
      }
   
   </script>


</body>
   <%@ include file="/views/common/coinfooter.jsp"%>
</html>