<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
</head>
<body>
	<h1>자유게시판</h1>

	<form action="../freeboard/freeboardSearch.do" method="post">
		<select name="searchCategory">
			<option value="fbTitle">제목</option>
			<option value="mId">작성자</option>
		</select>
		<input type="text" name="searchWord" size="30">
		<input type="submit" value="검색">
	</form>
	
	<br>
	<br>

	<table border="1">
		<tr>
			<td width=60>글번호</td>
			<td width=100>작성자</td>
			<td width=500>제목</td>
			<td width=200>작성일</td>
			<td width=60>추천수</td>
			<td width=70>조회수</td>
		</tr>
		<c:forEach items="${search }" var="search">
		<tr>
			 <td>${search.fbSeqno }</td>
			 <td>${search.mId }</td>
			 <td><a href = "../freeboard/freeboardContent.do?fbSeqno=${search.fbSeqno }">${search.fbTitle }</a></td>
			 <td>${search.fbDate }</td>
			 <td>${search.fbLike }</td>
			 <td>${search.fbView }</td>
		</tr>
		</c:forEach>
	</table>
	
	
	
	<a href="freeboardSearch.do?page=1&searchCategory=${searchCategory}&searchWord=${searchWord}">&lt;&lt;</a> &nbsp;
	
	<c:if test="${point >= 2}">
		<a href="freeboardSearch.do?page=${back }&searchCategory=${searchCategory}&searchWord=${searchWord}">&lt;</a> &nbsp;
	</c:if>
	
	<c:forEach var="i" begin="${min_num }" end="${max_num }">
		<a href= "freeboardSearch.do?page=${i }&searchCategory=${searchCategory}&searchWord=${searchWord}">${i }</a> &nbsp;
	</c:forEach>
	
	<c:if test="${point<= (pageTotal-1)/10}">
		<a href="freeboardSearch.do?page=${go }&searchCategory=${searchCategory}&searchWord=${searchWord}">&gt;</a> &nbsp;
	</c:if>
	
	<a href="freeboardSearch.do?page=${pageTotal}&searchCategory=${searchCategory}&searchWord=${searchWord}">&gt;&gt;</a> &nbsp;
	
	
	<br>
	<br>
	
	<form action="/KeyWar/freeboard/freeboardWrite.jsp" method="post">
		<input type="submit" value="글작성">
	</form>

	
	<br>
	<br>
	<br>
	
<script type="text/javascript">
	function mainPageMove() {
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
	<button id="bt" onclick="mainPageMove()">메인 페이지로 이동</button> &emsp;&emsp;


</body>
</html>