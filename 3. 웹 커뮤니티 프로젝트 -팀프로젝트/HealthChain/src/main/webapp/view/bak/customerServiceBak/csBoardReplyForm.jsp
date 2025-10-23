<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="csBoardReply.sg" method="post">
	<input type="hidden" name="page" value="${page }">
	<input type="hidden" name="lvl" value="${cs.getCs_level() + 1 }">
	<input type="hidden" name="parentId" value="${cs.getCs_id() }">
	답변제목 : <input type="text" name="title" required="required" autofocus="autofocus"><br>
	답변내용 : <textarea name="content" rows="4" cols="50" required="required" autofocus="autofocus"></textarea><br>
	<input type="submit" value="답변하기">
</form>
<br>
cs_id : ${cs.getCs_id()}<br>
user_id : ${user.getUser_id() }<br>
page : ${page }<br>
</body>
</html>