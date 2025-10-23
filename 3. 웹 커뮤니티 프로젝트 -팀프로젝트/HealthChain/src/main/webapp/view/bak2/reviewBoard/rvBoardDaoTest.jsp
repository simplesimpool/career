<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
	List<ReviewBoard> list = new ArrayList<ReviewBoard>();
	list = rvbDao.getBoardListByLike(0, 14);
	
	for(ReviewBoard rvb : list) {
		System.out.println("rvbId : " + rvb.getRvb_id());
		System.out.println("userId : " + rvb.getRvb_id());
		System.out.println("rvbTitle : " + rvb.getRvb_title());
		System.out.println("rvbContent : " + rvb.getRvb_content());
		System.out.println("rvbRegDate : " + rvb.getRvb_reg_date());
		System.out.println("rvbViewCnt : " + rvb.getRvb_view_cnt());
		System.out.println("rvbLikeCnt : " + rvb.getRvb_like_cnt());
		System.out.println("rvbDel : " + rvb.getRvb_del());
		System.out.println("rvbCategory : " + rvb.getRvb_category());
		
		System.out.println("");	
	}
%>
처리완료
</body>
</html>