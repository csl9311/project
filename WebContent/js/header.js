//*****************배너부분******************
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
slides.forEach(function (element) {
  element.style.width = sliderWidth + 'px';
})
//set width to be 'x' times the number of slides
var slider = document.querySelector('#slider-wrap ul#slider');
slider.style.width = sliderWidth * totalSlides + 'px';

//next, prev
var nextBtn = document.getElementById('next');
var prevBtn = document.getElementById('previous');
nextBtn.addEventListener('click', function () {
  plusSlides(1);
});
prevBtn.addEventListener('click', function () {
  plusSlides(-1);
});

//hover
slideWrapper.addEventListener('mouseover', function () {
  this.classList.add('active');
  clearInterval(autoSlider);
});
slideWrapper.addEventListener('mouseleave', function () {
  this.classList.remove('active');
  autoSlider = setInterval(function () {
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
slides.forEach(function () {
  var li = document.createElement('li');
  document.querySelector('#slider-pagination-wrap ul').appendChild(li);
})

function pagination() {
  var dots = document.querySelectorAll('#slider-pagination-wrap ul li');
  dots.forEach(function (element) {
      element.classList.remove('active');
  });
  dots[slideIndex].classList.add('active');
}

pagination();
var autoSlider = setInterval(function () {
  plusSlides(1);
}, 3000);




// ****************사이드 메뉴************** 
function openNav() {
	  document.getElementById("mySidenav").style.width = "240px";
	  $('.sidenav a').css("display","");
	}

function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	  
		 $('.sidenav a').css("display","none"); 
	  
	}



//**************가변footer 
var Height_Index = Number(document.getElementById("Index").clientHeight);
window.onload  = changeContentSize;
window.onresize  = changeContentSize;
function changeContentSize() {
 var Height_Window   = Number(document.documentElement.clientHeight);
 var Height_Footer   = Number(document.getElementById("myFooter").clientHeight);
 var ContentTop = Height_Window - Height_Footer - 5;
 document.getElementById("Index").style.minHeight = Height_Index + 'px';
 document.getElementById("Index").style.height = ContentTop + "px";
}