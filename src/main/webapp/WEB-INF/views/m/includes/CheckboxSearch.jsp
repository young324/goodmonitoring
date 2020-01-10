<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<!-- 상세검색 보이는 칸 -->
<form role="form" action="/m/board/CheckBoxSearchlist" method="get" >
<div id="#bs-example-navbar-collapse-1" class="search">

<!-- 상세검색 버튼 디자인 -->
<button type="button" class="btn btn-primary"><div class="detail">상세검색</div> </button>   
	
	<div id="detailtable" style="display: none">
		<table class="table table-borderless" id="detailtable"
			style="text-align: center; border: 1px solid #dddddd;">

			<thead>
				<tr>
					<th colspan="10" style="background-color: #eeeeee; text-align: center;">모집정보
						상세검색
					</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td colspan="10"><b>모집대상</b></td>
				</tr>
				<tr>
					<td colspan="10">
						<div class="checkbox checkbox-inline checkbox-primary">
							<input name="TARGET" type="checkbox" id="ilban" value="일반모니터">
							<label for="ilban">일반모니터</label>
						</div>

						<div class="checkbox checkbox-inline checkbox-primary">
							<input name="TARGET" type="checkbox" id="jubu" value="주부모니터">
							<label for="jubu">주부모니터</label>
						</div>

						<div class="checkbox checkbox-inline checkbox-primary">
							<input name="TARGET" type="checkbox" id="deahak" value="대학생모니터">
							<label for="deahak">대학생모니터</label>
						</div>

						<div class="checkbox checkbox-inline checkbox-primary">
							<input name="TARGET" type="checkbox" id="senior" value="시니어모니터">
							<label for="senior">시니어모니터</label>
						</div>

						<div class="checkbox checkbox-inline checkbox-primary">
							<input name="TARGET" type="checkbox" id="globalmonitor"
								value="글로벌모니터"> <label for="globalmonitor">글로벌모니터</label>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="10"><b>모집업종</b></td>
				</tr>
				<tr>
					<td colspan="10"
						style="padding-top: 6%; padding-bottom: 6%; padding-left: 10%">
						<div class="checkbox checkbox-inline checkbox-primary">
							<input name="ONLINE" type="checkbox" id="cate1"
								value="가전,IT,에너지,자동차,그룹사"> <label for="cate1">가전,IT,에너지,자동차,그룹사</label>
						</div>

						<div class="checkbox checkbox-inline checkbox-primary"
							style="float: left">
							<input name="ONLINE" type="checkbox" id="cate2" value="생활용품 기업">
							<label for="cate2">생활용품 기업 </label>
						</div>

						<div class="checkbox checkbox-inline checkbox-primary"
							style="float: left">
							<input name="ONLINE" type="checkbox" id="cate3" value="식품관련 기업">
							<label for="cate3">식품관련 기업</label>
						</div>

						<div class="checkbox checkbox-inline checkbox-primary"
							style="float: left">
							<input name="ONLINE" type="checkbox" id="cate4" value="육아전문 기업">
							<label for="cate4">육아전문 기업</label>
						</div>

						<div class="checkbox checkbox-inline checkbox-primary"
							style="float: left">
							<input name="ONLINE" type="checkbox" id="cate5"
								value="주택,건설,인테리어"> <label for="cate5">주택,건설,인테리어</label>
						</div>

						<div class="checkbox checkbox-inline checkbox-primary"
							style="float: left">
							<input name="ONLINE" type="checkbox" id="cate6"
								value="패션/메이크업 기업"> <label for="cate6">패션/메이크업
								기업</label>
						</div>

						<div class="checkbox checkbox-inline checkbox-primary"
							style="float: left">
							<input name="ONLINE" type="checkbox" id="cate7"
								value="교육,문화,도서,출판"> <label for="cate7">교육,문화,도서,출판</label>
						</div>
						<div class="checkbox checkbox-inline checkbox-primary"
							style="float: left">
							<input name="ONLINE" type="checkbox" id="cate8" value="금융,보험">
							<label for="cate8">금융,보험</label>
						</div>
						<div class="checkbox checkbox-inline checkbox-primary"
							style="float: left">
							<input name="ONLINE" type="checkbox" id="cate9" value="여가,건강,스포츠">
							<label for="cate9">여가,건강,스포츠</label>
						</div>
						<div class="checkbox checkbox-inline checkbox-primary"
							style="float: left">
							<input name="ONLINE" type="checkbox" id="cate10"
								value="방송,언론,교통,통신"> <label for="cate10">방송,언론,교통,통신</label>
						</div>
						<div class="checkbox checkbox-inline checkbox-primary"
							style="float: left">
							<input name="ONLINE" type="checkbox" id="cate11"
								value="유통,백화점,온라인쇼핑몰"> <label for="cate11">유통,백화점,온라인쇼핑몰</label>
						</div>
						<div class="checkbox checkbox-inline checkbox-primary"
							style="float: left">
							<input name="ONLINE" type="checkbox" id="cate12"
								value="행정기관,지자체,공공기관,NGO"> <label for="cate12">행정기관,지자체,공공기관,NGO</label>
						</div>
					</td>

				</tr>


				<tr>
					<td colspan="10"><b>온라인 계정</b></td>
				</tr>
				<tr>
					<td colspan="10">
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
					<td colspan="10"><b>활동 내용</b></td>

				</tr>
				<tr>
					<td colspan="10" style="padding-top: 6%; padding-bottom: 6%; padding-left: 10%"> 
						<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="writingarti"
										value="기사작성"> <label for="writingarti">기사작성</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary" style="float: left">
									<input name="WORK_KEYWORD" type="checkbox" id="writingreview"
										value="리뷰작성"> <label for="writingreview">리뷰작성</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary" style="float: left">
									<input name="WORK_KEYWORD" type="checkbox" id="blogposting"
										value="블로그포스팅"> <label for="blogposting">블로그포스팅</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary" style="float: left">
									<input name="WORK_KEYWORD" type="checkbox" id="idea"
										value="아이디어제안"> <label for="idea">아이디어제안</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary" style="float: left">
									<input name="WORK_KEYWORD" type="checkbox" id="offline"
										value="오프라인활동"> <label for="offline">오프라인활동</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary" style="float: left">
									<input name="WORK_KEYWORD" type="checkbox" id="experience"
										value="체험단 활동"> <label for="experience">체험단 활동</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary" style="float: left">
									<input name="WORK_KEYWORD" type="checkbox" id="contents"
										value="콘텐츠제작"> <label for="contents">콘텐츠제작</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary" style="float: left">
									<input name="WORK_KEYWORD" type="checkbox" id="promotion"
										value="홍보"> <label for="promotion">홍보</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary" style="float: left">
									<input name="WORK_KEYWORD" type="checkbox" id="conference"
										value="회의참석"> <label for="conference">회의참석</label>
								</div> 
								
								
								
								<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_KEYWORD" type="checkbox" id="worketc"
										value="기타"> <label for="worketc">기타</label>
								</div> 
					</td>
				</tr>
				<tr>
					<td colspan="10"><b>활동 보상</b></td>
				</tr>
				<tr>
					<td colspan="10" style="padding-top: 6%; padding-bottom: 6%; padding-left: 10%"> 
							<div class="checkbox checkbox-inline checkbox-primary">
									<input name="WORK_BENEFIT_KEY" type="checkbox" id="gift card"
									 value="상품권"> <label for="gift card">상품권</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary" style="float: left">
									<input name="WORK_BENEFIT_KEY" type="checkbox" id="certificates" 
									value="수료증"> <label for="certificates">수료증</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary" style="float: left">
									<input name="WORK_BENEFIT_KEY" type="checkbox" id="EntryPoint" 
									value="입사 가산점"> <label for="EntryPoint">입사 가산점</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary" style="float: left">
									<input name="WORK_BENEFIT_KEY" type="checkbox" id="scholarship" 
									value="장학금"> <label for="scholarship">장학금</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary" style="float: left">
									<input name="WORK_BENEFIT_KEY" type="checkbox" id="Point" 
									value="포인트"> <label for="Point">포인트</label>
								</div> 
								<div class="checkbox checkbox-inline checkbox-primary" style="float: left">
									<input name="WORK_BENEFIT_KEY" type="checkbox" id="cash"
										value="현금"> <label for="cash">현금</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary" style="float: left">
									<input name="WORK_BENEFIT_KEY" type="checkbox" id="stuff"
										value="현물"> <label for="stuff">현물</label>
								</div>
								<div class="checkbox checkbox-inline checkbox-primary" style="float: left">
									<input name="WORK_BENEFIT_KEY" type="checkbox" id="overseas"
										value="해외연수"> <label for="overseas">해외연수</label>
								</div>  
								
								<div class="checkbox checkbox-inline checkbox-primary" style="float: left">
									<input name="WORK_BENEFIT_KEY" type="checkbox" id="etc"
										value="기타"> <label for="etc">기타</label>
								</div> 
					</td>
				</tr> 
				<tr> 
					<td colspan="10"><input type="submit" class="btn btn-primary pull-right" value="검색" /></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</form>

