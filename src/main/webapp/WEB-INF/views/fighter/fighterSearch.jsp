<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script
  src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    
<script type="text/javascript">

	function fighterContent(select){ 
		var mId = $(select).text();
		
		$.ajax({
			url : "fighterContent.kf",
			type : "POST",
			dataType : "html", 
			data : {
				mId : mId
			},
			success:function (data) {
				
				var divCon = document.getElementById("kscontainer2");
				console.log(divCon);
				divCon.innerHTML = data;
			}, 
			error:function (e) {
				console.log(e);
			}
		});
		
		return false;
	}
</script>

<style type="text/css">
	#kscontainer {
		width: 100%;
		overflow: auto;
	}	
	
	#kscontainer1, #kscontainer2 {
		width: 50%;
		float: left;
	}
</style>

<div id="kscontainer">
<div id="kscontainer1">
	<h1>선수정보</h1>	

	<form action="/KeyWar/fighter/fighterSearch.kf" method="post">
		<select name="searchCategory">
			<option value="mId">아이디</option>
			<option value="mArea">지역</option>
			<option value="mSports">스포츠종목</option>
		</select>
		<input type="text" name="searchWord" size="30">
		<input type="submit" value="검색">
	</form>
	
	<br>
	<br>

	<table border="1">
		<tr>
			<td width=50>랭킹</td>
			<td width=100>아이디</td>
			<td colspan="3" width=100>전적(승/무/패)</td>
			<td width=100>지역</td>
			<td colspan="2" width=100>체급(cm/kg)</td>
			<td width=100>스포츠종목</td>
		</tr>
		<c:forEach items="${search }" var="search" varStatus="rank">
		<tr>
			 <td>${rank.count + ((point-1)*10) }</td>
			 <td><a href="#" onclick="fighterContent(this)">${search.mId }</a></td>
			 <td>${search.cWin }</td>
			 <td>${search.cDraw }</td>
			 <td>${search.cLose }</td>
			 <td>${search.mArea }</td>
			 <td>${search.cHeight }</td>
			 <td>${search.cWeight }</td>
			 <td>${search.mSports }</td>
		</tr>
		</c:forEach>
	</table>
	
	<a href="fighterSearch.kf?page=1&searchCategory=${searchCategory}&searchWord=${searchWord}">&lt;&lt;</a> &nbsp;
	
	<c:if test="${point >= 2}">
		<a href="fighterSearch.kf?page=${back }&searchCategory=${searchCategory}&searchWord=${searchWord}">&lt;</a> &nbsp;
	</c:if>
	
	<c:forEach var="i" begin="${min_num }" end="${max_num }">
		<a href= "fighterSearch.kf?page=${i }&searchCategory=${searchCategory}&searchWord=${searchWord}">${i }</a> &nbsp;
	</c:forEach>
	
	<c:if test="${point<= (pageTotal-1)/10}">
		<a href="fighterSearch.kf?page=${go }&searchCategory=${searchCategory}&searchWord=${searchWord}">&gt;</a> &nbsp;
	</c:if>
	
	<a href="freeboardSearch.fdo?page=${pageTotal}&searchCategory=${searchCategory}&searchWord=${searchWord}">&gt;&gt;</a> &nbsp;
</div>
	
<div id="kscontainer2">
	
</div>
</div>
