<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.content-container {
	background: fuchsia;
	height: 700px;
}
.id-style {
	display: inline;
	background: teal;
	border: 1px solid black;
}
.view-cnt-style {
	display: inline;
	background: lime;
	border: 1px solid black;
}
.title-style {
	background: #68b0af;
	border: 1px solid black;
	display: inline;
}
.writer-style {
	background: #68b0af;
	border: 1px solid black;
	display: inline;
}
.content-style {
	background: #32a84a;
	border: 1px solid black;
	height: 88%;
}
.reg-date-style {
	background: #b8c8e3;
	border: 1px solid black;
	height: 38px;
	text-align: right;
}
.react-container {
	background: #b8c8e3;
	border: 1px solid black;
	text-align: center;
}
</style>
</head>
<body>
<div class="content-container">
	<div class="id-style">글번호 : ${id }</div>
	<div class="view-cnt-style">조회수 : ${cs.getCs_view_cnt() }</div><br>
	<div class="title-style">제목 : ${cs.getCs_title() }</div>
	<div class="writer-style">작성자 : ${user.getUser_nickname() }</div>
	<div class="content-style">${cs.getCs_content() }</div>
	<div class="reg-date-style">작성일 : ${cs.getCs_reg_date() }</div>
</div>
<div class="react-container">
	<c:if test="${not empty sessionScope.userId && cs.getUser_id() == sessionScope.userId && 'admin' != sessionScope.userId}"><!-- 세션이 설정되어있고 작성글 아이디와 세션아이디가 같을떄 그리고 운영자가 아닐떄 -->
		<button onclick="location.href='csBoardUpdateForm.sg?page=${page}&id=${id}'">수정</button>
		<button onclick="deleteAction()">삭제</button>
	</c:if>
	<c:if test="${not empty sessionScope.userId && 'admin' == sessionScope.userId}"><!--세션이 설정되어 있고 관리자 일떄  -->
		<c:if test="${cs.getCs_level() <= 0 && cs.getUser_id() != 'admin'}"><!-- 답변제한코드 -->
			<button onclick="location.href='csBoardReplyForm.sg?page=${page}&id=${id}&lvl=${cs.getCs_level() }&parentId=${cs.getCs_parent_id() }'">답변하기</button>
		</c:if>
		<button onclick="deleteAction()">삭제</button>
	</c:if>
</div>
<script type="text/javascript">
	function deleteAction() {
		const result = confirm("정말로 삭제하시겠습니까?");
		if (result) {
	        location.href="csBoardDelete.sg?page=${page}&id=${id}";
	    }
	}
</script>

lvl : ${lvl }<br>
page : ${page }<br>
id : ${id }<br>
parentId : ${cs.getCs_parent_id() }<br>
regDate : ${cs.getCs_reg_date() }<br>
nickName : ${user.getUser_nickname() }<br>
viewCnt : ${cs.getCs_view_cnt() }<br>
<%-- <c:if test="${not empty sessionScope.userId}">
    <p>userId: ${sessionScope.userId}</p>
</c:if>
<c:if test="${empty sessionScope.userId}">
    <p>No user name in session.</p>
</c:if> --%>
</body>
</html>