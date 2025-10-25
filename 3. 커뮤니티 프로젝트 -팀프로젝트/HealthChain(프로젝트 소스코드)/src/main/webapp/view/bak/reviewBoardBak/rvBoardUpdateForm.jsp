<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="rvBoardUpdate.sg" method="post">
	<input type="hidden" name="order" value="${order }">
	<input type="hidden" name="page" value="${page }">
	<input type="hidden" name="id" value="${rvb.getRvb_id() }">
	작성자 : <input type="text" value="${user.getUser_nickname() }" readonly="readonly"><br>
	글제목 : <input type="text" name="title" value="${rvb.getRvb_title() }" required="required" autofocus="autofocus"><br>
	글내용 : <input type="text" name="content" value="${rvb.getRvb_content() }" required="required" autofocus="autofocus"><br>
	<input type="submit" value="수정">
</form>

order : ${order }<br>
page : ${page }<br>
rvbId: ${rvb.getRvb_id() }<br>
userId : ${user.getUser_id() }<br>
</body>
</html>