<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopReviewView</title>
<style type="text/css">
body{
	margin: 0;
	padding: 0;
	width: 600px;
	height: 700px;
}
*:focus {
	outline: none;
}

#index {
}

.pointer {
	cursor: pointer;
}

#wrap {
	/* width: 50vw; */
	max-width: 600px;
	/* background-color: rgb(42, 45, 52); */
	background-color: pink;
	color: rgb(210, 210, 210);
	position: relative;
	display: flex;
	justify-content: center;
	
}

#upper {
	width: 100%;
	border-bottom: 2px solid rgb(210, 210, 210);
	text-align: center;
}

#upper p {
	font-size: 1.3rem;
}

.button_close {
	display: inline-block;
	width: 5vw;
	height: 5vh;
	background: none;
	font-size: 1.5rem;
	font-weight: 100;
	border: none;
	color: rgb(210, 210, 210);
	position: absolute;
	top: 0;
	right: 1vw;
}

#selected_info {
	display: flex;
	margin-bottom: 5%;
}

img {
	width: 10vw;
	height: 10vh;
	margin: 1vw;
}

#item_info {
	font-size: 0.9rem;
}

#score {
	width: 100%;
	height: 10vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

#star_area img {
	width: 15px;
	height: 15px;
	padding: 0;
	margin: 1%;
}

.review {
	width: 100%;
	display: flex;
	justify-content: center;
	margin-bottom: 5%;
}

#review_textarea {
	display: block;
	width: 90%;
	height: 50%;
	background-color: rgb(75, 75, 75);
	padding: 2%;
	background-color: rgb(75, 75, 75);
}

#review_textarea textArea {
	background-color: rgb(75, 75, 75);
	width: 90%;
	height: 35vh;
	border: none;
	resize: none;
	border: none;
	color: rgb(210, 210, 210);
	border: none;
}

#review_attach {
	width: 100%;
	display: flex;
	justify-content: center;	
	align-content: center;
	margin-bottom: 5%;
}
#review_attach_inner{
	width: 93%;
	display: inline-flex;
}

#review_attach #thumUl {
margin: 0; padding: 0;
	display: flex;
	width: 59%;
}

#review_attach #submitUl {
margin: 0; padding: 0;
	display: flex;
	width: 41%;
}

#review_attach #thumUl li{
	display: inline-flex;
	width: 100%;
}
#review_attach #submitUl li{
	display: inline-flex;
	width: 100%;
}

.add_thmb {
	width: 95%;
	height: 5vh;
	/* background: none; */
	border: none;
}

#submitBtn, #cencleBtn {
	width: 100%;
	height: 5vh;
	background-color: rgb(25, 75, 75);
	border: none;
	color: rgb(210, 210, 210);
	margin-left: 1vw;
}

#cencleBtn {
	background-color: rgb(75, 75, 75);
}

</style>
</head>
<body>
	<div id="Index">
		<div id="wrap">
			<form id="submitForm" name="submitForm">
				<input type="hidden" id="pId" name="pId"> <input type="hidden"> <input type="hidden"> <input type="hidden"> <input type="hidden"> <input type="hidden"> <input type="hidden"> <input type="hidden"> <input type="hidden"> <input type="hidden">
				<div id="upper">
					<p>상품평 작성</p>
					<button class="button_close" type="button" onclick="self.close();">X</button>
				</div>
				<div id="selected_info">
					<div id="selecetd_img">
						<img alt="상품명" src="../../img/shopImg/photo2.jpg">
					</div>
					<div id="item_info">
						<p id="item">신세계백화점 19년 NEW 타이틀리스트 신형골프공 ProV1/ProV1X-포장가능</p>
						<span id="decs">색상 : 화이트</span>
					</div>
				</div>
				<div class="review">
					<div id="review_textarea">
						<textArea placeholder="상품평 내용(최소 10자 / 최대 1998자)을 입력해 주세요."></textArea>
						<span>0</span>
					</div>
				</div>
			
				<div id="review_attach">
				<div id="review_attach_inner">
						<ul id="thumUl">
							<li>
								<button type="button" class="add_thmb" onclick="">PHOTO<br>UPLOAD</button>
							</li>
							<li>
								<button type="button" class="add_thmb" onclick="">PHOTO<br>UPLOAD</button>
							</li>
							<li>
								<button type="button" class="add_thmb" onclick="">PHOTO<br>UPLOAD</button>
							</li>
						</ul>
						<ul id="submitUl">
							<li><button type="button" id="submitBtn">등록</button></li>
							<li><button type="button" id="cencleBtn" onclick="javascript:closePopup();">취소</button></li>
						</ul>
				</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>