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
.page-container {
	display: inline;
	margin-left: 16%;
}
.cs-title {
	
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
.board-lvl-style {
	display: inline;
	font-size: 20px;
}
.page-input-style {
	
}

</style>
</head>
<body>
	<h2 class="cs-title">고객센터 게시판</h2>
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
					<div class="board-container" onclick="location.href='csBoardContent.sg?page=${pgData.page}&lvl=${board.getCs_level() }&id=${board.getCs_id() }&parentId=${board.getCs_parent_id() }'">
						<div class="board-lvl-style">
							 <c:forEach var="lvl" begin="${1 }" end="${board.getCs_level() }"><!--레벨에 따라 들여쓰기갯수가 정해짐 -->
							 	↪
							 </c:forEach>
						</div>
						<div class="board-id-style">${board.getCs_id() }</div>
						<div class="board-title-style">${board.getCs_title() }</div>
						<div class="board-writer-style">${userList.get(status.index).getUser_nickname() }</div>
						<div class="board-date-style">${board.getCs_reg_date() }</div>
						<div class="board-view-style">${board.getCs_view_cnt() }</div>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
	검색 폐이지 : <input type="number" class="page-input-style">
	<button onclick="moveToPage()">이동</button>
	<div class="page-container">
		<c:if test="${pgData.startPage != 1 }">
			<button onclick="window.location='csBoard.sg?page=${pgData.prevPage }'">이전</button>
		</c:if>
		<c:forEach var="i" begin="${pgData.startPage }" end="${pgData.endPage }">
			<button onclick="window.location='csBoard.sg?page=${i }'">${i }</button>
		</c:forEach>
		<c:if test="${pgData.endPage != pgData.maxPage }">
			<button onclick="window.location='csBoard.sg?page=${pgData.nextPage }'">다음</button>
		</c:if>
	</div>
	<button class="board-write-style" onclick="sessionChk()">게시글 작성</button><br>
	<script type="text/javascript">
		function sessionChk() {
			let userId = "<%=(String)session.getAttribute("userId")%>";
			//console.log(userId);
			if(userId !== "null") {//세션이 존재
				window.location = "csBoardWriteForm.sg?page=${pgData.page}";
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
				location.href = "csBoard.sg?page=" + inputPage;
			}
		}
	</script>
	
	
	<%-- <c:if test="${not empty sessionScope.userId}">
	    <p>userId: ${sessionScope.userId}</p>
	</c:if>
	<c:if test="${empty sessionScope.userId}">
	    <p>No user name in session.</p>
	</c:if> --%>
	<c:forEach var="board" items="${boardList}">
       	cs_id : ${board.getCs_id() }<br>
		user_id : ${board.getUser_id() }<br>
		cs_title : ${board.getCs_title() }<br>
		cs_content : ${board.getCs_content() }<br>
		cs_reg_date : ${board.getCs_reg_date() }<br>
		cs_view_cnt : ${board.getCs_view_cnt() }<br>
		cs_del : ${board.getCs_del() }<br>
		cs_level : ${board.getCs_level() }<br>
		cs_parent_id : ${board.getCs_parent_id() }<br>
		cs_category : ${board.getCs_category() }<br><br>
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