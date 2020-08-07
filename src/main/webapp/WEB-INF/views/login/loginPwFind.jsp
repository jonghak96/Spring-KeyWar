<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 비밀번호 찾기</title>
</head>
<body>

	<form action="findPw.lo" method="post">	
		아이디 : <input type="text" name="mId"> 				<br>
		이름 : <input type="text" name="mName"> 				<br>
		전화번호 : <input type="text" name="mTelno">			<br>
		이메일 : <input type="text" name="mEmail"> 			<br>
		<input type="submit" value="찾기">
	</form>

</body>
</html>