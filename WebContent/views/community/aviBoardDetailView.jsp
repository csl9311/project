<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ page import = "community.model.vo.Board" %>
    <% Board board = (Board)request.getAttribute("board"); %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/views/common/coinheader.jsp"%>
<style>
main {
	font-size: 15px;
}

ul{
	list-style:none;
	padding-left:0px;
}
</style>
</head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/community/freeBoardView.css">
<body>




	<div class="main">
		<div class="subpage">
			<table>
				<tr>
					<td><input type="text"
						style="width: 80vw; background: none; color: white;  border:0;focus:outline=none;"
						placeholder="제목창" value="<%=board.getbTitle() %>" readonly
						>
						<hr style="border:1px solid gray">
							<span style="float:right; font-size:14px;margin-top:3px">조회수:<%=board.getbCount()+1 %> </span>
							<br>
						</td>
						
				</tr>

				<tr>
					<td><div class="aviBoard" 
							style="width: 80vw;text-align:left; margin: 5px; display: inline-block;">
								<%=board.getbAddress() %>
						
							<div class="aviContent mar" style="text-align: left; ">
							<textarea id="avicontent"
								style="width: 100%; height: auto; overflow-y: hidden; margin-top: 8px;  background: none; color: white; border: 0 ; "><%=board.getbContent() %>
								
								</textarea>
								<div class="divparent">
									<div class="good">
												<button class="goodbtn">추천</button> 
										
										</div>
										</div>
										
								<div class="updatedeletebtn" style="float:right;display:none">
									<button onclick="location">수정</button> <button>삭제</button>
								
								
								</div>
						</div>

							<hr style="border:1px solid gray">
							<div style="font-size:14px; margin-top:5px; text-align:left; float:right">
							
						 <span style="">작성자 : <%=board.getbWriter()%></span><br>
						 <span style="">작성일 : <%=board.getModifyDate()%></span> 
							<br><span>추천수 :</span><span id="goodbtn" style=" margin-bottom:1vh">  <%=board.getbGood() %></span>
							</div>
								
						</div></td>
				</tr>
				<tr>
					<td>
						<div style=" width: 80vw; margin-bottom: 5px;display: inline;">


							<textarea
								style="width: 69.5vw; min-height: 10vh; overflow-y: hidden; resize: none; background: none; color: white;border:0"
								onkeyup="resize(this)"  placeholder="댓글창입니다."></textarea>

							<button class="btn-primary"
								style="width: 10vw; height: 10vh; vertical-align: top;">등록</button>
						
						
						</div>	
							
					</td>
					
				</tr>

				<tr>
					<td><br>
						<hr style="border:1px solid gray"> <br>
						<div class="readAviReview"
							style="width: 80vw; height: auto; text-align:left; border: 1px solid black; display: inline-block; margin: 5px;
							padding:5px;">
					<!-- 		<table>
								<tr>
									<td class="sm-1"><span>댓글111</span></td>
									<td class="sm-2">김씨</td>
									<td class="sm-3">2019-07-24</td>
								</tr>
								<tr>
									<td class="sm-1"><span>댓글111</span></td>
									<td class="sm-2">김씨</td>
									<td class="sm-3">2019-07-24</td>
								</tr>
								<tr>
									<td class="sm-1"><span>댓글111</span></td>
									<td class="sm-2">김씨</td>
									<td class="sm-3">2019-07-24</td>
								</tr>
							</table> -->
						
							<ul >
							<li style="display:inline-block">
								<span style="font-size:13px;font-weight:bolder;">김개똥</span>
							
								<span style="font-size:10px"> 2019-07-07</span>
							</li>
								<li>
								
								<span>아이십자</span>
								</li>
							
							</ul>
							
							
								<ul >
							<li style="display:inline-block">
								<span style="font-size:13px;font-weight:bolder;">뭔데</span>
							
								<span style="font-size:10px"> 2019-07-07</span>
							</li>
								<li>
								
								<span>노래안부름?</span>
								</li>
							
							</ul>
						</div>
					</td>
				</tr>

			</table>

		</div>
	</div>

</body>

<script type="text/javascript">
	//youtube link size 변환
	
	$(window).resize(function() {
		resizeYoutube();
	});
	$(function() {
		resizeYoutube();
	});
	function resizeYoutube() {
		$("iframe").each(
				function() {
					if (/^https?:\/\/www.youtube.com\/embed\//g.test($(this).attr("src"))) {
				
						var add=this.src;
						var arr = add.split('/');
						console.log(arr[4]);
						$(this).css("width", "100%");
						$(this)
								.css(
										"height",
										Math
												.ceil(parseInt($(this).css(
														"width")) * 480 / 854)
												+ "px");
					}
				});
	}

	function resize(obj) { //area

		obj.style.height = "1px";

		obj.style.height = (20 + obj.scrollHeight) + "px";

	}
	
	
	
	$(document).ready(function()
			{
			       var tar = document.getElementById('avicontent');
			       console.log(tar);
			    
			    
			              tar.style.height = tar.scrollHeight+"px";
			            
			      
			});
	
	
	$('.goodbtn').click(function(){
			console.log("추천함");
			var add = <%=board.getbGood()+1 %>;
			$('#goodbtn').text(add);
			
	});
	
	$(function(){
		
		$('.goodbtn').clcick(function(){
			
			$.ajax({
				url: "avidetail.bo",
				type: "post",
				data {
					
					bno: $(board.)
					
				}
				
			})
			
		})
	})
</script>
<%@ include file="/views/common/coinfooter.jsp"%>
</html>

