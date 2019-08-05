<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<meta charset="UTF-8">
<style>
body{
	background-color: rgb(40, 44, 52) !important;
}

.py-5 img{
	width:50%;
	margin-left: 3em;
}

.formArea {
		width:60%;
		margin:auto;
		padding-top: 50px;
		padding-bottom: 50px;
} 

.st {
	width:80%;
	background-color: #635e6e;
	height:100%;
	margin-left: auto;
	margin-right: auto;
	border-radius: 20px;
}
.s1{
	margin-top:2em;
	width:50%;
}


.sm {
	width: 150px !important; 
	display: inline !important;
	margin-left: 10px;
	margin-right: 10px;
	font-size: 1em;
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
		width:30%;
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
			      	<form action="<%= request.getContextPath() %>/insert.ko" method="post" encType="multipart/form-data">
					  <div class="form-group">
					    <label><strong>업체명</strong></label>
					    <input type="text" class="form-control" id="kname" name="kname">
					  </div>
					  <div class="form-group">
					    <input type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()" value="주소 검색"/>
					    <br><span class="s1">우편번호<input type="text" class="form-control" id="sample6_postcode" name="sample6_postcode" placeholder="우편번호" readonly></span>
					    <br><span class="s1">주소<input type="text" class="form-control" id="sample6_address"  name="sample6_address" readonly/></span>
					    <br><span class="s1">상세 주소<input type="text" class="form-control" id="sample6_detailAddress"  name="sample6_detailAddress" /></span>
					    <input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
					   <!-- 주소 API -->
					    <script>
						    function sample6_execDaumPostcode() {
						        new daum.Postcode({
						            oncomplete: function(data) {
						                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						
						                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
						                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						                var addr = ''; // 주소 변수
						                var extraAddr = ''; // 참고항목 변수
						
						                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						                    addr = data.roadAddress;
						                } else { // 사용자가 지번 주소를 선택했을 경우(J)
						                    addr = data.jibunAddress;
						                }
						
						                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						                if(data.userSelectedType === 'R'){
						                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
						                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						                        extraAddr += data.bname;
						                    }
						                    // 건물명이 있고, 공동주택일 경우 추가한다.
						                    if(data.buildingName !== '' && data.apartment === 'Y'){
						                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						                    }
						                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						                    if(extraAddr !== ''){
						                        extraAddr = ' (' + extraAddr + ')';
						                    }
						                    // 조합된 참고항목을 해당 필드에 넣는다.
						                    document.getElementById("sample6_extraAddress").value = extraAddr;
						                
						                } else {
						                    document.getElementById("sample6_extraAddress").value = '';
						                }
						
						                // 우편번호와 주소 정보를 해당 필드에 넣는다.
						                document.getElementById('sample6_postcode').value = data.zonecode;
						                document.getElementById("sample6_address").value = addr;
						                // 커서를 상세주소 필드로 이동한다.
						                document.getElementById("sample6_detailAddress").focus();
						            }
						        }).open();
						    }
						</script>
						<!-- 주소 API끝 -->
					  </div>
					  <div class="form-group">
					  	<label style="width:100%"><strong>가격 정보</strong></label>
					    <span>1곡</span><input type="number" class="form-control" style="width:200px;" min="0" step="100" id="one" name="one">
					    <span>3곡</span><input type="number" class="form-control" style="width:200px;" min="0" step="100" id="three" name="three">
					  </div>
					  <div class="form-group inline1">
					  	<strong>영업시간</strong><input type="time" class="form-control sm" name="startTime" id="startTime"><input type="time" class="form-control sm" name="endTime" id="endTime">
					  	 <script type="text/javascript">
						    $("input[name='startTime']").timeInput({min: "0:00", max: "24:00"}); // 15 min intervals from 6:00 am to 3:00 pm
						</script>
					  </div>
					  <div class="form-group">
					  	<p><strong>타이틀 사진 첨부</strong><span class="subfont">(선택된 사진이 대표 사진이 됩니다.)</span></p>
					    <input type="file" id="mainImgInput" name="mainImgInput">
					    <p class="help-block"></p>
					  </div>
					  <div class="form-group">
					  	<p><strong>사진 첨부(여러장 첨부 가능)</strong></p>
					    <input multiple="multiple" type="file" id="subImgInput" name="subImgInput">
					    <p class="help-block"></p>
					  </div>
					<button type="submit" id="insertBtn" class="btn btn-success">등록!</button>
				</form>
			</div>
		</div>
	</div>
</body>
<%@ include file="../common/coinfooter.jsp"%>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/header.js"></script>
</html>