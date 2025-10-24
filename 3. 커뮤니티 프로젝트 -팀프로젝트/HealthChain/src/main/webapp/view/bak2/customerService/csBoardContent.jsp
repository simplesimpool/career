<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<style type="text/css">
/* 전체 배경과 폰트 */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f1eb;
    color: #2b473e;
    margin: 20px;
}

/* 콘텐츠 컨테이너 */
.content-container {
    background: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
    border: 1px solid #6d8c50;
}

/* 게시글 정보 스타일 */
.id-style, .view-cnt-style {
    display: inline-block;
    margin-right: 15px;
    font-size: 14px;
    color: #6d8c50;
}

.title-style, .writer-style {
    display: block;
    font-size: 18px;
    font-weight: bold;
    color: #2b473e;
    margin-bottom: 10px;
}

.content-style {
    margin-top: 15px;
    padding: 15px;
    border-radius: 4px;
    font-size: 16px;
    line-height: 1.6;
    color: #2b473e;
}

.reg-date-style {
    text-align: right;
    font-size: 14px;
    color: #999;
    margin-top: 10px;
}

/* 버튼 스타일 */
.react-container {
    text-align: center;
    margin-top: 20px;
    display: flex;
    justify-content: flex-end; /* 버튼들을 오른쪽으로 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
}

.react-container button {
    background-color: #6d8c50;
    color: white;
    border: none;
    padding: 10px 20px;
    margin: 5px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s;
}

.react-container button:hover {
    background-color: #2b473e;
}

/* 삭제 확인창 */
.react-container .delete-button {
    background-color: #f44336;
}

.react-container .delete-button:hover {
    background-color: #d32f2f;
}

</style>
</head>
<body>

<div class="content-container">
    <div class="id-style">글번호: ${id}</div>
    <div class="view-cnt-style">조회수: ${cs.getCs_view_cnt()}</div><br>
    <div class="title-style">제목: ${cs.getCs_title()}</div>
    <div class="writer-style">작성자: ${user.getUser_nickname()}</div>
    <div class="content-style">${cs.getCs_content()}</div>
    <div class="reg-date-style">작성일: ${cs.getCs_reg_date()}</div>
    
	<div class="react-container">
	    <c:if test="${not empty sessionScope.userId && cs.getUser_id() == sessionScope.userId && 'admin' != sessionScope.userId}">
	        <button onclick="location.href='csBoardUpdateForm.sg?page=${page}&id=${id}'">수정</button>
	        <button class="delete-button" onclick="deleteAction()">삭제</button>
	    </c:if>
	    <c:if test="${not empty sessionScope.userId && 'admin' == sessionScope.userId}">
	        <c:if test="${cs.getCs_level() <= 0 && cs.getUser_id() != 'admin'}">
	            <button onclick="location.href='csBoardReplyForm.sg?page=${page}&id=${id}&lvl=${cs.getCs_level()}&parentId=${cs.getCs_parent_id()}'">답변하기</button>
	        </c:if>
	        <button class="delete-button" onclick="deleteAction()">삭제</button>
	        <c:if test="${cs.getUser_id() == 'admin'}"><!--관리자글일때만 수정버튼생김  -->
				<button onclick="location.href='csBoardUpdateForm.sg?page=${page}&id=${cs.getCs_id()}'">수정</button>
			</c:if>
	    </c:if>
	    <button onclick="location.href='csBoard.sg?page=${page}'">목록</button>
	</div>
</div>

<script type="text/javascript">
    function deleteAction() {
        const result = confirm("정말로 삭제하시겠습니까?");
        if (result) {
            location.href = "csBoardDelete.sg?page=${page}&id=${id}";
        }
    }
</script>

<%-- <!-- 디버깅 정보 -->
<p>lvl: ${lvl}</p>
<p>page: ${page}</p>
<p>id: ${id}</p>
<p>parentId: ${cs.getCs_parent_id()}</p>
<p>regDate: ${cs.getCs_reg_date()}</p>
<p>nickName: ${user.getUser_nickname()}</p>
<p>viewCnt: ${cs.getCs_view_cnt()}</p> --%>

</body>
</html>
