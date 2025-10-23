<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
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
    margin-bottom: 5px;
    color: #2b473e;
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

textarea {
    resize: none;
    height: 150px;
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
    margin-top: 10px;
    font-size: 14px;
    color: #666;
}
</style>
</head>
<body>

<!-- 게시글 작성 폼 -->
<form action="csBoardWrite.sg" method="post">
    <input type="hidden" name="page" value="${page}">
    <label for="title">게시글 제목:</label>
    <input type="text" id="title" name="title" required="required" autofocus="autofocus" placeholder="제목을 입력하세요">

    <label for="content">게시글 내용:</label>
    <textarea id="content" name="content" required="required" placeholder="내용을 입력하세요"></textarea>

    <input type="submit" value="작성">
</form>

<!-- 페이지 정보 -->
<div class="page-info">
    현재 페이지: ${page}
</div>

</body>
</html>
