<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	session.setAttribute("loginId", null);
	session.removeAttribute("loginId");
	session.invalidate();
	
	response.sendRedirect("../mainScreen.jsp");
%>
    
    
    