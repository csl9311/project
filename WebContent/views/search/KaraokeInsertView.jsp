<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script language="javascript">

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrCoordUrl.do)를 호출하게 됩니다.
	var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo,entX,entY){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadFullAddr.value = roadFullAddr;
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.roadAddrPart2.value = roadAddrPart2;
		document.form.addrDetail.value = addrDetail;
		document.form.engAddr.value = engAddr;
		document.form.jibunAddr.value = jibunAddr;
		document.form.zipNo.value = zipNo;
		document.form.admCd.value = admCd;
		document.form.rnMgtSn.value = rnMgtSn;
		document.form.bdMgtSn.value = bdMgtSn;
		document.form.detBdNmList.value = detBdNmList;
		document.form.bdNm.value = bdNm;
		document.form.bdKdcd.value = bdKdcd;
		document.form.siNm.value = siNm;
		document.form.sggNm.value = sggNm;
		document.form.emdNm.value = emdNm;
		document.form.liNm.value = liNm;
		document.form.rn.value = rn;
		document.form.udrtYn.value = udrtYn;
		document.form.buldMnnm.value = buldMnnm;
		document.form.buldSlno.value = buldSlno;
		document.form.mtYn.value = mtYn;
		document.form.lnbrMnnm.value = lnbrMnnm;
		document.form.lnbrSlno.value = lnbrSlno;
		document.form.emdNo.value = emdNo;
		document.form.entX.value = entX;
		document.form.entY.value = entY;
		
		
}

</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta charset="UTF-8">
<style>
body{
	background-color: rgb(40, 44, 52) !important;
}

.py-5 img{
	width:50%;
	margin: 0 0 0 5em ;
}

.formArea {
		width:60%;
		margin:auto;
		padding-top: 50px;
		padding-bottom: 50px;
} 

.st {
	width:80%;
	background-color: #a3a3a3;
	height:100%;
	margin-left: auto;
	margin-right: auto;
	border-radius: 20px;
}
.s1{
	margin-top:2em;
}


.sm {
	width: 100px !important; 
	display: inline !important;
	margin-left: 10px;
	margin-right: 10px;
}
.bm {
	padding-bottom: 200px;
	color: #fff;
}
.subfont{
	color: #dbdbdb;
	font-size: 12px;
}
.form-control hr{
	width: 80%;
	color: #c8c8c8;
}

@media (min-width: 768px) {
	.formArea {
		width:80%;
	} 
	.py-5 img{
		width:50%;
		margin-left: 5em;
	}
}

@media (min-width: 960px) {
	.formArea {
		width:80%;
	} 
	.py-5 img{
		width:50%;
		margin-left: 10em;
	}
}
</style>
<title>Insert title here</title>
</head>
<%@include file="../common/coinheader.jsp" %>
<body>

		<div class="container bm">
			<div class="py-5 text-center">
				<img src="write.png">
	        	<h2>노래방 정보 입력</h2>
	        	<p class="lead">등록할 업체의 정보를 입력해주세요!</p>
	      	</div>
	      	<div class="st">
		      	<div class="formArea">
			      	<form method="post">
					  <div class="form-group">
					    <label><strong>업체명</strong></label>
					    <input type="text" class="form-control" id="kname">
					  </div>
					  <div class="form-group">
					    <input type="button" class="btn btn-outline-primary" onClick="goPopup();" value="주소 검색"/>
					    <br><span class="s1">주소<input type="text" class="form-control" id="roadAddrPart1"  name="roadAddrPart1" readonly /></span>
					    <br><span class="s1">상세 주소<input type="text" class="form-control" id="addrDetail"  name="addrDetail" /></span>
					  </div>
					  <div class="form-group">
					  	<label style="width:100%"><strong>가격 정보</strong></label>
					    <span>1곡</span><input type="number" class="form-control" style="width:200px;" id="one">
					    <span>3곡</span><input type="number" class="form-control" style="width:200px;" id="three">
					  </div>
					  <div class="form-group inline1">
					  	<strong>영업시간</strong><input type="time" class="form-control sm" name="startTime" id="startTime">~<input type="time" class="form-control sm" name="endTime" id="endTime">
					  </div>
					  <div class="form-group">
					  	<p><strong>타이틀 사진 첨부</strong><span class="subfont">(선택된 사진이 대표 사진이 됩니다.)</span></p>
					    <input type="file" id="mainImgInput">
					    <p class="help-block">첨부파일 내용</p>
					  </div>
					  <div class="form-group">
					  	<p><strong>사진 첨부</strong></p>
					    <input multiple="multiple" type="file" id="subImgInput">
					    <p class="help-block">첨부파일 내용</p>
					  </div>
					  <button type="submit" class="btn btn-success">등록!</button>
					</form>
				</div>
			</div>
	   </div>

</body>
<%@ include file="../common/coinfooter.jsp"%>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/header.js"></script>
</html>