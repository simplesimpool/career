<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.QuestionBoardCmt2"%>
<%@page import="model.dao.QuestionBoardCmt2Dao"%>
<%@page import="model.dao.QuestionBoardCmtDao"%>
<%@page import="model.QuestionBoardCmt"%>
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
	for(int i = 1; i <= 234; i++) {
		QuestionBoard qsb = new QuestionBoard();
		qsb.setUser_id("userId1");
		qsb.setQsb_title("qsbTitle" + i);
		qsb.setQsb_content("qsbContent" + i);
		
		qsbDao.insert(qsb);
	}
%>
처리완료
</body>
</html>