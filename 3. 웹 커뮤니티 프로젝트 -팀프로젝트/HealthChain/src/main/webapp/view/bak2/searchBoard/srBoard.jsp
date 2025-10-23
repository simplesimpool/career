<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
tr, td {
    padding: 15px;
}

td {
    text-align: center;
    border: 1px solid #6d8c50; /* 테두리 추가 */
    color: #2b473e;
}

 table th {
   text-align: center; /* 모든 셀 가운데 정렬 */
}


caption {
    font-size: 30px;
    font-weight: bold;
    line-height: 150%;
    color: #333; /* 어두운 색으로 변경 */
}

table {
    border: 2px solid #6d8c50;
    width: 100%;
    border-collapse: collapse;
}

.sr-title {
  background-color: #2b473e;
  color: #f4f1eb;
  height: 50px;
}

.board-container {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 10px;
    border: 1px solid #2b473e;
    background-color: #f4f1eb;
    transition: background-color 0.3s;
}

.board-container:hover {
    cursor: pointer;
    background: #b0d084; /* hover 시 밝아짐 */
}

.board-id-style {
    flex: 1;
    max-width: 10%;
    font-size: 16px;
    color: #2b473e;
}

.board-title-style {
    flex: 5;
    max-width: 40%;
    font-size: 16px;
    color: #2b473e;
}

.board-writer-style {
    flex: 3;
    max-width: 20%;
    font-size: 16px;
    color: #2b473e;
}

.board-date-style {
    flex: 2;
    max-width: 20%;
    font-size: 16px;
    color: #2b473e;
}

.board-view-style {
    flex: 1;
    max-width: 10%;
    font-size: 16px;
    color: #2b473e;
}

.board-write-style {
    margin-left: 20%;
}

.page-input-style {
    padding: 10px;
    border: 1px solid #6d8c50;
    border-radius: 5px;
    font-size: 16px;
    color: #2b473e;
    margin: 5px;
}

.page-container {
    display: inline;
    margin-left: 16%;
}

.page-container button {
    background: #4caf50; /* 초록색 */
    border: 1px solid #388e3c; /* 진한 초록색 */
    color: white;
    padding: 8px 15px;
    margin: 5px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
}

.page-container button:hover {
    background: #66bb6a; /* hover 시 밝아짐 */
}

.page-container button:disabled {
    background: #c8e6c9; /* 비활성화 버튼 색상 */
    cursor: not-allowed;
    color: #9e9e9e; /* 회색 글씨 */
}

.search-result{
    text-align: center;
    font-size: 24px;
    font-weight: bold;
    color: #2b473e;
    margin: 20px 0;
    pointer-events: auto; /* 클릭 이벤트 허용 */
    cursor: pointer; /* 마우스 포인터 변경 */

}

button {
    background-color: #6d8c50;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    margin: 5px;
    transition: background-color 0.3s;
}

a.page-link {
   background-color: #6d8c50;
   color: white;
}


li.page-item.active a.page-link {
  background-color: #2b473e !important;
  border : 0.1px solid black;
}


button:hover not(.main_button) {
    background-color: #2b473e;
}


.main-button {
  height: 50px; 
  width: 150px;  
  display: block; 
  margin: 20px auto 0;
  background-color: #f44336;
}




</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<h2 class="search-result" onclick="location.href='srBoard.sg?keyWord=${keyWord }&page=1'"><span style="color: orange">"${keyWord }"</span> 으로 검색하신 결과</h2>
	<table border="1">
	 <colgroup>
			<col style="width: 10%;">
			<col style="width: 35%;">
			<col style="width: 19%;">
			<col style="width: 16%;">
			<col style="width: 10%;">
		</colgroup>
		<tr class="sr-title">
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
	 <ul class="pagination justify-content-center">
		<c:if test="${pgData.startPage != 1 }">
		<li class="page-item">
				<a class="page-link" href="srBoard.sg?keyWord=${keyWord }&page=${pgData.prevPage }">이전 </a></li>
		</c:if>
		<c:forEach var="i" begin="${pgData.startPage }"
			end="${pgData.endPage }">
		<c:if test="${pgData.page == i }"><li class="page-item active"> <a class="page-link" href="srBoard.sg?keyWord=${keyWord }&page=${i }">${i }</a> </li> </c:if>
		<c:if test="${pgData.page != i }"><li class="page-item"><a class="page-link" href="srBoard.sg?keyWord=${keyWord }&page=${i }">${i }</a></li></c:if>	
		</c:forEach>
		<c:if test="${pgData.endPage != pgData.maxPage }">
			<li class="page-item">
				<a class="page-link" href="srBoard.sg?keyWord=${keyWord }&page=${pgData.nextPage }">다음</a></li>
		</c:if>
    </ul>
	<br>
	<button class="main-button" onclick="location.href='main.jb'">메인</button>
	
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<%-- 	
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
	maxPage : ${pgData.maxPage}<br> --%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>