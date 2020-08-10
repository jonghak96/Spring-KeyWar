<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<script
  src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    
<script type="text/javascript">

	function gymContent(select){ 		
		var mName = $(select).text();
		var mId = $(select).attr('id');
		
		$.ajax({
			url : "gymContent",
			type : "POST",
			dataType : "html", 
			data : {
				mId : mId,
				mName : mName
			},
			success:function (data) {
				
				var divCon = document.getElementById("kscontainer2");
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

<title>체육관정보</title>

<body>
	<h1>체육관정보</h1>

	<form action="gymSearch" method="get">
		<select name="searchCategory">
			<option value="mName">체육관명</option>
			<option value="gAddress">주소</option>
			<option value="mSports">스포츠종목</option>
		</select>
		<input type="text" name="searchWord" size="30">
		<input type="submit" value="검색">
	</form>
	
	<br>
	<br>
	<table border="1">
		<tr>
			<td width=50>인기</td>
			<td width=100>아이디</td>
			<td width=100>체육관명</td>
			<td width=150>주소</td>
			<td width=100>대여료</td>
			<td width=100>스포츠종목</td>
		</tr>
		<c:forEach items="${search }" var="search" varStatus="rank">
		<tr>
			 <td>${rank.count }</td>
			 <td>${search.mId }</td>
			 <td><a href="#" onclick="gymContent(this)" id="${search.mId }" > ${search.mName }</a></td>
			 <td>${search.gAddress }</td>
			 <td>${search.gRentalPrice }</td>
			 <td>${search.mSports }</td>
		</tr>
		</c:forEach>
	</table>
	
	
	
	<a href="gymSearch?page=1&searchCategory=${searchCategory}&searchWord=${searchWord}">&lt;&lt;</a> &nbsp;
	
	<c:if test="${point >= 2}">
		<a href="gymSearch?page=${back }&searchCategory=${searchCategory}&searchWord=${searchWord}">&lt;</a> &nbsp;
	</c:if>
	
	<c:forEach var="i" begin="${min_num }" end="${max_num }">
		<a href= "gymSearch?page=${i }&searchCategory=${searchCategory}&searchWord=${searchWord}">${i }</a> &nbsp;
	</c:forEach>
	
	<c:if test="${point<= (pageTotal-1)/10}">
		<a href="gymSearch?page=${go }&searchCategory=${searchCategory}&searchWord=${searchWord}">&gt;</a> &nbsp;
	</c:if>
	
	<a href="gymSearch?page=${pageTotal}&searchCategory=${searchCategory}&searchWord=${searchWord}">&gt;&gt;</a> &nbsp;
	
	
	<br>
	<br>
	
	<form action="/KeyWar/match/matchGymApply.jsp" method="post">
		<input type="submit" value="장소 신청">
	</form>


	
	<br>
	<br>
	<br>
	
<script type="text/javascript">
	function mainPageMove() {
		parent.location.href = "../mainScreen.jsp";
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

</div>
	
<div id="kscontainer2">
	
</div>
</div>