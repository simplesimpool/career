<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.display-container {
    display: flex; /* Flexbox로 정렬 */
    align-items: flex-start; /* 위쪽으로 정렬 */
}

.category-container {
	position: relative;
    background: fuchsia;
    width: 30%;
    display: inline-block;
    margin-right: 10px; /* 간격을 주기 위해 추가 */
}

.update-container {
	position: relative;
    background: aqua;
    width: 100%;
    height: 100%;
    display: inline-block;
}

.board-container {
	border: 1px solid black;
	margin-top: 10px;
	text-align: center;
}

.board-container:hover {
	cursor: pointer;
}

.page-container {
	margin-top: 40px;
	text-align: center;
}

.user-list-button {
	width: 100%;
    font-size: larger;
    margin-bottom: 10px;
}

.notice-list-button {
	width: 100%;
    font-size: larger;
    margin-bottom: 10px;
}

.cs-reply-list-button {
	width: 100%;
    font-size: larger;
    margin-bottom: 10px;
    text-decoration: underline;
}

.page-input {
	
}
</style>
</head>
<body>
	<h2>관리자 폐이지</h2>
	<div class="display-container">
		<div class="category-container">
			<button class="user-list-button" onclick="location.href='adminPageController.sg?category=userList'">회원목록</button><br>
			<button class="notice-list-button" onclick="location.href='adminPageController.sg?category=noticeList'">공지사항 관리</button><br>
			<button class="cs-reply-list-button" onclick="location.href='adminPageController.sg?category=csReplyList'">고객센터<br>답변관리</button><br>
		</div>
		<div class="update-container">
			<h3>고객센터 답변 목록</h3>
			<c:forEach var="board" items="${boardList}" varStatus="status">
				<div class=board-container onclick="contentClickAction('${board.getCs_id() }')">
					<div style="display: inline-block;">고객센터|</div>
					<div style="display: inline-block;">${board.getCs_title() }|</div>
					<div style="display: inline-block;">${board.getCs_reg_date() }</div>
				</div>
			</c:forEach>
			<div class="page-container">
				폐이지 이동 : <input type="number" class="page-input">
				<button onclick="moveToPage()" style="margin-right: 100px;">이동</button>
				<c:if test="${pgData.startPage != 1 }">
					<button onclick="pageClickAction(${pgData.prevPage})">이전</button>
				</c:if>
				<c:forEach var="i" begin="${pgData.startPage }" end="${pgData.endPage }">
					<button onclick="pageClickAction(${i})">${i }</button>
				</c:forEach>
				<c:if test="${pgData.endPage != pgData.maxPage }">
					<button onclick="pageClickAction(${pgData.nextPage})">다음</button>
				</c:if>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function pageClickAction(page) {
			location.href = "csReplyList.sg?page=" + page;
		}
		function moveToPage() {
			const inputPage = document.querySelector(".page-input").value;
			
			if(inputPage === "") {
				alert("이동할 폐이지를 입력해주세요");
				return;
			} else {
				location.href = "csReplyList.sg?page=" + inputPage;
			}
		}
		function contentClickAction(id) {
			location.href = "csReplyContent.sg?id=" + id;
		}
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
page : ${page }<br>
fdURL : ${fdURL }<br>
</body>
</html>