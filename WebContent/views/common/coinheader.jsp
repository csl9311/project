<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>메인페이지</title>


<style>

</style>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/header.js?v=<%=System.currentTimeMillis() %>"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/loginForm.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css"> <!-- //트위터 아이콘 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> <!--부트스트랩  -->
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>





</head>


<body id="main">

	<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a onclick="closeNav();">코인노래방 찾기</a>
  <a href="#" class="menu2">메뉴2</a>
  <a href="<%= request.getContextPath()%>/views/shop/shopMainView.jsp">shop</a>
  <a href="#">커뮤니티</a>
  <a href="#">마이페이지</a>
  <a href="#">고객센터</a>
</div>




	<header >
		
		<nav class="navbar navbar-fixed-top" style="z-index:121;">
	
			<span style="font-size:30px;cursor:pointer" onclick="openNav()" class=" top left">&#9776; Menu</span>
		
			<div class="right">
				<!-- <button type="button" class="login btn btn-sm">로그인</button> -->
				<span style="font-size:30px; cursor:pointer"  class="login " data-toggle="modal" data-target="#login-modal">Login</span>
				
				<button type="button" class="logout btn btn-sm none" style="display:none">로그아웃</button>
				<button type="button" class="profile btn btn-sm none"style="display:none">프로필</button>
			</div>
			<h1 class="logo">로고</h1>
		</nav>
	</header>


	<script> 
    


</script>


 

	<!--******************로그인폼 ***************************  -->	

<!-- <div class="login-btn">
<a href="#" class="button" >Login</a>
</div> -->

<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display:none; ">
          <div class="modal-dialog">
                <div class="loginmodal-container">
                    <h1>로그인</h1><br>
                  <form>
                    <input type="text" name="user" placeholder="Username">
                    <input type="password" name="pass" placeholder="Password">
                    <input type="submit" name="login" class="button loginmodal-submit" value="Login">
                  </form>
                    
                  <div class="login-help">
                    <a href="#">Register</a> - <a href="#">Forgot Password</a>
                  </div>
                </div>
            </div>
          </div>


</body>

<!--     <script>
  var Height_Index = Number(document.getElementById("Index").clientHeight);
  window.onload  = changeContentSize;
  window.onresize  = changeContentSize;
  function changeContentSize() {
   var Height_Window   = Number(document.documentElement.clientHeight);
   var Height_Footer   = Number(document.getElementById("myFooter").clientHeight);
   var ContentTop = Height_Window - Height_Footer - 5;
   document.getElementById("Index").style.minHeight = Height_Index + 'px';
   document.getElementById("Index").style.height = ContentTop + "px";
  }
 </script> -->



    



	
</html>