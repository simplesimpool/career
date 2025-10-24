<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="rvBoardWrite.sg" method="post">
	<input type="hidden" name="order" value="${order }">
	게시글 제목 : <input type="text" name="title" required="required" autofocus="autofocus"><br>
	게시글 내용 : <textarea name="content" rows="4" cols="50" required="required" autofocus="autofocus"></textarea><br>
	<input type="submit" value="작성">
</form>
<br>
page : ${page }<br>
order : ${order }<br>
</body>
</html>