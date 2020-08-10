<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="loginCheck.lo" method="post">
		<table>
			<tr>
				<td>
				
					아이디 : <input type="text" name="mId">
				</td>
			<tr>
				<td>
					비밀번호 : <input type="password" name="mPw">
				</td>
			</tr>
			<tr>
				<td>
					<div align="right">
						<input type="submit" value="확인">
					</div>
				</td>
			</tr>
		</table>
	</form>
	<a href="loginIdFind.jsp"><button>아이디 찾기</button></a>
	<a href="loginPwFind.jsp"><button>비밀번호 찾기</button></a>
	<!-- <a href="memberFindUpdate.mbr"><button>회원 정보 수정하기</button></a> -->
</body>
</html>