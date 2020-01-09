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
			<td><input type="text" id="C_ID" name="C_ID"> <input
				type="button" id="id_check" value="아이디 중복 확인" onclick="id_check()"></td>
			</tr>
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<tr>  
				<th>비밀번호</th>
				<td><input type="password" name="C_PASS" id="C_PASS"> 영문/숫자/특수문자 포함
					5자 이상</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" id="C_PASS_Check"></td>
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
				<td><input type="text" name="C_ZIPCODE" id="C_ZIPCODE" >  <input
					type="button" name="addsearch" value="우편번호 검색"  onclick="execPostCode();"></td>
			</tr>
			<tr>
				<th>회사 주소</th>
				<td><input type="text" name="C_ADDR" id="C_ADDR"><br> <input
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
var idx = false;
$(function(){
			$('#companyJoin').click(function(){
				
				var idx =false;
				
				if($.trim($('#C_ID').val()) == ''){
						alert("아이디 입력.");
						$('#C_ID').focus();
						return;
				}else if($.trim($('#C_PASS').val()) == ''){
						alert("패스워드 입력.");
						$('#C_PASS').focus();
						return;
				}
					//패스워드 확인
				else if($('#C_PASS').val() != $('#C_PASS_Check').val()){
						alert('패스워드가 다릅니다.');
						$('#C_PASS').focus();
						return;
				}
			
				else if(idx==false){
						alert("아이디 중복체크를 해주세요.");
						return;
				}else{
						$('#companyJoin').submit();
				}
			});


					$('#id_check').click(function(){
						  
						//userid 를 param.
				        //var USR_ID =  $("#USR_ID").val(); 
				         
				        $.ajax({
				            type : 'POST',
				            data :{C_ID : $('#C_ID').val()},
				            url : "/company/id_check",
				           
				            success : function(data) {
				                if (data >= 1) {   
				                    
				                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
				                    $("#C_ID").focus();
				                     
				                  
				                } else {
				                    alert("사용가능한 아이디입니다.");		    
				                    $("#C_PASS").focus();
				                    console.log(data); 
				                    idx = true;
				                    
				                }
				            },
				            error : function(error) {
				                
				                alert("error : " + error);
				            }
						 });
					 });  
				});
				
	function execPostCode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	           var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
	           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	               extraRoadAddr += data.bname;
	           }
	           // 건물명이 있고, 공동주택일 경우 추가한다.
	           if(data.buildingName !== '' && data.apartment === 'Y'){
	              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	           }
	           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	           if(extraRoadAddr !== ''){
	               extraRoadAddr = ' (' + extraRoadAddr + ')';
	           }
	           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	           if(fullRoadAddr !== ''){
	               fullRoadAddr += extraRoadAddr;
	           }
	
	           // 우편번호와 주소 정보를 해당 필드에 넣는다.
	           console.log(data.zonecode);
	           console.log(fullRoadAddr);
	           
	           
	           $("[name=C_ZIPCODE]").val(data.zonecode);
	           $("[name=C_ADDR]").val(fullRoadAddr);
	           
	           document.getElementById('C_ZIPCODE').value = data.zonecode; //5자리 새우편번호 사용
	           document.getElementById('C_ADDR').value = fullRoadAddr;
	           //document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; 
	       }
	    }).open({autoClose: true});
	}

						 
</script>
</html>