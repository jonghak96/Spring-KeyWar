<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체육관 회원가입</title>

<script src="jquery.js"></script>



</head>
<body>
	<c:forEach items="${list}" var="dto"> <!-- var = dto가 dto랑은 상관없이 그냥 값을 주는 거 아무거나 써도 ㄱㅊ -->
	<form action="gymUpdate.mbr" method="post" enctype="Multipart/form-data" onsubmit="return formSubmit()">
		아이디 : <input type="text" name="id" id="id" value="${dto.mId}" maxlength="17" readonly="readonly">				<br>
		비밀번호 : <input type="password" name="pw" id="pw" value="${dto.mPw}" maxlength="17">		<br>
		비밀번호 확인 : <input type="password" id="pwCheck" maxlength="17">			<br>
		체육관 이름 : <input type="text" name="name" id="name" value="${dto.mName}" maxlength="20">		<br>
		체육관 프로필 이미지 : <input type="file" name="profil" accept="image/gif,image/jpeg,image/png"> <br>
		체육관에서 배우는 종목 : <input type="text" name="sports" id="sports" value="${dto.mSports}" maxlength="10">		<br>
		체육관 대여료 : <input type="text" name="price" id="price" value="${dto.gRentalPrice}" maxlength="11">		<br>
		이메일 : <input type="text" name="email" id="email" value="${dto.mEmail}" maxlength="33"> <br>
		체육관 번호 : <input type="text" name="number" size="13" value="${dto.gNumber}" maxlength="13" id="number2">	<br>
		핸드폰 번호 : <input type="text" name="telno" size="13" value="${dto.mTelno}" maxlength="13" id="telno3"> 	<br>
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
				</select>
		주소(다시 선택해주세요) : <select name="gArea">
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
			<input type="text" name="address" id="address" value="${dto.gAddress}">						<br>
		체육관 소개 : <textarea rows="10" name="intro" cols="10">${dto.mIntro}</textarea>		<br>
		체육관 소개 이미지 파일 <input multiple="multiple" type="file" name="file" accept="image/gif,image/jpeg, image/png" />	<br>
		<input type="submit" value="회원가입">
	</form>
	</c:forEach> <!-- TSTL for문 -->
	
</body>
</html>