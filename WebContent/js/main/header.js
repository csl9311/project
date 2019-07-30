// ****************사이드 메뉴**************
function openNav() {
	document.getElementById("mySidenav").style.width = "240px";
	$('.sidenav a').css("display", "");
}

function closeNav() {
	document.getElementById("mySidenav").style.width = "0";
	$('.sidenav a').css("display", "none");
}
function logout() {
	console.log(location);
	$.ajax({
		url : '<%=request.getContextPath()%>/member.logout',
		type : 'get',
		success : function(data) {
			alert("로그아웃되었습니다.");
			location.reload();
		}
	});
}