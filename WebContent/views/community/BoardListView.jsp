<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body{
	background-color:rgb(40, 44, 52) !important;
	color: #fff;
}

.bm {
	padding-bottom: 200px;
	color: #000;	
}



.sortArea{
	margin: 24px 0;
	width:100%;
	display: block;
}


@media screen and (max-width: 1024px){
	.sortArea {
	    margin: 0;
	    padding: 0.625rem 1.25rem;
	}
}
.leftA {
	width:100px;
	height:50px;
	display:block;
	padding:0px;
	float:left;
	margin:0px;
	padding:0px;
}
.leftA select{
	width:100%;
	height:70% !important;
}


.notice {
	width: 100%;
	display:block;
}
.infoLine ol ul li {
	list-style:none !important;
	list-style-type: none !important;
}

.title{
    width: 50%;
    box-sizing: border-box;
    color: #000;
}
.infoLine{
	display: block;
}

.sortArea:after {
    display: block;
    content: '';
    height: 0;
    font-size: 0;
    opacity: 0;
    clear: both;
}

.table{
	border-radius: 10px;
}

.contentArea{
	padding-top: 4em;
	padding-bottom: 4em;
	width: 100%;
	
}
.container{
	margin-right: 0px;
}
.bc {
	margin-top: 3em;
	margin-bottom: 2em;
	background-color: #635e6e;
	border-radius: 8px;
	
}

.pagination{
	padding-top: 8px;
}
</style>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@include file="../common/coinheader.jsp" %>
<body>
<div class="container bm">
	<div class="py-5 text-center">
		<img src="../../img/Search/freeBoardTitle.png">
	</div>
	<div class="sortArea">
		<div class="leftA">
			<select class="form-control">
				<option>최신순</option>
				<option>조회순</option>
				<option>댓글순</option>
			</select>
		</div>
		<a class="btn btn-primary pull-right">글쓰기</a>
	</div>
	<!--  -->
	<div class="container bc">
		<div class="contentArea">
			<table class="table table-dark table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>게시글 제목</td>
						<td>작성자</td>
						<td>날짜 2019-07-29</td>
						<td>16</td>				
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td>2</td>
						<td>게시글 제목</td>
						<td>작성자</td>
						<td>날짜 2019-07-29</td>
						<td>56</td>				
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td>3</td>
						<td>게시글 제목</td>
						<td>작성자</td>
						<td>날짜 2019-07-29</td>
						<td>32</td>				
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td>4</td>
						<td>게시글 제목</td>
						<td>작성자</td>
						<td>날짜 2019-07-29</td>
						<td>2</td>				
					</tr>
				</tbody>
			</table>
			<div class="text-center">
				<select class="selectpicker">
				  <option>제목</option>
				  <option>제목 + 내용</option>
				  <option>글쓴이</option>
				</select>
				<input type="text" id="searchText" placeholder="검색할 내용을 입력하세요">
				<input type="submit" id="searchBtn" class="btn btn-success" value="검색">
			</div>
			<div class="text-center">
				<ul class="pagination">
					<li><a href="#">&lt;&lt;</a></li>
					<li><a href="#">&lt;</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">&gt;</a></li>
					<li><a href="#">&gt;&gt;</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!--  -->
	
	
	
	
</div>
</body>
<%@ include file="../common/coinfooter.jsp"%>
<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/header.js"></script>
</html>