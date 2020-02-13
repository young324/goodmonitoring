<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ include file="../../m/includes/header.jsp"%>
 

<!-- style="margin-right:100px"
 --><!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
	 
			<div class="panel-heading">
				<c:out value="${board.AD_TITLE}" />
					<div style="font-size:x-small;">
								<c:out value="${board.REPORTING_DATE}" />
								조회 :<c:out value="${board.VIEW_COUNT}" />			 
								추천 :<c:out value="${board.RECOMMEND_COUNT}" />
					</div>
			</div> 
			<!-- /.panel-heading -->
	<div style="white-space: pre-line; float: left">
	<table class="table table-bordered"> 
		<tr>
			<td>업종</td>  
			<td><c:out value="${board.INTEREST_CATEGORY}" /></td>  
		</tr>
		<tr>
			<td>대상</td>  
			<td><c:out value="${board.TARGET}" /></td>  
		</tr>
		<tr>  
			<td>모집인원</td>
			<td><c:out value="${board.AD_PERSONNEL}" />명</td>  
		</tr>
		<tr>  
			<td>모집기간</td>
			<td><c:out value="${board.AD_START_DATE}" /> ~ <c:out value="${board.AD_END_DATE}" /></td>  
		</tr> 
		<tr>  
			<td>발표일</td>
			<td><c:out value="${board.AD_ANNOUNCEMENT_DATE}" /></td>  
		</tr>
		<tr>  
			<td>활동기간</td>
			<td><c:out value="${board.WORK_START_DATE}" /> ~ <c:out value="${board.WORK_END_DATE}" /></td>  
		</tr> 
		</tbody>  
	</table>
	<table class="table"> 
	 <thead class="thead-dark">
	  	<tr>
	  		<th scope="col">자격요건</th>
	  	</tr>
	  </thead> 
	  <tbody>
	  	<tr> 
	  		<td  scope="row">
	  			<c:out value="${board.AD_TEXT}" />
	  		</td>
	  	</tr>
	  </tbody>
	  
	  <thead class="thead-dark">
	  	<tr>
	  		<th scope="col">활동내용</th>
	  	</tr>
	  </thead> 
	  <tbody>
	  	<tr> 
	  		<td  scope="row">
	  			<c:out value="${board.WORK_TEXT}" />
	  		</td>
	  	</tr>
	  </tbody>
	  
	  <thead class="thead-dark">
	  	<tr>
	  		<th scope="col">활동혜택</th>
	  	</tr>
	  </thead> 
	  <tbody>
	  	<tr> 
	  		<td  scope="row">
	  			<c:out value="${board.WORK_BENEFIT_TEXT}" />
	  		</td>
	  	</tr>
	  </tbody>
	  
	    <thead class="thead-dark">
	  	<tr>
	  		<th scope="col">지원방법</th>
	  	</tr>
	  </thead> 
	  <tbody>
	  	<tr> 
	  		<td  scope="row">
	  			<c:out value="${board.AD_APPLY_TEXT}" />
	  		</td>
	  	</tr>
	  </tbody>
	</table>   		  
 						</div>
						<!-- 이미지 -->
						<div class="thumbnail-wrapper">
							<div class="thumbnail">
								<img src="https://${aws_url}/${aws_bucketname }/${file.FILE_NAME}" />
							</div>
								<!-- 추천버튼 -->
						<div style="text-align: right;">
							<a class="btn btn-outline-dark heart" onclick="likebtn();"> <img
								id="like" src="">
							</a>
						</div>  
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
									onClick="window.open('${board.URL}');applybtn();">지원하기</button>
								<!-- @@@지원 할 수 있는 홈페이지 링크 연결 @@@-->
								<!-- 링크 연결, 지원하기 함수 -->
								
							
							</c:when>
						</c:choose>
						<!-- <button id="listbtn" data-oper='list' class="btn btn-info"
							onclick="location='/board/list'">리스트</button> -->
							<button id="back" data-oper='list' class="btn btn-info" onclick='history.back(); return false;'>리스트</button>
						<!-- end 수정--> 
						<!-- 추가 -->  
						<form id='operForm' action="/boad/modify" method="get">
							<input type='hidden' id='BOARD_NO' name='BOARD_NO'
								value='<c:out value="${board.BOARD_NO}"/>'> <input
								type='hidden' name='pageNum'
								value='<c:out value="${cri.pageNum}"/>'> <input
								type='hidden' name='amount'
								value='<c:out value="${cri.amount}"/>'> <input
								type='hidden' name='keyword'
								value='<c:out value="${cri.keyword}"/>'> <input
								type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
						</form>
						<!-- end 추가 -->
					
				</div>
				<!-- /.panel -->
			</div>
			<!-- 줄바꿈 -->
		</div>
		<!-- /.col-lg-12 -->
	 
	<!-- /.row -->
	<script type="text/javascript">
		var ckval = ${ck};//지원여부
		var likeval = ${like};//추천여부
		var USR_NO = ${USR_NO};
  
		$(document).ready(function() {

			var operForm = $("#operForm");
			$("button[data-oper='modify']").on("click", function(e) {
				operForm.attr("action", "/board/modify").submit();
			});
			
			if (likeval > 0) {
				console.log(likeval);
				$("#like").prop("src", "/resources/img/heart_liked.png");
				$(".like").prop('name', likeval)
			} else {
				console.log(likeval);
				$("#like").prop("src", "/resources/img/heart_unliked.png");
				$(".like").prop('name', likeval)
			}

		});
		//추천
		function likebtn() {
			var that = $("#like");

			var sendData = {
				BOARD_NO : '${board.BOARD_NO}',
				like : likeval,
				USR_NO : USR_NO
			};

			$.ajax({
				url : '/board/like',
				type : "post",
				data : sendData,
				success : function(data) {
					that.prop('name', data);
					if (data == 1) {
						$('#like')
								.prop("src", "/resources/img/heart_liked.png");

						likeval = data;
						console.log(likeval);
						$("#like")
								.prop("src", "/resources/img/heart_liked.png");
						$(".like").prop('name', likeval)
					} else {
						$('#like').prop("src",
								"/resources/img/heart_unliked.png");

						likeval = data;
						console.log(likeval);
						$("#like").prop("src",
								"/resources/img/heart_unliked.png");
						$(".like").prop('name', likeval)
					}
				}
			});
		}

		//지원
		function applybtn() {
			var that = $("#ck");

			var sendData = {
				BOARD_NO : '${board.BOARD_NO}',
				ck : ckval,
				USR_NO : USR_NO,
				INTEREST_CATEGORY : '${board.INTEREST_CATEGORY}',
				C_NAME : '${board.c_NAME}'
			};

			$.ajax({
				url : '/board/apply',
				type : "post",
				data : sendData,
				success : function(data) {
					that.prop('name', data);
					if (data == 1) {
						ckval = data;
						console.log("이미 지원한 모집정보입니다.");
						$(".apply").prop('name', ckval)
					} else {
						ckval = data;
						console.log("해당 모집정보에 지원하였습니다.");
						$(".apply").prop('name', ckval)
					}
				}
			});
		}
	</script>

	<%@include file="../../m/includes/footer.jsp"%>