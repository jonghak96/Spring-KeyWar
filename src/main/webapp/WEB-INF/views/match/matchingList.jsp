<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	&nbsp;
	<c:forEach items="${MEMBER }" var="MEMBER" varStatus="status">
	<div id="container">
		<div id="container2">
			<div id="member">
				도전자 정보 <br>
				ID : ${MEMBER.mId } &emsp; 지역 : ${MEMBER.mArea } <br>
				나이 : ${MEMBER.cAge } &emsp; 키 : ${MEMBER.cHeight } &nbsp; 몸무게 : ${MEMBER.cWeight} &nbsp; 체급 : ${MEMBER.cwClass } <br>
				사용하는 종목 : ${MEMBER.mSports } <br>
				승리수 : ${MEMBER.cWin } &nbsp; 패배수 : ${MEMBER.cLose } &nbsp; 비긴횟수 : ${MEMBER.cDraw }
			</div>
			<div id="rival">
				상대 정보 <br>
				ID : ${RIVAL[status.index].mId } &emsp; 지역 : ${RIVAL[status.index].mArea } <br>
				나이 : ${RIVAL[status.index].cAge } &emsp; 키 : ${RIVAL[status.index].cHeight } &nbsp; 몸무게 : ${RIVAL[status.index].cWeight} &nbsp; 체급 : ${RIVAL[status.index].cwClass } <br>
				사용하는 종목 : ${RIVAL[status.index].mSports } <br>
				승리수 : ${RIVAL[status.index].cWin } &nbsp; 패배수 : ${RIVAL[status.index].cLose } &nbsp; 비긴횟수 : ${RIVAL[status.index].cDraw }		
			</div>
			<div id="gym">
				체육관 정보 <br>
				체육관 이름 : ${GYM[status.index].mName } &emsp; 체육관 번호 : ${GYM[status.index].gNumber } / ${GYM[status.index].mTelno } &emsp; 체육관 주소 : ${GYM[status.index].gAddress } &emsp; 체육관 대여료 : ${GYM[status.index].gRentalPrice }
			</div>		
		</div>
		<div id="container3">
			<form action="matchingRecord.match" method="post">
				<input type="hidden" value="<%=session.getAttribute("mId") %>" name="mId"> 
				<input type="hidden" value="${MATCHSEQNO[status.index].mSuccess }" name="mType" id="${status.index }mType">
				<input type="hidden" value="${MATCHSEQNO[status.index].matchSeqno }" name="matchSeqno" id="${status.index }matchSeqno">
				<c:if test="${MATCHSEQNO[status.index].mSuccess < 3 }"> 
					<c:if test="${(MATCHSEQNO[status.index].mSuccess == 1) and (MEMBER.mId ne mId)}">
						<input type="submit" value="수락">	
					</c:if>
					<button type="button" onclick="cancle(this)" value="${status.index }">취소</button>
				</c:if>
			</form>
		</div>
	</div>	
	</c:forEach>
