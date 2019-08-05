<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/coinheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main/mainbanner.css">
<style>
#slider-wrap img{
cursor:pointer;

}

</style>
<body>
	<div id="main" >
		<!--*****************배너광고 영역  ************** -->
		<div id="Index" style="min-height:80vh">
			<div id="slider-wrap">
				<ul id="slider">
					<li>
						<div>
							<h3>배너 #1</h3>
							<span>Sub-title #1</span>
						</div>
						
						<img onclick="location.href='<%=request.getContextPath()%>/list.bo';" style="cursor:pointer" src="<%=request.getContextPath()%>/img/cmboard/bono.jpg">
						
					</li>

					<li>
						<div>
							<h3>배너 #2</h3>
							<span>Sub-title #2</span>
						</div>
						<img  src="<%=request.getContextPath()%>/img/cmboard/bono2.jpg">
					</li>

					<li>
						<div>
							<h3>배너 #3</h3>
							<span>Sub-title #3</span>
						</div>
						<img src="https://i.pinimg.com/originals/e7/05/c8/e705c8e4778f8015b293e307f5517a9c.jpg">
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
				<button class="btn" type="button" value="3">버튼이미지3</button>
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