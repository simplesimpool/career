<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

/* 입력 필드 스타일 */
input[type="text"] {
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="qsBoardUpdate.sg" method="post">
	<input type="hidden" name="page" value="${page }">
	<input type="hidden" name="id" value="${qsb.getQsb_id() }">
	작성자 : <input type="text" value="${user.getUser_nickname() }" readonly="readonly"><br>
	글제목 : <input type="text" name="title" value="${qsb.getQsb_title() }" required="required" autofocus="autofocus"><br>
	글내용 : <input type="text" name="content" value="${qsb.getQsb_content() }" required="required" autofocus="autofocus"><br>
	<input type="submit" value="수정">
</form>
<br>
page : ${page }<br>
qsb_id : ${qsb.getQsb_id() }<br>
user_id : ${user.getUser_id() }<br>
</body>
</html>