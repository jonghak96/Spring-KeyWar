<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영상게시판</title>

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
	
	.videoContainer {
		width: 1200px;
		overflow: auto;
		border: 1px;
	}
	
	.videobox {
		min-width: 200px;
		width: 300px;
		min-height: 150px;
		margin-right: 20px;
		margin-bottom: 5px;
		padding: 10px;
		border: 3px solid black;
		float: left;
	}
	
</style>

</head>
<body>
	<h1>영상게시판</h1>

	<form action="getVideoboardSearch" method="get">
		<select name="searchCategory">
			<option value="bTitle">제목</option>
			<option value="mId">작성자</option>
		</select>
		<input type="text" name="searchWord" size="30">
		<input type="submit" value="검색">
	</form>
	
	<br>
	<br>

	<c:forEach items="${search }" var="search" varStatus="status">
		<c:if test="${(status.count % 3) == 1 }">
			<div class="videoContainer">
		</c:if>
		<div class="videobox">
			<a href = "videoboard/boardContent?bSeqno=${search.bSeqno }"><img src="../board/${search.fPhotoPath }" alt="photo" width="200" height="150"></a> <br>
			영상번호 : ${search.bSeqno } <br>
			작성자 : ${search.mId } <br>
			제목 : ${search.bTitle } <br>
			등록일자 : ${search.bDate } <br>
			조회수 : ${search.bView }
		</div>
		<c:if test="${(status.count % 3) == 0 || status.last eq true }">
		</div>
		</c:if>
	</c:forEach>
	
	
	
	<a href="boardSearch.do?page=1&searchCategory=${searchCategory}&searchWord=${searchWord}">&lt;&lt;</a> &nbsp;
	
	<c:if test="${point >= 2}">
		<a href="boardSearch.do?page=${back }&searchCategory=${searchCategory}&searchWord=${searchWord}">&lt;</a> &nbsp;
	</c:if>
	
	<c:forEach var="i" begin="${min_num }" end="${max_num }">
		<a href= "boardSearch.do?page=${i }&searchCategory=${searchCategory}&searchWord=${searchWord}">${i }</a> &nbsp;
	</c:forEach>
	
	<c:if test="${point<= (pageTotal-1)/10}">
		<a href="boardSearch.do?page=${go }&searchCategory=${searchCategory}&searchWord=${searchWord}">&gt;</a> &nbsp;
	</c:if>
	
	<a href="boardSearch.do?page=${pageTotal}&searchCategory=${searchCategory}&searchWord=${searchWord}">&gt;&gt;</a> &nbsp;
	
	
	<c:if test="${IDCHECK == 1 }">
	<form action="videoboard/boardWrite" method="post">
		<input type="submit" value="영상등록">
	</form>
	</c:if>
	
		
	<br>
	<br>
	<br>
	
<script type="text/javascript">
	function mainPageMove() {
		location.href = "main";
	}
</script>

	<button id="bt" onclick="mainPageMove()">메인 페이지로 이동</button> &emsp;&emsp;
	

</body>
</html>