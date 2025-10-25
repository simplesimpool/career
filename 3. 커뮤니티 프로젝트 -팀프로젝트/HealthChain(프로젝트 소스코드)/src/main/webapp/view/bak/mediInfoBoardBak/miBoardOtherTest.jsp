<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
	List<MediInfoBoard> boardList = new ArrayList<MediInfoBoard>();
	boardList = mibDao.getBoardList(0, 14);
	
	for(MediInfoBoard board : boardList) {
		System.out.println("mibId : " + board.getMib_id());
		System.out.println("userId : " + board.getUser_id());
		System.out.println("mibTitle : " + board.getMib_title());
		System.out.println("mibContent : " + board.getMib_content());
		System.out.println("mibRegDate : " + board.getMib_reg_date());
		System.out.println("mibViewCnt : " + board.getMib_view_cnt());
		System.out.println("mibDel : " + board.getMib_del());
		System.out.println("mibCategory : " + board.getMib_category());
		System.out.println("");
	}
%>
처리완료
</body>
</html>