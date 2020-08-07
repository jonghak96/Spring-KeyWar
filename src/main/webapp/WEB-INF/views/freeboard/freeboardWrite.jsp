<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성</title>
</head>
<body>
	<h1>글작성</h1>
	

	<form action="/KeyWar/freeboard/freeboardWrite.do" method="post" enctype="Multipart/form-data" onsubmit="return formSubmit()">
	<table border="1">
		<tr>
			<td>작성자:</td>
			<td><input type="text" name="mId" size="100" value="${loginId }"></td>
		</tr>
		<tr>
			<td>제목:</td>
			<td><input type="text" name="fbTitle" size="100"></td>
		</tr>
		<tr>
			<td>내용:</td>
			<td><textarea rows="20" cols="100" name="fbContent"></textarea> </td>
		</tr>
		<tr>
			<td>사진첨부:</td>
			<td><input multiple="multiple" type="file" name="files" accept="image/gif,image/jpeg,image/png" />
		</tr>
	</table>
	<input type="submit" value="작성">
	</form>

	
	
	<a href = "/KeyWar/freeboard/freeboardSearch.do">취소</a></td>
	
</body>
</html>