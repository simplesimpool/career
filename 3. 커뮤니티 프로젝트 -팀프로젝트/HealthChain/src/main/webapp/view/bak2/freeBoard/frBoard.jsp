<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
tr, td {
	padding: 15px;
}


td {
	text-align: center;
	border: 1px solid #6d8c50;
	color: #2b473e;
}


 table th {
   text-align: center; /* 모든 셀 가운데 정렬 */
}


caption {
	font-size: 30px;
	font-weight: bold;
	line-height: 150%;
	color: #2b473e;
}

table {
	border: 2px solid #6d8c50;
	width: 100%;
	border-collapse: collapse;

}

.page-container {
	display: inline;
	margin-left: 16%;
}

.frb-title {
	text-align: center;
	color: #2b473e;
	padding: 10px;
	border-radius: 5px;
	margin-bottom: 20px;
	pointer-events: auto; /* 클릭 이벤트 허용 */
    cursor: pointer; /* 마우스 포인터 변경 */
}

.board-container {
    display: grid; /* Grid 레이아웃 사용 */
    grid-template-columns: 0.5fr 3.5fr 1.4fr 2fr 0.5fr; /* 각 열의 비율 설정 */
    align-items: center; /* 세로 중앙 정렬 */
    background: #f4f1eb; /* 배경색 */
    border: 1px solid #6d8c50; /* 테두리 색상 */
    padding: 10px 15px; /* 내부 여백 */
    border-radius: 5px; /* 모서리 둥글게 */
    margin-bottom: 10px; /* 각 항목 간격 */
    width: 100%; /* 전체 폭 채우기 */
    box-sizing: border-box; /* 패딩 포함한 크기 계산 */
    cursor: pointer; /* 클릭 가능하게 설정 */
}

.board-container:hover {
    background-color: #b0d084; /* Hover 시 배경색 변경 */
}

.admin-background {
   background-color: #F5F6CE;
}


.board-id-style,
.board-title-style,
.board-writer-style,
.board-date-style,
.board-view-style {
    text-align: center; /* 텍스트 중앙 정렬 */
    overflow: hidden; /* 넘치는 내용 숨기기 */
    white-space: nowrap; /* 한 줄로 유지 */
    text-overflow: ellipsis; /* 넘치는 텍스트를 말줄임표로 표시 */
    padding: 5px; /* 내부 여백 */
    font-size: 16px; /* 제목 글자 크기 */
    color: #2b473e;
    
}


.board-container:hover {
    cursor: pointer;
    background-color: #b0d084; /* 호버 시 배경색 변경 */
}

.board-write-style {
    background-color: #6d8c50;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 14px;
	margin: 5px;
	transition: background-color 0.3s;
    float : right;
}


.board-write-style:hover {
	background-color: #2b473e;
}

.page-input-style {
	padding: 10px;
	border: 1px solid #6d8c50;
	border-radius: 5px;
	font-size: 16px;
	color: #2b473e;
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
	align-content : right;
	transition: background-color 0.3s;
	display: inline-block; /* 모든 버튼을 한 줄에 정렬 */
    vertical-align: middle; /* 버튼 텍스트와 입력 필드와 같은 줄 정렬 */
    margin: 5px 0; /* 간격 조정 */
}

a.page-link {
   background-color: #6d8c50;
   color: white;
}


li.page-item.active a.page-link {
  background-color: #2b473e !important;
  border : 0.1px solid black;
}


button:hover {
	background-color: #2b473e;
}




.main-button {
  height: 50px; 
  width: 150px;  
  display: block; 
  margin: 20px auto 0;
  background-color: #f44336 
}

.tr-title{
  background-color: #2b473e;
  color: #f4f1eb;
  height: 50px;
}



</style>
</head>
<body>
	<h2 class="frb-title" onclick="location.href='frBoard.sg?page=1'" >자유게시판</h2>
	<table border="1">
	<colgroup>
        <col style="width: 10%;">
        <col style="width: 40%;">
        <col style="width: 20%;">
        <col style="width: 20%;">
        <col style="width: 10%;">
    </colgroup>
		<tr class="tr-title">
			<th>게시글아이디</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="board" items="${boardList}" varStatus="status">
			<tr>
				<td colspan="5">
					<div class="board-container ${userList.get(status.index).getUser_id() == 'admin' ? 'admin-background' : ''}"
						onclick="location.href='frBoardContent.sg?page=${pgData.page}&id=${board.getFrb_id()}'">
						<div class="board-id-style">${board.getFrb_id() }</div>
						<div class="board-title-style">${board.getFrb_title() }</div>
						<div class="board-writer-style">${userList.get(status.index).getUser_nickname() }</div>
						<div class="board-date-style">${board.getFrb_reg_date() }</div>
						<div class="board-view-style">${board.getFrb_view_cnt() }</div>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
	검색 폐이지 : <input type="number" class="page-input-style">
	<button onclick="moveToPage()">이동</button>
	<button class="board-write-style" onclick="sessionChk()">게시글 작성</button>
	<ul class="pagination justify-content-center">
		<c:if test="${pgData.startPage != 1 }">
		<li class="page-item">
				<a class="page-link" href="frBoard.sg?page=${pgData.prevPage }">이전 </a> </li>
		</c:if>
		<c:forEach var="i" begin="${pgData.startPage }"
			end="${pgData.endPage }">
		<c:if test="${pgData.page == i }"><li class="page-item active"> <a class="page-link" href="frBoard.sg?page=${i }">${i }</a> </li> </c:if>
		<c:if test="${pgData.page != i }"><li class="page-item"><a class="page-link" href="frBoard.sg?page=${i }">${i }</a></li></c:if>	
		</c:forEach>
		<c:if test="${pgData.endPage != pgData.maxPage }">
			<li class="page-item">
				<a class="page-link" href="frBoard.sg?page=${pgData.nextPage }">다음</a></li>
		</c:if>
   </ul>
	<br>
    <button onclick="location.href='main.jb'" class="main-button"> 메인 </button>
    <br>
	<script type="text/javascript">
		function sessionChk() {
			let userId = "<%=(String) session.getAttribute("userId")%>";
			if (userId !== "null") {
				location.href = "frBoardWriteForm.sg?page=${pgData.page}";
			} else {
				const result=confirm("비회원은 게시글을 작성할 수 없습니다. 로그인 하시겠습니까?");
				if(result){
					location.href="loginForm.sw?fdURL=${fdURL}&page=${pgData.page}";
				}
			}
		}
		function moveToPage() {
			let inputPage = document.querySelector(".page-input-style").value;
			if (inputPage === "") {
				alert("이동할 폐이지를 입력하세요");
			} else {
				location.href = "frBoard.sg?page=" + inputPage;
			}
		}
	</script>
	${fdURL }<br>
	${pgData.page }
   <%--  <c:forEach var="board" items="${boardList}">
        	frb_id : ${board.getFrb_id() }<br>
		user_id : ${board.getUser_id() }<br>
		frb_title : ${board.getFrb_title() }<br>
		frb_content : ${board.getFrb_content() }<br>
		frb_reg_date : ${board.getFrb_reg_date() }<br>
		frb_view_cnt : ${board.getFrb_view_cnt() }<br>
		frb_del : ${board.getFrb_del() }<br>
		frb_category : ${board.getFrb_category() }<br>
		<br>
	</c:forEach>
	<br>
	<br>
	<c:forEach var="user" items="${userList}">
           user_id : ${user.getUser_id() }<br>
		dr_lic_code : ${user.getDr_lic_code() }<br>
		user_pw : ${user.getUser_pw() }<br>
		user_name : ${user.getUser_name() }<br>
		user_tel : ${user.getUser_tel() }<br>
		user_addr : ${user.getUser_addr() }<br>
		user_del : ${user.getUser_del() }<br>
		user_nickname : ${user.getUser_nickname() }<br>
		<br>
	</c:forEach>
	<br>
	<br> totalBoardNum : ${pgData.totalBoardNum}
	<br> limitBoardNum : ${pgData.limitBoardNum}
	<br> limitPageNum : ${pgData.limitPageNum}
	<br>
	<br>  --%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	</body>
	</html>