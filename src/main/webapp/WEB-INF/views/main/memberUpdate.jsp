<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>

<script src="jquery.js"></script>

<style>
	#wClass {
			
	}

</style>

<script type="text/javascript">

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
		var pw = document.getElementById("pw");
		var pwCheck = document.getElementById("pwCheck");
		var name = document.getElementById("name");
		var sex = document.getElementById("sex");
		var telno = document.getElementById("telno");
		var email = document.getElementById("email");
		var height = document.getElementById("height");
		var weight = document.getElementById("weight");
		
		if (specialCheck(id) == 1 || passwordCheck(pw) == 1 || passwordCheck(pwCheck) == 1 || specialCheck(name) == 1 || 
				specialCheck(telno) == 1 || emailCheck(email) == 1 || specialCheck(height) == 1 || 
				specialCheck(weight) == 1 || pwidOverlapCheck(pw, pwCheck) == 1)
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
		if(!pattern1.test(input.value) || !pattern2.test(input.value) || !pattern3.test(input.value) || input.length > 8) { 
			alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다."); 
			input.focus();
			return 1; 
		}
		return 0;
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
	<c:forEach items="${list}" var="dto"> <!-- var = dto가 dto랑은 상관없이 그냥 값을 주는 거 아무거나 써도 ㄱㅊ -->
	<form action="memberUpdate.mbr" method="post" enctype="Multipart/form-data" onsubmit="return formSubmit()">
		아이디 : <input type="text" name="id" value="${dto.mId}" readonly="readonly"> <br>
		비밀번호 : <input type="password" name="pw" id="pw" value="${dto.mPw}" maxlength="17">		<br>
		비밀번호 확인 : <input type="password" id="pwCheck"  maxlength="17">			<br>
		이름 : <input type="text" name="name" id="name" value="${dto.mName}" maxlength="10">			<br>
		성별 : <input type="text" name="sex" id="sex" value="${dto.cSex}" maxlength="1">				<br>
		나이 <select name="age">
					<option value="16" selected="selected">선택</option>
					<option value="17">17이하</option>
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
				</select> <br>
		이메일 : <input type="text" name="email1" id="email" value="${dto.mEmail}" maxlength="33"> <br> 
		핸드폰 번호 : <input type="text" name="telno" id="telno" value="${dto.mTelno}" size="20" maxlength="13"> 	<br>
		프로필 사진 : <input type="file" name="profil" accept="image/gif, image/jpeg, image/png" />		<br>
		키 : <input type="text" name="height" id="height" value="${dto.cHeight}" maxlength="6"> 			<br>
		몸무게 : <input type="text" name="weight" id="weight" value="${dto.cWeight}" maxlength="6">			<br>
		체급 계산 : <span id="wClass">현재값</span><input type="hidden" value="" name="wClass" id="IwClass"> <button type="button" onclick="wClassCalc()">체급 계산</button> <br>
		사용하는 격투기 : <input type="text" name="sports" id="sports" value="${dto.mSports}" maxlength="10">		<br>
		지역 : <input type="text" name="area" value="${dto.mArea}" maxlength="8">				<br>
		<div>
			매칭 조건 <br>
			상대 성별(남, 여 둘 중 하나만 써주세요) : <input type="text" name="rSex" size="2" value="${dto.rSex}"> <br>			
			상대 나이 <select name="rAge1">
					<option value="17" selected="selected">17이하</option>
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
				<select name="rAge2">
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
					<input type="checkbox" name="rArea" value="강원도">강원도 <br>  &emsp;&emsp;&emsp;&emsp;
					<input type="checkbox" name="rArea" value="충청북도">충청북도 
					<input type="checkbox" name="rArea" value="충청남도">충청남도 
					<input type="checkbox" name="rArea" value="전라북도">전라북도 
					<input type="checkbox" name="rArea" value="전라남도">전라남도 
					<input type="checkbox" name="rArea" value="경상북도">경상북도 
					<input type="checkbox" name="rArea" value="경상남도">경상남도 
					<input type="checkbox" name="rArea" value="제주특별자치도">제주특별자치도 
					<input type="checkbox" name="rArea" value="세종특자치시">세종특자치시 <br>
			상대 	체급 	<select name="rwClass1">
					<option value="미니멈급" selected="selected">미니멈급</option>
					<option value="라이트플라이급">라이트플라이급</option>
					<option value="슈퍼플라이급">슈퍼플라이급</option>
					<option value="밴텀급">밴텀급</option>
					<option value="슈퍼밴텀급">슈퍼밴텀급</option>
					<option value="페더급">페더급</option>
					<option value="슈퍼페더급">슈퍼페더급</option>
					<option value="라이트급">라이트급option>
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
		자기소개 : <textarea rows="10" cols="10" name="intro" maxlength="300">${dto.mIntro}</textarea>		<br>
		<input type="submit" value="정보 수정">
	</form>
	</c:forEach> <!-- TSTL for문 -->

</body>
</html>