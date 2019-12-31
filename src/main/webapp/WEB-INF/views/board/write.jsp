<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<!-- ﻿c:forEach사용을 위한 jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- form태그  -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->

<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->
<!-- datetimepicker -->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<link rel="stylesheet" href="/resources/css/jquery-ui.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap-checkbox.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />

<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>





<script src="/resources/js/jquery-1.11.1.min.js"></script>
<script src="/resources/js/jquery-checkbox.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">

<script type='text/javascript'
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>

<script src="/resources/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>


<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css">







<script
	src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.form.js'
	type="text/javascript" language="javascript"></script>
<script
	src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.MetaData.js'
	type="text/javascript" language="javascript"></script>
<script
	src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.MultiFile.js'
	type="text/javascript" language="javascript"></script>
<script
	src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.blockUI.js'
	type="text/javascript" language="javascript"></script>
<!-- datetimepicker-->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>


<title>모집정보 입력</title>

</head>

<body>

	<%
		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

		String userID = null;

		if (session.getAttribute("userID") != null) {

			userID = (String) session.getAttribute("userID");

		}
	%>





	<!-- 게시판 -->


	<div class="container">

		<div class="row">

			<form role="form" action="/board/write" method="post" enctype="multipart/form-data">

				<table class="table table-borderless"
					style="text-align: center; border: 1px solid #dddddd">

					<thead>

						<tr>

							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">모집정보
								입력</th>

						</tr>
					</thead>

					<tbody>
						<tr>
							<td maxlength="">모집명</td>
							<td><input type="text" class="form-control"
								placeholder="글 제목을 입력해주세요" name="AD_TITLE" maxlength="50" /></td>
							<!-- maxlength는 쓸 수 있는 글자길이 -->

						</tr>

						<tr>
							<td maxlength="">회사명</td>
							<td><input type="text" class="form-control"
								placeholder="회사명을 입력해주세요" name="C_NAME" maxlength="50" /></td>
						</tr>

						<tr>
							<td maxlength="">업종</td>
							<td class="pull-left">
								<div class="control-group">
									<div class="controls">
		
										<select name="INTEREST_CATEGORY" id="IndustryCategory" class="form-control">
											<option>it</option>
											<option>먹거리</option>
											<option>화장</option>
										</select>
									</div>
								</div>
							</td>
						</tr>


					</tbody>

				</table>


				<!-- 모집개요 -->

				<table class="table table-borderless"
					style="text-align: center; border: 1px solid #dddddd">

					<thead>

						<tr>

							<th colspan="2"
								style="background-color: #eeeeee; text-align: left;">모집개요</th>

						</tr>

					</thead>

					<tbody>
						<tr>
							<td>대상</td>
							<td class="pull-left">
								<div class="control-group">
									<div class="controls">
										<select name="TARGET" id="Target" class="form-control">
											<c:forEach items="${listTarget}" var="target">
												<option value="${target.TARGET}">${target.TARGET}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</td>
						</tr>

						<tr>
							<td>인원</td>
							<td><input type="text" class="form-control"
								placeholder="인원을 입력해주세요" name="AD_PERSONNEL" maxlength="10" /></td>

						</tr>
						<tr>
							<td>기간</td>
							<td>


								<div class="form-group">
									<div class="col-sm-9">
										<div class='col-sm-5'>
											<div class="form-group">
												<div class='input-group date dateTimePicker'
													id="datepicker1">
													<input type='text' class="form-control dtPicker"
														name="AD_START_DATE" required="required" /> <span
														class="input-group-addon"> <span
														class="glyphicon glyphicon-calendar"></span>
													</span>
												</div>

											</div>
										</div>
										<div class='col-sm-1'>
											<h4 align="center">
												<b>~</b>
											</h4>
										</div>

										<div class='col-sm-5'>
											<div class="form-group">
												<div class='input-group date dateTimePicker'
													id="datepicker1">
													<input type='text' class="form-control dtPicker" name="AD_END_DATE"
														required="required" /> <span class="input-group-addon">
														<span class="glyphicon glyphicon-calendar"></span>
													</span>
												</div>

											</div>
										</div>
									</div>

								</div>

								</div>

							</td>
						</tr>
						<tr>
							<td>발표일</td>
							<td><div class='col-sm-4'>
									<div class="form-group">
										<div class='input-group date dateTimePicker' id="datepicker1">
											<input type='text' class="form-control dtPicker"
												name="AD_ANNOUNCEMENT_DATE" required="required" /> <span
												class="input-group-addon"> <span
												class="glyphicon glyphicon-calendar"></span>
											</span>
										</div>

									</div>
								</div></td>
						</tr>

						<tr>
							<td>지원방법</td>
							<td><textarea class="form-control" placeholder="글 내용"
									name="AD_APPLY_TEXT" maxlength="200" style="height: 100px;"></textarea></td>

						</tr>
						<tr>
							<td>문의처</td>
							<td><input type="text" class="form-control"
								placeholder="문의처를 입력해주세요" name="C_EMAIL" /></td>

						</tr>
						
						<tr>
							<td>첨부파일</td>
							<td>
							<%@ include file="capacity_file.jsp" %>
							
							<!-- <input type="file" id="file" name="files"
								class="multi" maxlength="5" style="width: 60%;"> --></td>
							<!--  업로드 개수 5개로 제한하고 멀티로 해줌 --> 

						</tr>


						</tr>

					</tbody>

				</table>


				<!-- 모집조건 -->
				<table class="table table-borderless"
					style="text-align: center; border: 1px solid #dddddd">

					<thead>

						<tr>

							<th colspan="10"
								style="background-color: #eeeeee; text-align: left;">모집조건</th>

						</tr>

					</thead>

					<tbody>
						<tr>
							<td>나이</td>
							<td>
								<div class="radio radio-info radio-inline">
									<input type="radio" id="Directinput" value="직접입력"
										name="AD_AGE2" checked="unchecked"> <label
										for="Directinput">직접입력</label>
								</div>
							</td>

							<td width="15%"><input type="text" id="age"
								class="form-control" name="AD_AGE" /></td>
							<td><h>ㅡ</h></td>

							<td width="15%"><input type="text" id="age2"
								class="form-control" name="AD_AGE" /></td>

							<td colspan="6">

								<div class="radio radio-info radio-inline">

									<input type="radio" id="older60" value="60,100" name="AD_AGE"
										checked=""> <label for="older60">60세 이상</label>
								</div>
								<div class="radio radio-info radio-inline">
									<input type="radio" id="Ageunrelate" value="0,100"
										name="AD_AGE" checked=""> <label for="Ageunrelate">나이무관</label>
								</div>

							</td>

						</tr>


						<tr>
							<td>지역</td>
							<td colspan="1" width="15%">
								<div class="control-group">
									<div class="controls">
										<select name="AD_AREA_NAME" id="Citys" class="form-control">
											<option>시</option>
											<option>서울시</option>
											<option>부산시</option>
										</select>
									</div>
								</div>
							</td>
							<td colspan="1" width="15%">
								<div class="control-group">
									<div class="controls">
										<select name="AD_AREA_NAME" id="District" class="form-control">
											<option>구</option>
											<option>동대문구</option>
										</select>
									</div>
								</div>
							</td>

							<td colspan="8">
								<div class="checkbox checkbox-inline checkbox-primary"
									style="float: left">
									<input name="AD_AREA_NAME" type="checkbox" id="global"
										value="글로벌"> <label for="global">글로벌</label>
								</div>
							</td>

						</tr>
						<tr>
							<td>온라인 계정</td>
							<td colspan="6">
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="ONLINE" type="checkbox" id="blog" value="블로그">
									<label for="blog">블로그</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="ONLINE" type="checkbox" id="cafe" value="카페">
									<label for="cafe">카페</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="ONLINE" type="checkbox" id="twiter" value="트위터">
									<label for="twiter">트위터</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="ONLINE" type="checkbox" id="facebook" value="페이스북">
									<label for="facebook">페이스북</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="ONLINE" type="checkbox" id="instagram" value="인스타">
									<label for="instagram">인스타</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="ONLINE" type="checkbox" id="youtube" value="유튜브">
									<label for="youtube">유튜브</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="ONLINE" type="checkbox" id="kakaostory"
										value="카카오스토리"> <label for="kakaostory">카카오스토리</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="ONLINE" type="checkbox" id="onlineetc" value="기타">
									<label for="onlineetc">기타</label>
								</div>

							</td>

						</tr>
						<tr>
							<td>세부내용</td>
							<td colspan="10"><textarea class="form-control"
									placeholder="세부내용을 입력해주세요" name="AD_TEXT" maxlength="200"
									style="height: 100px;"></textarea></td>
						</tr>

					</tbody>

				</table>

				<!-- 활동 내용  -->


				<table class="table table-borderless"
					style="text-align: center; border: 1px solid #dddddd">

					<thead>

						<tr>
							<th colspan="10"
								style="background-color: #eeeeee; text-align: left;">활동 내용</th>
						</tr>

					</thead>

					<tbody>
						<tr>
							<td width="9%">키워드</td>
							<td colspan="10">
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="writingreview"
										value="리뷰작성"> <label for="writingreview">리뷰작성</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="writingarti"
										value="기사작성"> <label for="writingarti">기사작성</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="blogposting"
										value="블로그포스팅"> <label for="blogposting">블로그포스팅</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="promotion"
										value="홍보"> <label for="promotion">홍보</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="experience"
										value="체험"> <label for="experience">체험</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="mission"
										value="미션"> <label for="mission">미션</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="plan" value="기획">
									<label for="plan">기획</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="offline"
										value="오프라인활동"> <label for="offline">오프라인활동</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="contents"
										value="컨텐츠제작"> <label for="contents">컨텐츠제작</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="idea"
										value="아이디어제안"> <label for="idea">아이디어제안</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="worketc"
										value="기타"> <label for="worketc">기타</label>
								</div>
							</td>
						<tr>
							<td>기간</td>

							<td colspan="1" width="15%">
								<div class='input-group date dateTimePicker' id="datepicker1">
									<input type='text' class="form-control dtPicker" 
										name="WORK_START_DATE" required="required" /> <span
										class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</td>
							
							<td colspan="1" style="float: left"><b>ㅡ</b></td>
							
							<td colspan="9" width="15%" style="float: left">
								<div class='input-group date dateTimePicker' id="datepicker1">
									<input type='text' class="form-control dtPicker" name="WORK_END_DATE" style="min-width: 150px"
										required="required" /> <span class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</td>
							
						</tr>
						<tr>
							<td>횟수</td>



							<td colspan="1" width="15%">
								<div class="control-group">
									<div class="controls">
										<select name="WORK_TIME" id="week" class="form-control">
											<option>--</option>
											<option>무관</option>
											<option>주</option>
											<option>월</option>
										</select>
									</div>
									</div>
					
							</td>
							<td colspan="1" width="15%">
							<div class="control-group">
									<div class="controls">
										<select name="WORK_TIME" id="month" class="form-control">
											<option>--</option>
											<option>1회</option>
											<option>2회</option>
										</select>
									</div>
								</div>
							</td>
							<td colspan="8">
								<div class="checkbox checkbox-inline checkbox-primary"
									style="float: left">
									
								</div>
							</td>

						</tr>
						<tr >
							<td>세부내용</td>
							<td colspan="10"><textarea class="form-control" placeholder="세부 내용"
									name="WORK_TEXT" maxlength="200" style="height: 100px;"></textarea></td>

						</tr>

					</tbody>

				</table>

				<!-- 활동 보상 -->
				<table class="table table-borderless"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="10"
								style="background-color: #eeeeee; text-align: left;">활동 보상</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td >키워드</td>
							<td colspan="10"> 
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_BENEFIT_KEY" type="checkbox" id="cash"
										value="현금"> <label for="cash">현금</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_BENEFIT_KEY" type="checkbox" id="stuff"
										value="현물"> <label for="stuff">현물</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_BENEFIT_KEY" type="checkbox"
										id="certificates" value="수료증"> <label
										for="certificates">수료증</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_BENEFIT_KEY" type="checkbox" id="empbenefits"
										value="취업혜택"> <label for="empbenefits">취업혜택</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_BENEFIT_KEY" type="checkbox" id="etc"
										value="기타"> <label for="etc">기타</label>
								</div>
							</td>
						<tr>
							<td>세부내용</td>
							<td colspan="10"><textarea class="form-control" placeholder="세부 내용"
									name="WORK_BENEFIT_TEXT" maxlength="200" style="height: 100px;"></textarea></td>

						</tr>


					</tbody>

				</table>


				<table class="table table-borderless"
					style="text-align: center; border: 1px solid #dddddd">

					<thead>


					</thead>

					<tbody>

						<tr>
							<td>태그</td>

							<td>
								<div class="form-inline">
									<div class="pull-left" style="margin: 0px 2px 2px 0px;">
										<input type="text" class="form-control" placeholder="태그1"
											name="WORK_TAG" maxlength="50" style="width: 80px;" /> <input
											type="text" class="form-control" placeholder="태그2"
											name="WORK_TAG" maxlength="50" style="width: 80px;" /> <input
											type="text" class="form-control" placeholder="태그3"
											name="WORK_TAG" maxlength="50" style="width: 80px;" /> <input
											type="text" class="form-control" placeholder="태그4"
											name="WORK_TAG" maxlength="50" style="width: 80px;" /> <input
											type="text" class="form-control" placeholder="태그5"
											name="WORK_TAG" maxlength="50" style="width: 80px;" />
									</div>
								</div>
						</tr>

					</tbody>
				</table>

				<!-- 글쓰기 -->
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기" />

			</form>

		</div>

	</div>



	<script type="text/javascript">
	
	//직접입력 라디오버튼 클릭시 텍스트박스 활성화
$(document).ready(function(){
	$("input:radio[name=AD_AGE2]").prop("checked", false);
	$("input:radio[name=AD_AGE]").prop("checked", false);
	
    // 라디오버튼 클릭시 이벤트 발생
    $("input:radio[name=AD_AGE2]").click(function(){
 
        if($("input[name=AD_AGE2]:checked").val() == "직접입력"){
            $("input:text[name=AD_AGE]").attr("disabled",false);
            $("input:radio[name=AD_AGE]").prop("checked", false);
 
        }
    });
});

$(document).ready(function(){
	 
    // 라디오버튼 클릭시 이벤트 발생
    $("input:radio[name=AD_AGE]").click(function(){
 		
        if($("input[name=AD_AGE]:checked").val() == "60,100"){
              $("input:text[name=AD_AGE]").attr("disabled",true);
              $("input:radio[name=AD_AGE2]").prop("checked", false);

        }else if($("input[name=AD_AGE]:checked").val() == "0,100"){
              $("input:text[name=AD_AGE]").attr("disabled",true);
              $("input:radio[name=AD_AGE2]").prop("checked", false);
              
        }
    });
});

//횟수 - 무관선택시 옆에 셀렉트박스 비활성화
$(document).ready(function(){

	$("#week").change(function(){
		
		if($("#week option:selected").val() == "무관"){
			$("#month").val("--").attr("selected", "selected")
            $("#month").attr("disabled",true);
		}else {
			$("#month").attr("disabled",false);
		}
	});
});


//지역
$(document).ready(function(){ 
    // 글로벌 체크박스 클릭시 이벤트 발생
    $("input:checkbox[name=AD_AREA_NAME]").click(function(){
    	
        if($("input[name=AD_AREA_NAME]:checked").val() == "글로벌"){
        	$("#Citys").val("--").attr("selected", "selected")
        	$("#District").val("--").attr("selected", "selected")
        	$("#Citys").attr("disabled",true);
        	$("#District").attr("disabled",true);
        }else{
        	$("#Citys").attr("disabled",false);
        	$("#District").attr("disabled",false);
        }
    });

    
    
    //bootstrap-datepicker
    $(".dtPicker").datepicker({
    	 format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		    //startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
    	 // endDate: '+10d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		   // autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		  //  calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		  //  clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		   // datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
		 //   daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
		 //   daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
		 //   disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
		 //   immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		 //   multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
		 //   multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
		//    templates : {
		//        leftArrow: '&laquo;',
		//        rightArrow: '&raquo;'
		//    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
		    // title: "테스트",	//캘린더 상단에 보여주는 타이틀
		    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
		    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		    language : "kr"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
    });
    
});




</script>






	<!-- 애니매이션 담당 JQUERY -->

	<!--<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->


	<!-- 부트스트랩 JS  -->

	<!--  <script src="js/bootstrap.js"></script>-->



</body>




</html>