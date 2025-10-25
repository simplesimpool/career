<%@page import="model.CustomerService"%>
<%@page import="model.dao.CustomerServiceDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  //데이터 넣기용 테스트
	CustomerServiceDao csDao = CustomerServiceDao.getInstance();
	for(int i = 1; i <= 234; i++) {
		CustomerService cs = new CustomerService();
		cs.setUser_id("userId1");
		cs.setCs_title("csTitle" + i);
		cs.setCs_content("csContent" + i);
		
		csDao.insert(cs);
	}
%>
처리완료
</body>
</html>