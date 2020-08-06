<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
  src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
 
<script type="text/javascript">	

	function matchingList(type) {
		var id = "${loginId }";
		console.log("id = " + id);
		var mType = type.value;
		console.log("type = " + mType);
				
		$.ajax({
			url : "matchingList.match",
			type : "POST",
			dataType : "HTML", 
			contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			data : {
				mId : id,
				mType : mType
			},
			success:function (args) {
				document.getElementById("matchingList").innerHTML = args;
			}, 
			error:function (e) {
				console.log(e);
			}
		});		
	}

	function cancle(num) {
		var indexType = num.value + "mType";
		var indexSeqno = num.value + "matchSeqno";
		var type = document.getElementById(indexType).value;
		var seqno = document.getElementById(indexSeqno).value;
				
		this.location.href = "matchingRecord.match?mId=${mId}&mType=" + type + "&matchSeqno=" + seqno + "&cancle=cancle";
	}
	
	function mainPageMove() {
		location.href = "../mainScreen.jsp"
	}
	
</script>
 
<style type="text/css">
	section , aside {
		display: block;
		float: left;
	}

	section {	
		width: 1000px;
		background-color: #FF9090;	
	}
	
	aside {
		left: 1000px;
		width: 300px;
		background-color: #FF6C6C;
	}
	
	<!-- div matchingList 에서 사용 -->
	#container {
		width: 1000px;
		background-color: #FFFFB0;
		margin-bottom: 5px;
	}
	
	#container2 {
		width: 800px;
		background-color: #FFFFB0;
		margin-bottom: 5px;
		float: left;
	}
	
	#container3 {
		width: 200px;
		float: left;
	}

	#member {
		width: 400px;
		float: left;
		background-color: #FFE08C;
	}
	
	#rival {-
		width: 400px;
		float: right;
		background-color: #FFFFB0;
	}
	
	#gym {
		width: 800px;
		background-color: #DBBC68;
	}

</style>
</head>
<body>

	<section>
		<div id="matchingList">
			&nbsp;
		</div>
	</section>
	<aside>
		<div id="type1">
			<button type="button" onclick="matchingList(this)" value="1">매칭 신청중 보기</button>
		</div>
		<div id="type2">
			<button type="button" onclick="matchingList(this)" value="2">매칭 완료된것 보기</button>		
		</div>
		<div id="type3">
			<button type="button" onclick="matchingList(this)" value="3">매칭 결과 보기</button>		
		</div>
		<div>
			<button type="button" onclick="mainPageMove()">메인페이지로 돌아가기</button>
		</div>
	</aside>

</body>
</html>





