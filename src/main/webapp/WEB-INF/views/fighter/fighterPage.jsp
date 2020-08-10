<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수정보</title>
	
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

</head>
<body>
	
	<header>
		<c:import url="../main/matchingListTop.jsp"></c:import>
		<c:import url="../main/menu.jsp"></c:import>	
	</header>
	<div id="container">
		<c:import url="fighterSearch.kf"></c:import>
		<button id="bt" onclick="mainPageMove()">메인 페이지로 이동</button> &emsp;&emsp;
	</div>
	<footer>
		<c:import url="../main/advertisement.jsp"></c:import>
	</footer>
</body>
</html>