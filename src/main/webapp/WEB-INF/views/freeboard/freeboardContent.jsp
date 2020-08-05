<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 컨텐트</title>
</head>
<body>

	<form action="/KeyWar/freeboard/freeboardUpdate.do" method="post">
		<table border="1">
			<tr>
				<td>글번호</td>
				<td><input type="text" name="fbSeqno" size="50" readonly="readonly" value="${content.fbSeqno}"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="mId" size="50" readonly="readonly" value="${content.mId}"></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><input type="text" name="fbDate" size="50" readonly="readonly" value="${content.fbDate}"></td>
			</tr>
			<tr>
				<td>추천수</td>
				<td><input type="text" name="fbLike" size="50" readonly="readonly" value="${content.fbLike}"></td>
			</tr>
			<tr>
				<td>조회수</td>
				<td><input type="text" name="fbView" size="50" readonly="readonly" value="${content.fbView}"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="fbTitle" size="50" value="${content.fbTitle}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="50" name="fbContent">${content.fbContent}</textarea></td>
			</tr>
				<c:forEach items="${file }" var="file" varStatus="vs">
			<tr>
				<td>첨부파일${vs.count}</td>
				<td><img src="../freeboard/${file.ffPhotoPath }" alt="photo" width="200" height="200"></td>
			</tr>
				</c:forEach>

			
			<tr>
				<td colspan="2"><input type="submit" value="수정">
				
				<a href = "/KeyWar/freeboard/freeboardLike.do?fbSeqno=${content.fbSeqno }">좋아요</a>
				<a href = "/KeyWar/freeboard/freeboardDelete.do?fbSeqno=${content.fbSeqno }">삭제</a>
				<a href = "/KeyWar/freeboard/freeboardSearch.do">목록보기</a></td>
			</tr>
		</table>
	</form>
	
	<table>
		<tr>
			<td>댓글</td>
		</tr>
			
		<c:forEach items="${commentContent}" var="fc">
		<form action="/KeyWar/freeboard/freeboardcommentUpdate.do" method="post">
		<tr>
			<td><input type="text" name="fcSeqno" size="5" value="${fc.fcSeqno}" readonly="readonly"></td>
			<td><input type="text" name="fcWriter" size="10" value="${fc.fcWriter}" readonly="readonly"></td>
			<td><input type="text" name="fcContent" size="50" value="${fc.fcContent}"></td>
			<td><input type="text" name="fcDate" size="20" value="${fc.fcDate}" readonly="readonly"></td>
			<td><input type="submit" value="수정">
			<td><a href = "/KeyWar/freeboard/freeboardcommentDelete.do?fcSeqno=${fc.fcSeqno}">삭제</a></td>
		</tr>
		</form>
		</c:forEach>
	</table>
	
	<form action="/KeyWar/freeboard/freeboardcommentWrite.do" method="post">
			<textarea rows="3" cols="50" name="fcContent"></textarea>
			<input type="hidden" name="mId" value="${loginId }">
			<input type="hidden" name="fbSeqno" value="${content.fbSeqno}">
			<input type="submit" value="댓글등록">	
	</form>
		
	

</body>
</html>