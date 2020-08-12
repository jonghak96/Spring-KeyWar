<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체육관 회원가입</title>

<script src="jquery.js"></script>

<script type="text/javascript">
	var idCheck = "true";
	
	function formSubmit() {
		var id = document.getElementById("id");
		var pw = document.getElementById("pw");
		var pwCheck = document.getElementById("pwCheck");
		var name = document.getElementById("name");
		var sports = document.getElementById("sports");
		var telno2 = document.getElementById("telno2");
		var telno3 = document.getElementById("telno3");
		var email1 = document.getElementById("email1");
		var email2 = document.getElementById("email2");
		
		if (specialCheck(id) == 1 || passwordCheck(pw) == 1 || passwordCheck(pwCheck) == 1 || specialCheck(name) == 1 || specialCheck(sports) == 1 ||
				priceCheck(price) == 1 || specialCheck(telno2) == 1 || specialCheck(telno3) == 1 || emailCheck(email1) == 1 || emailCheck(email2) == 1 || specialCheck(address) == 1 || 
				/* idCheck == "true" ||  */pwidOverlapCheck(pw, pwCheck) == 1)
			return false;
		
		return true;
	}
	
	function emailCheck(input) {
		if (input.value == "") {
			alert("빈값이 있습니다.")
			input.focus();
			return 1;
		}		
		return 0;
	}
	
	function priceCheck(input) {
		if (input.value == "") {
			alert("빈값이 있습니다.")
			input.focus();
			return 1;
		}		
		return 0;
	}
	
	function specialCheck(input) {
		if (input.value == "") {
			alert("빈값이 있습니다.")
			input.focus();
			return 1;
		}
		
		var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

		if(special_pattern.test(input.value) == true) {
			alert("특수문자가 들어가있습니다.")
			input.focus();
			return 1; 
		} 		
		return 0;
	}
	
	function passwordCheck(input) {
		if (input.value == "") {
			alert("빈값이 있습니다.")
			input.focus();
			return 1;
		}
		
		var pattern1 = /[0-9]/; // 숫자 
		var pattern2 = /[a-zA-Z]/; // 문자 
		var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자 
		if(!pattern1.test(input.value) || !pattern2.test(input.value) || !pattern3.test(input.value) || input.value.length < 8) { 
			alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다."); 
			input.focus();
			return 1; 
		}
		return 0;
	}
	
	function idOverlapCheck() {		
		var data = "";
		
		$.ajax({
			url : "KControllerAjax", // 데이터를 보낼 장소
			type : "POST", // get, post 두가지의 방식
			dataType : "TEXT", 
			data : {
				id : $("#id").val()
			},
			success:function (args) {
				idCheck = args;
				if (idCheck == "true")
					$("#idCheck").text("이미 사용중인 아이디입니다.");
				else  {
					$("#idCheck").text("사용 가능한 아이디입니다.");
					document.getElementById("id").readOnly = true;
				}
			}, 
			error:function (e) {
				console.log(e);
			}
		});
	}
	
	function pwidOverlapCheck(input1, input2) {
		if (input1.value == input2.value) {
			return 0;
		}
		else {
			alert("비밀번호가 같지 않습니다.");
			return 1;
		}
	} 
	
	function emailChange(input) {
		var text = document.getElementById("email2");
				
		if(input == "0") {
			text.readOnly = false;
		}
		else { 
			text.readOnly = true;
			text.value = input;
		}
	}
</script>



</head>
<body>
	<form action="gymSignUp" method="post" enctype="Multipart/form-data" onsubmit="return formSubmit()">
		<h6 id="c1">*필수 입력</h6>
		*아이디 : <input type="text" name="id" id="id" maxlength="17">
		<button type="button" onclick="idOverlapCheck()">아이디 중복확인</button> <span id="idCheck"></span>				<br>
		*비밀번호 : <input type="password" name="pw" id="pw" maxlength="17">		<br>
		*비밀번호 확인 : <input type="password" id="pwCheck" maxlength="17">			<br>
		*체육관 이름 : <input type="text" name="name" id="name" maxlength="20">		<br>
		*체육관 프로필 이미지 : <input type="file" name="profile" accept="image/gif,image/jpeg,image/png"> <br>
		체육관에서 배우는 종목 : <input type="text" name="sports" id="sports" maxlength="10">		<br>
		체육관 대여료 : <input type="text" name="price" id="price" maxlength="11">		<br>
		*이메일 : <input type="text" name="email1" id="email1" maxlength="23"> @ 
			   <input type="text" name="email2" id="email2" maxlength="15">
			   <select name="email" onchange="emailChange(this.value)">
			   <option value="naver.com">naver.com</option>
				<option value="google.com">google.com</option>
				<option value="daum.net">daum.net</option>
				<option value="nate.com">nate.com</option>
				<option value="korea.com">korea.com</option>
				<option value="yahoo.com">yahoo.com</option>
				<option value="empal.com">empal.com</option>
				<option value="hanmir.com">hanmir.com</option>		
				<option value="hotmail.com">hotmail.com</option>		
				<option value="hitel.net">hitel.net</option>		
				<option value="kebi.com">kebi.com</option>		
				<option value="netian.com">netian.com</option>		
				<option value="0" selected="selected">직접입력</option>		
			   </select><br>
		체육관 번호 : <select name="number1">
					<option value="02" selected="selected">02 (서울)</option>
					<option value="031">031 (경기)</option>
					<option value="032">032 (인천)</option>
					<option value="033">033 (강원)</option>
					<option value="041">041 (충남)</option>
					<option value="042">042 (대전)</option>
					<option value="043">043 (충북)</option>
					<option value="044">044 (세종)</option>
					<option value="051">051 (부산)</option>
					<option value="052">052 (울산)</option>
					<option value="053">053 (대구)</option>
					<option value="054">054 (경북)</option>
					<option value="055">055 (경남)</option>
					<option value="061">061 (전남)</option>
					<option value="062">062 (광주)</option>
					<option value="063">063 (전북)</option>
					<option value="064">064 (제주)</option>
				</select> 
				<input type="text" name="number2" size="4" maxlength="4" id="number2"> - 
				<input type="text" name="number3" size="4" maxlength="4" id="number3"> 	<br>
		*핸드폰 번호 : <select name="telno">
					<option value="010" selected="selected">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select> -
				<input type="text" name="telno2" size="4" maxlength="4" id="telno2"> - 
				<input type="text" name="telno3" size="4" maxlength="4" id="telno3"> 	<br>
		*대여 가능 시간: <select name="timeTable1">
						<option value="6">06:00</option>
						<option value="7">07:00</option>
						<option value="8">08:00</option>
						<option value="9">09:00</option>
						<option value="10">10:00</option>
						<option value="11">11:00</option>
						<option value="12">12:00</option>
						<option value="13">13:00</option>
						<option value="14">14:00</option>
						<option value="15">15:00</option>
						<option value="16">16:00</option>
						<option value="17">17:00</option>
						<option value="18">18:00</option>
						<option value="19">19:00</option>
						<option value="20">20:00</option>
						<option value="21">21:00</option>
						<option value="22">22:00</option>
						<option value="23">23:00</option>
					</select> ~
					<select name="timeTable2">
						<option value="7">07:00</option>
						<option value="8">08:00</option>
						<option value="9">09:00</option>
						<option value="10">10:00</option>
						<option value="11">11:00</option>
						<option value="12">12:00</option>
						<option value="13">13:00</option>
						<option value="14">14:00</option>
						<option value="15">15:00</option>
						<option value="16">16:00</option>
						<option value="17">17:00</option>
						<option value="18">18:00</option>
						<option value="19">19:00</option>
						<option value="20">20:00</option>
						<option value="21">21:00</option>
						<option value="22">22:00</option>
						<option value="23">23:00</option>
						<option value="24">24:00</option>
					</select> <br>					
			*주소 : <select name="gArea">
					<option value="서울 특별시" selected="selected">서울 특별시</option>
					<option value="부산 광역시">부산 광역시</option>
					<option value="대구 광역시">대구 광역시</option>
					<option value="인천 광역시">인천 광역시</option>
					<option value="광주 광역시">광주 광역시</option>
					<option value="대저 광역시">대전 광역시</option>
					<option value="울산 광역시">울산 광역시</option>
					<option value="경기도">경기도</option>
					<option value="강원도">강원도</option>
					<option value="충청북도">충청북도</option>
					<option value="충청남도">충청남도</option>
					<option value="전라북도">전라북도</option>
					<option value="전라남도">전라남도</option>
					<option value="경상북도">경상북도</option>
					<option value="경상남도">경상남도</option>
					<option value="제주특별자치도">제주특별자치도</option>
					<option value="세종특자치시">세종특자치시</option>
				</select>
			<input type="text" name="address" id="address">						<br>
		체육관 소개 : <textarea rows="10" name="intro" cols="10"></textarea>		<br>
		*체육관 소개 이미지 파일 <input multiple="multiple" type="file" name="files" accept="image/gif,image/jpeg,image/png" />	<br>
		<input type="hidden" value="g" name="type">
		<input type="submit" value="회원가입">
	</form>
</body>
</html>