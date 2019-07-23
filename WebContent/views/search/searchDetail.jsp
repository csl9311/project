<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<style>

.carousel {
    margin-top: 20px;
}
.item .thumb {
	width: 25%;
	cursor: pointer;
	float: left;
}
.item .thumb img {
	width: 100%;
	height: 100%;
	margin: 2px;
}
.item img {
	width: 100%;
	height: 100%;
}

.col-sm-6 h2{
	text-align: left;
}

.col-sm-6 strong{
	font-size: 1.5rem;
}

/** 별  **/
.col-sm-6 .fa fa-star{
	margin-bottom: 10px;
}
.checked {
  color: orange;
}

/** 폰트 **/
review-SubTitle {
    color: #999;
    font-size: 1.4rem;
    font-weight: 600;
    padding-left: 2rem;
}

.review-count {
    color: #fff;
    font-size: 1.4rem;
    font-weight: 600;
    margin-left: 0.5rem;
}

.col-sm-6 a:link, .col-sm-6 a:visited, .col-sm-6 a:hover{
	text-decoration: none;
	color: white;
}

.location-text{
	margin-top: 0.5rem;
}
.btn btn-info{
	font-size: 1.5em;
}

hr.hr-style {
	width: 100%;
    border: 0;
    height: 1px;
    background-image: linear-gradient(to right, rgba(255, 255, 255, 0.05), rgba(255, 255, 255, 0.75), rgba(255, 255, 255, 0.05));
}

/** 리뷰 부분 **/
.review{
    background-position: 0 2.6rem;
    background-repeat: no-repeat;
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    color: #fff;
    font-size: 1.3rem;
    padding: 2rem 0;
    position: relative;
}
.review .index{
	padding: 0 0 2rem 0;
    position: relative;
}
.review .star{
    display: block;
    font-size: 1.2rem;
    padding-bottom: 0.8rem;
}
.review .id-text{
	color: #AAA;
    font-size: 1.2rem;
}
.review .create-date{
    color: #AAA;
    font-size: 1.2rem;
    position: absolute;
    right: 0;
    top: 0;
}

.review p{
	color: #fff;
}

@media (min-width: 481px) and (max-width: 768px){
	p {
		font-size: 1.3em;
		color: #fff;	
	} 
}
@media (min-width: 769px) {
	p {
		font-size: 1.3em;
		color: #fff;	
	} 
}



</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.js"></script>
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/main/mainbanner.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>


<%@include file="../common/coinheader.jsp" %>





<div class="container">
  <div class="row">
    <div class="col-sm-6">
        <div id="carousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="item active">
                    <img src="photo1.jpg">
                </div>
                <div class="item">
                    <img src="photo2.jpg">
                </div>
                <div class="item">
                    <img src="photo1.jpg">
                </div>
                <div class="item">
                    <img src="photo2.jpg">
                </div>
                <div class="item">
                    <img src="photo1.jpg">
                </div>
                <div class="item">
                    <img src="photo2.jpg">
                </div>
                <div class="item">
                    <img src="photo1.jpg">
                </div>
                
            </div>
        </div> 
    <div class="clearfix">
        <div id="thumbcarousel" class="carousel slide" data-interval="false">
            <div class="carousel-inner">
                <div class="item active">
                    <div data-target="#carousel" data-slide-to="0" class="thumb"><img src="photo1.jpg"></div>
                    <div data-target="#carousel" data-slide-to="1" class="thumb"><img src="photo2.jpg"></div>
                    <div data-target="#carousel" data-slide-to="2" class="thumb"><img src="photo1.jpg"></div>
                    <div data-target="#carousel" data-slide-to="3" class="thumb"><img src="photo2.jpg"></div>
                </div><!-- /item -->
                <div class="item">
                    <div data-target="#carousel" data-slide-to="4" class="thumb"><img src="photo1.jpg"></div>
                    <div data-target="#carousel" data-slide-to="5" class="thumb"><img src="photo2.jpg"></div>
                    <div data-target="#carousel" data-slide-to="6" class="thumb"><img src="photo1.jpg"></div>
                   
                </div><!-- /item -->
            </div><!-- /carousel-inner -->
            <a class="left carousel-control" href="#thumbcarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
            </a>
            <a class="right carousel-control" href="#thumbcarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
            </a>
        </div> <!-- /thumbcarousel -->
    </div><!-- /clearfix -->
    </div> <!-- /col-sm-6 -->
    <div class="col-sm-6">
        <h2>노래방</h2>
        <strong>평점</strong>
	        <span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
			<span><strong> / </strong>3.5</span>
		<span class="review-SubTitle">후기</span>
		<a href="#"><span class="review-count">123</span>
		<span class="gotorev"> ▶  </span></a>
		<p class="location-text">경기 수원시 팔달구 매산로 2-11 에 위치함</p>
		<button id="location-button" class="btn btn-info"><i class="material-icons">place</i> 지도보기</button>
		<p></p><hr class="hr-style"><br>
		<p>넣을거 생각좀 해볼게요...</p>
    </div> <!-- /col-sm-6 -->
  </div> <!-- /row -->
  <div class="row">
  	<div class="col-sm-12">
  		<p><br></p>
  		<h3>후기</h3>
  		<hr class="hr-style">
  		<!-- 리뷰 1 -->
  		<div class="review">
  			<div class="index">
	  			<span class="star">
			  		<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star"></span>
	  			</span>
	  			<span class="id-text">작성자 아이디</span>
	  			<span class="create-date">2019-07-24</span>
	  			<p>리뷰 내용이 담길건데요</p>
  			</div>
  		</div>
  		<!-- 리뷰 2 -->
  		<div class="review">
  			<div class="index">
	  			<span class="star">
			  		<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span>
	  			</span>
	  			<span class="id-text">작성자 아이디2</span>
	  			<span class="create-date">2019-07-23</span>
	  			<p>리뷰 내용 쓰일공간</p>
  			</div>
  		</div>
  		
  	</div>
  </div>
</div> <!-- /container -->








</body>
<%@ include file="../common/coinfooter.jsp"%>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/header.js"></script>
</html>