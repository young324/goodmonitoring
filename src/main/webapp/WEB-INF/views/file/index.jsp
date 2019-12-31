<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<%@ include file="../includes/contants.jspf" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${HOME}/resources/css/board.css" rel="stylesheet" />
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>


</head>
<body>


<form action="upload.do" method="post" enctype="multipart/form-data" >

<%@ include file="capacity_file.jsp" %>

<button >입력</button>
</form>

</body>
</html>