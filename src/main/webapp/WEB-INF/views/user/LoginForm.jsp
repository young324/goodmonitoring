<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->

<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->

<link rel="stylesheet" href="/resources/css/bootstrap.min.css">

<title>로그인</title>

<style>
/* PC용 CSS */
@media all and (min-width:960px){
/* 기본 CSS */
#wrap{
	position:relative;
	width:90%;
	vertical-align: middle;
}

.login_form{

}


</style>

</head>

<body>

 <!-- 네비게이션  -->

 <%@include file="../includes/header.jsp"%> 

 <!-- 로긴폼 -->

 <div class="container" id ="wrap">
<div class="login_form">
  <div class="col-lg-4"></div>

  <div class="col-lg-4">

  <!-- 점보트론 -->

   <div class="jumbotron" style="padding-top: 20px;">

   <!-- 로그인 정보를 숨기면서 전송post -->

   <form method="post" action="/user/LoginForm">

  <!-- <h3 style="text-align: center;"> 로그인화면 </h3>-->

    <div class="form-group">

     <input type="text" class="form-control" placeholder="아이디" id="USR_ID" name="USR_ID" maxlength="20">

    </div>

       

    <div class="form-group">

     <input type="password" class="form-control" placeholder="비밀번호" id="USR_PASS" name="USR_PASS" maxlength="20">

    </div>

    <input type="submit" class="btn btn-primary form-control" value="로그인">
<!-- 버튼 아래 메뉴 -->
    <div class="text-center" style="float:none; margin-top:10%">
    	<thead>
    	<tr>
    		<th><a href="/board/Joinselect">회원가입</a></th>
    		<th>|</th>
    		<th><a href=".jsp">아이디 찾기</a></th>
    		<th>|</th>
    		<th><a href=".jsp">비밀번호 찾기</a></th>
    	</tr>
    	</thead>
    </div>

    

   </form>

  </div>

 </div>
</div>
</div>



 <!-- 애니매이션 담당 JQUERY -->

 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 

 <!-- 부트스트랩 JS  -->

 <script src="js/bootstrap.js"></script>

 

</body>

</html>