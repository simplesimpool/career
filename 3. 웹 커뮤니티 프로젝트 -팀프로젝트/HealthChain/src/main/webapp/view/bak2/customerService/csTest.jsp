<%@page import="model.dao.CustomerServiceDao"%>
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
	CustomerServiceDao csDao = CustomerServiceDao.getInstance();
	System.out.println(csDao.getIndex("2731"));
%>
처리완료
</body>
</html>