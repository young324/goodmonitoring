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
	<form role="form" action="/m/board/write" method="post"
				enctype="multipart/form-data">
		<table class="table table-borderless">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">모집정보
						입력</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>  
						<div class="form-group">
							<label>모집명</label> <input type="text" class="form-control"
								placeholder="글 제목을 입력해주세요" name="AD_TITLE" maxlength="50" /> <!-- <small
								class="form-text text-muted">We'll never share your
								email with anyone else.</small> -->
						</div>
						<div class="form-group">
							<label>회사명</label> <input type="text" class="form-control"
								placeholder="회사명을 입력해주세요" name="C_NAME" maxlength="50" />
						</div>
						<div class="form-group">
							<label>업종</label> <select name="INTEREST_CATEGORY"
								id="interest_category" class="form-control">
								<c:forEach items="${listIndustryCategory}"
									var="listIndustryCategory">
									<option value="${listIndustryCategory.INTEREST_CATEGORY}">${listIndustryCategory.INTEREST_CATEGORY}</option>
								</c:forEach>
							</select>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		
		<!-- 모집개요 -->
		<table class="table table-borderless">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">모집개요
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td> 
						<div class="form-group">
							<label>대상</label>
							<select name="TARGET" id="Target" class="form-control">
									<c:forEach items="${listTarget}" var="target">
										<option value="${target.TARGET}">${target.TARGET}</option>
									</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>인원</label>
							<input type="text" class="form-control"
								placeholder="인원을 입력해주세요" name="AD_PERSONNEL" maxlength="10" />
						</div>
						<div class="form-group">
							<label>모집기간</label>
							<table>
							<tr>
							<td>
								<div class='input-group date dateTimePicker'
													id="datepicker1">
													<input type='text' class="form-control dtPicker"
														name="AD_START_DATE" required="required" /> 
														<span
														class="input-group-addon"> <span
														class="glyphicon glyphicon-calendar"></span>
													</span>     
								</div>
								</td>     
								<td style="padding:10px;">ㅡ</td>
								<td>
								<div class='input-group date dateTimePicker'
													id="datepicker1">
													<input type='text' class="form-control dtPicker"
														name="AD_END_DATE" required="required" /> <span
														class="input-group-addon"> <span
														class="glyphicon glyphicon-calendar"></span>
													</span>  
		 										  
							</div>
							</td> 
							</tr>
							</table>
						 </div>
					 <div class="form-group">
							<label>발표일</label>
							<div class='input-group date dateTimePicker' id="datepicker1">
											<input type='text' class="form-control dtPicker"
												name="AD_ANNOUNCEMENT_DATE" required="required" /> <span
												class="input-group-addon"> <span
												class="glyphicon glyphicon-calendar"></span>
											</span>
										</div>
						</div>
						<div class="form-group">
							<label>지원방법</label>
							<textarea class="form-control"
									placeholder="지원방법을 입력해주세요" name="AD_APPLY_TEXT" maxlength="200"
									style="height: 100px;"></textarea> 
						</div>
						<div class="form-group">
							<label>문의처</label>
							<input type="text" class="form-control"
								placeholder="문의처를 입력해주세요" name="C_EMAIL" />
						</div>
						<div class="form-group">
							<label>지원 URL</label>
							<input type="text" class="form-control"
								placeholder="지원 URL을 입력해주세요" name="URL" />
						</div>
						<div class="form-group">
							<label>이미지</label>
							<%@ include file="capacity_file.jsp"%>
 
						</div>
						
					</td>
				</tr>
			</tbody>
		</table>
		
		<!-- 모집조건 -->
		<table class="table table-borderless">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">모집조건</th>
				</tr>
			</thead>
			<tbody> 
				<tr>
					<td>
							
						<div class="form-group">
							<label>성별</label>
							<div>
							<div class="radio radio-info radio-inline">
									<input type="radio" id="male" value="남" name="SEX" checked="">
									<label for="male">남자</label>
								</div>
								<div class="radio radio-info radio-inline">
									<input type="radio" id="female" value="여" name="SEX" checked="">
									<label for="female">여자</label>
								</div>
								<div class="radio radio-info radio-inline">
									<input type="radio" id="irrelevant" value="무관" name="SEX"
										checked=""> <label for="irrelevant">무관</label>
								</div>
								</div> 
						</div>
						<div class="form-group">
							<label>나이</label>
							<div>
								<div class="radio radio-info radio-inline">
									<input type="radio" id="Directinput" value="직접입력"
										name="AD_AGE2" checked="unchecked"> <label
										for="Directinput">직접입력</label>
								</div>
								<table>
								<tr>
								<td>
								<input type="text" id="age"
								class="form-control" name="AD_AGE" />
								</td> 
								<td style="padding:10px;">ㅡ</td>
								<td>
									<input type="text" id="age2"
								class="form-control" name="AD_AGE" /> 
								</td> 
								</tr>  
								
								</table>
							</div> 
							<div class="radio radio-info radio-inline">
									<input type="radio" id="older60" value="60,100" name="AD_AGE" checked="">
									<label for="older60">60세 이상</label>
									</div>
									<div class="radio radio-info radio-inline">
									<input type="radio" id="Ageunrelate" value="0,100" name="AD_AGE" checked="">
									<label for="Ageunrelate">나이무관</label>
									</div>  
						</div>
						 
							
					   
					
						<div class="form-group">
							<label>지역</label>
							
							<table>
							<tr>
							<td>
							<div class="controls">
										<select name="AD_AREA_NAME" id="Citys" class="form-control">
											<option>시</option>
											<option>서울시</option>
											<option>부산시</option>
										</select>
							</div>
							</td>
							<td>
							<div class="controls">
										<select name="AD_AREA_NAME" id="District" class="form-control">
											<option>구</option>
											<option>동대문구</option>
										</select>
							</div>
							</td>      
							<td>   
							<div class="checkbox checkbox-inline checkbox-primary"
									style="padding-left:50px;">
									<input name="AD_AREA_NAME" type="checkbox" id="global"
										value="글로벌"> <label for="global">글로벌</label>
							</div> 
							</td> 
							</tr>
							</table>
							  
						</div> 
						<div class="form-group"> 
							<label>온라인 계정</label>
							<div style="font-size:small;" >  
							<table style="padding-left:50px;">
							<tr>
							<td>
							<div class="checkbox checkbox-inline checkbox-primary">
									<input name="ONLINE" type="checkbox" id="blog" value="블로그">
									<label for="blog">블로그</label>
								</div>
								</td>
								<td>
								<div class="checkbox checkbox-inline checkbox-primary"
									style="float: left">
									<input name="ONLINE" type="checkbox" id="cafe" value="카페">
									<label for="cafe">카페</label>
								</div>
								</td>
								<td>
								<div class="checkbox checkbox-inline checkbox-primary"
									style="float: left">
									<input name="ONLINE" type="checkbox" id="twiter" value="트위터">
									<label for="twiter">트위터</label>
								</div>
								</td>
								</tr>
								<tr>
								<td>
								<div class="checkbox checkbox-inline checkbox-primary"
									style="float: left">
									<input name="ONLINE" type="checkbox" id="facebook" value="페이스북">
									<label for="facebook">페이스북</label>
								</div>
								</td>
								<td>
								<div class="checkbox checkbox-inline checkbox-primary"
									style="float: left">
									<input name="ONLINE" type="checkbox" id="instagram" value="인스타">
									<label for="instagram">인스타</label>
								</div>
								</td>
								<td>
								
								<div class="checkbox checkbox-inline checkbox-primary"
									style="float: left">
									<input name="ONLINE" type="checkbox" id="youtube" value="유튜브">
									<label for="youtube">유튜브</label>
								</div>
								</td>
								</tr>
								<tr>
								<td>
								<div class="checkbox checkbox-inline checkbox-primary"
									style="float: left">
									<input name="ONLINE" type="checkbox" id="kakaostory"
										value="카카오스토리"> <label for="kakaostory">카카오스토리</label>
								</div>
								</td>
								<td>
								</td>
								<td>
								<div class="checkbox checkbox-inline checkbox-primary"
									style="float: left">
									<input name="ONLINE" type="checkbox" id="onlineetc" value="기타">
									<label for="onlineetc">기타</label>
								</div> 
								</td>
								</tr>  
								</table>
								</div>  
						</div>
						
						<div class="form-group"> 
							<label>세부내용</label>
							<textarea class="form-control"
									placeholder="세부내용을 입력해주세요" name="AD_TEXT" maxlength="200"
									style="height: 100px;"></textarea></textarea> 
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		
		<!-- 활동내용 -->
		<table class="table table-borderless">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">활동내용
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td> 
						<div class="form-group">
							<label>활동내용</label>    
							<div style="font-size:small;" >  
							<table style="padding-left:50px;">
							<tr>
							<td>
							<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="writingarti"
										value="기사작성"> <label for="writingarti">기사작성</label>
								</div>
								</td>
								<td>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="writingreview"
										value="리뷰작성"> <label for="writingreview">리뷰작성</label>
								</div>
								</td>
								
								
							</tr>
							<tr>
							<td>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="blogposting"
										value="블로그포스팅"> <label for="blogposting">블로그포스팅</label>
								</div>
								</td>
							<td>
							
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="idea"
										value="아이디어제안"> <label for="idea">아이디어제안</label>
								</div>
								</td>
								
								</tr>
								<tr>
								<td>
								
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="offline"
										value="오프라인활동"> <label for="offline">오프라인활동</label>
								</div>
								</td>
								<td>
							
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="experience"
										value="체험단 활동"> <label for="experience">체험단 활동</label>
								</div>
								</td>
								</tr>
								<tr>
								<td>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="contents"
										value="콘텐츠제작"> <label for="contents">콘텐츠제작</label>
								</div>
								</td>
								<td>
								
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="promotion"
										value="홍보"> <label for="promotion">홍보</label>
								</div>
								</td>
								
								</tr>
								<tr>
								<td>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="conference"
										value="회의참석"> <label for="conference">회의참석</label>
								</div>
								</td>

							 	
								<td>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="worketc"
										value="기타"> <label for="worketc">기타</label>
								</div>
								</td>
								</tr>
								</table>
								</div>
						</div>
						<div class="form-group">
							<label>활동기간</label>
							<table>
							<tr>
							<td>
								<div class='input-group date dateTimePicker'
													id="datepicker1">
													<input type='text' class="form-control dtPicker"
														name="WORK_START_DATE" required="required" /> 
														<span
														class="input-group-addon"> <span
														class="glyphicon glyphicon-calendar"></span>
													</span>     
								</div>
								</td>     
								<td style="padding:10px;">ㅡ</td>
								<td>
								<div class='input-group date dateTimePicker'
													id="datepicker1">
													<input type='text' class="form-control dtPicker"
														name="WORK_END_DATE" required="required" /> <span
														class="input-group-addon"> <span
														class="glyphicon glyphicon-calendar"></span>
													</span>  
		 										  
							</div>
							</td> 
							</tr>
							</table> 
						 </div>  
					 
					 <div class="form-group">
					  
							<label>모임횟수</label>
						  
										<select name="WORK_TIME" id="week" class="form-control">
											<option>주</option>
											<option>월</option>
											<option>무관</option>
										</select>  
								 
								 
										<select name="WORK_TIME" id="month" class="form-control">

											<option>1회</option>
											<option>2회</option>
										</select>
									
										<select name="WORK_TIME" id="NC" class="form-control">

											<option>필수</option>
											<option>선택</option>
										</select>
							 
						</div>
						<div class="form-group">
							<label>세부내용</label>
							<textarea class="form-control"
									placeholder="세부 내용" name="WORK_TEXT" maxlength="200"
									style="height: 100px;"></textarea>
						</div>
						
						
						
					</td>
				</tr>
			</tbody> 
		</table>
		
		<!-- 활동보상 -->
		<table class="table table-borderless">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">활동보상
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td> 
						<div class="form-group">
							<label>활동보상</label>
							<div style="font-size:small;" >  
							<table style="padding-left:50px;">
							<tr>
							<td>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_BENEFIT_KEY" type="checkbox" id="gift card"
										value="상품권"> <label for="gift card">상품권</label>
								</div>
								</td>
								<td>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_BENEFIT_KEY" type="checkbox"
										id="certificates" value="수료증"> <label
										for="certificates">수료증</label>
								</div>
								</td>
								<td>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_BENEFIT_KEY" type="checkbox" id="EntryPoint"
										value="입사 가산점"> <label for="EntryPoint">입사 가산점</label>
								</div>
								</td>
							</tr>
							<tr>
							<td>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_BENEFIT_KEY" type="checkbox" id="scholarship"
										value="장학금"> <label for="scholarship">장학금</label>
								</div>
								</td>
								<td>
								
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_BENEFIT_KEY" type="checkbox" id="Point"
										value="포인트"> <label for="Point">포인트</label>
								</div>
								</td>
								<td>
							
							<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_BENEFIT_KEY" type="checkbox" id="cash"
										value="현금"> <label for="cash">현금</label>
								</div>
								</td>
								</tr>
								<tr>
								<td>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_BENEFIT_KEY" type="checkbox" id="stuff"
										value="현물"> <label for="stuff">현물</label>
								</div>
								</td>
								<td>
								
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_BENEFIT_KEY" type="checkbox" id="overseas"
										value="해외연수"> <label for="overseas">해외연수</label>
								</div>

								</td>
								<td>
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_BENEFIT_KEY" type="checkbox" id="etc"
										value="기타"> <label for="etc">기타</label>
								</div>
								</td>
 
							 	
							
								</tr>
								
								</table>
								</div>
						</div>
					
					 
					  
						<div class="form-group">
							<label>세부내용</label>
							<textarea class="form-control"
									placeholder="세부 내용" name="WORK_BENEFIT_TEXT" maxlength="200"
									style="height: 100px;"></textarea>
						</div>
						<div class="form-group">
							<label>태그</label>
							<input type="text" class="form-control" placeholder="태그1"
											name="WORK_TAG" maxlength="50"/> 
							<input type="text" class="form-control" placeholder="태그2"
											name="WORK_TAG" maxlength="50"/> 
							<input type="text" class="form-control" placeholder="태그3"
											name="WORK_TAG" maxlength="50"/> 
							<input type="text" class="form-control" placeholder="태그4"
											name="WORK_TAG" maxlength="50"/> 
							<input type="text" class="form-control" placeholder="태그5"
											name="WORK_TAG" maxlength="50"/> 
						</div>
						
						
					</td>
				</tr>
			</tbody>
		</table>
		
		<!-- 글쓰기 -->
			<input type="submit" class="btn btn-primary pull-right" value="작성" />
	</form>

	<div class="container">

		<div class="row">

	

		</div>

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