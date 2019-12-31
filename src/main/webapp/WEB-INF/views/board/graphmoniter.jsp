<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<%@ page import="java.util.*, java.text.*"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">이달의 모집정보</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- 이달의 모집정보 css, js -->
<!-- btn-outline-* / v4버전이라 기존 디자인과 충돌  -->
<!--  <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css" /> -->

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- 차트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/handsontable/5.0.0/handsontable.full.min.css" />
</head>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handsontable/5.0.0/handsontable.full.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/web-animations/2.3.1/web-animations.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/muuri/0.5.4/muuri.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 		<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>  
 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js"
	integrity="sga384-UO2eT0CpHqdSJQ6hJty5KVphzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="annoymous"></script>


<!-- 이달의 -->
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
	.login_form {
		
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
<!-- 맞춤모집정보 -->
<div>
	<%
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
	%>
	<c:choose>
		<c:when test="${!empty sessionScope.user}">
			<ul>
				<label>최근 지원하셨던 <a class="nav-link">${C_NAME}</a>의 모집정보를
					확인해보세요
				</label>
				<a href="/board/fitlistC_NAME"> >바로가기</a>
			</ul>
			<ul>
				<label><%=cal.get(Calendar.MONTH) + 1%>월에는 <a>${MostTarget}</a>대상의
					<a>${MostCategory}</a>모집이 활발합니다.</label>
				<a href="/board/graphmoniter"> >바로가기</a>
			</ul>
		</c:when>
	</c:choose>
</div>
<!-- 네비게이션  -->

<nav class="navbar navbar-default">





	<div class="navbar-header">

		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expaned="false">

			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>

		</button>



	</div>

	<div class="collapse navbar-collapse"
		id="#bs-example-navbar-collapse-1">





		<ul class="nav navbar-nav">

			<c:choose>
				<c:when test="${!empty sessionScope.user}">
					<li class="nav-item dropdown"><a class="nav-link"><%=cal.get(Calendar.MONTH) + 1%>월에 작성된 모집정보입니다.</a></li>
				</c:when>
				<c:when test="${!empty sessionScope.company}">
					<li class="nav-item dropdown"><a class="nav-link"><%=cal.get(Calendar.MONTH) + 1%>월에 작성된 모집정보입니다.</a></li>
				</c:when>
   
				<c:otherwise>
					<li><a href="/board/list">메인</a></li>

					<li><a href="/board/list">게시판</a></li>

					<li><a href="/board/Joinselect">회원가입</a></li>
					<li><a href="/board/Loginselect">로그인</a></li>

				</c:otherwise>

			</c:choose>


		</ul>



		<ul class="nav navbar-nav navbar-right">

			<li class="dropdown"><a href="#" class="dropdown-toggle"
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

				</ul></li>

		</ul>

	</div>
	<!-- 이달의 모집정보 -->



</nav>
<div class="grid">
	<div class="item">
		<div class="item-content">
			<strong><%=cal.get(Calendar.MONTH) + 1%></strong>월의 전체 모니터링 모집정보는 <strong>
				${countboard} </strong> 건으로, <strong> ${MostTarget} </strong> 를 대상으로 한 <strong>
				${MostCategory} </strong> 모집이 활발합니다.
			</h3>

			<table>
				<th>
					<canvas id="myChart2"></canvas>
				</th>
				<th><%!String[] btnColor = {"btn btn-outline-danger", "btn btn-outline-primary", "btn btn-outline-success",
			"btn btn-outline-info", "btn btn-outline-warning"};%> <%
 	request.setAttribute("btnColor", btnColor);
 %> <c:set var="btnColor" value="${pageScope.btnColor}" /> <c:forEach
						items="${listTarget}" var="target" varStatus="status">
						<button type="button" id="btn_${status.index}"
							class="btn btn-default" style="width: 100%;" name="tgbtn"
							value="${target.TARGET}" onClick="monthlybtn();">${target.TARGET}
							<div style="display: inline;" id="count">00</div>
							건
						</button>
						<br>
					</c:forEach> <!-- 
<button type="button" class="btn btn-outline-danger" style="width: 100%;">일반     000건</button><br>
<button type="button" class="btn btn-outline-primary" style="width: 100%;">주부     000건</button><br>
<button type="button" class="btn btn-outline-success" style="width: 100%;">대학생   000건</button><br>
<button type="button" class="btn btn-outline-info" style="width: 100%;">시니어   000건</button><br>
<button type="button" class="btn btn-outline-warning" style="width: 100%;">글로벌   000건</button>
 --></th>
			</table>
			<h4>
				<strong> <label id="tgtext"></label></strong> 대상의 모니터링 모집 정보 <strong>
					<label id="tgcounttext"></label>
				</strong> 건에 대한 <strong>업종별 분석정보</strong>
			</h4>
			<div id="model"></div>

		</div>
	</div>
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
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
				<table width="100%"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#번호</th>
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
								<a class='move' href='<c:out value="${board.BOARD_NO}"/>'> <c:out
										value="${board.AD_TITLE}" /></a>
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
								value='<c:out value="${pageMaker.cri.keyword}"/>'> <input
								type="hidden" name="pageNum"
								value='<c:out value="${pageMaker.cri.pageNum}"/>'> <input
								type="hidden" name="amount"
								value='<c:out value="${pageMaker.cri.amount}"/>'>
							<button class="btn btn-default">Search</button>
						</form>
					</div>
				</div>

				<!--  end 검색처리 추가 -->
				<!-- Page처리 추가 -->
				<div class="pull-right">
					<ul class="pagination">
						<c:if test="${pageMaker.prev }">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage-1}">Previous</a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} " >
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage+1}">Next</a></li>
						</c:if>
					</ul>
				</div>
				<!-- form 추가 -->
				<form id="actionForm" action="/board/list" method="get">
					<input type="hidden" name="pageNum"
						value="${pageMaker.cri.pageNum}"> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount}"> <input
						type="hidden" name="type"
						value='<c:out value="${pageMaker.cri.type}"/>'> <input
						type="hidden" name="keyword"
						value='<c:out value="${pageMaker.cri.keyword}"/>'>
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

<script type="text/javascript">
$(document).ready(
	function(){
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
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		/**상세조회로 가기 */
		$(".move").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='BOARD_NO' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action", "/board/read");
			actionForm.submit();
		});
		/**Search 처리 Script */
		var searchForm = $("#searchForm");
		$("#searchForm button").on("click", function(e){
			if(!searchForm.find("option:selected").val()){
				alert("검색 종류를 선택하세요!");
				return false;
			}
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 선택하세요!");
				return false;
			}
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			searchForm.submit();			
		})		
	});
</script>

<!-- 이달의  -->
<script>

	

		var data = [
				{
					target : '일반',
					value : 991,
					percent : '<div class="progress"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: 90.15%" aria-valuenow="90.15" aria-valuemin="0" aria-valuemax="100">90.15%</div></div>'
				},
				{
					target : '주부',
					value : 348,
					percent : '<div class="progress"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: 20.10%" aria-valuenow="20.10" aria-valuemin="0" aria-valuemax="100">20.10%</div></div>'
				},
				{
					target : '대학생',
					value : 295,
					percent : '<div class="progress"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: 10.70%" aria-valuenow="10.70" aria-valuemin="0" aria-valuemax="100">10.70%</div></div>'
				},
				{
					target : '시니어',
					value : 151,
					percent : '<div class="progress"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: 5.15%" aria-valuenow="5.15" aria-valuemin="0" aria-valuemax="100">5.15%</div></div>'
				},
				{
					target : '글로벌',
					value : 15,
					percent : '<div class="progress"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: 1%" aria-valuenow="1" aria-valuemin="0" aria-valuemax="100">1%</div></div>'
				} ]; 
		var hot = new Handsontable(document
				.getElementById('7lfxIhp2GiscHjEmabeklB'), {
			data : data,
			rowHeaders : true,
			colWidths : [ 100, 100, 600 ],
			colHeaders : false,
			columns : [ {
				data : "target",
				renderer : "numeric",
				className : "htMiddle sans",
				readOnly : true
			}, {
				data : "value",
				renderer : "numeric",
				className : "htMiddle sans",
				readOnly : true
			}, {
				data : "percent",
				renderer : "html",
				className : "htMiddle sans",
				readOnly : true
			} ]
		});
		var grid = new Muuri('.grid', {
			dragEnabled : false,
			dragContainer : document.body,
			dragSort : function() {
				return [ grid ]
			}
		});
		
	</script>


<script>

//버튼 색깔	 
		/* $("#btn_0").attr('class','btn btn-outline-danger');  
		$("#btn_1").attr('class','btn btn-outline-primary');  
		$("#btn_2").attr('class','btn btn-outline-success');
		$("#btn_3").attr('class','btn btn-outline-info');
		$("#btn_4").attr('class','btn btn-outline-warning');
		$("#btn_5").attr('class','btn btn-outline-danger');
		$("#btn_6").attr('class','btn btn-outline-primary');
		$("#btn_7").attr('class','btn btn-outline-success');
		$("#btn_6").attr('class','btn btn-outline-info'); */

		//버튼 누를때 변경
		
		
		
		//업종 리스트
		var list = new Array();
		<c:forEach var="itemList" items="${listIndustryCategory}" varStatus="industrycategory">
			list.push("${itemList.INTEREST_CATEGORY}");
		</c:forEach>
		
		var listIC = new Array(); //업종별 이름
		var listCount = new Array(); //업종별 개수
		var showCount = new Array();//보여줄 업종별 개수
		var percent = new Array();//퍼센트
		
		<c:forEach var="itemList" items="${countICbyTG}" varStatus="countICbyTG">
			listIC.push("${itemList.INTEREST_CATEGORY}");
			listCount.push("${itemList.tcount}");  
		</c:forEach>  
		  
		//업종 개수값 ajax로 controller에서 리턴받아서 넣기
		var SUM = 0;
		var data3 = [];
		for (var i=0;i<list.length;i++){
			
			for (var j=0; j<list.length; j++){
				if (list[j] == listIC[i])	{  //일치하는거에만 값 넣기
					showCount[j] = listCount[i];
				}  			
			}    
			
			if(showCount[i] == null){
				showCount[i] = 0;  
			}//없으면 0넣기

			
			//퍼센트 계산_총합
			SUM += parseInt(showCount[i]);		
		}
  		
		
		
		for (var i=0;i<list.length;i++){
			//퍼센트 계산
			percent[i] = Math.floor(parseInt(showCount[i])/SUM*100);//소수점 버림 
		/* 	console.log(percent[i]);  
			  */ 
			data3.push({
				category : list[i],       
				value : showCount[i],
				percent : '<div class="progress"><div id="progress" title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ' + percent[i] + '%" aria-valuenow="' + percent[i] + '" aria-valuemin="0" aria-valuemax="100">' + percent[i] + '%' + '</div></div>'
			}); 
			
		} 
		
	/*
		var data = [
				{
					category : '식품관련 기업',
					value : 221,
					percent : '<div class="progress"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: 17%" aria-valuenow="17" aria-valuemin="0" aria-valuemax="100">17%</div></div>'
				},
				{
					category : '육아전문 기업',
					value : 15,
					percent : '<div class="progress"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: 6.72%" aria-valuenow="6.72" aria-valuemin="0" aria-valuemax="100">6.72%</div></div>'
				},
				{
					category : '교육, 문화, 도서, 출판',
					value : 300,
					percent : '<div class="progress"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">20%</div></div>'
				},
				{
					category : '여가, 건강, 스포츠',
					value : 125,
					percent : '<div class="progress"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: 8.8%" aria-valuenow="8.8" aria-valuemin="0" aria-valuemax="100">8.8%</div></div>'
				} ];
		*/
				
		var hot = new Handsontable(document
				.getElementById('model'), {
			data : data3,  
			rowHeaders : true, 
			colWidths : [ 210, 50, 400 ],     
			colHeaders : false,
			columns : [ {
				data : "category",
				renderer : "numeric",
				className : "htMiddle sans",
				readOnly : true
			}, {
				data : "value",
				renderer : "numeric",
				className : "htMiddle sans",
				readOnly : true
			}, {
				data : "percent",
				renderer : "html",
				className : "htMiddle sans",
				readOnly : true
			} ]
		});
		var grid = new Muuri('.grid', {
			dragEnabled : false,
			dragContainer : document.body,
			dragSort : function() {
				return [ grid ]
			}
		});
	</script>

<!-- 차트 -->
<script type="text/javascript">
		data = {
			datasets : [ {
				backgroundColor : [ '#F5A9A9', '#A9F5F2', '#BCF5A9', '#9F81F7', '#F3F781' ], 
				//분홍: #F5A9A9, 하늘: #A9F5F2, 연두: #BCF5A9, 연보라: #9F81F7, 연노랑: #F3F781
				data : [ ${ilban}, ${jubu}, ${deahak}, ${senior}, ${global} ]
			} ],
			// 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남
			labels : [ '일반', '주부', '대학생', '시니어', '글로벌' ]
		};

		// 도넛형 차트
		var ctx2 = document.getElementById("myChart2");
		var myDoughnutChart = new Chart(ctx2, {
			type : 'doughnut',
			data : data,
			options : {}
		});
		
	</script>
<script>
	
	//일반모니터의 값으로 초기화
	var btnname = $("#btn_0").attr('value'); 
	$("#tgtext").text(btnname);
	$("#tgcounttext").text(${all_IC_count});
	//$("#count").text(${target0});
	$("#btn_0").children('div').text(${target0});    
	$("#btn_1").children('div').text(${target1});
	$("#btn_2").children('div').text(${target2});
	$("#btn_3").children('div').text(${target3});
	$("#btn_4").children('div').text(${target4});
	 
	$(document).ready(function() {
		$("button[name='tgbtn']").on('click', (e) => {
			console.log(e.target.value);//
			btnname = e.target.value;     
			$("#tgtext").text(btnname);//text변경     
			$("#tgcounttext").text($(e.target).children('div').text());  
			//mothlybtn안에 있던거@@@@  
			
		var that = $("#btn");
		//var btnname = $(":button").val(); //button인게 눌렸을때 그것의 value
		
		var sendData = {btn : btnval, btnname : btnname}; //버튼의 밸류값을 전송
		
		$.ajax({
			url : '/board/monthly',
			type : "post",
			data : sendData,
			success : function(data){
				that.prop('name',data);
				console.log(data);	
				var listIC = new Array(); //업종별 이름  
				var listCount = new Array(); //업종별 개수
				var showCount = new Array();//보여줄 업종별 개수
				var percent = new Array();//퍼센트
				
				
				//컨트롤러에서 받은 data받기
				listIC = data;
				listCount = data;
				  
				        
				/* 
				list[i] > 전체 업종
				
				listIC[i].tcount
				listIC[i].interest_CATEGORY
				*/
				/* for(var i=0; i<listIC.length; i++){
					console.log(listIC[i].interest_CATEGORY);
				} */
				SUM = 0;
				data3 = [];  //초기화     
				
				for(var k=0; k<list.length; k++)
				{
					for(var i=0; i<listIC.length; i++)
					{
						for (var j=0; j<list.length; j++)
						{
						if (list[j] == listIC[i].interest_CATEGORY)	{  //일치하는거에만 값 넣기
							showCount[j] = listCount[i].tcount;
						}
					}
					
				}
					if(showCount[k] == null){
						showCount[k] = 0;  
					}//없으면 0넣기	 
					
					
					//퍼센트 계산_총합
					SUM += parseInt(showCount[k]);		
					
					
				} 
				
			
				for (var i=0;i<list.length;i++){
				//퍼센트 계산
				percent[i] = Math.floor(parseInt(showCount[i])/SUM*100);//소수점 버림 
/* 				console.log(percent[i]);  
 */				 
				data3.push({
					category : list[i],       
					value : showCount[i],
					percent : '<div class="progress"><div id="progress" title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ' + percent[i] + '%" aria-valuenow="' + percent[i] + '" aria-valuemin="0" aria-valuemax="100">' + percent[i] + '%' + '</div></div>'
				}); 
				
			} 
				  
				
				//update
					hot.updateSettings({
				   	 	data : data3 
					}); 
		  	}	//ajax끝
		
		
		});
			
		//@@@@@
			 
			
		});
	});
	
	//누른 버튼에 따라 다른 값을 받아서 전달
	var btnval = ${btn};
	
	//대상별 이달의 모집정보 데이터
	function monthlybtn(){
		
	}
	</script>
<%@include file="../includes/footer.jsp"%>


