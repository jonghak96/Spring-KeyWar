<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
</head>
<script type="text/javascript">
	function loginPageMove() {
		location.href = "../mainScreen.jsp";
	}
</script>

<style>
	#bt {
	  background-color: grey;
	  border-radius: 10px;
	  color: white;
	  padding: 15px 30px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	  margin: 4px 2px;
	  cursor: pointer;
	}
</style>
<body>
	<center>
	<h1>회원가입이 완료되었습니다.</h1> <br>
	<button id="bt" onclick="loginPageMove()">로그인 페이지로 이동</button> &emsp;&emsp;
	</center>
</body>
</html>