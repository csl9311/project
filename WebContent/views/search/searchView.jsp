<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="karaoke.model.vo.*, java.util.*"%>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2126183a3359f675cc302c8972c00e81&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2126183a3359f675cc302c8972c00e81"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<title></title>
</head>
<body>
	<%@include file="../common/coinheader.jsp"%>
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
			<ul class="list-group list-group-flush" id="klist">
				<!-- <a href="#">
			  		<li class="list-group-item">
			  			<div class="listArea"> html5 부터 a태그 아래에 블럭태그 사용 가능
					  		<div class="imgArea">
					  			<div class="thumb">
					  				<div class="thumbimg" style="background-image: 
					  				url('photo1.jpg');  background-size: cover;">
					  				</div>
					  			</div>
					  		</div>
				  			<div class="listTextArea">
	      						<h3 class="mb-2">노래방 이름 들어갈 곳</h3>
	      						<span class="fa fa-star checked"></span>
	      						4.5
	      						<span class="review-SubTitle">리뷰</span>
	      						1232개
	      						<br>
	      						<span class="location">경기도 고양시 일산 어딘가</span>
	      					</div>
      					</div>
      				</li>
      			</a> -->
			</ul>	
			
			<!-- 페이징 시작 -->
			
			<script type="text/javascript">
				var page = 1;  //페이징과 같은 방식이라고 생각하면 된다. 
				 
				$(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
				     getList(page);
				     page++;
				}); 
				 
				$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
				     if($(window).scrollTop() >= $(document).height() - $(window).height()){
				          getList(page);
				           zpage++;   
				     } 
				});
				 
				function getList(page){
				 
				    $.ajax({
				        type : 'POST',  
				        dataType : 'json', 
				        data : {"page" : page},
				        url : '주소'
				        success : function(returnData) {
				            var data = returnData.rows;
				            var html = "";
				            if (page==1){ //페이지가 1일경우에만 id가 list인 html을 비운다.
				                  $("#list").html(""); 
				            }
				            if (returnData.startNum<=returnData.totCnt){
				                if(data.length>0){
				                // for문을 돌면서 행을 그린다.
				                }else{
				                //데이터가 없을경우
				                }
				            }
				            html = html.replace(/%20/gi, " ");
				            
				            if (page==1){  //페이지가 1이 아닐경우 데이터를 붙힌다.
				                $("#list").html(html); 
				            }else{
				                $("#busStopList").append(html);
				            }
				       },error:function(e){
				           if(e.status==300){
				               alert("데이터를 가져오는데 실패하였습니다.");
				           };
				       }
				    }); 
				}
			
			<!-- 페이징 끝 -->

			
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
				console.log("!232");
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
	
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">슈퍼스타코인노래연습장</div>'
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

							<!--  -->
	<%@ include file="../common/coinfooter.jsp"%>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/header.js"></script>
</body>
</html>