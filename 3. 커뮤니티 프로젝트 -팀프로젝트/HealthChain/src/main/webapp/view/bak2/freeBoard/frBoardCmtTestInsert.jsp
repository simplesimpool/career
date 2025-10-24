<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.FreeBoardCmt"%>
<%@page import="model.dao.FreeBoardCmtDao"%>
<%@page import="model.FreeBoard"%>
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
	FreeBoardCmtDao frbCmtDao = FreeBoardCmtDao.getInstance();
	FreeBoardCmt frbCmt = new FreeBoardCmt();
	for(int i = 1; i <= 234; i++) {
		frbCmt.setUser_id("userId1");
		frbCmt.setFrb_id(513);
		frbCmt.setFrb_cmt_reply("frbCmtReply" + i);
		frbCmtDao.insert(frbCmt);
	}
%>
처리완료
</body>
</html>