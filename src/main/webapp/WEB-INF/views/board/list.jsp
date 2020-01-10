<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->

<meta name="viewport" content="width=device-width" initial-scale="1">

<link rel="stylesheet" href="/resources/css/bootstrap-checkbox.css">

<style>

/* PC용 CSS */
@media all and (min-width:960px) {
	/* 기본 CSS */
	#wrap {
		position: relative;
		width: 90%;
	}
	.txt_line {   
		width: 70px;
		padding: 0 5px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	.search {
		width: 60%;
	}
}
/* 모바일용 CSS */
.txt_line {
	width: 70px;
	padding: 0 5px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
</head>
<body>

<!-- 네비게이션  -->
<!-- <div class="row">
	<div class="col-lg-12"> 
		<div class="panel panel-default">
		
	<div class="col-lg-12">
		<h1 class="page-header">모니터링 모집정보</h1>
	</div> 
	/.col-lg-12 --> 
 
<%--  <nav class="navbar navbar-default">





  <div class="navbar-header">

   <button type="button" class="navbar-toggle collapsed" 

    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"

    aria-expaned="false">

     <span class="icon-bar"></span>

     <span class="icon-bar"></span>


     <span class="icon-bar"></span>

    </button>

    

  </div>
 


  <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
  
  
  
  

   <ul class="nav navbar-nav">

<c:choose>
	<c:when test="${!empty sessionScope.user}">       		
        		<li class="nav-item dropdown" >
        			<a href="/board/fitlistJoin">${sessionScope.user.USR_ID } 님의 이용내역을 분석하여 적합한 모집정보를 추천 드립니다.</a>
        		</li>        		        	
    </c:when>
    <c:when test="${!empty sessionScope.company}">       		
        		<li class="nav-item dropdown" >
        			<a class="nav-link">${sessionScope.C_ID} 님 환영합니다.</a>
        		</li>         	
    </c:when>
  	
<c:otherwise>
    <li><a href="/board/Loginselect">로그인하면 맞춤 모집정보를 제공받을 수 있습니다.</a></li>


	
</c:otherwise>
	
</c:choose>	


   </ul>

    

   <ul class="nav navbar-nav navbar-right">

    <li class="dropdown">

     <a href="#" class="dropdown-toggle"

      data-toggle="dropdown" role="button" aria-haspopup="true"

      aria-expanded="false">메뉴<span class="caret"></span></a>

     <ul class="dropdown-menu">
     <c:choose>
     
		<c:when test="${!empty sessionScope}">       		
        		<li><a href="/user/logout">로그아웃</a></li>
        		<li><a href="/user/mypage">마이페이지</a></li>     	
        		     	
  	  	</c:when>
  	  <c:otherwise>
  	  </c:otherwise>
	
</c:choose>	
 	
     </ul>

    </li>

   </ul>

  </div> 

 </nav> --%>
<!-- 상세검색 -->
 <%@include file="../includes/header.jsp"%>  
<%@include file="../includes/CheckboxSearch.jsp"%>
 

<!-- /.row -->
 
 
<!-- 여기 -->

			<div class="panel-heading">
				모집정보
				<c:choose>
					<c:when test="${!empty sessionScope.user}">
						<button id='FitBtn' type="button" class="btn btn-xs pull-right">맞춤모집정보</button>
						<button id='listBtn' type="button" class="btn btn-xs pull-right">전체
							모집정보</button>

					</c:when>
					<c:when test="${!empty sessionScope.company}">
						<button id='regBtn' type="button" class="btn btn-xs pull-right">모집정보작성</button>

					</c:when>

					<c:otherwise>

					</c:otherwise>
				</c:choose>

			</div>
			<!-- /.panel-heading -->

                         
			<div class="panel-body">
				<table 
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>분류</th>
							<th>제목</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<c:forEach items="${list}" var="board">
						<tr>
							<td><c:out value="${board.BOARD_NO}" /></td>
							<td class="txt_line"><c:out value="${board.TARGET}" /></td>


							<td>
								<!-- script로 기동 <a  href='/board/read?BOARD_NO=<c:out value="${board.BOARD_NO}"/>'>-->
								<a class='move' href='<c:out value="${board.BOARD_NO}"/>'> 
								<c:out value="${board.AD_TITLE}" /></a>
							</td>



							<td><c:out value="${board.REPORTING_DATE}" /></td>
							<td><c:out value="${board.VIEW_COUNT}" /></td>

						</tr>
					</c:forEach>
				</table>
				<!--  검색처리 추가 -->
				<div class="row">
					<div class="col-lg-12">
						<form id="searchForm" action="/board/list" method="get">
							<select name="type">
								<option value=""
									<c:out value="${pageMaker.cri.type == null ? 'selected':'' }'"/>="">--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T' ? 'selected':'' }'"/>="">제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C' ? 'selected':'' }'"/>="">내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W' ? 'selected':'' }'"/>="">작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':'' }'"/>="">제목
									or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW' ? 'selected':'' }'"/>="">제목
									or 작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected':'' }'"/>="">제목
									or 내용 or 작성자</option>
							</select> <input type="text" name="keyword"
								value='<c:out value="${pageMaker.cri.keyword}"/>'> 
								<input type="hidden" name="pageNum"	value='<c:out value="${pageMaker.cri.pageNum}"/>'>
								<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>'>
							<button class="btn btn-default">Search</button>
						</form>
					</div>
				</div>

				<!--  end 검색처리 추가 -->
				<!-- Page처리 추가 -->
				<div class="pull-right">
					<ul class="pagination">
						<c:if test="${pageMaker.prev }">
							<li class="paginate_button previous"> 
							<a	href="${pageMaker.startPage-1}">Previous</a>
							</li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} " >
							<a href="${num}">${num}</a>
							</li> 
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next">
							<a href="${pageMaker.endPage+1}">Next</a>
							</li>
						</c:if>
					</ul>
				</div>
				<!-- form 추가 -->
				<form id="actionForm" action="/board/list" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}"> 
					<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"/>'> 
					<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
				</form> 
				<!-- end form 추가 -->
				<!-- end Page처리 추가 -->
				<!-- Madal창 추가 Start-->
				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
				<!-- Madal창 추가 End-->

			</div>
			<!-- /.panel-body -->
	
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
   </body>

 

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var result = '<c:out value="${result}"/>';
						checkModal(result);
						history.replaceState({}, null, null);
						function checkModal(result) {
							if (result == '' || history.state) {
								return;
							}
							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글 " + parseInt(result)
												+ " 번이 등록되었습니다.");
							}
							$("#myModal").modal("show");
						}

						$("#regBtn").on("click", function() {
							self.location = "/board/write";
						});

						$("#FitBtn").on("click", function() {
							self.location = "/board/fitlistJoin";
						});
						$("#listBtn").on("click", function() {
							self.location = "/board/list";
						});

						/**page 처리 Script */
						var actionForm = $("#actionForm");
						$(".paginate_button a").on(
								"click",
								function(e) {
									e.preventDefault();
									console.log('click');
									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});
						/**상세조회로 가기 */
						$(".move").on("click", function(e) {e.preventDefault();
											actionForm
													.append("<input type='hidden' name='BOARD_NO' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/board/read");
											actionForm.submit();
											console.log($(this).val());  
										});
						/**Search 처리 Script */
						var searchForm = $("#searchForm");
						$("#searchForm button").on(
								"click",
								function(e) {
									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색 종류를 선택하세요!");
										return false;
									}
									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 선택하세요!");
										return false;
									}
									searchForm.find("input[name='pageNum']")
											.val("1");
									e.preventDefault();
									searchForm.submit();
								})

						//$("#detailtable").hide();

						$(".detail").click(function() {
							if ($("#detailtable").is(":visible")) {
								$("#detailtable").hide();

							} else {
								$("#detailtable").show();

							}

						});

					});

	function searchbtn() {

		var lists = [];

		$("input[name='TARGET']:checked").each(function(i) { //jQuery로 for문 돌면서 check 된값 배열에 담는다
			lists.push($(this).val());
		});

		var sendData = {
			TARGET : lists
		};

		$.ajax({
			url : '/board/boardSearchList',
			type : "post",
			data : sendData,
			success : function(data) {

			}
		});
	}
</script>
<%@include file="../includes/footer.jsp"%>

</html>  
