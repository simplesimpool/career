<%@page import="model.dao.FreeBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	FreeBoardDao frbDao = FreeBoardDao.getInstance();
	System.out.println(frbDao.getIndex("773"));
%>
처리완료
</body>
</html>