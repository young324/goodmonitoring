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
 
.img{
		width:30%; 
	}
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

   

  
<!-- 버튼 아래 메뉴 -->
    <div class="text-center" style="float:none; margin-top:10%">
     
    	  <table>
    	<tr>
    		<td>     
    			<div class="thumbnail">
    			<a href="/user/userJoin">
    			<img src="/resources/img/user_img.png">
    			</a> 
    			<a class="btn btn-primary" href="/user/userJoin">개인 회원가입</a>
				</div>
    		</td>
    	 	  
    		<td>
    			<div class="thumbnail">
    			<a href="/company/companyJoin">
    			<img src="/resources/img/company_img.png">
    			</a>
    			<a class="btn btn-primary" href="/company/companyJoin">기업 회원가입</a> 
				</div>
    		</td>
    	</tr>
    </table> 
    	
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