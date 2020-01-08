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

<!--  <nav class="navbar navbar-default">

  <div class="navbar-header">

   <button type="button" class="navbar-toggle collapsed" 

    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"

    aria-expaned="false">

     <span class="icon-bar"></span>

     <span class="icon-bar"></span>

     <span class="icon-bar"></span>

    </button>

      <a class="navbar-brand" href="index.html">모니터링 모집정보</a>

  </div>

  <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">

   <ul class="nav navbar-nav">

    <li><a href="/board/list">메인</a></li>

    <li><a href="/board/list">게시판</a></li>

	<li><a href="/user/userJoin">회원가입</a></li>
	
	<li><a href="/user/LoginForm">로그인</a></li>
   </ul>

    

   <ul class="nav navbar-nav navbar-right">

    <li class="dropdown">

     <a href="#" class="dropdown-toggle"

      data-toggle="dropdown" role="button" aria-haspopup="true"

      aria-expanded="false">접속하기<span class="caret"></span></a>

     <ul class="dropdown-menu">

      <li class="active"><a href="login.jsp">로그인</a></li>

      <li><a href="/board/Loginselect">회원가입</a></li>

      

     </ul>

    </li>

   </ul>

  </div> 

 </nav> -->
 <%@include file="../includes/header.jsp"%> 

 <!-- 로긴폼 -->

 <div class="container" id ="wrap">
<div class="login_form">
  <div class="col-lg-4"></div>

  <div class="col-lg-4">

  <!-- 점보트론 -->

   <div class="jumbotron" style="padding-top: 20px;">

  
<!-- 버튼 아래 메뉴 -->
    <div class="text-center" style="float:none; margin-top:10%">
    	<thead>
    	<tr>

    		<th><a href="/user/LoginForm">개인 회원 로그인</a></th>
    		<th>|</th>
    		<th><a href="/company/companyLoginForm">기업 회원 로그인</a></th>
    	</tr>
    	</thead>
    </div>

    



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