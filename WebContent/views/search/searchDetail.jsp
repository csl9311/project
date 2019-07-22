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

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.js"></script>
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/main/mainbanner.css">
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
        <h3>Some product subhead</h3>
        <p>Product description goes here.  Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.</p>
        <p>Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus.</p>

    </div> <!-- /col-sm-6 -->
  </div> <!-- /row -->
</div> <!-- /container -->








</body>
<%@ include file="../common/coinfooter.jsp"%>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/header.js"></script>
</html>