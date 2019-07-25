
  var login; // 데이터 가져 올 부분

  // 로그인 버튼 이벤트
  $('.login').on('click', function(){
    login=true;
    if(login){
      $('.login').css('display', 'none');
      $('.login-btn').css('display','inline-block');
/*      $('.profile').css('display','inline-block');
      $('.logout').css('display','inline-block');*/
    }
  });

  // 로그아웃 버튼 이벤트
  $('.logout').on('click',function(){
    login = false;
    if(!login){
      $('.login').css('display', 'inline-block');
      $('.logout').css('display','none');
      $('.profile').css('display','none');
    }
  });

  // 대분류 영역 토글
  $('#cateImg').on('click', function(){
    $('.menu').slideToggle(300);
  });

  // 중분류 영역 토글
  $('#lCate').on('click', function(){
    $('#mCate').slideToggle(300);
  });

  // 검색 결과 출력
  var data = [1,2,3,4,5];
  $('#search').on('click', function(){
    $('.result').html("");
    for(var i = 0; i < data.length; i ++){
      $('.result').append(
        "<br>" +  data[i] + "번 째 데이터"
      );
    }
  });
  
  

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

// next, prev
var nextBtn = document.getElementById('next');
var prevBtn = document.getElementById('previous');
nextBtn.addEventListener('click', function () {
    plusSlides(1);
});
prevBtn.addEventListener('click', function () {
    plusSlides(-1);
});

// hover
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
