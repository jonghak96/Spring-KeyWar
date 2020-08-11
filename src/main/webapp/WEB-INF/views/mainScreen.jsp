<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KeyWar</title>

<script
  src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    
<script type="text/javascript">
	var id = "${loginId }";	
	/*
	$(function() {		
		setInterval("messageAlram()", 1000); // 2초에 한번식 실행				
	});
	
	function messageAlram(){
		if (id != "") {			
			$.ajax({
				url : "message.match",
				type : "POST",
				dataType : "TEXT", 
				contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
				data : {
					myId : id
				},
				success:function (args) {
					var idCheck = args;
						
					if (idCheck == "false") {
						
					} else {
						var box = document.getElementById("messageBox");
						box.style.visibility='visible';
						document.getElementById("message").innerHTML = args;
					}
				}, 
				error:function (e) {
					console.log(e);
				}
			});
		}
	}
	
	function messageDisappear() {
		var box = document.getElementById("messageBox");
		box.style.visibility='hidden';
	}
	*/
</script>
<style type="text/css">
	
	header {
	}
	
	section {
		width: 50%;
	}
	
	aside {
		width: 50%;
	}
	
	footer {

	}

	section, aside {
		float: left;
	}
	
	#container {
		width: 100%;
	}
	
	#messageBox {
		position: fixed;
		background-color: #FFCC97;
		top: 200px;
		left: 200px;
		visibility: hidden;
		z-index: 2;
	}
	
	#msButton {
		width: 500px;
		height: 30px;
	}
	body {
   position: relative; /* #wrapper에 투명도를 주면 컨텐츠도 같이 투명해지기 때문에.. */
	}
	body:after {
    content : "";
    display: block;
    position: absolute;
    top: 0;
    left: 0;
	background-image: url('https://cdn.pixabay.com/photo/2012/10/25/23/32/box-62867_1280.jpg');
	background-size: 100% 100%;
    width: 100%;
    height: 100%;
    opacity : 0.5;
    z-index: -1;
    
	}
	
	#electroinicDisplayContainer {
		height: 100px;
	}
</style>

</head>
<body>
	<div id="messageBox">
		<div id="message"></div>
		<div ><button type="button" onclick="messageDisappear()" id="msButton">확인</button> </div>
	</div>
		
	<div id="banner"></div>
	<header>
		<c:import url="main/matchingListTop.jsp"></c:import>
		<c:import url="main/menu.jsp"></c:import>	
	</header>
	<div id="container">
			<c:import url="/rankingList"></c:import>
	</div>
	<footer>
		<c:import url="main/advertisement.jsp"></c:import>
	</footer>
		
</body>
</html>

