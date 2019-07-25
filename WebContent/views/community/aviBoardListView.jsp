<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	width: calc(100% - 150px);
}
.paging a{
color:white;
}
</style>
</head>
<body>
	<div class="main">
		<span style="padding-right:10vw">자유게시판</span>
		<span>영상게시판</span>
		<div class="aviCommonBoard">
		
			<div class="aviBoardList">

				<%
					//youtube 주소  id값따오기
					String address = "A5AmE_b68cg";
					/* String address = null; */
					for (int i = 0; i < 9; i++) {
				%>
				<div class="aviList"
					style="width: 20vw; height: auto; display: inline-block; margin: 3%; text-align: left;"
					onclick="location.href='<%=request.getContextPath()%>/views/community/aviBoardDetailView.jsp'">
					<div>
						<table>
							<tr>
								<td>
									<div class="aviThumbnail"
										style="width: 100%; height: 50%; margin: auto; display: block">
										<img src="https://img.youtube.com/vi/<%=address%>/0.jpg">
									</div>
								</td>
							</tr>

							<tr>
								<td>
									<div class="aviTitle">
										<span style="text-align: left">제목입니다 </span>
									</div>
								</td>
							</tr>

							<tr>

								<td>
									<div class="aviwriter">
										<span style="font-size: 10px">작성자</span>
									</div>
								</td>
							</tr>

							<tr>

								<td>
									<div>
										<span style="font-size: 9px">조회수</span>
									</div>
								</td>
							</tr>

						</table>
						<br>
					</div>

				
				</div>

				<%
					}
				%>


	<div class="paging" >

						<a href="#" class="btn_arr first"><span class="hide">처음페이지</span></a>
						<a href="#" class="btn_arr prev"><span class="hide">이전페이지</span></a>
						
						<!-- D : 활성화페이지일 경우 : on 처리 -->
						<a href="#">	
&#60;</a><a href="#" class="on">1</a>
						<a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
												<a href="#">	
&#62;</a>
						<a href="#" class="btn_arr next"><span class="hide">다음페이지</span></a>
						<a href="#" class="btn_arr last"><span class="hide">마지막페이지</span></a>
					</div>
			</div>

			<button style="margin-top:15px; color:black;"
				onclick="location.href='<%=request.getContextPath()%>/views/community/aviBoardInsertView.jsp'">글쓰기</button>
		</div>




	</div>

	<script>
		$().each(
				function() {
					if (/^https?:\/\/www.youtube.com\/embed\//g.test($(this)
							.attr("src"))) {

						var add = this.src;
						var arr = add.split('/');
						console.log(arr[4]);

					}
				});
	</script>
</body>

<%@ include file="/views/common/coinfooter.jsp"%>
</html>