<%@page import="java.util.List"%>
<%@page import="model.ReviewBoard"%>
<%@page import="java.util.ArrayList"%>
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
	List<ReviewBoard> rvbList = new ArrayList<ReviewBoard>();
	rvbList = rvbDao.getBoardListByLike(0, 4);
	
%>
처리완료
</body>
</html>