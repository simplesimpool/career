<%@page import="model.dao.QuestionBoardCmtDao"%>
<%@page import="model.QuestionBoardCmt"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.QuestionBoard"%>
<%@page import="model.dao.QuestionBoardDao"%>
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
	QuestionBoardDao qsbDao = QuestionBoardDao.getInstance();
	System.out.println(qsbDao.getIndex("592"));
%>
처리완료
</body>
</html>