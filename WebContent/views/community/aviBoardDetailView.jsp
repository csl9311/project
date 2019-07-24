<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<div class="subpage"
			style="text-align: center; border: 1px solid black; padding: 10px; margin: 10px; display: inline-block;">
			<table>
				<tr>
					<td><input type="text"
						style="width: 80vw; background: none; color: white; margin-bottom: 8px;"
						placeholder="미형의 유산"></td>
				</tr>

				<tr>
					<td><div class="aviBoard" 
							style="width: 80vw;text-align:left; margin: 5px; display: inline-block;">
							<!--<%=request.getAttribute("Youtube^^address")%>  -->
							<iframe width="811" height="456"
								src="https://www.youtube.com/embed/A5AmE_b68cg" frameborder="0"
								allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>
								
							<div class="aviContent mar">
							<span
								style="width: 100%; height: auto; overflow-y: hidden; margin-top: 8px;  background: none; color: white; border: 0 ; ">
								
								weqeqweqweqwe<br>
								ewqeqweqweqweq <br>
								eqweqweqw<br>
						</span>
						</div>

							<hr>
							<br> <span style="float: right;margin-bottom:3vh">작성자 : <%=request.getAttribute("BoardName")%></span>
								
						</div></td>
				</tr>
				<tr>
					<td>
						<div style=" width: 80vw; margin: 5px;display: inline;">


							<textarea
								style="width: 69.5vw; height: 10vh; overflow-y: hidden; resize: none; background: none; color: white;"
								onkeyup="resize(this) ">댓글창</textarea>

							<button class="btn-primary"
								style="width: 10vw; height: 10vh; vertical-align: top;">등록</button>
							
						</div> <br>
					</td>
				</tr>

				<tr>
					<td>
						
						<div class="readAviReview"
							style="width: 80vw; height: auto; text-align:left; border: 1px solid black; display: inline-block; margin: 5px;">
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
					if (/^https?:\/\/www.youtube.com\/embed\//g.test($(this)
							.attr("src"))) {
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
</script>
<%@ include file="/views/common/coinfooter.jsp"%>
</html>

