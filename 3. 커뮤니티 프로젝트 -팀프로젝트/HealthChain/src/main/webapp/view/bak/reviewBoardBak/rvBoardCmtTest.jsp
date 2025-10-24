<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.ReviewBoardCmt"%>
<%@page import="model.dao.ReviewBoardCmtDao"%>
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
	ReviewBoardCmtDao rvbDao = ReviewBoardCmtDao.getInstance();
	ReviewBoardCmt cmt = new ReviewBoardCmt();
	cmt = rvbDao.select("1");
	cmt.setRvb_cmt_reply("rvbCmtReply1");
	
	rvbDao.update(cmt);
%>
처리완료
</body>
</html>