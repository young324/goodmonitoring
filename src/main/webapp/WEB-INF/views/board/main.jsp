<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@include file="../includes/header.jsp"%>


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
 .carousel-inner > .item > img {  
      top: 0; 
      left: 0;
      min-width: 100%;
      min-height: 300px;
    }  
 

</style>
<div class="row">
<div class="col-lg-12"> 
		<div class="panel panel-default">
	<div class="col-lg-12">
		<h1 class="page-header">모니터링 모집정보</h1>
	</div>
	<!-- /.col-lg-12 -->


<!-- 네비게이션  -->

 <nav class="navbar navbar-default">





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

 </nav>
<!-- 상세검색 보이는 칸 -->
 




<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			 

			<div class="panel-body">
			<table>
				<tr>
					<td><div>
				<table width="100%"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>인기 모집정보</th>
						</tr>
					</thead>
					<c:forEach items="${RecommendList}" var="board">
						<tr>
							<td>
								<!-- script로 기동 <a  href='/board/read?BOARD_NO=<c:out value="${board.BOARD_NO}"/>'>-->
								<a class='move' href='<c:out value="${board.BOARD_NO}"/>'> 
								<c:out value="${board.AD_TITLE}" /></a>
							</td>
 

						</tr>
					</c:forEach>
				</table>
				</div> 
				</td>
					<td rowspan="2">
						<div style="float:right;"> 
        <div id="carousel-example-generic" class="carousel slide">
        <!--
            id="carousel-example-generic" 없으면 다음 페이지로 안넘어간다.
            class="carousel":이미지 양쪽의 화살표 보이게 하는것
                (화살표 없어도 그 부근 클릭하면 넘어간다.이 줄 없으면 아래 동그란 인티케이터도 안나타난다.) 
                 slide 없으면 슬라이드 효과 없이 그냥 이미지가 나타난다. 
                -->
        
            <!-- Indicators(이미지 하단의 동그란것->class="carousel-indicators") -->
            <ol class="carousel-indicators">
              <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
              <li data-target="#carousel-example-generic" data-slide-to="1"></li>
              <li data-target="#carousel-example-generic" data-slide-to="2"></li>
              <li data-target="#carousel-example-generic" data-slide-to="3"></li>
              <li data-target="#carousel-example-generic" data-slide-to="4"></li>
            </ol>
            <!-- 
                위의 data-slide-to가 0 2 2이면 두번째 동그라미 클릭해도 3번째 이미지가 나온다. 
                0 2 5이면 세번째 동그라미 클릭해도 아무 반응이 없다. 
                Indicators는 이미지 갯수와 같게 만들어야 한다. 
            -->
             <!-- Carousel items -->  
<!--              style="max-width: 25%; height: auto;" 
 -->             <div class="carousel-inner"  style="width: 300px; height: 300px;">  
             <!-- class="carousel-inner" : 없으면 이미지 3장이 모두 세로로 배치된다. 
             -->   
                 
               
             	<%-- <c:forEach items="${lately5}" var="lately5">
					<div class="item" >   
                  		<img onclick="javascript:location.href='http://naver.com';" src="<spring:url value="/img/${lately5.FILE_PATH}"/>" alt="Second slide">        
                	</div> 
				</c:forEach> --%>
				 
				
                <div class="item active">   
					<img id="slide0" onclick="javascript:location.href='http://naver.com';" src="/resources/img/test.jpg" alt="First slide">
                </div> 
                <div class="item" >             
                   <img id="slide1" onclick="javascript:location.href='http://naver.com';" src="/resources/img/test.jpg" alt="Second slide">        
                </div>  
                <div class="item">  
                   <img id="slide2" onclick="javascript:location.href='http://naver.com';" src="/resources/img/test2.jpg" alt="Third slide">                 
                </div>
                <div class="item">  
                   <img id="slide3" onclick="javascript:location.href='http://naver.com';" src="/resources/img/test2.jpg" alt="fourth slide">                 
                </div>
                <div class="item">  
                   <img id="slide4" onclick="javascript:location.href='http://naver.com';" src="/resources/img/test2.jpg" alt="fifth slide">                 
                </div>
             </div>  
            <!-- Controls -->
              <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                <span class="icon-prev"></span>
              </a>
              <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                <span class="icon-next"></span>
              </a>
          </div>
  </div>   
					</td>  
				</tr>
				<tr>
					<td>
						<div>
				<table 
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th colspan="2">마감임박 모집정보</th>
						</tr> 
					</thead> 
					<c:forEach items="${DeadlineList}" var="board">
						<tr>
							<td>
								<span style="color:red">D-${board.DATE}</span> 
							</td> 
							<td>
								<!-- script로 기동 <a href='/board/read?BOARD_NO=<c:out value="${board.BOARD_NO}"/>'>-->
								<a class='move' href='<c:out value="${board.BOARD_NO}"/>'> 
								<c:out value="${board.AD_TITLE}" /></a>
							</td>
						</tr>
					</c:forEach>
				</table>
				</div>
					</td>
				</tr>
			</table>
			
				<%-- <!--  검색처리 추가 -->
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
 --%>
				<!--  end 검색처리 추가 --> 
				<!-- Page처리 추가 -->
				<%-- <div class="pull-right">
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
				</form>  --%>
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
</div>
</div>
</div> 

<script type="text/javascript">
	$(document)
			.ready(
					function() { 
						
						//이미지
						var imgPath = new Array();
						var imgURL = new Array();
						
						<c:forEach var="lately5" items="${Lately5}" varStatus="Lately5">
							imgPath.push("${lately5.FILE_PATH}");
							console.log('${lately5.FILE_PATH}');
							$("#slide${Lately5.index}").attr('src',"<spring:url value="/img/${lately5.FILE_PATH}"/>");
							$("#slide${Lately5.index}").attr('onclick',"javascript:location.href='${lately5.URL}';");
						</c:forEach> 
			      
						
						
			 			
		/* 				for (var i=0; i<imglist.length; i++){
							console.log(imglist[i]);
						}     */
 
						/* $('.carousel').carousel() */
						   /* 자동으로 5초의 지연시간이 설정되어 있는데 아래와 같이 바꿀수 있다. 
      아래 코드 쓰려면 위 코드 지워야 한다.  */      
       
      $('.carousel').carousel({
          interval: 3000
      }); 
         
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
						$(".move")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='BOARD_NO' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/board/read");
											actionForm.submit();
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


