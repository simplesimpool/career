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
.frb-title {
	
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
	<h2 class="search-result">검색결과</h2>
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
					<div class="board-container" onclick="location.href='srBoardContent.sg?id=${board.getId()}&category=${board.getCategory() }'">
						<div class="board-id-style">${board.getId() }</div>
						<div class="board-title-style">${board.getTitle() }</div>
						<div class="board-writer-style">${userList.get(status.index).getUser_nickname() }</div>
						<div class="board-date-style">${board.getReg_date() }</div>
						<div class="board-view-style">${board.getView_cnt() }</div>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
	검색 폐이지 : <input type="number" class="page-input-style">
	<button onclick="moveToPage()">이동</button>
	<div class="page-container">
		<c:if test="${pgData.startPage != 1 }">
			<button onclick="window.location='srBoard.sg?keyWord=${keyWord }&page=${pgData.prevPage }'">이전</button>
		</c:if>
		<c:forEach var="i" begin="${pgData.startPage }" end="${pgData.endPage }">
			<button onclick="window.location='srBoard.sg?keyWord=${keyWord }&page=${i }'">${i }</button>
		</c:forEach>
		<c:if test="${pgData.endPage != pgData.maxPage }">
			<button onclick="window.location='srBoard.sg?keyWord=${keyWord }&page=${pgData.nextPage }'">다음</button>
		</c:if>
	</div><br>
	<script type="text/javascript">
		function moveToPage() {
			let inputPage = document.querySelector(".page-input-style").value;
			if(inputPage === "") {
				alert("이동할 폐이지를 입력하세요");
			} else {
				location.href = "srBoard.sg?" + "keyWord=" + "${keyWord}" + "&page=" + inputPage;
			}
		}
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<c:forEach var="board" items="${boardList}">
       	id : ${board.getId() }<br>
		user_id : ${board.getUser_id() }<br>
		title : ${board.getTitle() }<br>
		content : ${board.getContent() }<br>
		reg_date : ${board.getReg_date() }<br>
		view_cnt : ${board.getView_cnt() }<br>
		del : ${board.getDel() }<br>
		category : ${board.getCategory() }<br><br>
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
</body>
</html>