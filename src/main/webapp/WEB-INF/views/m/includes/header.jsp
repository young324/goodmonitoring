<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<!DOCTYPE html>
<html lang="kr"> 

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>모니터링 모집정보 서비스</title>  

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- <style type="text/css">
/* 모바일용 CSS */
@media all and (min-width:320px) {
	#wrap {
		flex-flow: row wrap;
	}
}
</style>
</head> 

<body> -->
	<!-- Navigation 위에거-->
	<div class="row"> 
<div class="col-lg-12">   
		<div class="panel panel-default"> 
	<nav class="navbar navbar-default">
		<div id="navbar-header">
	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>  
                    <span class="icon-bar"></span>
                </button>    
                 <a class="navbar-brand" href="/m/board/main"><img src="/resources/img/Goodmonitoring.png"></a>  
	<div class="navbar-header">

	 

 

	</div>

	<div class="collapse navbar-collapse"
		id="#bs-example-navbar-collapse-1">

		<ul class="nav navbar-nav">

			<c:choose>
				<c:when test="${!empty sessionScope.user}">
				<li><a href="/m/board/main">메인</a></li>
					<li><a href="/m/board/list?pageNum=1&amount=10">게시판</a></li>
					<li><a href="/m/board/Joinselect">회원가입</a></li>
					<li><a href="/m/user/logout">로그아웃</a></li>
					
					  
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">모집정보 찾기<span class="caret"></span></a>

				<ul class="dropdown-menu">
					<c:choose>

						<c:when test="${!empty sessionScope}">
							<li><a href="/m/board/list?pageNum=1&amount=10">전체 모집정보</a></li>
							<li><a href="/m/board/fitlistJoin">맞춤 모집정보</a></li>
							<li><a href="/m/board/graphmoniter">이달의 모집정보</a></li>
						</c:when>
						<c:otherwise>
						</c:otherwise>

					</c:choose>
				</ul></li>
				</c:when>
				<c:when test="${!empty sessionScope.company}">
					<li><a href="/m/board/main">메인</a></li>
					<li><a href="/m/board/list?pageNum=1&amount=10">게시판</a></li>
					<li><a href="/m/board/Joinselect">회원가입</a></li>
					<li><a href="/m/user/logout">로그아웃</a></li>
					
					
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">모집정보 찾기<span class="caret"></span></a>

				<ul class="dropdown-menu">
					<c:choose>

						<c:when test="${!empty sessionScope}">
							<li><a href="/m/board/list?pageNum=1&amount=10">전체 모집정보</a></li>
							<li><a href="/m/board/graphmoniter">이달의 모집정보</a></li>
						</c:when>
						<c:otherwise>
						</c:otherwise>

					</c:choose>
				</ul></li>
				</c:when>

				<c:otherwise>
					<li><a href="/m/board/main">메인</a></li>
					<li><a href="/m/board/list?pageNum=1&amount=10">게시판</a></li>
					<li><a href="/m/board/Joinselect">회원가입</a></li>
					<li><a href="/m/board/Loginselect">로그인</a></li>
					<ul class="nav navbar-nav navbar-right">

			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">모집정보 찾기<span class="caret"></span></a>

				<ul class="dropdown-menu">
					<c:choose>

						<c:when test="${!empty sessionScope}">
							<li><a href="/m/board/list?pageNum=1&amount=10">전체 모집정보</a></li>
							<li><a href="/m/board/fitlistJoin">맞춤 모집정보</a></li>
							<li><a href="/m/board/graphmoniter">이달의 모집정보</a></li>
						</c:when>
						<c:otherwise>
						</c:otherwise>

					</c:choose>
				</ul></li>
		</ul>

				</c:otherwise>
			</c:choose>
		</ul>



	</div>
	 </div> 
	</nav>  
<!-- <div class="row">
<div class="col-lg-12"> 
		<div class="panel panel-default"> -->
<!-- 	<div class="col-lg-12">
		<h1 class="page-header">모니터링 모집정보</h1>
		<img src="/resources/img/Goodmonitoring.png"> 
	</div>
  -->

  

		<!-- 추가 -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>