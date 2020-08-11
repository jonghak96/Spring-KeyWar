<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업데이트 완료</title>
</head>
<body>
	<center>수정이 완료되었습니다.
	변경된 정보로 다시 로그인해주세요
	
	<form action="http://192.168.0.148:8080/KeyWar/main/mainScreen.jsp">
		<input type="submit" value="메인으로">
	</form>
	</center>
	<%session.invalidate(); %>
</body>
</html>