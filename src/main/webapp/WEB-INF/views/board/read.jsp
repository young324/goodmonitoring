<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">모니터링 모집정보</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>


<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<label id='BOARD_NO' name='BOARD_NO'
					value='<c:out value="${board.BOARD_NO}"/>'> <c:out
						value="${board.BOARD_NO}" /></label> <label name='AD_TITLE'
					value='<c:out value="${board.AD_TITLE}"/>'> <c:out
						value="${board.AD_TITLE}" /></label>

				<div class="pull-right">
					<label>추천 수 :</label> <label name='RECOMMEND_COUNT'
						value='<c:out value="${board.RECOMMEND_COUNT}"/>'> <c:out
							value="${board.RECOMMEND_COUNT}" /></label> <label>조회 수 :</label> <label
						name='VIEW_COUNT' value='<c:out value="${board.VIEW_COUNT}"/>'>
						<c:out value="${board.VIEW_COUNT}" />
					</label>
				</div>

			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<!-- 추가 -->
				<div class="form-group">
					<label name='AD_TITLE' value='<c:out value="${board.AD_TITLE}"/>'>
						<c:out value="${board.AD_TITLE}" />
					</label>
				</div>
				<!-- end 추가 -->
				<!-- 수정 -->
				<div class="form-group">
					<label>모집인원 : </label><label name='AD_PERSONNEL'
						value='<c:out value="${board.AD_PERSONNEL}"/>'> <c:out
							value="${board.AD_PERSONNEL}" /></label> <label>명</label>
				</div>
				<div class="form-group">
					<label>모집기간 :</label> <label name='AD_START_DATE'
						value='<c:out value="${board.AD_START_DATE}"/>'> <c:out
							value="${board.AD_START_DATE}" /></label> <label> ~ </label> <label
						name='AD_END_DATE' value='<c:out value="${board.AD_END_DATE}"/>'>
						<c:out value="${board.AD_END_DATE}" />
					</label>
				</div>
				<div class="form-group">
					<label>발표일 : </label> <label name='AD_ANNOUNCEMENT_DATE'
						value='<c:out value="${board.AD_ANNOUNCEMENT_DATE}"/>'> <c:out
							value="${board.AD_ANNOUNCEMENT_DATE}" /></label>
				</div>
				<div class="form-group">
					<label>자격요건 : </label> <label name='AD_TEXT'
						value='<c:out value="${board.AD_TEXT}"/>'> <c:out
							value="${board.AD_TEXT}" /></label>
				</div>
				<div class="form-group">
					<label>지원방법 : </label> <label name='AD_APPLY_TEXT'
						value='<c:out value="${board.AD_APPLY_TEXT}"/>'> <c:out
							value="${board.AD_APPLY_TEXT}" /></label>
				</div>
				<div class="form-group">
					<label>활동혜택 : </label> <label name='WORK_BENEFIT_TEXT'
						value='<c:out value="${board.WORK_BENEFIT_TEXT}"/>'> <c:out
							value="${board.WORK_BENEFIT_TEXT}" /></label>
				</div>
				<div class="form-group">
					<label>활동기간 : </label> <label name='WORK_START_DATE'
						value='<c:out value="${board.WORK_START_DATE}"/>'> <c:out
							value="${board.WORK_START_DATE}" /></label> <label> ~ </label> <label
						name='WORK_END_DATE'
						value='<c:out value="${board.WORK_END_DATE}"/>'> <c:out
							value="${board.WORK_END_DATE}" /></label>
				</div>
				<div class="form-group">
					<label>활동내용 : </label> <label name='WORK_TEXT'
						value='<c:out value="${board.WORK_TEXT}"/>'> <c:out
							value="${board.WORK_TEXT}" /></label>
				</div>
				<!-- 이미지 --> 
				<img src="<spring:url value='/uploads/board/캡쳐.png'/>"/>      
				<!-- 추천버튼 -->

				<div style="text-align: right;">
					<a class="btn btn-outline-dark heart" onclick="likebtn();"> <img
						id="like" src="">
					</a>
				</div>
			

				<!-- 기업회원만 접근가능 -->
				<c:choose>
					<c:when test="${!empty sessionScope.company}">
						<button data-oper='modify' class="btn btn-defalut">수정</button>       		
        				<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>    	
    				</c:when>
    			</c:choose>

				<!-- 개인회원만 접근가능 -->
				<c:choose>
					<c:when test="${!empty sessionScope.user}">
						<button id="apply" data-oper='list' class="btn btn-info"
						onClick="window.open('${board.URL}');applybtn();" >지원하기</button>
						<!-- @@@지원 할 수 있는 홈페이지 링크 연결 @@@-->  
						<!-- 링크 연결, 지원하기 함수 -->  				
				</c:when>
    			</c:choose>
				<button id="listbtn" data-oper='list' class="btn btn-info"
				onclick="location='/board/list'">리스트</button>
				<!-- end 수정-->
				<!-- 추가 -->
				<form id='operForm' action="/boad/modify" method="get">
					<input type='hidden' id='BOARD_NO' name='BOARD_NO'
						value='<c:out value="${board.BOARD_NO}"/>'> <input
						type='hidden' name='pageNum'
						value='<c:out value="${cri.pageNum}"/>'> <input
						type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
					<input type='hidden' name='keyword'
						value='<c:out value="${cri.keyword}"/>'> <input
						type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
				</form>
				<!-- end 추가 -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<script type="text/javascript">
var ckval = ${ck};//지원여부
var likeval = ${like};//추천여부
var USR_NO = ${USR_NO};

$(document).ready(function() {
	
		var operForm = $("#operForm"); 
		$("button[data-oper='modify']").on("click", function(e){
			operForm.attr("action","/board/modify").submit();
		});
      
  	
  	
  	if(likeval>0) {
        console.log(likeval);        
        $("#like").prop("src", "/resources/img/heart_liked.png");
        $(".like").prop('name',likeval)
    }
    else {
        console.log(likeval);  
        $("#like").prop("src", "/resources/img/heart_unliked.png");
        $(".like").prop('name',likeval)
    }
  	
    
    
  	
  	
});
//추천
function likebtn(){
	var that = $("#like");
	
	var sendData = {BOARD_NO : '${board.BOARD_NO}' , like: likeval, USR_NO : USR_NO};
	
	$.ajax({
		url : '/board/like',
		type : "post",
		data : sendData,
		success : function(data){
			that.prop('name',data);
			if(data==1) {
                $('#like').prop("src","/resources/img/heart_liked.png");

				likeval = data; 
				console.log(likeval); 
				$("#like").prop("src", "/resources/img/heart_liked.png");
		        $(".like").prop('name',likeval)
            }
            else{
                $('#like').prop("src","/resources/img/heart_unliked.png");
 
                likeval = data; 
                console.log(likeval); 
                $("#like").prop("src", "/resources/img/heart_unliked.png");
                $(".like").prop('name',likeval)
            }				
	  }
	});
}

//지원
function applybtn(){
	var that = $("#ck");
	
	var sendData = {BOARD_NO : '${board.BOARD_NO}' , ck : ckval , USR_NO : USR_NO, INTEREST_CATEGORY : '${board.INTEREST_CATEGORY}',
					C_NAME : '${board.c_NAME}'};
	
	
	$.ajax({
		url : '/board/apply',
		type : "post",
		data : sendData,
		success : function(data){
			that.prop('name',data);
			if(data==1) {
				ckval = data; 
				console.log("이미 지원한 모집정보입니다."); 
		        $(".apply").prop('name',ckval)
            }
            else{ 
                ckval = data; 
                console.log("해당 모집정보에 지원하였습니다."); 
                $(".apply").prop('name',ckval)
            }				
	  }
	});
}

</script>

<%@include file="../includes/footer.jsp"%>


