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
	FreeBoardDao frbDao = FreeBoardDao.getInstance();
	for(int i = 1; i <= 234; i++) {
		FreeBoard frb = new FreeBoard();
		frb.setUser_id("userId1");
		frb.setFrb_title("frbTitle" + i);
		frb.setFrb_content("frbContent" + i);

		frbDao.insert(frb);
	}
%>
처리완료
</body>
</html>