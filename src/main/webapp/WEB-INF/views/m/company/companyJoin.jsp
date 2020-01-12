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

<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

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
	<form name="insert" method="post" action="/m/company/companyJoin">
		<table class="table table-borderless">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">기업
						회원가입</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div class="form-group">
							<label>아이디</label><input class="form-control" type="text"
								name="C_ID" style="margin-bottom: 10px;"> <input
								type="button" placeholder="아이디를 입력해주세요"
								value="아이디 중복 확인">
							<!-- <small 
								class="form-text text-muted">We'll never share your
								email with anyone else.</small> -->
						</div>
						<div class="form-group">
							<label>비밀번호</label> <input type="password" class="form-control"
								placeholder="비밀번호를 입력해주세요" name="C_PASS" maxlength="50" /> <small
								class="form-text text-muted">영문/특수기호/숫자 포함 8자 이상 입력</small>
						</div>
						<div class="form-group">
							<label>비밀번호 확인</label> <input type="password"
								class="form-control">
						</div>
						<div class="form-group">
							<label>회사명</label> <input type="text" name="C_NAME"
								placeholder="이름을 입력해주세요" class="form-control">
						</div>
						<div class="form-group">
							<label>사업자등록번호</label> <input type="text" class="form-control"
								name="C_CODE"> <input type="button" name="cpnumsearch"
								value="사업자등록번호 검색">
						</div>
						<div class="form-group">
							<label>회사 도메인</label> <input type='text' name="C_URL"
								class="form-control">
						</div>
						<div class="form-group">
							<label>회사 전화번호</label> <input type="text" class="form-control"
								name="C_TEL">
						</div>
						<div class="form-group">
							<label>부서명</label> <input type="text" class="form-control"
								size="11px" maxlength="11" name="C_PART">
						</div>
						<div class="form-group">
							<label>담당자명</label> <input type="text" class="form-control"
								name="C_PART_NAME">
						</div>
						<div class="form-group">
							<label>담당자 핸드폰번호</label> <input type="text" class="form-control"
								size="11px" maxlength="11" name="C_PART_TEL">
						</div>
						<div class="form-group">
							<label>이메일</label> <input type="text" class="form-control"
								name="C_EMAIL">
						</div>
						<div class="form-group">
							<label>우편번호</label> <input type="text" class="form-control"
								name="C_ZIPCODE"> <input type="button" name="addsearch"
								value="우편번호 검색">
						</div>
						<div class="form-group">
							<label>회사 주소</label> <input type="text" class="form-control"
								name="C_ADDR"> <input type="text" class="form-control"
								name="home_h2">
						</div>

						<div class="form-group">
							<label>주요 모집업종</label> <br> <input type='checkbox' name="INTEREST_CATEGORY" value="가전 IT 에너지 자동차 그룹사">가전, IT, 에너지,
					자동차, 그룹사<br> <input type='checkbox' name="INTEREST_CATEGORY" value="생활용품 기업">생활용품
					<br> <input type='checkbox' name="INTEREST_CATEGORY" value="식품관련 기업">식품 <br>
					<input type='checkbox' name="INTEREST_CATEGORY" value="주택 건설 인테리어">주택, 건설, 인테리어 <br>
					<input type='checkbox' name="INTEREST_CATEGORY" value="육아전문 기업">육아 <br> <input
					type='checkbox' name="INTEREST_CATEGORY" value="패션/메이크업 기업">패션/메이크업 <br> <input
					type='checkbox' name="INTEREST_CATEGORY" value="교육 문화 도서 출판">교육, 문화, 도서, 출판 <br> <input
					type='checkbox' name="INTEREST_CATEGORY" value="금융 보험">금융, 보험 <br> <input
					type='checkbox' name="INTEREST_CATEGORY" value="여가 건강 스포츠">여가, 건강, 스포츠 <br> <input
					type='checkbox' name="INTEREST_CATEGORY" value="방송 언론 교통 통신">방송, 언론, 교통, 통신 <br> <input
					type='checkbox' name="INTEREST_CATEGORY" value="유통 백화점 온라인 쇼핑몰">유통, 백화점, 온라인 쇼핑몰 <br> <input
					type='checkbox' name="INTEREST_CATEGORY" value="행정기관  지자체  공공기관  NGO">행정기관, 지자체, 공공기관, NGO
						</div>
						

					</td>
				</tr>
			</tbody>
		</table>

		<input type="submit" class="btn btn-primary pull-right" value="회원가입" />
		<input class="btn btn-primary" type="reset" value="취소" />


	</form>

	<div class="container">

		<div class="row"></div>

	</div>



	<script type="text/javascript">
		//직접입력 라디오버튼 클릭시 텍스트박스 활성화
		$(document).ready(function() {
			$("input:radio[name=AD_AGE2]").prop("checked", false);
			$("input:radio[name=AD_AGE]").prop("checked", false);

			// 라디오버튼 클릭시 이벤트 발생
			$("input:radio[name=AD_AGE2]").click(function() {

				if ($("input[name=AD_AGE2]:checked").val() == "직접입력") {
					$("input:text[name=AD_AGE]").attr("disabled", false);
					$("input:radio[name=AD_AGE]").prop("checked", false);

				}
			});
		});

		$(document).ready(function() {

			// 라디오버튼 클릭시 이벤트 발생
			$("input:radio[name=AD_AGE]").click(function() {

				if ($("input[name=AD_AGE]:checked").val() == "60,100") {
					$("input:text[name=AD_AGE]").attr("disabled", true);
					$("input:radio[name=AD_AGE2]").prop("checked", false);

				} else if ($("input[name=AD_AGE]:checked").val() == "0,100") {
					$("input:text[name=AD_AGE]").attr("disabled", true);
					$("input:radio[name=AD_AGE2]").prop("checked", false);

				}
			});
		});

		//횟수 - 무관선택시 옆에 셀렉트박스 비활성화
		$(document).ready(function() {

			$("#week").change(function() {

				if ($("#week option:selected").val() == "무관") {
					$("#month").val("--").attr("selected", "selected")
					$("#month").attr("disabled", true);
					$("#NC").val("--").attr("selected", "selected")
					$("#NC").attr("disabled", true);
				} else {
					$("#month").attr("disabled", false);
					$("#NC").attr("disabled", false);
				}
			});
		});

		//지역
		$(document).ready(function() {
			// 글로벌 체크박스 클릭시 이벤트 발생
			$("input:checkbox[name=AD_AREA_NAME]").click(function() {

				if ($("input[name=AD_AREA_NAME]:checked").val() == "글로벌") {
					$("#Citys").val("--").attr("selected", "selected")
					$("#District").val("--").attr("selected", "selected")
					$("#Citys").attr("disabled", true);
					$("#District").attr("disabled", true);
				} else {
					$("#Citys").attr("disabled", false);
					$("#District").attr("disabled", false);
				}
			});

			//bootstrap-datepicker
			$(".dtPicker").datepicker({
				format : "yyyy-mm-dd", //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
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
				showWeekDays : true,// 위에 요일 보여주는 옵션 기본값 : true
				// title: "테스트",	//캘린더 상단에 보여주는 타이틀
				todayHighlight : true, //오늘 날짜에 하이라이팅 기능 기본값 :false 
				toggleActive : true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
				weekStart : 0,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
				language : "kr" //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
			});

		});
	</script>






	<!-- 애니매이션 담당 JQUERY -->

	<!--<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->


	<!-- 부트스트랩 JS  -->

	<!--  <script src="js/bootstrap.js"></script>-->




</body>




</html>