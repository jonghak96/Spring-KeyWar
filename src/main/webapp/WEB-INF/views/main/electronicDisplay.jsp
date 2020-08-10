<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	#electroinicContainer {
		height: 100px;
	}
</style>


<c:forEach items="${ELECTROINIC }" var="ELECTROINIC" varStatus="status">
<div id="electroinicContainer">
	<span>${ELECTROINIC.mFightDate }</span> <br>
	<span>${ELECTROINIC.challenger }</span> vs <span>${ELECTROINIC.enemy }</span> <br>
	<span>${ELECTROINIC.gymName } , ${ELECTROINIC.mArea }</span>
</div>
</c:forEach>
    