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
	QuestionBoardCmt2Dao qsbCmt2Dao = QuestionBoardCmt2Dao.getInstance();
	QuestionBoardCmt2 qsbCmt2 = qsbCmt2Dao.select("471");
	
	qsbCmt2.setQsb_cmt2_reply("qsbCmt2Reply1");
	
	qsbCmt2Dao.update(qsbCmt2);
	
%>
처리완료
</body>
</html>