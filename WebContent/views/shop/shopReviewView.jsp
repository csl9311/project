<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "shop.model.vo.*, product.model.vo.*, java.util.*" %>
<%
	String pId = request.getParameter("pId");
	String pName = (String)(request.getParameter("pName"));
	String rId = request.getParameter("rId");
	String rContent = (String)(request.getParameter("rContent"));
	System.out.println(pId);
	System.out.println(rId);
%>

<!DOCTYPE html>
<html>
<head>
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>shopReviewView</title>
<style type="text/css">
*:focus {
	outline: none;
}

body{
	margin: 0;
	padding: 0;
	overflow: hidden;
}
#Index {
	width: 600px;
	display: flex;
	justify-content: center;
	background-color: rgb(42, 45, 52);
}

.pointer {
	cursor: pointer;
}

#wrap {
	width: 90%;
	color: rgb(210, 210, 210);
	position: relative;
	display: flex;
	flex-direction: column;
	justify-content: center;
	height: 700px;
}

#submitForm{
	width: 90%;
	height: 100%;
}
#upper {
	margin-top: -3%;
	width: 100%;
	border-bottom: 2px solid rgb(210, 210, 210);
	text-align: center;
}

#upper p {
	font-size: 1.3rem;
}

.button_close {
	display: inline-block;
	width: 5vw;
	height: 5vh;
	background: none;
	font-size: 1.5rem;
	font-weight: 100;
	border: none;
	color: rgb(210, 210, 210);
	position: absolute;
	top: 1.5vh;
	right: 1vw;
}

#selected_info {
	display: flex;
	margin-bottom: 5%;
	margin-top: 5%;
}

img {
	width: 10vw;
	height: 10vh;
	margin: 1vw;
}

#item_info {
	margin-left: 2	%;
	font-size: 0.9rem;
}

#score {
	width: 100%;
	height: 10vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

#star_area img {
	width: 15px;
	height: 15px;
	padding: 0;
	margin: 1%;
}

.review {
	width: 100%;
	display: flex;
	justify-content: center;
	margin-bottom: 5%;
}

#review_textarea {
	display: block;
	width: 100%;
	height: 100%;
	background-color: rgb(75, 75, 75);
	padding: 2%;
	background-color: rgb(75, 75, 75);
}

#review_textarea textArea {
	background-color: rgb(75, 75, 75);
	width: 90%;
	height: 40vh;
	border: none;
	resize: none;
	border: none;
	color: rgb(210, 210, 210);
	border: none;
}

#review_attach {
	width: 100%;
	display: flex;
	justify-content: center;	
	align-content: center;
	margin-bottom: 5%;
	margin-top: 10%;
}
#review_attach_inner{
	width: 100%;
	display: inline-flex;
}

#review_attach #thumUl {
margin: 0; padding: 0;
	display: flex;
	width: 59%;
}

#review_attach #submitUl {
margin: 0; padding: 0;
	display: flex;
	width: 41%;
}

#review_attach #thumUl li{
	display: inline-flex;
	width: 100%;
}
#review_attach #submitUl li{
	display: inline-flex;
	width: 100%;
}

.add_thmb {
	width: 95%;
	height: 50px;
	/* background: none; */
	border: none;
}

#submitBtn, #cencleBtn {
	width: 100%;
	height: 50px;
	background-color: rgb(25, 75, 75);
	border: none;
	color: rgb(210, 210, 210);
	margin-left: 1vw;
	cursor: pointer;
}
#cencleBtn {
	background-color: rgb(75, 75, 75);
}

</style>
</head>
<body>
	<div id="Index">
		<div id="wrap">
			<!-- <form id="submitForm" name="submitForm" action="/updateReview.do" onsubmit="return cfmSubmit();"> -->
				<input type="hidden" id="pId" name="pId"> <input type="hidden"> <input type="hidden"> <input type="hidden"> <input type="hidden"> <input type="hidden"> <input type="hidden"> <input type="hidden"> <input type="hidden"> <input type="hidden">
				<div id="upper">
					<p>상품평 작성</p>
					<button class="button_close" type="button" onclick="self.close();">X</button>
				</div>
				<div id="selected_info">
					<div id="selecetd_img">
						<img alt="상품명" src="../../img/shopImg/photo2.jpg">
					</div>
					<div id="item_info">
						<p id="item"><%=pName%></p>
						<span id="decs"></span>
					</div>
				</div>
				<div class="review">
					<div id="review_textarea">
						<textArea id="textArea" placeholder="상품평 내용(최대 2000자)을 입력해 주세요."><%=rContent%></textArea>
						<span id="byteCheck">0</span>
						<script>
							String.prototype.bytes = function() {
							 var msg = this;
							 var cnt = 0;
							//한글이면 2, 아니면 1 count 증가
							 for( var i=0; i< msg.length; i++) 
							  cnt += (msg.charCodeAt(i) > 128 ) ? 2 : 1;  
							 return cnt;
							}

							//textarea에서 키를 입력할 때마다 동작
							$("#textArea").keyup(function( e ){
							 msg_length = $(this).val().bytes(); 
							
							 if( msg_length <= 3999 ) {     
							  $("#byteCheck").css("color", "#9e9b9b");    
							  $("#byteCheck").html(parseInt(msg_length/2));  
							 }
							 else {
							  $("#byteCheck").css("color", "#E55451");   
							  $("#byteCheck").html(parseInt(msg_length/2));   
							 }
							});
						</script>
					</div>
				</div>
			
				<div id="review_attach">
				<div id="review_attach_inner">
						<ul id="thumUl">
							<li>
								<button type="button" class="add_thmb" onclick="">PHOTO<br>UPLOAD</button>
							</li>
							<li>
								<button type="button" class="add_thmb" onclick="">PHOTO<br>UPLOAD</button>
							</li>
							<li>
								<button type="button" class="add_thmb" onclick="">PHOTO<br>UPLOAD</button>
							</li>
						</ul>
						<ul id="submitUl">
							<li><button type="button" id="submitBtn">등록</button></li>
							<li><button type="button" id="cencleBtn" onclick="self.close();">취소</button></li>
						</ul>
					</div>
				</div>
		<!-- 	</form> -->
		</div>
	</div>
	<script>
		$('#submitBtn').on('click', function(){
			if(confirm("정말 수정하시겠습니까?")){
			var rId = '<%=rId%>';
			var content = $("#textArea").val();
			var rContent = content.trim();
			
			$.ajax({
				url: "<%=request.getContextPath()%>/updateReview.do",
				type: "post",
				data: {rId:rId, rContent:rContent},
				success:function(data){
					if(data.result > 0) {
						alert("수정에 성공했습니다!");
						window.opener.location.reload();
						self.close();
					} else {
						alert("수정에 실패했습니다.");	
					}
				}
			})
			}
		});
		
	</script> 
</body>
</html>