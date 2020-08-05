<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영상등록</title>

<script
  src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    
<script type="text/javascript">	

	function sumNail() {
		// Form 전체를 넘겨주는 방식 
		var formData = new FormData($("#sumNailForm")[0]); 
		console.log(formData);
		// 아래 주석은 위와 같은데 표현만 다름 
		// var formData = new FormData(document.getElementById("form")); 
		// var formData = new FormData($("form")[0]); 
		
		// 원하는 것만 넘겨주는 방식 
		var formData = new FormData(); 
		formData.append("videoFile", $("#videoFile")[0].files[0]);

		$.ajax({ 
			type: 'POST', 
			url: 'video.sumnail', 
			processData: false, // 필수 
			contentType: false, // 필수 
			data: formData, 
			dataType: "html",
			success: function(data) { 
				console.log("성공");
				console.log(data);
				var divCon = document.getElementById("sumNailContainer");
				console.log(divCon);
				divCon.innerHTML = data;

				var imgId = "img0";				
				var imgSrc = document.getElementById(imgId).src;	
				var inputHidden = document.getElementById("imgSrc");
				inputHidden.value = imgSrc.substring(imgSrc.indexOf("i") - 1 , imgSrc.length);
			}
		});
	}
	
	function imgClick(img) {
		var imgId = "img" + img.value;
		
		var imgSrc = document.getElementById(imgId).src;		
		
		var inputHidden = document.getElementById("imgSrc");
		
		inputHidden.value = imgSrc.substring(imgSrc.indexOf("i") - 1 , imgSrc.length);
		console.log(inputHidden.value = imgSrc.substring(imgSrc.indexOf("i") - 1 , imgSrc.length));
	}	
</script>

<style type="text/css">
	#sumNailContainer {
		width: 1000px;
		border: 1px solid black;
	}
</style>

</head>
<body>

	<h1>영상등록</h1>


	<form action="/KeyWar/board/boardWrite.do" method="post" enctype="Multipart/form-data" id="sumNailForm">
	
	<table border="1">
		<tr>
			<td rowspan="2">경기결과 입력</td><td>기록자</td><td>도전자 ID</td><td rowspan="2">VS</td><td>상대자 ID</td>
			<td rowspan="2">도전자의<select name="mResult"><option value="win">승리</option><option value="lose">패배</option><option value="draw">무승부</option></select></td>
		</tr>
		<tr>
			<td><input type="text" value="${loginId }" size="20" readonly="readonly"></td>
			<td><input type="text" name="member_mSeqno" size="15"></td>
			<td><input type="text" name="rival_mSeqno" size="15"></td>
		</tr>
	</table>
	
	<br>

	<table border="1">
		<tr>
			<td>작성자:</td>
			<td><input type="text" name="mId" size="100" value="${loginId }"></td>
		</tr>
		<tr>
			<td>제목:</td>
			<td><input type="text" name="bTitle" size="100"></td>
		</tr>
		<tr>
			<td>내용:</td>
			<td><textarea rows="20" cols="100" name="bContent"></textarea> </td>
		</tr>
		<tr>
			<td>동영상 첨부:</td>
			<td><input type="file" name="videoFile" accept="video/*" id="videoFile"  /> <button type="button" onclick="sumNail()">동영상 썸네일 추출하기</button> </td>
		</tr>
	</table>
	
	<input type="hidden" name="imgSrc" id="imgSrc" value="">
	<div id="sumNailContainer">
	
	</div>
		<input type="submit" value="영상등록">
	</form>
	
	<a href = "/KeyWar/board/boardSearch.do">취소</a>

</body>
</html>