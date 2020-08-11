<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSTL 선언부 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<script
  src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>


<script type="text/javascript">
	$(function() {	
		$.ajax({
			url : "electronicdisplay.match",
			type : "POST",
			dataType : "HTML", 
			data : {
			},
			success:function (args) {
				console.log(args);
				document.getElementById("electroinicDisplay").innerHTML = args;
			}, 
			error:function (e) {
				console.log(e);
			}
		});
	});
</script>

<div id="electroinicDisplayContainer">
	<div id="electroinicDisplay">
		
	</div>
</div>

<div align="right">
	<c:choose>
		<c:when test="${empty loginId}"><a href="login"><button>로그인</button></a> | <a href="signUp_view"><button>회원가입</button></a></c:when>
		<c:otherwise>
			${loginId }님 안녕하세요 | <a href="logout">로그아웃</a><br>
			<a href="matchRecord">매칭 현황 보러가기</a>		
		</c:otherwise>
	</c:choose>	
</div>