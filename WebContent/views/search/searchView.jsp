<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/**    탭 스타일       **/
#searchMain{
	min-height: 500px; 
	margin : 10px;
}
section {
    margin: auto;
    height: 100%;
    
}
section .section-title {
    text-align: center;
    color: rgba(40, 44, 52, 0.5);
    margin-bottom: 50px;
    text-transform: uppercase;
}
#tabs{
	background-color: rgba(40, 44, 52, 0.5);
    color: #eee;
    height: 100%;
}
#tabs h6.section-title{
    color: #eee;
}
#tabs h6.section-title.active{
    background-color: black;
    
}

#tabs .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
    color: #f3f3f3;
    background-color: transparent;
    border-color: transparent transparent #eee;
    border-bottom: 4px solid !important;
    font-size: 20px;
    font-weight: bold;
}
#tabs .nav-tabs .nav-link {
    border: 1px solid transparent;
    border-top-left-radius: .25rem;
    border-top-right-radius: .25rem;
    color: #eee;
    font-size: 20px;
}


/**      리스트 부분         **/

.list-group, .list-group-item {
	#tabs{width:100%; padding:5px 5px 5px 5px;},
	.list-group {width: 100%;},

}

@media (min-width: 481px) and (max-width: 768px){
	.list-group, .list-group-item  { width: 100%;} 
}
@media (min-width: 769px) {
	.list-group, .list-group-item  { width: 100%; height: auto;} 
}


.thumbnailImg{
	width: 40%;
	float: left;
	overflow: hidden;
}
.rtitle{
	color: black;
	text-align: left;
	float: left;
	margin-left: 20px;
}	
.list-group, .list-group-item{
	min-height:200px;
}
.rtitle span{
	color: #000000;
	
}

select {
  display: block;
  margin: 0 100px;
  background-color: #2A3F54;
}

.dropdown-menu{ margin-bottom: 10px;}


/** 검색 **/

#mysearch:focus + .input-group-addon {
	z-index: 10;
}

#search-btn:hover {
	cursor: pointer;
	/*color: gold;*/
	background-color: #ffc107;
}


.show-on-hover:hover > ul.dropdown-menu {
    display: block;    
}


/** 지도 **/
#mapapi {
	margin: auto;
	width: 100%;
	height: 100%;
}

@media (min-width: 481px) and (max-width: 768px){
	#mapapi { width: 100%; height: 700px; } 
}
@media (min-width: 769px) {
	#mapapi { width: 100%; height: 900px;} 
}

</style>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2126183a3359f675cc302c8972c00e81"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<title></title>
</head>
<body onload="relayout();">
<%@include file="../common/coinheader.jsp" %>
<div id="searchMain">
<section id="tabs">
	<div class="container">
		<h6 class="section-title h1">노래방 찾기</h6>
		<div class="row">
			<div class="col-xs-12 ">
				<nav>
					<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
						<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">목록</a>
						<a class="nav-item nav-link" id="nav-about-tab" data-toggle="tab" href="#nav-about" role="tab" aria-controls="nav-about" aria-selected="false">지도보기</a>
					</div>
				</nav>
				<div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-contact-tab">
					
					
					
				<!-- 검색 -->
				
				<!-- select -->
					
				<div class="row" style="margin-left: 5px;">
				<div class="col">
					<div class="btn-group">
					    <button type="button" class="form-control btn btn-default dropdown-toggle" data-toggle="dropdown">
					        옵션
					    </button>
					    <ul class="dropdown-menu" role="menu">
					        <li><a href="#">small</a></li>
					        <li><a href="#">medium</a></li>
					        <li><a href="#">large</a></li>
					    </ul>
					</div>
			    </div>
			        
			        <!-- search -->
			    <div class="col" style="padding:0;">
					<form class="form" >
						<div class="input-group">
			    			<input class="form-control" type="text" placeholder="업소명을 입력하세요" aria-label="Search" style="padding-left: 20px; border-radius: 40px;" id="search">
			    			<div class="input-group-addon" style="margin-left: -50px; z-index: 3; border-radius: 40px; background-color: transparent; border:none;">
			    				<button class="btn btn-warning btn-sm" type="submit" style="border-radius: 20px;" id="search-btn"><i class="fa fa-search"></i></button>
			    			</div>
						</div>
					</form>
					</div>
				</div>
				
				<!-- 검색 끝 -->
				
				<!-- 목록 -->
				<div class="list-group">
				  <a href="#" class="list-group-item">
				    <div class="thumbnailImg">
				    	<img src="../../img/shopImg/photo1.jpg" class="img-thumbnail">
				    </div>
				    <div class="rtitle">
				    	<h2>노래방</h2>
				    </div>
				    <div>
				    	<span>위치~~</span>
				    </div>
				    <div>
				    	<span>별점~~</span>
				    </div>
				    <div>
			    		<span>가격정보~~</span>
				    </div>
				  </a>
				</div>
				
				
				
				
				
				<div class="pagingArea" align = "center">
					<nav aria-label="Page navigation example">
					<ul class="pagination pagination-circle pg-blue">
						
						<li class="page-item" id="first"><a class="page-link" 
						href='<%= request.getContextPath() %>'>First</a></li>
				
						<li class="page-item disabled"><a class="page-link" aria-label="Previous" 
						href="<%= request.getContextPath() %>">
						<span aria-hidden="true">&laquo;</span>
			       		<span class="sr-only">Previous</span>
			       		</a>
			       		</li>
				
								<li class="page-item"><a class="page-link disabled" 
								href='<%= request.getContextPath() %>' >1</a></li>
								<li class="page-item"><a class="page-link" 
								href='<%= request.getContextPath() %>'>2</a></li>
			
						<li class="page-item" id="Last"><a class="page-link" aria-label="Next" 
						href="<%= request.getContextPath() %>">
						<span aria-hidden="true" >&raquo;</span>
						<span class="sr-only">Next</span>
						</a>
						
				
						<li class="page-item"><a class="page-link" 
						href="<%= request.getContextPath() %>">Last</a></li>
						
						</ul>
				  	 </nav>
				  	 </div>
					
					
					
					</div>	
					<div class="tab-pane fade" id="nav-about" role="tabpanel" aria-labelledby="nav-contact-tab">
						<div id="mapapi"></div>
						<script>
							var container = document.getElementById('mapapi');
							var options = {
							center: new kakao.maps.LatLng(33.450701, 126.570667),
									level: 3
							};
								var map = new kakao.maps.Map(container, options);
								
								map.relayout();
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
</div>
<%@ include file="../common/coinfooter.jsp"%>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/header.js"></script>
</body>
</html>