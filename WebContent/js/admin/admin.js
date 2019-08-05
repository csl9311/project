
// 상품등록 영역 css 변경
var $active = $('#areaActive_productUpdate');

$active.click(function() {
	$active.css('display', 'none');
	$('#productUpdate').css('display', 'block');
});