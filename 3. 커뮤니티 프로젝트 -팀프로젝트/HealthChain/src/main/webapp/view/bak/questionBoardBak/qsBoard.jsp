<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
tr, td {
	padding: 15px;
}

td {
	background: yellow;
	text-align: center;
}

caption {
	font-size: 30px;
	font-weight: bold;
	line-height: 150%;
}

table {
	background: green;
	border: 1px solod pink;
	width: 100%;
}
.qsb-title {
	
}
.board-container {
	background: aqua;
	border: 1px solid black;
}
.board-container:hover {
	cursor: pointer;
}
.board-id-style {
	margin-right: 8%;
	display: inline;
	border: 1px solid black;
}
.board-title-style {
	margin-left: 10%;
	display: inline;
	border: 1px solid black;
}
.board-writer-style {
	margin-left: 10%;
	display: inline;
	border: 1px solid black;
}
.board-date-style {
	margin-left: 10%;
	display: inline;
	border: 1px solid black;
}
.board-view-style {
	margin-left: 20%;
	display: inline;
	border: 1px solid black;
}
.board-write-style {
	margin-left: 20%;
}
.page-input-style {
	
}
.page-container {
	display: inline;
	margin-left: 16%;
}
.board-write-style {
	margin-left: 20%;
}	
</style>
</head>
<body>
	<h2 class="qsb-title">질문게시판</h2>
	<table border="1">
		<tr>
			<th>게시글아이디</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="board" items="${boardList}" varStatus="status">
			<tr>
				<td colspan="5">
					<div class="board-container" onclick="location.href='qsBoardContent.sg?page=${pgData.page}&id=${board.getQsb_id()}'">
						<div class="board-id-style">${board.getQsb_id() }</div>
						<div class="board-title-style">${board.getQsb_title() }</div>
						<div class="board-writer-style">${userList.get(status.index).getUser_nickname() }</div>
						<div class="board-date-style">${board.getQsb_reg_date() }</div>
						<div class="board-view-style">${board.getQsb_view_cnt() }</div>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
	검색 폐이지 : <input type="number" class="page-input-style">
	<button onclick="moveToPage()">이동</button>
	<div class="page-container">
		<c:if test="${pgData.startPage != 1 }">
			<button onclick="window.location='qsBoard.sg?page=${pgData.prevPage }'">이전</button>
		</c:if>
		<c:forEach var="i" begin="${pgData.startPage }" end="${pgData.endPage }">
			<button onclick="window.location='qsBoard.sg?page=${i }'">${i }</button>
		</c:forEach>
		<c:if test="${pgData.endPage != pgData.maxPage }">
			<button onclick="window.location='qsBoard.sg?page=${pgData.nextPage }'">다음</button>
		</c:if>
	</div>
	<button class="board-write-style" onclick="sessionChk()">게시글 작성</button><br>
	<script type="text/javascript">
		function sessionChk() {
			let userId = "<%=(String)session.getAttribute("userId")%>";
			//console.log(userId);
			if(userId !== "null") {//세션이 존재
				location.href = "qsBoardWriteForm.sg?page=${pgData.page}";
			}
			else {//세션이 없음
				alert("비회원은 게시글을 작성할 수 없습니다");
			}
		}
		function moveToPage() {
			let inputPage = document.querySelector(".page-input-style").value;
			if(inputPage === "") {
				alert("이동할 폐이지를 입력하세요");
			} else {
				location.href = "qsBoard.sg?page=" + inputPage;
			}
		}
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	<c:forEach var="board" items="${boardList}">
       	qsb_id : ${board.getQsb_id() }<br>
		user_id : ${board.getUser_id() }<br>
		qsb_title : ${board.getQsb_title() }<br>
		qsb_content : ${board.getQsb_content() }<br>
		qsb_reg_date : ${board.getQsb_reg_date() }<br>
		qsb_view_cnt : ${board.getQsb_view_cnt() }<br>
		qsb_del : ${board.getQsb_del() }<br>
		qsb_category : ${board.getQsb_category() }<br><br>
    </c:forEach>
    <br><br>
    <c:forEach var="user" items="${userList}">
       	user_id : ${user.getUser_id() }<br>
		dr_lic_code : ${user.getDr_lic_code() }<br>
		user_pw : ${user.getUser_pw() }<br>
		user_name : ${user.getUser_name() }<br>
		user_tel : ${user.getUser_tel() }<br>
		user_addr : ${user.getUser_addr() }<br>
		user_del : ${user.getUser_del() }<br>
		user_nickname : ${user.getUser_nickname() }<br><br>
    </c:forEach>
    <br><br>
	totalBoardNum : ${pgData.totalBoardNum}<br>
	limitBoardNum : ${pgData.limitBoardNum}<br>
	limitPageNum : ${pgData.limitPageNum}<br><br>
	
	page : ${pgData.page}<br>
	startPage : ${pgData.startPage}<br>
	endPage : ${pgData.endPage}<br>
	nextPage : ${pgData.nextPage}<br>
	prevPage : ${pgData.prevPage}<br>
	maxPage : ${pgData.maxPage}<br>
	url : ${url}<br>
</body>
</html>