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
	ReviewBoardCmtDao rvbCmtDao = ReviewBoardCmtDao.getInstance();
	
	for(int i = 1; i <= 234; i++) {
		ReviewBoardCmt rvbCmt = new ReviewBoardCmt();
		rvbCmt.setUser_id("userId1");
		rvbCmt.setRvb_id(713);
		rvbCmt.setRvb_cmt_reply("rvbCmtReply" + i);
		rvbCmtDao.insert(rvbCmt);
	}
%>
처리완료
</body>
</html>