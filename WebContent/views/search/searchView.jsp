<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="karaoke.model.vo.*, java.util.*, common.PageInfo" %>
<%
	ArrayList<Karaoke> list = (ArrayList<Karaoke>)request.getAttribute("list");
	ArrayList<Attachment> at = (ArrayList<Attachment>)request.getAttribute("at");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();

%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body{
	background-color: rgb(40, 44, 52) !important;
}
.list-group li {
	background-color: #363645;
}
#mainArea{
	width:100%;
	margin-left: auto;
	margin-right: auto;
	
}

/* 폼 관련  */ 
.searchBar{
	padding: 1em 1em 2em 1em;
}

/*** 리스트    ***/

.listTextArea{
	float: right;
    min-height: 16.3rem;
    position: relative;
    width: calc(60% - 1rem);
}

.listArea{
    padding: 0;
    position: relative;
}

.listArea::after {
    clear: both;
    content: '';
    display: table;
}


/* 리스트 이미지  */
.imgArea{
	border-radius: 0.8rem;
    bottom: 0;
    left: 0;
    overflow: hidden;
    padding: 0;
    position: absolute;
    top: 0;
    width: 40%;
}

.thumb{
	height: 100%;
    position: relative
}

.thumbimg{
	width: 100%;
    height: 100%;
    background: 50% no-repeat;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    overflow: hidden;
    position: absolute;
    top: 0;
    left: 0;
}

/** 별  **/
.col-sm-6 .fa fa-star{
	margin-bottom: 10px;
}
.checked {
  color: orange;
}

/** 폰트 **/
.review-SubTitle {
    color: #999;
    font-size: 1.4rem;
    font-weight: 600;
    padding-left: 1rem;
}

.location {
    color: #999;
    font-size: 1.1rem;
    font-weight: 600;
}

.review-count {
    color: #fff;
    font-size: 1.4rem;
    font-weight: 600;
    margin-left: 0.5rem;
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

/*   지도    */
#mapapi {
	margin: auto;
	width: 100%;
	height: 100%;
}

@media ( min-width : 481px) and (max-width: 768px) {
	#mapapi {
		width: 100%;
		height: 700px;
	}
	#mainArea{
		width:100%;
		margin-left: auto;
		margin-right: auto;
	}
	
}

@media ( min-width : 769px) {
	#mapapi {
		width: 100%;
		height: 900px;
	}
	#mainArea{
		width:70%;
		margin: auto;
	}
	.searchBar{
		padding: 1em 0em 2em 0em;
	}
	
}
</style>
<meta charset="UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e8732c5397c277a3b26c4848c8209b8"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e8732c5397c277a3b26c4848c8209b8&libraries=LIBRARY"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e8732c5397c277a3b26c4848c8209b8&libraries=services,clusterer,drawing"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<title>노래방 찾기</title>
</head>
<%@include file="/views/common/coinheader.jsp"%>
<body>
<div id="mainArea">
	<!-- 탭 영역 -->
	<nav>
	  <div class="nav nav-tabs" id="nav-tab" role="tablist">
	    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">노래방 검색</a>
	    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">지도보기</a>
	  </div>
	</nav>
	<!-- 탭 끝 -->
	<!-- 내용 -->
	<div class="tab-content" id="nav-tabContent">
		<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
			<!-- 서치바 영역 -->
			<div class="searchBar">
				<form class="form-inline">
					<input class="form-control mr-sm-2" type="search" aria-label="Search">
			   	 	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
				</form>
			</div>
			<!-- 검색 끝 -->
			
			<!-- 목록 나타나는 부분 -->
			<ul class="list-group list-group-flush">
			<% if(list.isEmpty()){ %>
				<li class="list-group-item">목록이 없습니다.</li>
			<% } else { %>
				<% for(Karaoke k : list) { %>
				<a href="#">
			  		<li class="list-group-item">
			  			<div class="listArea">
					  		<div class="imgArea">
					  			<div class="thumb">
					  				<div class="thumbimg" style="background-image: url('<%=request.getContextPath()%>/views/search/photo1.jpg');  background-size: cover;"></div>
					  			</div>
					  		</div>
				  			<div class="listTextArea">
	      						<h3 class="mb-2"><%= k.getKaraokeName() %></h3>
	      						<span class="fa fa-star checked"></span>
	      						4.5
	      						<span class="review-SubTitle">리뷰</span>
	      						1232개
	      						<br>
	      						<span class="location"><%= k.getAddress() %><%= k.getAddressDetail() %> 에 위치함</span>
	      					</div>
      					</div>
      				</li>
      			</a>
				<% } %>
			<% } %>
			</ul>	
			
			
			<%-- <script>
			
			$(window).scroll(function() {
			    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
			    href="<%= request.getContextPath() %>/list.ko?currentPage=<%= currentPage + 1 %>"
			    <% for(Karaoke k : list) { %>
			      $("ul.list-group").append("<h1>Page " + page);
			    <% } %>
			    }
			});
			</script> 			
			
			
			
			
			
			<script>
			function getLocation() {
				  if (navigator.geolocation) { // GPS를 지원하면
				    navigator.geolocation.getCurrentPosition(function(position) {
				      alert(position.coords.latitude + ' ' + position.coords.longitude);
				    }, function(error) {
				      console.error(error);
				    }, {
				      enableHighAccuracy: false,
				      maximumAge: 0,
				      timeout: Infinity
				    });
				  } else {
				    alert('GPS를 지원하지 않습니다');
				  }
				}
			getLocation();
			</script>--%>

			
			<!-- 목록 끝 -->
		</div>
		<!-- 탭2 -->
		<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
	  <!-- 지도 표시되는 부분 -->
	  
	  <div id="mapapi"></div>
	  <!-- 지도 스크립트 -->
		<script>
			var mapContainer = document.getElementById('mapapi'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    }; 
			
			$('#nav-profile-tab').on('click', function() {
				setTimeout(function() {	
					map.relayout();
				}, 300);
			});
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		 
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('서울특별시 강남구 역삼1동 테헤란로1길 28', function(result, status) {
	
			  // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
		</script>
		<!-- 지도 스크립트 끝 -->
		
		
			
			
		</div>
		<!-- 탭2 끝 -->
	</div>
	<!-- 내용 끝 -->
</div>
<%@ include file="../common/coinfooter.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/header.js"></script>	
</body>
</html>