<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>

<script src="jquery.js"></script>

<style>
	#wClass {
			
	}

</style>

<script type="text/javascript">
	var idCheck = "true";

	function wClassCalc() {
		var weight = document.getElementById("weight").value;
		var wClass = document.getElementById("wClass");
		var IwClass = document.getElementById("IwClass");
		var str = "";		
		
		if (weight < 47.62)
			str = "미니멈급";
		else if (weight < 48.98)
			str = "라이트플라이급";
		else if (weight < 50.80)
			str = "플라이급";
		else if (weight < 52.16)
			str = "슈퍼플라이급";
		else if (weight < 53.52)
			str = "밴텀급";
		else if (weight < 55.34)
			str = "슈퍼밴텀급";
		else if (weight < 57.15)
			str = "페더급";
		else if (weight < 58.97)
			str = "슈퍼페더급";
		else if (weight < 61.23)
			str = "라이트급";
		else if (weight < 63.50)
			str = "슈퍼라이트급";
		else if (weight < 66.68)
			str = "웰터급";
		else if (weight < 69.85)
			str = "슈퍼웰터급";
		else if (weight < 72.57)
			str = "미들급";
		else if (weight < 76.20)
			str = "슈퍼미들급";
		else if (weight < 79.38)
			str = "라이트헤비급";
		else if (weight < 90.72)
			str = "크루저급";
		else 
			str = "헤비급";
		
		wClass.innerHTML = str;
		IwClass.value = str;
		console.log(IwClass.value);
		
		return false;
	}
	
	function formSubmit() {
		var id = document.getElementById("id");
		var pw = document.getElementById("pw");
		var pwCheck = document.getElementById("pwCheck");
		var name = document.getElementById("name");
		var sex = document.getElementById("sex");
		var telno2 = document.getElementById("telno2");
		var telno3 = document.getElementById("telno3");
		var email = document.getElementById("email1");
		var email2 = document.getElementById("email2");
		var height = document.getElementById("height");
		var weight = document.getElementById("weight");
		var rAge1 = parseInt(document.getElementById("rAge1"));
		var rAge2 = parseInt(document.getElementById("rAge2"));
		
		rAgeCheck(rAge1, rAge2);
		
		if (specialCheck(id) == 1 || passwordCheck(pw) == 1 || passwordCheck(pwCheck) == 1 || specialCheck(name) == 1 || 
				specialCheck(telno2) == 1 || specialCheck(telno3) == 1 || emailCheck(email1) == 1 || emailCheck(email2) == 1 || specialCheck(height) == 1 || 
				specialCheck(weight) == 1 || idCheck == "true" || pwidOverlapCheck(pw, pwCheck) == 1)
			return false;
		
		return true;
	}
	
/* 	function rAgeCheck(input1, input2) {
		console.log(input1);
		console.log(input2);
		if (input1 <= input2){ 
			return 0;			
		}
		else {
			alert("상대 나이 설정을 다시 확인해주세요.")
			return 1;
		}
	} */
	
	function emailCheck(input) {
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
	<form action="customerSignUp.mbr" method="post" enctype="Multipart/form-data" onsubmit="return formSubmit()">
		<h6 id="c1">*필수 입력</h6>
		*아이디 : <input type="text" name="id" id="id" maxlength="17"><button type="button" onclick="idOverlapCheck()">아이디 중복확인</button> <span id="idCheck"></span>			<br>
		*비밀번호 : <input type="password" name="pw" id="pw" maxlength="17">		<br>
		*비밀번호 확인 : <input type="password" id="pwCheck" maxlength="17">			<br>
		*이름 : <input type="text" name="name" id="name" maxlength="10">			<br>
		*성별 : <input type="text" name="sex" id="sex" maxlength="1">				<br>
		*나이 <select name="age">
					<option value="17">17이하</option>
					<option value="18" selected="selected">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
					<option value="32">32</option>
					<option value="33">33</option>
					<option value="34">34</option>
					<option value="35">35</option>
					<option value="36">36</option>
					<option value="37">37</option>
					<option value="38">38</option>
					<option value="39">39</option>
					<option value="40">40</option>
					<option value="41">41</option>
					<option value="42">42</option>
					<option value="43">43</option>
					<option value="44">44</option>
					<option value="45">45</option>
					<option value="46">46</option>
					<option value="47">47</option>
					<option value="48">48</option>
					<option value="49">49</option>
					<option value="50">50이상</option>
				</select> <br>
		*이메일 : <input type="text" name="email1" id="email" maxlength="23"> @ 
			   <input type="text" name="email2" id="email2" maxlength="15">
			   <select onchange="emailChange(this.value)">
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
				<option value="직접입력" selected="selected">직접입력</option>		
			   </select><br>
		*핸드폰 번호 : <select name="telno">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select> 
				<input type="text" name="telno2" id="telno2" size="4" maxlength="4"> - 
				<input type="text" name="telno3" id="telno3" size="4" maxlength="4"> 	<br>
		*프로필 사진 : <input type="file" name="profil" accept="image/gif, image/jpeg, image/png" />		<br>
		*키 : <input type="text" name="height" id="height" maxlength="6"> 			<br>
		*몸무게 : <input type="text" name="weight" id="weight" maxlength="6">			<br>
		*체급 계산 : <span id="wClass">현재값</span><input type="hidden" value="" name="wClass" id="IwClass"> <button type="button" onclick="wClassCalc()">체급 계산</button> <br>
		사용하는 격투기 : <input type="text" name="sports" id="sports" maxlength="10">		<br>
		*지역 : <input type="text" name="area" maxlength="8">				<br>
		<div>
			매칭 조건 <br>
			*상대 성별 <input type="checkbox" name="rSex" value="남"> 남 <input type="checkbox" name="rSex" value="여"> 여 <br>			
			*상대 나이 <select name="rAge1" id="rAge1">
					<option value="17" selected="selected">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
					<option value="32">32</option>
					<option value="33">33</option>
					<option value="34">34</option>
					<option value="35">35</option>
					<option value="36">36</option>
					<option value="37">37</option>
					<option value="38">38</option>
					<option value="39">39</option>
					<option value="40">40</option>
					<option value="41">41</option>
					<option value="42">42</option>
					<option value="43">43</option>
					<option value="44">44</option>
					<option value="45">45</option>
					<option value="46">46</option>
					<option value="47">47</option>
					<option value="48">48</option>
					<option value="49">49</option>
					<option value="50">50이상</option>
				</select>
				~
				<select name="rAge2" id="rAge2">
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
					<option value="32">32</option>
					<option value="33">33</option>
					<option value="34">34</option>
					<option value="35">35</option>
					<option value="36">36</option>
					<option value="37">37</option>
					<option value="38">38</option>
					<option value="39">39</option>
					<option value="40">40</option>
					<option value="41">41</option>
					<option value="42">42</option>
					<option value="43">43</option>
					<option value="44">44</option>
					<option value="45">45</option>
					<option value="46">46</option>
					<option value="47">47</option>
					<option value="48">48</option>
					<option value="49">49</option>
					<option value="50" selected="selected">50이상</option>
				</select>
				 <br>
			상대 지역 	<input type="checkbox" name="rArea" value="서울 특별시">서울 특별시 
					<input type="checkbox" name="rArea" value="부산 광역시">부산 광역시 
					<input type="checkbox" name="rArea" value="대구 광역시">대구 광역시 
					<input type="checkbox" name="rArea" value="인천 광역시">인천 광역시 
					<input type="checkbox" name="rArea" value="광주 광역시">광주 광역시 
					<input type="checkbox" name="rArea" value="대저 광역시">대전 광역시 
					<input type="checkbox" name="rArea" value="울산 광역시">울산 광역시 
					<input type="checkbox" name="rArea" value="경기도">경기도 
					<input type="checkbox" name="rArea" value="강원도">강원도 
					<input type="checkbox" name="rArea" value="충청북도">충청북도 
					<input type="checkbox" name="rArea" value="충청남도">충청남도 
					<input type="checkbox" name="rArea" value="전라북도">전라북도 
					<input type="checkbox" name="rArea" value="전라남도">전라남도 
					<input type="checkbox" name="rArea" value="경상북도">경상북도 
					<input type="checkbox" name="rArea" value="경상남도">경상남도 
					<input type="checkbox" name="rArea" value="제주특별자치도">제주특별자치도 
					<input type="checkbox" name="rArea" value="세종특자치시">세종특자치시 <br>
			*상대 체급 	<select name="rwClass1">
					<option value="미니멈급" selected="selected">미니멈급</option>
					<option value="라이트플라이급">라이트플라이급</option>
					<option value="슈퍼플라이급">슈퍼플라이급</option>
					<option value="밴텀급">밴텀급</option>
					<option value="슈퍼밴텀급">슈퍼밴텀급</option>
					<option value="페더급">페더급</option>
					<option value="슈퍼페더급">슈퍼페더급</option>
					<option value="라이트급">라이트급</option>
					<option value="슈퍼라이트급">슈퍼라이트급</option>
					<option value="웰터급">웰터급</option>
					<option value="슈퍼웰터급">슈퍼웰터급</option>
					<option value="미들급">미들급</option>
					<option value="슈퍼미들급">슈퍼미들급</option>
					<option value="라이트헤비급">라이트헤비급</option>
					<option value="크루저급">크루저급</option>
					<option value="헤비급">헤비급</option>
				</select>
				~
				 	<select name="rwClass2">
					<option value="미니멈급">미니멈급</option>
					<option value="라이트플라이급">라이트플라이급</option>
					<option value="슈퍼플라이급">슈퍼플라이급</option>
					<option value="밴텀급">밴텀급</option>
					<option value="슈퍼밴텀급">슈퍼밴텀급</option>
					<option value="페더급">페더급</option>
					<option value="슈퍼페더급">슈퍼페더급</option>
					<option value="라이트급">라이트급</option>
					<option value="슈퍼라이트급">슈퍼라이트급</option>
					<option value="웰터급">웰터급</option>
					<option value="슈퍼웰터급">슈퍼웰터급</option>
					<option value="미들급">미들급</option>
					<option value="슈퍼미들급">슈퍼미들급</option>
					<option value="라이트헤비급">라이트헤비급</option>
					<option value="크루저급">크루저급</option>
					<option value="헤비급" selected="selected">헤비급</option>
				</select>		</div>		
		자기소개 : <textarea rows="10" cols="10" name="intro" maxlength="300"></textarea>		<br>
		<input type="hidden" value="c" name="type">
		<input type="submit" value="회원가입">
	</form>

</body>
</html>