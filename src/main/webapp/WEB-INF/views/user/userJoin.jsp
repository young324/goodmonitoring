<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>개인회원 가입 페이지</title>
<!--  js -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<form name="insert" method="post" action="/user/userJoin">
		<table width="940" style="padding: 5px 0 5px 0;">
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<h1>개인 회원가입 페이지</h1>
			<th>아이디</th>
			<td><input type="text" name="USR_ID"> <input
				type="button" name="id_check" value="아이디 중복 확인"></td>
			</tr>
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="USR_PASS"> 영문/특수기호/숫자
					포함 8자 이상 입력</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password"></td>
			</tr>
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="USR_NAME"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type='date' class="form-control"
							name="USR_BIRTH" required="required" />
				</td>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="USR_SEX" value="여" /> 여 <input
					type="radio" name="USR_SEX" value="남" /> 남</td>
			</tr>
			<tr>
				<th>핸드폰 번호</th>
				<td>
					<!--  <select name="USR_TEL">
                 <option value="010">010</option>
                 <option value="011">011</option>
                 <option value="019">019</option>
   
              </select>
               -
               <input type="text" size="4px" maxlength="4" name="USR_TEL"> -
               <input type="text" size="4px" maxlength="4" name="USR_TEL">-->

					<input type="text" size="11px" maxlength="11" name="USR_TEL">
				</td>
			</tr>
			<tr>
			<tr>
				<th>이메일</th>
				<td><input type='text' name="USR_EMAIL"> <!--  <input type='text' name="">
              <select name="">
                 <option value="">직접입력</option>
                 <option value="daum.net">daum.net</option>
                 <option value="empal.com">empal.com</option>
                 <option value="gmail.com">gmail.com</option>
                 <option value="hanmail.net">hanmail.net</option>
                 <option value="msn.com">msn.com</option>
                 <option value="naver.com">naver.com</option>
                 <option value="nate.com">nate.com</option>
              </select>--></td>
			</tr>
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="USR_ZIPCODE"> <input
					type="button" name="addsearch" value="우편번호 검색"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="USR_ADDR"><br> <!--   <input type="text" name="">-->
				</td>
			</tr>
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<tr>
				<th>소속</th>
				<td><select name="TARGET">
						<option value="청소년">청소년</option>
						<option value="대학생">대학생</option>
						<option value="일반">일반</option>
						<option value="주부">주부</option>
						<option value="시니어">시니어</option>
						<option value="글로벌">글로벌</option>
				</select></td>
			</tr>
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<tr>
				<th>관심 모집업종</th>
				<td>
				<input type='checkbox' name="INTEREST_CATEGORY" value="11">가전,IT,에너지,자동차,그룹사<br> 
				<input type='checkbox' name="INTEREST_CATEGORY" value="12">생활용품 기업<br> 
				<input type='checkbox' name="INTEREST_CATEGORY" value="13">식품관련 기업<br> 
				<input type='checkbox' name="INTEREST_CATEGORY" value="14">육아전문 기업<br> 
				<input type='checkbox' name="INTEREST_CATEGORY" value="15">주택,건설,인테리어<br>
				<input type='checkbox' name="INTEREST_CATEGORY" value="16">패션/메이크업 기업<br>
				<input type='checkbox' name="INTEREST_CATEGORY" value="17">교육,문화 도서 출판<br>
				<input type='checkbox' name="INTEREST_CATEGORY" value="18">금융,보험<br>
				<input type='checkbox' name="INTEREST_CATEGORY" value="19">여가,건강,스포츠<br>
				<input type='checkbox' name="INTEREST_CATEGORY" value="20">방송,언론,교통,통신<br>
				<input type='checkbox' name="INTEREST_CATEGORY" value="21">유통,백화점,온라인 쇼핑몰<br>
				<input type='checkbox' name="INTEREST_CATEGORY" value="22">행정기관, 지자체, 공공기관, NGO</td>
			</tr>
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<tr>
				<th>경력 / 활동 기간</th>
				<td><select name="USR_CAREER">
						<option value="없음">없음</option>
						<option value="모니터링">모니터링</option>
						<option value="서포터즈">서포터즈</option>
						<option value="기자단">기자단</option>
				</select> <select name="USR_CAREER_DATE">
						<option value="없음">없음</option>
						<option value="3개월미만">3개월 미만</option>
						<option value="1년미만">3개월 이상 1년 미만</option>
						<option value="1년이상">1년 이상 2년 미만</option>
						<option value="2년이상">2년 이상 3년 미만</option>
						<option value="3년이상">3년 이상</option>
				</select><input type="button" name="careeradd" value="경력 추가"><br>
				</td>
			</tr>
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<tr>
				<th>보유계정</th>
				<td><input type='checkbox' name="ONLINE" value="블로그">블로그<br> <input
					type='checkbox' name="ONLINE" value="카페">카페<br> <input
					type='checkbox' name="ONLINE" value="트위터">트위터<br> <input
					type='checkbox' name="ONLINE" value="페이스북">페이스북<br> <input
					type='checkbox' name="ONLINE" value="인스타그램">인스타그램<br> <input
					type='checkbox' name="ONLINE" value="유튜브">유튜브<br> <input
					type='checkbox' name="ONLINE" value="카카오스토리">카카오스토리<br> <input
					type='checkbox' name="ONLINE">기타 <input type='text'
					name="ONLINE"> <br></td>
			</tr>
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<tr>
				<th>계정 주소</th>
				<td><input type='text' name="ONLINE_URL"> <input
					type="button" name="adds" value="추가"></td>
			</tr>
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2" align="left">
					<!--  <a href="/user/userJoin.do" class="joinbtn" >회원가입</a> --> 
					<input type="submit" value="회원가입"/> <input type="reset" value="취소"/>
				</td>
			</tr>
		</table>
		</td>
		</tr>
	</form>

</body>
</html>