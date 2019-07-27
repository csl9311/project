<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/views/common/coinheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main/mainbanner.css">

<body>
	<div id="main">
		<!--*****************배너광고 영역  ************** -->
		<div id="Index">
			<div id="slider-wrap">
				<ul id="slider">
					<li>
						<div>
							<h3>배너 #1</h3>
							<span>Sub-title #1</span>
						</div>
						<img src="https://lh3.googleusercontent.com/-qH3OfUllyh4/Vd6-8LUyXvI/AAAAAAAAGJY/ju75kZoQg7U/s800-Ic42/city-cityscape-amarpreet-kaur.jpg">
					</li>

					<li>
						<div>
							<h3>배너 #2</h3>
							<span>Sub-title #2</span>
						</div>
						<img src="https://post-phinf.pstatic.net/MjAxNzExMThfMjQ4/MDAxNTEwOTg1MjU1NzM2.yv4sJDr18MojEUzi2dbxsNU0r_Vv3F2jU6FKpnM1wQ0g.XM0LL1Xtee_liE3efoxFZYL3I5bZqen-GK0gP-2ya9Eg.JPEG/20171118-015.jpg?type=w1200">
					</li>

					<li>
						<div>
							<h3>배너 #3</h3>
							<span>Sub-title #3</span>
						</div>
						<img src="data:image/jpeg;base64,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">
					</li>

					<li>
						<div>
							<h3>배너 #4</h3>
							<span>Sub-title #4</span>
						</div>
						<img src="http://itcm.co.kr/files/attach/images/813/596/782/325f0acced8215b4b49a8f5a9a207a8c.png">
					</li>

					<li>
						<div>
							<h3>배너 #5</h3>
							<span>Sub-title #5</span>
						</div>
						<img src="https://png.pngtree.com/thumb_back/fw800/back_pic/02/66/81/39578b81744df9f.jpg">
					</li>
				</ul>

				<div class="slider-btns" id="next">
					<span>▶</span>
				</div>
				<div class="slider-btns" id="previous">
					<span>◀</span>
				</div>

				<div id="slider-pagination-wrap"><ul></ul></div>
			</div>

			<div class="mainMenu">
				<button class="btn" type="button" onclick="location.href=''">노래방찾기</button>
				<button class="btn" type="button" value="2">커뮤니티</button>
				<button class="btn" type="button" value="3">예약관리</button>
				<button class="btn" type="button" value="4">쇼핑몰</button>
			</div>

		</div>


		<%@ include file="/views/common/coinfooter.jsp"%>
		<script>
			//slide-wrap
			var slideWrapper = document.getElementById('slider-wrap');
			//current slideIndexition
			var slideIndex = 0;
			//items
			var slides = document.querySelectorAll('#slider-wrap ul li');
			//number of slides
			var totalSlides = slides.length;
			//get the slide width
			var sliderWidth = slideWrapper.clientWidth;
			//set width of items
			slides.forEach(function(element) {
				element.style.width = sliderWidth + 'px';
			})
			//set width to be 'x' times the number of slides
			var slider = document.querySelector('#slider-wrap ul#slider');
			slider.style.width = sliderWidth * totalSlides + 'px';

			//next, prev
			var nextBtn = document.getElementById('next');
			var prevBtn = document.getElementById('previous');
			nextBtn.addEventListener('click', function() {
				plusSlides(1);
			});
			prevBtn.addEventListener('click', function() {
				plusSlides(-1);
			});

			//hover
			slideWrapper.addEventListener('mouseover', function() {
				this.classList.add('active');
				clearInterval(autoSlider);
			});
			slideWrapper.addEventListener('mouseleave', function() {
				this.classList.remove('active');
				autoSlider = setInterval(function() {
					plusSlides(1);
				}, 3000);
			});

			function plusSlides(n) {
				showSlides(slideIndex += n);
			}

			function currentSlides(n) {
				showSlides(slideIndex = n);
			}

			function showSlides(n) {
				slideIndex = n;
				if (slideIndex == -1) {
					slideIndex = totalSlides - 1;
				} else if (slideIndex === totalSlides) {
					slideIndex = 0;
				}

				slider.style.left = -(sliderWidth * slideIndex) + 'px';
				pagination();
			}

			//pagination
			slides.forEach(function() {
				var li = document.createElement('li');
				document.querySelector('#slider-pagination-wrap ul').appendChild(li);
			})

			function pagination() {
				var dots = document.querySelectorAll('#slider-pagination-wrap ul li');
				dots.forEach(function(element) {
					element.classList.remove('active');
				});
				dots[slideIndex].classList.add('active');
			}

			pagination();
			var autoSlider = setInterval(function() {
				plusSlides(1);
			}, 3000);
		</script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/main/header.js"> </script>
	</div>
</body>
</html>