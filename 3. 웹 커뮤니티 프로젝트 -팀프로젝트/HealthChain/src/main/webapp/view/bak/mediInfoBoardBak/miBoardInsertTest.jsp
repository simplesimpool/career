<%@page import="model.MediInfoBoard"%>
<%@page import="model.dao.MediInfoBoardDao"%>
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
	MediInfoBoardDao mibDao = MediInfoBoardDao.getInstance();
	for(int i = 1; i <= 500; i++) {
		MediInfoBoard mib = new MediInfoBoard();
		mib.setUser_id("userId1");
		mib.setMib_title("mibTitle" + i);
		mib.setMib_content("mibContent" + i);
		mibDao.insert(mib);
	}
%>
처리완료
</body>
</html>