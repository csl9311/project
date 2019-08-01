<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="community.model.vo.*,community.model.dao.* ,java.util.*,common.* "%>

<%
		ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
 		PageInfo pi = (PageInfo)request.getAttribute("pi");
 		Board search = (Board)request.getAttribute("search");
 		int listCount = pi.getListCount();
		int currentPage = pi.getCurrentPage();
		int maxPage = pi.getMaxPage();
		int startPage = pi.getStartPage();
		int endPage = pi.getEndPage(); 
		
		String inputsearch = search.getbContent(); 
		System.out.println("인풋"+inputsearch);
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/views/common/coinheader.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/community/freeBoardView.css">
<style>
CSS
#aviThumbnail {
	
}

.paging a {
	color: white;
}
</style>
</head>
<body>
	<div class="main" style="text-align: center">
		<span style="padding-right: 10vw">자유게시판</span> <span>영상게시판</span>
	
	
		<div class="aviCommonBoard" style="text-align:center" >
		
			<div class="searchAviArea" align="right" style="width:100%">
			<div style="width:auto;font-size:14px">
			<form action="list.bo" id="search" method="post">
			
			<!-- <input type="text" id="searchList" name="search" style="width:13vw;border:0;border-bottom:1px solid gray;"placeholder="검색창입니다." >  -->
	 <%if(inputsearch =="" ||inputsearch ==null){ %> 
			<input type="text" id="searchList" name="search" style="width:13vw;border:0;border-bottom:1px solid gray;"placeholder="검색창입니다." >
				<%}else{ %>
			<input type="text" id="searchList" name="search" style="width:13vw;border:0;border-bottom:1px solid gray;"placeholder="검색창입니다." value=<%=inputsearch %>>	
				<%} %>
			<span  style="cursor:pointer" id="goSearch" >검색</span>
			</form>
			</div>
			</div>
			<div style="text-align:center;width:80vw">
			<div class="aviBoardList" style="text-align: left;height:auto">

				<%
					//youtube 주소  id값따오기
					String address = "A5AmE_b68cg";

					for (Board b : list) {

						String adr = b.getbAddress().replaceAll("\'", "\"");

						String[] arr = adr.split("/");
						String[] arr2 = arr[4].split("\"");
						System.out.println(arr2[0]);
						
						
				%>
				<div class="aviList"
					style="width: 20vw; height: 10vh; display: inline-block; margin: 3.5%; text-align: left;">
				
						<table id="avilistSelect">
							<tr>
								<td >
								<input type="hidden" value="<%=b.getBid()%>">
									<div class="aviThumbnail"
										style="width: 100%; height: 50%; margin: auto; display: inline-block">
										<img src="https://img.youtube.com/vi/<%=arr2[0]%>/0.jpg">
									</div>
								</td>
							</tr>

							<tr>
								<td>
									<div class="aviTitle">
										 <span
											style="text-align: left"><%=b.getbTitle()%> </span>
									</div>
								</td>
							</tr>

							<tr>

								<td>
									<div class="aviwriter">
										<span style="font-size: 10px"><%=b.getbWriter()%></span>
									</div>
								</td>
							</tr>

							<tr>

								<td>
									<div>
										<span style="font-size: 9px">조회수 :<%=b.getbCount()%>회</span>
										<span style="font-size: 9px; align:left"> &nbsp;&nbsp; 추천 :<%=b.getbGood()%>회</span>
									</div>
								</td>
							</tr>

						</table>
						<br>
				


				</div>

				<%
					}
				%>

			</div>
		
</div>

		</div>
		
		
	 <div class="pagingArea" align="center" >
		 	<%if(!list.isEmpty()){ %>
		 	
		 	<!-- 맨처음으로 -->
		 	<button onclick="location.href ='<%= request.getContextPath() %>/list.bo?currentPage=1&search=<%=inputsearch%>'">
		 		&lt;&lt;
		 	</button>
		 	
		 	<!-- 이전페이지로 -->
		 	<button id="beforeBtn" onclick ="location.href='<%= request.getContextPath()%>/list.bo?currentPage=<%= currentPage -1%>&search=<%=inputsearch%>'">&lt;</button>
		 	<script>
		 		if(<%= currentPage%><=1){
		 			$('#beforeBtn').attr("disabled","true");
		 		}
		 	</script>
		 	<!-- 10개의 페이지목록 -->
		 	<% for(int p = startPage; p<= endPage; p++) {%>
		 		<%if(p == currentPage){ %>
		 			<button id="choosen" disabled style="color:#34c6eb"><%= p %> </button>
		 		
		 			<%} else{ %>
		 				<button id="numBtn" onclick="location.href ='<%=request.getContextPath()%>/list.bo?currentPage=<%=p%>&search=<%=inputsearch%>'"><%= p %></button>
		 		<%} %>
		 	<%} %>
		 	
		 	<!-- 다음 페이지로 -->
		 	
		 	<button id="afterBtn" onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%=currentPage+1%>&search=<%=inputsearch%>'">&gt;</button>
		 	<!-- 맥스 페이지일때 다음페이지 활성화 하지않게하기위한 script -->
		 	<script>
		 		if(<%= currentPage%> >= <%= maxPage%>){
		 			 $('#afterBtn').attr('disabled','true');
		 		}
		 	</script>
		 	<!-- 맨 끝으로 -->
		 	<button onclick = "location.href = '<%= request.getContextPath() %>/list.bo?currentPage=<%= maxPage %>&search=<%=inputsearch%>'">&gt;&gt;</button>
		 <%} %>
		 
		
		 <br>
		 </div>
 <div class="searchArea" align="center">
		 	<% if(loginUser !=null){ %>
				<button class="btn-primary" style="margin-top: 15px; background:default"
			onclick="location.href='<%=request.getContextPath()%>/views/community/aviBoardInsertView.jsp'">글쓰기</button>
		 	
		 	<% } %>
		 </div>
		 <br>
	</div>
	


	<script>
		$().each(
				function() {
					if (/^https?:\/\/www.youtube.com\/embed\//g.test($(this)
							.attr("src"))) {

						var add = this.src;
						var arr = add.split('/');

					}
				});
		
		
		$(function(){
			$('#avilistSelect td').mouseenter(function(){
		
			}).click(function(){
				console.log("ㅅㅂ");
				var bid = $(this).children('input').val();
				console.log(bid);
			<%-- 	<%if(loginUser !=null){ %> --%>
			 location.href="<%= request.getContextPath() %>/avidetail.bo?bid="+bid; 
				<%-- <%}else{ %>
					alert("회원만 이용할 수 있는 서비스 입니다");
				<%}%> --%>
			});
		});
		
		$('#goSearch').click(function(){
			$(this).closest('#search').submit();
			console.log("검색");
			var search = $('#searchList').val();
			
			
	/* 		$.ajax({
				
				url:"list.bo",
				type:"post",
				data:{search:search},
				success: function(data){
				
					
					
					
				}
	});*/
	
			
		});
	</script>
</body>

<%@ include file="/views/common/coinfooter.jsp"%>
</html>