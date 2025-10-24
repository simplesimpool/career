<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
/* 테이블 스타일 */
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

/* 버튼 스타일 */
.new-order-button, .like-order-button {
    background-color: #6d8c50;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s;
    text-decoration: none;
    margin-right: 10px;
    float: right;
}

.new-order-button:hover, .like-order-button:hover {
    background-color: #2b473e;
}

/* 게시판 컨테이너 스타일 */
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

.admin-background {
   background-color: #F5F6CE;
}


.board-container:hover {
    cursor: pointer;
    background-color: #b0d084;
}


.board-container > div {
    text-align: center;
    overflow: hidden;
    white-space: nowrap;
 
    padding: 5px;
}

/* 각 항목 스타일 */
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
    flex: 2.5;
    max-width: 20%;
    font-size: 16px;
    color: #2b473e;
}

.board-view-style, .board-like-style {
    flex: 0.5;
    max-width: 10%;
    font-size: 16px;
    color: #2b473e;
}

/* 글 작성 버튼 스타일 */
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

/* 페이지 이동 스타일 */
.page-container {
    display: inline;
    margin-left: 16%;
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


button:hover not(.main_button) {
    background-color: #2b473e;
}


.tr-title{
  background-color: #2b473e;
  color: #f4f1eb;
  height: 50px;
}


/* 메인 타이틀 스타일 */
.rvb-title {
    text-align: center;
    color: #2b473e;
    padding: 10px;
    border-radius: 5px;
    margin-bottom: 20px;
    pointer-events: auto; /* 클릭 이벤트 허용 */
    cursor: pointer; /* 마우스 포인터 변경 */
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
	<h2 class="rvb-title" onclick="location.href='rvBoard.sg?order=${order}&page=1'">후기게시판</h2>
	<input class="order" type="hidden" value="${order }">
	<button class="new-order-button" onclick="newOrderButtonAction()">최신순</button>
	<button class="like-order-button" onclick="likeOrderButtonAction()">추천순</button>
	<table border="1">
	    <colgroup>
			<col style="width: 10%;">
			<col style="width: 35%;">
			<col style="width: 15%;">
			<col style="width: 18%;">
			<col style="width: 5%;">
			<col style="width: 5%;">
		</colgroup>
		<tr class="tr-title">
			<th>게시글아이디</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>조회수</th>
			<th>추천수</th>
		</tr>
		<c:forEach var="board" items="${boardList}" varStatus="status">
			<tr>
				<td colspan="6">
				<!-- 작성자 닉네임이 "관리자"일 경우 다른 클래스 적용 -->
					<div class="board-container ${userList.get(status.index).getUser_id() == 'admin' ? 'admin-background' : ''}" onclick="moveToContent(${board.getRvb_id() })">  
						<div class="board-id-style">${board.getRvb_id() }</div>
						<div class="board-title-style">${board.getRvb_title() }</div>
						<div class="board-writer-style">${userList.get(status.index).getUser_nickname() }</div>
						<div class="board-date-style">${board.getRvb_reg_date() }</div>
						<div class="board-view-style">${board.getRvb_view_cnt() }</div>
						<div class="board-like-style">${board.getRvb_like_cnt() }</div>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
	검색 폐이지 : <input type="number" class="page-input-style">
	<button onclick="moveToPage()">이동</button>
	<button class="board-write-style" onclick="sessionChk()">게시글 작성</button><br>
	<ul class="pagination justify-content-center">
		<c:if test="${pgData.startPage != 1 }">
		<li class="page-item">
				<a class="page-link" href="#" onclick="pageClickAction(${pgData.prevPage })">이전 </a> </li>
		</c:if>
		<c:forEach var="i" begin="${pgData.startPage }"
			end="${pgData.endPage }">
		<c:if test="${pgData.page == i }"><li class="page-item active"> <a class="page-link" href="#" onclick="pageClickAction(${i })">${i }</a> </li> </c:if>
		<c:if test="${pgData.page != i }"><li class="page-item"><a class="page-link" href="#" onclick="pageClickAction(${i })">${i }</a></li></c:if>	
		</c:forEach>
		<c:if test="${pgData.endPage != pgData.maxPage }">
			<li class="page-item">
				<a class="page-link" href="#" onclick=" pageClickAction(${pgData.nextPage })">다음</a></li>
		</c:if>
   </ul>
	<br>
	<button class="main-button" onclick="location.href='main.jb'">메인</button>
	<br>
	<script type="text/javascript">
		function getOrderValue() {
			const order = document.querySelector(".order");
			return order.value;
		}
		function setOrderValue(value) {
			const order = document.querySelector(".order");
			order.value = value;
		}
	</script>
	<script type="text/javascript">
		const orderValue = "${order}";
		const newOrderButton = document.querySelector(".new-order-button");
		const likeOrderButton = document.querySelector(".like-order-button");
		if(orderValue === "like") {
			newOrderButton.style.textDecoration = "none";
			likeOrderButton.style.textDecoration = "underline";
		}
		else {
			newOrderButton.style.textDecoration = "underline";
			likeOrderButton.style.textDecoration = "none";
		}
	</script>
	<script type="text/javascript">
		function sessionChk() {
			let userId = "<%=(String)session.getAttribute("userId")%>";
			const orderValue = getOrderValue();
			if(userId !== "null") {
				location.href = "rvBoardWriteForm.sg?order=" + orderValue + "&page=" + "${pgData.page}";
			}
			else {
				const result=confirm("비회원은 게시글을 작성할 수 없습니다. 로그인 하시겠습니까?");
				if(result){
					location.href="loginForm.sw?fdURL=${fdURL}&order="+orderValue+"&page=${pgData.page}";
				}
			}
		}
		function newOrderButtonAction() {
			setOrderValue("new");
			const orderValue = getOrderValue();
			location.href = "rvBoard.sg?order=" + orderValue + "&page=" + "${pgData.page}";
		}
		function likeOrderButtonAction() {
			setOrderValue("like");
			const orderValue = getOrderValue();
			location.href = "rvBoard.sg?order=" + orderValue + "&page=" + "${pgData.page}";
		}
		function moveToContent(rvbIdParam) {
			const rvbId = rvbIdParam;
			const orderValue = getOrderValue();
			location.href = "rvBoardContent.sg?order=" + orderValue + "&page=" + "${pgData.page}" + "&id=" + rvbId;
		}
		function pageClickAction(p) {
			const page = p;
			const orderValue = getOrderValue();
			location.href = "rvBoard.sg?order=" + orderValue + "&page=" + page;
		}
		function moveToPage() {
			let inputPage = document.querySelector(".page-input-style").value;
			if(inputPage === "") {
				alert("이동할 폐이지를 입력하세요");
			} else {
				const orderValue = getOrderValue();
				location.href = "rvBoard.sg?order=" + orderValue + "&page=" + inputPage;
			}
		}
	</script>
</body>
</html>

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<%-- 	<c:forEach var="board" items="${boardList}">
       	rvb_id : ${board.getRvb_id() }<br>
		user_id : ${board.getUser_id() }<br>
		rvb_title : ${board.getRvb_title() }<br>
		rvb_content : ${board.getRvb_content() }<br>
		rvb_reg_date : ${board.getRvb_reg_date() }<br>
		rvb_view_cnt : ${board.getRvb_view_cnt() }<br>
		rvb_like_cnt : ${board.getRvb_like_cnt() }<br>
		rvb_del : ${board.getRvb_del() }<br>
		rvb_category : ${board.getRvb_category() }<br><br>
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
	order : ${order }<br> --%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>