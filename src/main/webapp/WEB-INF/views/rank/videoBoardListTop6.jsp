<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이슈동영상</title>
</head>
<body>
	<c:forEach items="${list}" var="dto" begin="0" end="0"> <!-- var = dto가 dto랑은 상관없이 그냥 값을 주는 거 아무거나 써도 ㄱㅊ -->
		<h1>1위</h1>
		${dto.mId}
		${dto.cWin}승
		${dto.cLose}패
	</c:forEach> <!-- TSTL for문 -->
	<c:forEach items="${list}" var="dto" begin="1" end="1"> <!-- var = dto가 dto랑은 상관없이 그냥 값을 주는 거 아무거나 써도 ㄱㅊ -->
		<h1>2위</h1>
		${dto.mId}
		${dto.cWin}승
		${dto.cLose}패
	</c:forEach> <!-- TSTL for문 -->
	<c:forEach items="${list}" var="dto" begin="2" end="2"> <!-- var = dto가 dto랑은 상관없이 그냥 값을 주는 거 아무거나 써도 ㄱㅊ -->
		<h1>3위</h1>
		${dto.mId}
		${dto.cWin}승
		${dto.cLose}패
	</c:forEach> <!-- TSTL for문 -->
</body>
</html>