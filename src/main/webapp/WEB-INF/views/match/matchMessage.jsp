<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>

	div {
		width: 500px;
	}

	#member {
		border: 3px solid black;
	}
	
	#rival {
		border: 3px solid green;
	}
	
	#gym {
		border: 3px solid red;
	}
	
</style>
    
<div id="member">
	<c:forEach items="${MEMBER}" var="member">
		 아이디 &emsp; ${MEMBER.mId } <br>
		 지역 &emsp; ${MEMBER.mArea } <br>
		 스포츠종목 &emsp; ${MEMBER.mSports } <br>
		 나이 &emsp; ${MEMBER.cAge } <br>
		 키 : &emsp; ${MEMBER.cHeight } 몸무게 :&emsp; ${MEMBER.cWeight } 체급 : &emsp; ${MEMBER.cwClass } <br>
		 승리 &emsp; ${MEMBER.cWin } 패배 &emsp; ${MEMBER.cLose } 비김 &emsp; ${MEMBER.cDraw }		 
	</c:forEach>
</div>
<div id="rival">
	<c:forEach items="${RIVAL}" var="rival">
		 아이디 &emsp; ${RIVAL.mId } <br>
		 지역 &emsp; ${RIVAL.mArea } <br>
		 스포츠종목 &emsp; ${RIVAL.mSports } <br>
		 나이 &emsp; ${RIVAL.cAge } <br>
		 키 : &emsp; ${RIVAL.cHeight } 몸무게 :&emsp; ${RIVAL.cWeight } 체급 : &emsp; ${RIVAL.cwClass } <br>
		 승리 &emsp; ${RIVAL.cWin } 패배 &emsp; ${RIVAL.cLose } 비김 &emsp; ${RIVAL.cDraw }		 
	</c:forEach>
</div>
<div id="gym">
	<c:forEach items="${GYM}" var="gym">
		 체육관 이름 &emsp; ${GYM.mName } <br> 
		 체육관 번호 &emsp; ${GYM.gNumber } / &emsp; ${GYM.mTelno } <br> 
		 체육관에서 가르치는 종목 &emsp; ${GYM.mSports } <br> 
		 체육관 주소 &emsp; ${GYM.gAddress } <br> 
		 체육관 대여비 &emsp; ${GYM.gRentalPrice } <br> 
	</c:forEach>
</div>