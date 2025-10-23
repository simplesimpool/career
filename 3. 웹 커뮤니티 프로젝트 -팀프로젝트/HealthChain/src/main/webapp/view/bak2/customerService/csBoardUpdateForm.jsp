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
    background-color: #f5f5f5;
    color: #333;
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
}

/* 폼 라벨 */
form label {
    font-size: 16px;
    font-weight: bold;
    margin-bottom: 5px;
}

/* 입력 필드 스타일 */
input[type="text"], textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 14px;
    box-sizing: border-box;
}

input[readonly] {
    background-color: #e9e9e9;
    cursor: not-allowed;
}

/* 제출 버튼 */
input[type="submit"] {
    background-color: #4caf50;
    color: white;
    border: none;
    padding: 12px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    text-align: center;
}

input[type="submit"]:hover {
    background-color: #388e3c;
}

/* 페이지 정보 */
.page-info {
    text-align: center;
    margin-top: 10px;
    font-size: 14px;
    color: #666;
}
</style>
</head>
<body>

<!-- 게시글 수정 폼 -->
<form action="csBoardUpdate.sg" method="post">
    <input type="hidden" name="page" value="${page}">
    <input type="hidden" name="id" value="${cs.getCs_id()}">

    <label for="writer">작성자:</label>
    <input type="text" id="writer" value="${user.getUser_nickname()}" readonly="readonly">

    <label for="title">글제목:</label>
    <input type="text" id="title" name="title" value="${cs.getCs_title()}" required="required" autofocus="autofocus" placeholder="제목을 입력하세요">

    <label for="content">글내용:</label>
    <textarea id="content" name="content" required="required" placeholder="내용을 입력하세요">${cs.getCs_content()}</textarea>

    <input type="submit" value="수정">
</form>

<!-- 페이지 및 추가 정보 -->
<div class="page-info">
    <p>현재 페이지: ${page}</p>
    <p>작성자 ID: ${user.getUser_id()}</p>
    <p>게시글 ID: ${cs.getCs_id()}</p>
</div>

</body>
</html>
