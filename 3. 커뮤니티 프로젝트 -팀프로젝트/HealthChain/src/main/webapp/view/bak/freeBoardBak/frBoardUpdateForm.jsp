<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="frBoardUpdate.sg" method="post">
	<input type="hidden" name="page" value="${page }">
	<input type="hidden" name="id" value="${frb.getFrb_id() }">
	작성자 : <input type="text" value="${user.getUser_nickname() }" readonly="readonly"><br>
	글제목 : <input type="text" name="title" value="${frb.getFrb_title() }" required="required" autofocus="autofocus"><br>
	글내용 : <input type="text" name="content" value="${frb.getFrb_content() }" required="required" autofocus="autofocus"><br>
	<input type="submit" value="수정">
</form>
<br>
page : ${page }<br>
frb_id : ${frb.getFrb_id() }<br>
user_id : ${user.getUser_id() }<br>
</body>
</html>