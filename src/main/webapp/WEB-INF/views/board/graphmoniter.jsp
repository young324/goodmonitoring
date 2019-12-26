<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<h2>모집정보 분석/예측</h2>
	<div class="container">
		<div class="row my-3">
			<div class="col-12">
			</div>
		</div>
			<div class="col-lg-6">
						<canvas id="myChart2"></canvas>
			</div>
		</div>
	</div>

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

	<div class="grid">
		<div class="item">
			<div class="item-content">
			<%
	Date date = new Date();
	Calendar cal = Calendar.getInstance();
%>
					<!-- <select name='month'>
					
						<option value='0' selected>-- 월 선택 --</option>
						<option value='1'>1월</option>
						<option value='2'>2월</option>
						<option value='3'>3월</option>
						<option value='4'>4월</option>
						<option value='5'>5월</option>
						<option value='6'>6월</option>
						<option value='7'>7월</option>
						<option value='8'>8월</option>
						<option value='9'>9월</option>
						<option value='10'>10월</option>
						<option value='11'>11월</option>
						<option value='12'>12월</option>
					</select>  --><strong><%=cal.get(Calendar.MONTH)+1%></strong>월의 전체 모니터링 모집정보는
					<strong>
					<%=
							"4,231"
					%>
					</strong>
					건으로, <strong>
						${MostTarget}
					</strong> 를 대상으로 한 <strong>
						${MostCategory}
					</strong> 모집이 활발합니다.
				</h3>
				<div id="7lfxIhp2GiscHjEmabeklB"></div>

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
					value : ${ilban},
					percent : '<div class="progress"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${target1}%" aria-valuenow="${target1}" aria-valuemin="0" aria-valuemax="100">${target1}%</div></div>'
				},
				{
					target : '주부',
					value : ${jubu},
					percent : '<div class="progress"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${target3}%" aria-valuenow="${target3}" aria-valuemin="0" aria-valuemax="100">${target3}%</div></div>'
				},
				{
					target : '대학생',
					value : ${deahak},
					percent : '<div class="progress"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${target2}%" aria-valuenow="${target2}" aria-valuemin="0" aria-valuemax="100">${target2}</div></div>'
				},
				{
					target : '시니어',
					value : ${senior},
					percent : '<div class="progress"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${target5}%" aria-valuenow="${target5}" aria-valuemin="0" aria-valuemax="100">${target5}%</div></div>'
				},
				{
					target : '글로벌',
					value : ${global},
					percent : '<div class="progress"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${target4}%" aria-valuenow="1" aria-valuemin="0" aria-valuemax="100">${target4}%</div></div>'
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
	
</body>

</html>