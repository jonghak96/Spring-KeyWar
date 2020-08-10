<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	#container {
		width: 1400px;
		background-color: #FFFFB0;
		margin-bottom: 5px;
	}
	
	#container2 {
		width: 1200px;
		background-color: #FFFFB0;
		margin-bottom: 5px;
		float: left;
	}
	
	#container3 {
		width: 200px;
		float: left;
	}

	#member {
		width: 600px;
		float: left;
		background-color: #FFE08C;
	}
	
	#rival {
		width: 600px;
		float: right;
		background-color: #FFFFB0;
	}
	
	#gym {
		width: 1200px;
		background-color: #DBBC68;
	}
	
</style>

</head>
<body>

	<c:forEach items="${MEMBER }" var="MEMBER" varStatus="status">
	<div id="container">
		<div id="container2">
			<div id="member">
				도전자 정보 <br>
				ID : ${MEMBER.mId } &emsp; 지역 : ${MEMBER.mArea } &emsp; 나이 : ${MEMBER.cAge } &emsp; 키 : ${MEMBER.cHeight } &nbsp; 몸무게 : ${MEMBER.cWeight} &nbsp; 체급 : ${MEMBER.cwClass } <br>
				사용하는 종목 : ${MEMBER.mSports } &emsp; 승리수 : ${MEMBER.cWin } &emsp; 패배수 : ${MEMBER.cLose } &emsp; 비긴횟수 : ${MEMBER.cDraw }
			</div>
			<div id="rival">
				상대 정보 <br>
				ID : ${RIVAL[status.index].mId } &emsp; 지역 : ${RIVAL[status.index].mArea } &emsp; 나이 : ${RIVAL[status.index].cAge } &emsp; 키 : ${RIVAL[status.index].cHeight } &nbsp; 몸무게 : ${RIVAL[status.index].cWeight} &nbsp; 체급 : ${RIVAL[status.index].cwClass } <br>
				사용하는 종목 : ${RIVAL[status.index].mSports } &emsp; 승리수 : ${RIVAL[status.index].cWin } &emsp; 패배수 : ${RIVAL[status.index].cLose } &emsp; 비긴횟수 : ${RIVAL[status.index].cDraw }		
			</div>
			<div id="gym">
				체육관 정보 <br>
				체육관 이름 : ${GYM[status.index].mName } &emsp; 체육관 번호 : ${GYM[status.index].gNumber } / ${GYM[status.index].mTelno } &emsp; 체육관 주소 : ${GYM[status.index].gAddress } &emsp; 체육관 대여료 : ${GYM[status.index].gRentalPrice }
			</div>		
		</div>
		<div id="container3">
			<form action="">
				<input type="submit" value="승낙">
			</form>
		</div>
	</div>	
	</c:forEach>

</body>
</html>