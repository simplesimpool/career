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
	border: 1px solid #6d8c50;
	color: #2b473e;
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

 table th {
   text-align: center; /* 모든 셀 가운데 정렬 */
}


.page-container {
	display: inline;
	margin-left: 16%;
}

.mib-title {
	text-align: center;
	color: #2b473e;
	padding: 10px;
	border-radius: 5px;
	margin-bottom: 20px;
	pointer-events: auto; /* 클릭 이벤트 허용 */
    cursor: pointer; /* 마우스 포인터 변경 */
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
	background-color: #b0d084;
}

.board-container>div {
	text-align: center;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	padding: 5px;
}

.admin-background {
   background-color: #F5F6CE;
}


/* 비율 설정 */
.board-id-style {
	flex: 0.5;
	max-width: 10%;
	font-size: 16px;
	color: #2b473e;
}

.board-title-style {
	flex: 4; /* 40% */
	max-width: 40%;
	font-size: 16px;
	color: #2b473e;
}

.board-writer-style {
	flex: 2.5; /* 20% */
	max-width: 20%;
	font-size: 16px;
	color: #2b473e;
}

.board-date-style {
	flex: 2.5; /* 20% */
	max-width: 20%;
	font-size: 16px;
	color: #2b473e;
}

.board-view-style {
	flex: 0.5;
	max-width: 10%;
	font-size: 16px;
	color: #2b473e;
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
	transition: background-color 0.3s;
	vertical-align: middle;
	margin: 5px 0;
}

a.page-link {
   background-color: #6d8c50;
   color: white;
}


li.page-item.active a.page-link {
  background-color: #2b473e !important;
  border : 0.1px solid black;
}


button not(.main_button):hover {
	background-color: #2b473e;
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

.main_button {
  height: 50px; 
  width: 150px;  
  background-color: #f44336;
  display: block; 
  margin: 10px auto 0 ;
}

.tr-title{
  background-color: #2b473e;
  color: #f4f1eb;
  height: 50px;
}

</style>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body>
	<h2 class="mib-title"  onclick="location.href='miBoard.sg?page=1'">의료정보게시판</h2>
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
						onclick="location.href='miBoardContent.sg?page=${pgData.page}&id=${board.getMib_id()}'">
						<div class="board-id-style">${board.getMib_id() }</div>
						<div class="board-title-style">${board.getMib_title() }</div>
						<div class="board-writer-style">${userList.get(status.index).getUser_nickname() }</div>
						<div class="board-date-style">${board.getMib_reg_date() }</div>
						<div class="board-view-style">${board.getMib_view_cnt() }</div>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
	검색 폐이지 :
	<input type="number" class="page-input-style">
	<button onclick="moveToPage()">이동</button>
	<button class="board-write-style" onclick="sessionChk()">게시글작성</button>
	<ul class="pagination justify-content-center">
		<c:if test="${pgData.startPage != 1 }">
		<li class="page-item">
				<a class="page-link" href="miBoard.sg?page=${pgData.prevPage }">이전 </a> </li>
		</c:if>
		<c:forEach var="i" begin="${pgData.startPage }"
			end="${pgData.endPage }">
		<c:if test="${pgData.page == i }"><li class="page-item active"> <a class="page-link" href="miBoard.sg?page=${i }">${i }</a> </li> </c:if>
		<c:if test="${pgData.page != i }"><li class="page-item"><a class="page-link" href="miBoard.sg?page=${i }">${i }</a></li></c:if>	
		</c:forEach>
		<c:if test="${pgData.endPage != pgData.maxPage }">
			<li class="page-item">
				<a class="page-link" href="miBoard.sg?page=${pgData.nextPage }">다음</a></li>
		</c:if>
   </ul>
	
    <br>
    <button onclick="location.href='main.jb'" class="main_button"> 메인 </button>
     <br>
	
	<script type="text/javascript">
		async function sessionChk() {
			const userId = "<%=(String) session.getAttribute("userId")%>";
			const isActivityBlocked = await userActivityChk() + "";
			
			if(isActivityBlocked === "true") {
				alert("활동이 정지된 상태입니다");
				return;
			}
			
			if (userId !== "null") {//세션이 존재
				location.href = "miBoardWriteForm.sg?page=${pgData.page}";
			} else {//세션이 없음
				const result=confirm("비회원은 게시글을 작성할 수 없습니다. 로그인 하시겠습니까?");
				if(result){
					location.href="loginForm.sw?fdURL=${fdURL}&page=${pgData.page}";
				}
			}
		}
		async function userActivityChk() {
			let response = null;
			
			try {
				response = await axios.post("http://localhost:8080/HealthChain/MibCheckUserActivityServlet", {
					id : "<%=(String)session.getAttribute("userId")%>"
				});
				return response.data.result;
			}
			catch(error) {
				return "error";
			}
		}
		function moveToPage() {
			const inputPage = document.querySelector(".page-input-style").value;
			if (inputPage === "") {
				alert("이동할 폐이지를 입력하세요");
			} else {
				location.href = "miBoard.sg?page=" + inputPage;
			}
		}
	</script>























<%-- 	<c:forEach var="board" items="${boardList}">
       	mib_id : ${board.getMib_id() }<br>
		user_id : ${board.getUser_id() }<br>
		mib_title : ${board.getMib_title() }<br>
		mib_content : ${board.getMib_content() }<br>
		mib_reg_date : ${board.getMib_reg_date() }<br>
		mib_view_cnt : ${board.getMib_view_cnt() }<br>
		mib_del : ${board.getMib_del() }<br>
		mib_category : ${board.getMib_category() }<br>
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
	<br> page : ${pgData.page}
	<br> startPage : ${pgData.startPage}
	<br> endPage : ${pgData.endPage}
	<br> nextPage : ${pgData.nextPage}
	<br> prevPage : ${pgData.prevPage}
	<br> maxPage : ${pgData.maxPage}
	<br> --%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>