<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영상 컨텐트</title>
</head>
<body>

	<form action="../videoboardUpdate" method="post">
		<table border="1">
			<tr>
				<td colspan="2"><video src="/keywar/resources/20208115624179.mp4" width="500" height="300" controls>영상파일</video></td>
			</tr>
			<tr>
				<td>영상번호</td>
				<td><input type="text" name="bSeqno" size="50" readonly="readonly" value="${boardContent.bSeqno}"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="mId" size="50" readonly="readonly" value="${boardContent.mId}"></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><input type="text" name="bDate" size="50" readonly="readonly" value="${boardContent.bDate}"></td>
			</tr>
			<tr>
				<td>추천수</td>
				<td><input type="text" name="bLike" size="50" readonly="readonly" value="${boardContent.bLike}"></td>
			</tr>
			<tr>
				<td>조회수</td>
				<td><input type="text" name="bView" size="50" readonly="readonly" value="${boardContent.bView}"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="bTitle" size="50" value="${boardContent.bTitle}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="50" name="bContent">${boardContent.bContent}</textarea></td>
			</tr>

			
			<tr>
				<td colspan="2"><input type="submit" value="수정">
				
				<a href = "../videoBoardLikeCount?bSeqno=${boardContent.bSeqno }">좋아요</a>
				<a href = "../videoboardDelete?bSeqno=${boardContent.bSeqno }">삭제</a>
				<a href = "../getVideoboardSearch">목록보기</a></td>
			</tr>
		</table>
	</form>
	
	<table>
		<tr>
			<td>댓글</td>
		</tr>
			
		<c:forEach items="${commentContentVideo}" var="fc">
		<form action="../videoboardCommentUpdate" method="post">
		<tr>
			<td><input type="text" name="cSeqno" size="5" value="${fc.cSeqno}" readonly="readonly"></td>
			<td><input type="text" name="cWriter" size="10" value="${fc.cWriter}" readonly="readonly"></td>
			<td><input type="text" name="cContent" size="50" value="${fc.cContent}"></td>
			<td><input type="text" name="cDate" size="20" value="${fc.cDate}" readonly="readonly"></td>
			<td><input type="submit" value="수정">
			<td><a href = "../videoboardCommentDelete?cSeqno=${fc.cSeqno}">삭제</a></td>
		</tr>
		</form>
		</c:forEach>
	</table>
	
	<form action="../videoboardCommentWrite" method="post">
			<textarea rows="3" cols="50" name="cContent"></textarea>
			<input type="hidden" name="mId" value="${loginId }">
			<input type="hidden" name="bSeqno" value="${boardContent.bSeqno}">
			<input type="submit" value="댓글등록">	
	</form>	

</body>
</html>