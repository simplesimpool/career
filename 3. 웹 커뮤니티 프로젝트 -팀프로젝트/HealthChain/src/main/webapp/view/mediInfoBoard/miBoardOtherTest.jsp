<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.MediInfoBoard"%>
<%@page import="model.dao.MediInfoBoardDao"%>
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
	MediInfoBoardDao mibDao = MediInfoBoardDao.getInstance();
	System.out.println(mibDao.getIndex("517"));
%>
처리완료
</body>
</html>