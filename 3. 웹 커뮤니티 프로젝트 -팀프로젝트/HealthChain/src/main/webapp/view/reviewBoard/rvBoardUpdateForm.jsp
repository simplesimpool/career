<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<style type="text/css">
/* 전체 배경과 폰트 */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f1eb;
    color: #2b473e;
    margin: 20px;
}

/* 폼 컨테이너 */
form {
    background: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    margin: 0 auto;
    display: flex;
    flex-direction: column;
    gap: 15px;
    border: 1px solid #6d8c50;
}

/* 폼 라벨 */
form label {
    font-size: 16px;
    font-weight: bold;
    color: #2b473e;
}

textarea {
    resize: none;
    height: 150px;
}

/* 입력 필드 스타일 */
input[type="text"], textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 14px;
    box-sizing: border-box;
    color: #2b473e;
    background-color: #f4f1eb;
}

input[readonly] {
    background-color: #e0e0e0;
    color: #6d8c50;
    cursor: not-allowed;
}

/* 제출 버튼 */
input[type="submit"] {
    background-color: #6d8c50;
    color: white;
    border: none;
    padding: 12px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    text-align: center;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #2b473e;
}

/* 페이지 정보 */
.page-info {
    text-align: center;
    margin-top: 20px;
    font-size: 14px;
    color: #666;
}
</style>
</head>
<body>
<form action="rvBoardUpdate.sg" method="post">
	<input type="hidden" name="order" value="${order }">
	<input type="hidden" name="page" value="${page }">
	<input type="hidden" name="id" value="${rvb.getRvb_id() }">
	
	<label for="nickname">작성자:</label>
	<input id="nickname" type="text" value="${user.getUser_nickname() }" readonly="readonly">
	
	<label for="title">글제목:</label>
	<input id="title" type="text" name="title" value="${rvb.getRvb_title() }" required="required" autofocus="autofocus" maxlength="20" placeholder="최대 20자">
	
	<label for="content">글내용:</label>
	<textarea id="content" name="content" rows="4" cols="50" required="required" autofocus="autofocus" maxlength="800" placeholder="최대 800자">${rvb.getRvb_content() }</textarea>
	
	<input type="submit" value="수정">
</form>

<%-- order : ${order }<br>
page : ${page }<br>
rvbId: ${rvb.getRvb_id() }<br>
userId : ${user.getUser_id() }<br> --%>
</body>
</html>