<%@page import="api.frboard.FrbCmtPageResServlet"%>
<%@page import="model.ReviewBoard"%>
<%@page import="model.dao.ReviewBoardDao"%>
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
	ReviewBoardDao rvbDao = ReviewBoardDao.getInstance();
	for(int i = 1; i <= 234; i++) {
		ReviewBoard rvb = new ReviewBoard();
		rvb.setUser_id("userId1");
		rvb.setRvb_title("rvbTitle" + i);
		rvb.setRvb_content("rvbContent" + i);
		
		rvbDao.insert(rvb);
	}
%>
처리완료
</body>
</html>