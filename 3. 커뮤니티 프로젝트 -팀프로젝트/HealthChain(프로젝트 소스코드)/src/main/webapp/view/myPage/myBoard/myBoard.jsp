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

.user-update-button {
    width: 100%;
    font-size: larger;
    margin-bottom: 10px;
}

.my-board-button {
    width: 100%;
    font-size: larger;
    margin-bottom: 10px;
    text-decoration: underline;
}

.my-comment-button {
    width: 100%;
    font-size: larger;
    margin-bottom: 50%;
}

.resign-button {
	position: relative;
    width: 100%;
}

.board-container {
	border: 1px solid black;
	margin-top: 10px;
	text-align: center;
}

.board-container:hover {
	cursor: pointer;
}

.react-container {
	margin-top: 40px;
}

.page-container {
	margin-top: 40px;
	text-align: center;
}

.page-input {
	
}

#board-category {
	
}
</style>
</head>
<body>
	<h2>마이폐이지</h2>
	<div class="display-container">
		<div class="category-container">
			<button class="user-update-button" onclick="location.href='myPageController.sg?category=userUpdate'">회원정보 수정</button><br>
			<button class="my-board-button" onclick="location.href='myPageController.sg?category=myBoard'">내가 쓴 게시글</button><br>
			<button class="my-comment-button" onclick="location.href='myPageController.sg?category=myComment'">내가 쓴 댓글</button><br>
			<button class="resign-button">탈퇴</button><br>
		</div>
		<div class="update-container">
			<h3>내가 쓴 게시글</h3>
			<select id="board-category" onchange="boardSelectAction()">
				<option value="all">전체</option>
				<option value="frb">자유게시판</option>
				<option value="qsb">질문게시판</option>
				<option value="rvb">리뷰게시판</option>
				<option value="cs">고객센터</option>
				<option value="mib">의료정보게시판</option>
			</select>
			<c:if test="${boardCategory == 'all' }">
				<c:forEach var="board" items="${boardList}" varStatus="status">
					<div class=board-container onclick="contentClickAction(${board.getId()}, '${board.getCategory() }')">
						<c:if test="${board.getCategory() == 'frb'}">
							<div style="display: inline-block;">자유게시판|</div>
						</c:if>
						<c:if test="${board.getCategory() == 'rvb'}">
							<div style="display: inline-block;">리뷰게시판|</div>
						</c:if>
						<c:if test="${board.getCategory() == 'cs'}">
							<div style="display: inline-block;">고객센터|</div>
						</c:if>
						<c:if test="${board.getCategory() == 'qsb'}">
							<div style="display: inline-block;">질문게시판|</div>
						</c:if>
						<c:if test="${board.getCategory() == 'mib'}">
							<div style="display: inline-block;">의료정보게시판|</div>
						</c:if>
						<div style="display: inline-block;">${board.getTitle() }|</div>
						<div style="display: inline-block;">${board.getReg_date() }</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${boardCategory == 'frb' }">
				<c:forEach var="board" items="${boardList}" varStatus="status">
					<div class=board-container onclick="contentClickAction(${board.getFrb_id()}, '${board.getFrb_category() }')">
						<div style="display: inline-block;">자유게시판|</div>
						<div style="display: inline-block;">${board.getFrb_title() }|</div>
						<div style="display: inline-block;">${board.getFrb_reg_date() }</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${boardCategory == 'cs' }">
				<c:forEach var="board" items="${boardList}" varStatus="status">
					<div class=board-container onclick="contentClickAction(${board.getCs_id()}, '${board.getCs_category() }')">
						<div style="display: inline-block;">고객센터|</div>
						<div style="display: inline-block;">${board.getCs_title() }|</div>
						<div style="display: inline-block;">${board.getCs_reg_date() }</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${boardCategory == 'qsb' }">
				<c:forEach var="board" items="${boardList}" varStatus="status">
					<div class=board-container onclick="contentClickAction(${board.getQsb_id()}, '${board.getQsb_category() }')">
						<div style="display: inline-block;">질문게시판|</div>
						<div style="display: inline-block;">${board.getQsb_title() }|</div>
						<div style="display: inline-block;">${board.getQsb_reg_date() }</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${boardCategory == 'rvb' }">
				<c:forEach var="board" items="${boardList}" varStatus="status">
					<div class=board-container onclick="contentClickAction(${board.getRvb_id()}, '${board.getRvb_category() }')">
						<div style="display: inline-block;">리뷰게시판|</div>
						<div style="display: inline-block;">${board.getRvb_title() }|</div>
						<div style="display: inline-block;">${board.getRvb_reg_date() }</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${boardCategory == 'mib' }">
				<c:forEach var="board" items="${boardList}" varStatus="status">
					<div class=board-container onclick="contentClickAction(${board.getMib_id()}, '${board.getMib_category() }')">
						<div style="display: inline-block;">의료정보게시판|</div>
						<div style="display: inline-block;">${board.getMib_title() }|</div>
						<div style="display: inline-block;">${board.getMib_reg_date() }</div>
					</div>
				</c:forEach>
			</c:if>
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
		const boardCategoryElement = document.querySelector("#board-category");//init action
		boardCategoryElement.value = "${boardCategory }";//init action
		
		function boardSelectAction() {
			const value = document.querySelector("#board-category").value;
			location.href = "myBoardController.sg?boardCategory=" + value + "&page=${pgData.page}";
			//if the page parameter is added, it will remained and can send it to the each of services.
			//but if remove the page parameter, each selection will lead the page to 1.
		}
		function pageClickAction(page) {
			const value = document.querySelector("#board-category").value;
			location.href = "myBoardController.sg?boardCategory=" + value + "&page=" + page;
		}
		function moveToPage() {
			const inputPage = document.querySelector(".page-input").value;
			const value = document.querySelector("#board-category").value;
			
			if(inputPage === "") {
				alert("이동할 폐이지를 입력해주세요");
				return;
			} else {
				location.href = "myBoardController.sg?boardCategory=" + value + "&page=" + inputPage;
			}
		}
		function contentClickAction(id, category) {
			location.href = "myBoardContent.sg?category=" + category + "&id=" + id;
		}
	</script>
	























<%-- <br><br><br>
boardCategory : ${boardCategory }<br>

<c:forEach var="board" items="${boardList}">
	id : ${board.getId() }<br>
	userId : ${board.getUser_id() }<br>
	title : ${board.getTitle() }<br>
	content : ${board.getContent() }<br>
	regDate : ${board.getReg_date() }<br>
	viewCnt : ${board.getView_cnt() }<br>
	del : ${board.getDel() }<br>
	category : ${board.getCategory() }<br><br>
</c:forEach>
	totalBoardNum : ${pgData.totalBoardNum}<br>
	limitBoardNum : ${pgData.limitBoardNum}<br>
	limitPageNum : ${pgData.limitPageNum}<br><br>
	
	page : ${pgData.page}<br>
	startPage : ${pgData.startPage}<br>
	endPage : ${pgData.endPage}<br>
	nextPage : ${pgData.nextPage}<br>
	prevPage : ${pgData.prevPage}<br>
	maxPage : ${pgData.maxPage}<br> --%>
</body>
</html>