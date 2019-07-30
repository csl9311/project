<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ page import = "community.model.vo.*, java.util.* " %>

    <% Board board = (Board)request.getAttribute("board");
    Member loginInfo = (Member) session.getAttribute("loginUser");
    ArrayList<Reply> list = (ArrayList<Reply>) request.getAttribute("list");
    
	String arr = board.getbAddress().replaceAll("\"","\'");
	System.out.println(arr);
   
    %>
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
	<form action="views/community/aviBoardUpdateView.jsp" id="detailForm" method="get">
			<table>
				
				<tr>
				
					<td>
						<input type="hidden" name="bid" value="<%=board.getBid() %>">
					<input type="text"
						style="width: 80vw; background: none; color: white;  border:0;focus:outline=none;"
						placeholder="제목창" name="title" value="<%=board.getbTitle() %>" readonly>
						<hr style="border:1px solid gray">
							<span style="float:right; font-size:14px;margin-top:3px">조회수:<%=board.getbCount()+1 %> </span>
							<br>
						</td>
						
				</tr>

				<tr>
					<td><div class="aviBoard" 
							style="width: 80vw;text-align:left; margin: 5px; display: inline-block;">
								<%=board.getbAddress()%>
							<div class="aviContent mar" style="text-align: left;">
							<input type="hidden" name="address" value="<%=arr%>">
							<input type="hidden" name ="content" value="<%=board.getbContent()%>">
							<textarea id="avicontent"
								style="width: 100%; height: auto; overflow-y: hidden; margin-top: 8px;  background: none; color: white; border: 0 ; "readonly><%=board.getbContent()%></textarea>
								<div class="divparent">
									<div class="good">
												<button class="goodbtn"type="button">추천</button> 
											
										</div>
										</div>
										<div style="margin-bottom:40px;">
								<div class="updatedeletebtn" style="float:right; display:none; ">
									<button class="edit boardEdit" type="submit">수정</button> <button class="edit boardDelete"type="button" onclick="deleteBoard();">삭제</button>
								</div>
								
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
								class="contentarea" style="width: 69.5vw; min-height: 10vh; overflow-y: hidden; resize: none; background: none; color: white;border:0"
								onkeyup="resize(this)"  placeholder="댓글창입니다."></textarea>
						
							<button class="btn-primary" id="insertReply" type="button"
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
		
					<% if(list.isEmpty()){ %>
							<span>댓글이없습니다. 댓글을 등록해주세요!</span>
							
						 <% }else{ %>
							<%
							for (int i = 0; i < list.size(); i++) {
							%>
							<div id="replycontent">
							<ul >
							<li style="display:inline-block">
								<span style="font-size:13px;font-weight:bolder;"><%=list.get(i).getrWriter() %></span>
							
								<span style="font-size:10px"><%=list.get(i).getModifyDate() %></span>
							</li>
								<li>
								
								<span><%=list.get(i).getrContent()%></span>
								</li>
							
							</ul>
							</div>
							<%} %>
							<%} %>  
							
							
							
						</div>
					</td>
				</tr>

			</table>
		</form>
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
			    		
			 
			              tar.style.height = tar.scrollHeight+"px";
			            
			      
			});

		
		$('.goodbtn').click(function(){ //추천
			<%if (loginUser != null) {%>
				
			var writer = '<%= loginInfo.getId()%>';
			var bid ='<%=board.getBid()%>'
			var bwriter = '<%= board.getbWriter()%>'
			
			
			$.ajax({
				url: "avigood.bo",
				type: "post",
				data: {writer:writer,bid:bid,bwriter:bwriter},
				success: function(data){
					
					console.log("성공");
					var add = <%=board.getbGood()+1 %>
					$('#goodbtn').text(add);
				},
				error: function(data){
					console.log("에러입니다.");
					alert("이미 추천한 글입니다.");
					
				}
				
			});
				<%}else{%>
				 $("#login-modal").modal();
				<%}%>
	
		
		});
		
		$('.contentarea').click(function(){
			<%if (loginUser == null) {%>
			 $("#login-modal").modal();
			 
			 <%}else{%>
			 
			 
				$('#insertReply').click(function(){
					var content = $('.contentarea').val();
					
					if(!($.isEmptyObject(content))){	
					var bid ='<%=board.getBid()%>';
					var writer ='<%=loginInfo.getNickName()%>'; 
					content = replaceAll(content,"\n", "<br>");
					console.log(content);
					console.log(bid);
					console.log(writer);
					
					$.ajax({
						
						url: "insertreply.bo",
						type: "post",
						data: {writer:writer,content:content,bid:bid},
						success: function(data){
						
							
							
					}
					
				});
				
					location.reload();
					}else{
						
						console.log("댓글없으면 값안넣어줌");
						
					}	
					
		});
				
		<%} %>
	
		});
		
		function replaceAll(str,searchStr,replaceStr){
			return str.split(searchStr).join(replaceStr);
		}
		
	
		$(document).ready(function(){
			
			<%if(loginUser != null){ %>
			<%if(loginUser.getNickName().equals(board.getbWriter())) {%>
				 $('.updatedeletebtn').css("display","inline-block");
			<%}%>
		
			
		<%-- 	$('.boardEdit').click(function(){ 
				var bid = '<%=board.getBid() %>';
				var title ='<%=board.getbTitle()%>';
				console.log('<%=board.getbContent()%>');
				var modifyDate ='<%=board.getModifyDate()%>';
				var write ='<%=board.getbWriter()%>';
				var address ='<%=board.getbAddress()%>';
				
				$.ajax({
					url: "<%=request.getContextPath()%>/views/community/aviBoardUpdateView.jsp",
					type:"post",
					data:{bid:bid,title:title,
						modifyDate:modifyDate,write:write,address:address},
					success: function(data){
						location.href="<%=request.getContextPath()%>/views/community/aviBoardUpdateView.jsp";
						console.log("dd");
						
					}
				});
				
			});
			 --%>
			
			<%}%>
		});
		
		function deleteBoard(){
			var bool = confirm("정말로 삭제하시겠습니가?");
			
			if(bool){
			location.href='<%= request.getContextPath( )%>/delete.bo?no=' + <%=board.getBid() %>;
			}
		}
			
		
	

</script>
<%@ include file="/views/common/coinfooter.jsp"%>
</html>

