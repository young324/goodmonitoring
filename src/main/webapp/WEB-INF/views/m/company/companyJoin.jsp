<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>기업 회원가입 페이지</title>
<!--  js -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--
    <style type="text/css">
        h1, h2, ul, li, p, div {margin:0; padding:0; box-sizing: border-box;}
        li {list-style: none;}
        .clear:after {content:""; display: block; clear: both;}
        a {line-height: 1.5; color: #333;}
        body {background: #f1f1f1; font-size: 13px;}
        header {background: coral;}
        h1 {font-size: 25px; color: #cc0; padding: 10px; color: #fff;}
        .lnb li {margin: 10px; padding: 10px; background: lightgreen;}
        .content {padding: 20px;}
        h2 {font-size: 20px;}
        .ext {margin: 10px; padding: 20px; background: lightgreen;}
        footer {padding: 10px; background: #aaa;}
    </style>
-->

</head>
<body>
	<form name="insert" method="post">
		<table width="940" style="padding: 5px 0 5px 0;">
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<h1>기업 회원가입 페이지</h1>
			<th>아이디</th>
			<td><input type="text" name="C_ID"> <input
				type="button" name="idsearch" value="아이디 검색"></td>
			</tr>
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="C_PASS"> 영문/숫자/특수문자 포함
					5자 이상</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password"></td>
			</tr>
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<tr>
				<th>회사명</th>
				<td><input type="text" name="C_NAME"></td>
			</tr>
			<tr>
				<th>사업자등록번호</th>
				<td><input type="text" maxlength="10" name="C_CODE"> <input
					type="button" name="cpnumsearch" value="사업자등록번호 검색">
			</tr>
			<th>회사 도메인</th>
			<td><input type="text" name="C_URL"></td>
			</tr>
			<tr>
				<th>회사 전화번호</th>
				<td><!-- <select name="C_TEL">
						<option value="서울">02</option>
						<option value="경기">031</option>
						<option value="인천">032</option>
						<option value="강원">033</option>
						<option value="충남">041</option>
						<option value="대전">042</option>
						<option value="충북">043</option>
						<option value="세종">044</option>
						<option value="부산">051</option>
						<option value="울산">052</option>
						<option value="대구">053</option>
						<option value="경북">054</option>
						<option value="경남">055</option>
						<option value="전남">061</option>
						<option value="광주">062</option>
						<option value="전북">063</option>
						<option value="제주">064</option>
				</select> - <input type="text" size="4px" maxlength="4" name="C_TEL">
					- --> <input type="text" size="11px" maxlength="11" name="C_TEL">
				</td>
			</tr>
			<tr>
				<th>부서명</th>
				<td><input type="text" name="C_PART"></td>
			</tr>
			<tr>
				<th>담당자명</th>
				<td><input type="text" name="C_PART_NAME"></td>
			</tr>
			<tr>
				<th>담당자 핸드폰번호</th>
				<td><!-- <select name="C_PART_TEL">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="019">019</option>
				</select> - <input type="text" size="4px" maxlength="4" name="C_PART_TEL">
					- --><input type="text" size="11px" maxlength="11" name="C_PART_TEL">
				</td>
			</tr>
			<tr>
			<tr>
				<th>이메일</th>
				<td><!--  <input type='text' name="C_EMAIL">@ --><input
					type='text' name="C_EMAIL"> <!--  <select name="C_EMAIL">
						<option value="">직접입력</option>
						<option value="daum.net">daum.net</option>
						<option value="empal.com">empal.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="msn.com">msn.com</option>
						<option value="naver.com">naver.com</option>
						<option value="nate.com">nate.com</option>
				</select> --> </td>
			</tr>
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="C_ZIPCODE"> <input
					type="button" name="addsearch" value="우편번호 검색"></td>
			</tr>
			<tr>
				<th>회사 주소</th>
				<td><input type="text" name="C_ADDR"><br> <input
					type="text" name="home_h2"></td>
			</tr>
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<tr>
				<th>주요 모집업종</th>
				<td><input type='checkbox' name="INTEREST_CATEGORY" value="가전 IT 에너지 자동차 그룹사">가전, IT, 에너지,
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
					type='checkbox' name="INTEREST_CATEGORY" value="행정기관  지자체  공공기관  NGO">행정기관, 지자체, 공공기관, NGO</td>
			</tr>
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2" align="left"><input type="submit" value="회원가입">
					<input type="reset" value="취소"></td>
			</tr>
		</table>
		</td>
		</tr>
	</form>
</body>
</html>