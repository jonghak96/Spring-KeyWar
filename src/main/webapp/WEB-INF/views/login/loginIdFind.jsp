<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 ID 찾기</title>
</head>
<body>


	<form action="findId.lo" method="post">
		회원 이름 : <input type="text" name="mName">				<br>
		전화번호 : <input type="text" name="mTelno">				<br>
		이메일 : <input type="text" name="mEmail">				<br>
		<!-- 인증번호 : <input type="text" name="">				<br>	 -->
		
		<input type="submit" value="확인">
					
	</form>
</body>
</html>
