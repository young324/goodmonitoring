<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="utf-8">
<title>모집정보 분석/예측</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.ss"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anoymous">
<!-- 차트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>

	<style type="text/css">
@import
	url("https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css")
	;
</style>
	<style type="text/css">
@import
	url("https://cdnjs.cloudflare.com/ajax/libs/handsontable/5.0.0/handsontable.full.min.css")
	;

.handsontable td, .handsontable tr, .handsontable th {
	border: 0 !important;
}

.handsontable th {
	background-color: #ffffff;
}

.sans {
	font: 0.8em sans-serif;
}
</style>
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
<%
	Date date = new Date();
	Calendar cal = Calendar.getInstance();
%>
<h2>모집정보 분석/예측</h2>



	<div class="grid">
		<div class="item">
			<div class="item-content">
					<strong><%=cal.get(Calendar.MONTH)+1%></strong>월의 전체 모니터링 모집정보는
					<strong>
					${countboard}
					</strong>
					건으로, <strong>
						${MostTarget}
					</strong> 를 대상으로 한 <strong>
						${MostCategory}
					</strong> 모집이 활발합니다.
				</h3>
				
<table>
<th>
<canvas id="myChart2"></canvas>
</th>
<th>
<button type="button" class="btn btn-outline-danger" style="width: 100%;">일반     000건</button><br>
<button type="button" class="btn btn-outline-primary" style="width: 100%;">주부     000건</button><br>
<button type="button" class="btn btn-outline-success" style="width: 100%;">대학생   000건</button><br>
<button type="button" class="btn btn-outline-info" style="width: 100%;">시니어   000건</button><br>
<button type="button" class="btn btn-outline-warning" style="width: 100%;">글로벌   000건</button>
</th>
</table>
				<h4><strong>
					<%=
						"일반"	
					%></strong>
					 대상의 모니터링 모집 정보
					 <strong>
					<%=
						"988"	
					%></strong>
					건에 대한 <strong>업종별 분석정보</strong>
				</h4>
				<div id="model"></div>
				
			</div>
		</div>
	</div>

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
		var data = [
				/*
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
					
					
					<c:forEach items="${listTarget}" var="target">
					<option value="${target.TARGET}">${target.TARGET}</option>
				</c:forEach>
				*/
			<c:forEach items="${listIndustryCategory}" var="listIndustryCategory">
				category : "${industrycategory.INTEREST_CATEGORY}",
				value : 221
				
			</c:forEach>
			
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
		var hot = new Handsontable(document
				.getElementById('model'), {
			data : data,
			rowHeaders : true,
			colWidths : [ 100, 100, 600 ],
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
	
		<!-- 부트스트랩 -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js"
		integrity="sga384-UO2eT0CpHqdSJQ6hJty5KVphzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="annoymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js
		crossorigin="anonymous"></script>

	<!-- 차트 -->
	<script>
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
	
</body>

</html>