<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.tab{
	margin : auto;
	
}
.tab tr td{
	padding : 10px;
	text-align: left !important
}
.updateadr{
	width: 25vw;
}
.updatephone{
	width: 5vw;
}

</style>

</head>
<%@ include file="Form.jsp"%>
<body>
<<<<<<< HEAD
<div id="mypage">


	<section class="result">		
		
		<table class="tab">
            <tr>
                <td>
                    <label>이름</label>
                </td>
                <td>
                    <input type="text" name="sname" id="sname" size="20px"> 
                </td>
            </tr>
            <tr>
                <td>
                    <label>아이디</label>
                </td>
                <td>
                    <input type="text" name="id" id="id" size="20px">
                    <input type="button" id="check" value="중복확인">
                </td>
            </tr>
            <tr>
                <td>
                    <label>비밀번호</label>
                </td>
                <td>
                    <input type="text" name="pwd" id="pwd" size="20px"> 
                    *영문 대소문자/숫자/특수문자를 혼용하여 2종류10~16자 또는 3종 8~16자
                </td>
            </tr>
            <tr>
                <td>
                    <label>비밀번호 확인</label>
                </td>
                <td>
                    <input type="text" name="pwdCheck" id="pwdCheck" size="20px">
                </td>
            </tr>
            <tr>
                   <td>
                         생일/성별
                    </td>
                    <td>
                    <script type="text/javascript">
                         var today = new Date();
                         var toyear = parseInt(today.getFullYear ());
                         var start = toyear;
                         var end = toyear - 15;

                         document.write("<select name=birth1> ");
                         document.write("<option value='2015' selected>");
                         for (i=start;i>=end;i--) document.write("<option>"+i);
                         document.write("</select>년  ");

                         document.write("<select name=birth2>");
                         document.write("<option value='' selected>");
                         for (i=1;i<=12;i++) document.write("<option>"+i);
                         document.write("</select>월  ");

                         document.write("<select name=birth3>");
                         document.write("<option value='' selected>");
                         for (i=1;i<=31;i++) document.write("<option>"+i);
                         document.write("</select>일  </font>");
                         </script>
                         <input type="radio" name="gender" value="남">남
                         <input type="radio" name="gender" value="여" checked>여
                    </td>
               </tr>
            <tr>
                <td>
                    <label>우편번호</label>
                </td>
                <td>
                    <input type="text" name="dong" id="dong" size="5">-
                    <input type="text" name="dong" id="dong" size="5">
                    <input type="button" id="address" value="우편번호검색">
                </td>
            </tr>
            <tr>
                <td>
                    <label>주소</label>
                </td>
                <td>
                    <input type="text" name="home" id="home" class="updateadr"> 
                </td>
            </tr>
            <tr>
                <td>
                    <label>상세주소</label>
                </td>
                <td>
                    <input type="text" name="homeAddress" id="homeAddress" class="updateadr">   
                </td>
            </tr>
            <tr>
                <td>
                    <label>이메일</label>
                </td>
                <td>
                    <input type="text" name="email" id="email" size="10"> @
                    <input type="text" name="email2" id="email2" style="width:10vw">
                    <select id="email2" style="width: 5vw">
                        <option value=""></option>
                        <option value="1">직접 입력</option>
                        <option value="google.com">google.com</option>
                        <option value="naver.com">naver.com</option>
                        <option value="daum.net">daum.net</option>
                        
                    </select>
                    <input type="button" id="check2" value="중복확인">
                </td>
            </tr>    
            <tr>
                <td>
                    휴대폰
                </td>
                <td>                   		
                    <input type="text" name="smartPhone1" class="updatephone"> -
                    <input type="text" name="smartPhone1" class="updatephone"> -
                    <input type="text" name="smartPhone2" class="updatephone">
                </td>
            </tr>
            <tr>
            <tr>
                <td>
                    <label>뉴스메일</label>
                </td>
                <td>
                    <input type="radio" name="news" checked>받습니다.
                    <input type="radio" name="news">받지 않습니다.
                </td>
            </tr>
            <tr>
                <td>
                    <label>SMS안내(이벤트)</label>
                </td>
                <td>
                    <input type="radio" name="sms" checked>받습니다.
                    <input type="radio" name="sms">받지 않습니다.
                </td>
            </tr>
        </table>
        <br>
        <input type="button" id="join" value="회원가입">
	</section>
</div>



</body>
<%@ include file="/views/common/coinfooter.jsp"%>
</html>