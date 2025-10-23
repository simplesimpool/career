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
	QuestionBoardCmtDao qsbCmtDao = QuestionBoardCmtDao.getInstance();
	QuestionBoardCmt cmt = qsbCmtDao.select("469");
	cmt.setQsb_cmt_reply("qsbCmtReply1");
	qsbCmtDao.update(cmt);
	
	System.out.println("qsbCmtId : " + cmt.getQsb_cmt_id());
	System.out.println("userId : " + cmt.getUser_id());
	System.out.println("qsbId : " + cmt.getQsb_id());
	System.out.println("qsbCmtReply : " + cmt.getQsb_cmt_reply());
	System.out.println("qsbCmtDate : " + cmt.getQsb_cmt_date());
	System.out.println("qsbCmtDel : " + cmt.getQsb_cmt_del());
	System.out.println("qsbCmtCategory : " + cmt.getQsb_cmt_category());
	System.out.println("");
%>
처리완료
</body>
</html>