<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopReviewView</title>
<style>
#index {
	width: 60vw;
}

#wrap {
	width: 60vw;
	background-color: rgb(42, 45, 52);
	color: rgb(210, 210, 210);
	position: relative;
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
	height: 20vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

#star_area {
	
}

.review {
	width: 100%;
	display: flex;
}

.review_text {
	flex-basis: 19%;
	height: 20vh;
	display: inline-flex;
	flex-direction: column;
	justify-content: center;
	text-align: center;
	margin: 1vw;
}

#review_textarea {
	display: inline-flex;
	width: 76%; 
	background-color: rgb(75, 75, 75);
	padding: 2%;
}

#review_textarea textArea {
	background-color: rgb(75, 75, 75); border : none;
	resize: none;
	border: none;
}

#review_attach {
	display: flex;
	align-content: center;
	vertical-align: middle;
}

#review_attach ul {
	margin-left: 2vw;
	padding: 0;
	display: flex;
}

#review_attach li {
	display: inline-flex;
}

.add_thmb {
	width: 5vw;
	height: 5vh;
}

////////////////////////////////ul앞에 마진주기
#submitBtn{
	margin-left: 20vw;
}
#submitBtn, #cencleBtn {
	width: 10vw;
	height: 5vh;
	background-color: rgb(25, 75, 75);
	border: none;
	color: rgb(210, 210, 210);
	margin-left: 1vw;
}

#cencleBtn {
	background-color: rgb(75, 75, 75);
}
#attach_text{
	flex-basis: 19%;
	height: 10vh;
	display: inline-flex;
	flex-direction: column;
	justify-content: center;
	text-align: center;
	}
</style>
</head>
<body>
	<div id="Index">
		<div id="wrap">
			<form id="submitForm" name="submitForm">
				<input type="hidden"> <input type="hidden"> <input
					type="hidden"> <input type="hidden"> <input
					type="hidden"> <input type="hidden"> <input
					type="hidden"> <input type="hidden"> <input
					type="hidden"> <input type="hidden">
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
						<span id="decs">모델 : PRO V1-3피스/ 색상 : 화이트/ 포장여부 : 선물포장</span>
					</div>
				</div>
				<div id="score">
					<div id="review_star">
						<div id="star_area">
							<button type="button" title="1" value="1" class="">1점 선택</button>
							<button type="button" title="2" value="2" class="">2점 선택</button>
							<button type="button" title="3" value="3" class="">3점 선택</button>
							<button type="button" title="4" value="4" class="">4점 선택</button>
							<button type="button" title="5" value="5" class="">5점 선택</button>
						</div>
						<span class="star_ico rv1">아쉽네요!</span> <span class="star_ico rv2">그냥그래요!</span>
						<span class="star_ico rv3">보통이에요!</span> <span
							class="star_ico rv4">좋아요!</span> <span class="star_ico rv5">최고에요!</span>
					</div>
				</div>
				<div class="review">
					<div class="review_text">
						<span>상품평</span><br> <span><em><b>0</b>자</em>/ 1998자</span>
					</div>
					<div id="review_textarea">
						<textArea cols="55" rows="10"
							placeholder="상품평 내용(최소 10자 / 최대 1998자)을 입력해 주세요."></textArea>
					</div>
				</div>
				<div id="review_attach">
				<div id="attach_text">
					<span>사진등록</span>
				</div>
					<ul>
						<li>
							<button type="button" class="add_thmb" onclick=""></button>
						</li>
						<li>
							<button type="button" class="add_thmb" onclick=""></button>
						</li>
						<li>
							<button type="button" class="add_thmb" onclick=""></button>
						</li>
					</ul>
					<ul>
						<li><button type="button" id="submitBtn">등록</button></li>
						<li><button type="button" id="cencleBtn"
								onclick="javascript:closePopup();">취소</button></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
</body>
</html>