<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.user-display-container {
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
}

.my-comment-button {
    width: 100%;
    font-size: larger;
    margin-bottom: 50%;
    text-decoration: underline;
}

.comment-container {
	border: 1px solid black;
	margin-top: 10px;
	text-align: center;
}

.comment-container:hover {
	cursor: pointer;
}

.resign-button {
	position: relative;
    width: 100%;
}

.page-container {
	margin-top: 40px;
	text-align: center;
}

.page-input {
	
}

#comment-category {
	
}
</style>
</head>
<body>
	<h2>마이폐이지</h2>
	<div class="user-display-container">
		<div class="category-container">
			<button class="user-update-button" onclick="location.href='myPageController.sg?category=userUpdate'">회원정보 수정</button><br>
			<button class="my-board-button" onclick="location.href='myPageController.sg?category=myBoard'">내가 쓴 게시글</button><br>
			<button class="my-comment-button" onclick="location.href='myPageController.sg?category=myComment'">내가 쓴 댓글</button><br>
			<button class="resign-button">탈퇴</button><br>
		</div>
		<div class="update-container">
			<h3>내가 쓴 댓글</h3>
			<select id="comment-category" onchange="commentSelectAction()">
				<option value="all">전체댓글</option>
				<option value="frbCmt">자유게시판댓글</option>
				<option value="qsbCmt">질문게시판댓글</option>
				<option value="rvbCmt">리뷰게시판댓글</option>
			</select>
			<c:if test="${commentCategory == 'all' }">
				<c:forEach var="comment" items="${commentList}" varStatus="status">
					<div class=comment-container onclick="contentClickAction(${comment.getCmt_id()}, '${comment.getCmt_category() }')">
						<c:if test="${comment.getCmt_category() == 'frb_cmt'}">
							<div>자유게시판|${boardList.get(status.index).getFrb_title() }</div>
							<div style="border: 1px solid black"></div>
							<div style="display: inline-block;">${comment.getCmt_reply() }|</div>
							<div style="display: inline-block;">${comment.getCmt_date() }</div>
						</c:if>
						<c:if test="${comment.getCmt_category() == 'rvb_cmt'}">
							<div>리뷰게시판댓글|${boardList.get(status.index).getRvb_title() }</div>
							<div style="border: 1px solid black"></div>
							<div style="display: inline-block;">${comment.getCmt_reply() }|</div>
							<div style="display: inline-block;">${comment.getCmt_date() }</div>
						</c:if>
						<c:if test="${comment.getCmt_category() == 'qsb_cmt'}">
							<div>질문게시판|${boardList.get(status.index).getQsb_title() }</div>
							<div>질문게시판 답변내용</div>
							<div style="border: 1px solid black"></div>
							<div style="display: inline-block;">${comment.getCmt_reply() }|</div>
							<div style="display: inline-block;">${comment.getCmt_date() }</div>
						</c:if>
						<c:if test="${comment.getCmt_category() == 'qsb_cmt2'}">
							<div>질문게시판${boardList.get(status.index).getQsb_title() }</div>
							<div>질문게시판 답변의댓글내용</div>
							<div style="border: 1px solid black"></div>
							<div style="display: inline-block;">${comment.getCmt_reply() }|</div>
							<div style="display: inline-block;">${comment.getCmt_date() }</div>
						</c:if>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${commentCategory == 'frbCmt' }">
				<c:forEach var="comment" items="${commentList}" varStatus="status">
					<div class=comment-container onclick="contentClickAction(${comment.getFrb_cmt_id()}, '${comment.getFrb_cmt_category()}')">
						<div>자유게시판|${boardList.get(status.index).getFrb_title() }</div>
						<div style="border: 1px solid black"></div>
						<div style="display: inline-block;">${comment.getFrb_cmt_reply() }|</div>
						<div style="display: inline-block;">${comment.getFrb_cmt_date() }</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${commentCategory == 'rvbCmt' }">
				<c:forEach var="comment" items="${commentList}" varStatus="status">
					<div class=comment-container onclick="contentClickAction(${comment.getRvb_cmt_id()}, '${comment.getRvb_cmt_category()}')">
						<div>리뷰게시판|${boardList.get(status.index).getRvb_title() }</div>
						<div style="border: 1px solid black"></div>
						<div style="display: inline-block;">${comment.getRvb_cmt_reply() }|</div>
						<div style="display: inline-block;">${comment.getRvb_cmt_date() }</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${commentCategory == 'qsbCmt' }">
				<c:forEach var="comment" items="${commentList}" varStatus="status">
					<div class=comment-container onclick="contentClickAction(${comment.getCmt_id()}, '${comment.getCmt_category()}')">
						<c:if test="${comment.getCmt_category() == 'qsb_cmt' }">
							<div>질문게시판|${boardList.get(status.index).getQsb_title() }</div>
							<div>질문게시판 답변내용</div>
							<div style="border: 1px solid black"></div>
							<div style="display: inline-block;">${comment.getCmt_reply() }|</div>
							<div style="display: inline-block;">${comment.getCmt_date() }</div>
						</c:if>
						<c:if test="${comment.getCmt_category() == 'qsb_cmt2' }">
							<div>질문게시판|${boardList.get(status.index).getQsb_title() }</div>
							<div>질문게시판 답변의댓글내용</div>
							<div style="border: 1px solid black"></div>
							<div style="display: inline-block;">${comment.getCmt_reply() }|</div>
							<div style="display: inline-block;">${comment.getCmt_date() }</div>
						</c:if>
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
		const boardCategoryElement = document.querySelector("#comment-category");//init action
		boardCategoryElement.value = "${commentCategory }";//init action
		
		function commentSelectAction() {
			const value = document.querySelector("#comment-category").value;
			location.href = "myCommentController.sg?commentCategory=" + value + "&page=${pgData.page}";
			//if the page parameter is added, it will remained and can send it to the each of services.
			//but if remove the page parameter, each selection will lead the page to 1.
		}
		function pageClickAction(page) {
			const value = document.querySelector("#comment-category").value;
			location.href = "myCommentController.sg?commentCategory=" + value + "&page=" + page;
		}
		function moveToPage() {
			const inputPage = document.querySelector(".page-input").value;
			const value = document.querySelector("#comment-category").value;
			
			if(inputPage === "") {
				alert("이동할 폐이지를 입력해주세요");
				return;
			} else {
				location.href = "myCommentController.sg?commentCategory=" + value + "&page=" + inputPage;
			}
		}
		function contentClickAction(id, category) {
			location.href = "myCommentContent.sg?category=" + category + "&id=" + id;
		}
	</script>

























<br><br><br>
commentCategory : ${commentCategory }<br>

<%-- <c:forEach var="comment" items="${commentList}">
	cmtId : ${comment.getCmt_id() }<br>
	userId : ${comment.getUser_id() }<br>
	boardId : ${comment.getBoard_id() }<br>
	cmtReply : ${comment.getCmt_reply() }<br>
	cmtDate : ${comment.getCmt_date() }<br>
	cmtDel : ${comment.getCmt_del() }<br>
	cmtCategory : ${comment.getCmt_category() }<br><br>
</c:forEach> --%>
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