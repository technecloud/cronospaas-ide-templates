<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.setAttribute("ROLE_NAME", request.getParameter("ROLE_NAME"));
out.println(session.getAttribute("ROLE_NAME"));
%>