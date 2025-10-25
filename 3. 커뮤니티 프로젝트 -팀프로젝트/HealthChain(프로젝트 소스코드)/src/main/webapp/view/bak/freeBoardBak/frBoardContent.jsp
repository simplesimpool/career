<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<style type="text/css">
.content-container {
	background: fuchsia;
	height: 700px;
}
.id-style {
	display: inline;
	background: teal;
	border: 1px solid black;
}
.view-cnt-style {
	display: inline;
	background: lime;
	border: 1px solid black;
}
.title-style {
	background: #68b0af;
	border: 1px solid black;
	display: inline;
}
.writer-style {
	background: #68b0af;
	border: 1px solid black;
	display: inline;
}
.content-style {
	background: #32a84a;
	border: 1px solid black;
	height: 88%;
}
.reg-date-style {
	background: #b8c8e3;
	border: 1px solid black;
	height: 38px;
	text-align: right;
}
.react-container {
	background: #b8c8e3;
	border: 1px solid black;
	text-align: center;
}
.cmt-container {
	background: #dbbba0;
	border: 1px solid black;
	width: 100%;
	height: 100%;
	position: relative;
}
.cmt-write-container {
	background: #dbbba0;
	border: 1px solid black;
}
.cmt-write-form {
	display: inline-block;
    vertical-align: middle;
    resize: none; 
	width: 70%;
	height: 220px;
}
.cmt-write-button {
	display: inline-block;
    vertical-align: middle; 
	height: 200px;
	width: 220px;
}
.cmt-page-container {
	background: #dbbba0;
	border: 1px solid black;
	text-align: center;
}
.cmt-prev-style {

}
.cmt-page-style {
	
}
.cmt-next-style {
	
}
.cmt-content {
	border: 1px solid black;
}
.cmt-info {
	border: 1px solid black;
	display: inline;
}
.cmt-update {
	display: inline;
	cursor: pointer;
	border: 1px solid black;
}
.cmt-delete {
	display: inline;
	cursor: pointer;
	border: 1px solid black;
}
.cmt-react-container {
	border: 1px solid black;
}
</style>
</head>
<body>
<div class="content-container">
	<div class="id-style">글번호 : ${frb.getFrb_id() }</div>
	<div class="view-cnt-style">조회수 : ${frb.getFrb_view_cnt() }</div><br>
	<div class="title-style">제목 : ${frb.getFrb_title() }</div>
	<div class="writer-style">작성자 : ${user.getUser_nickname() }</div>
	<div class="content-style">${frb.getFrb_content() }</div>
	<div class="reg-date-style">작성일 : ${frb.getFrb_reg_date() }</div>
</div>
<div class="react-container">
	<c:if test="${not empty sessionScope.userId && frb.getUser_id() == sessionScope.userId && 'admin' != sessionScope.userId}"><!-- 세션이 설정되어있고 작성글 아이디와 세션아이디가 같을떄 그리고 운영자가 아닐떄 -->
		<button onclick="location.href='frBoardUpdateForm.sg?page=${page}&id=${frb.getFrb_id()}'">수정</button>
		<button onclick="deleteAction()" style="display: inline-block;">삭제</button>
	</c:if>
	<c:if test="${not empty sessionScope.userId && 'admin' == sessionScope.userId}"><!--세션이 설정되어 있고 관리자 일떄  -->
		<button onclick="deleteAction()">삭제</button>
	</c:if>
</div>
<div class="cmt-container"><!--DOM 검색 대상  -->
	<div class="cmt-info">유저닉네임/생성일자</div>
	<button class="cmt-update" onclick="showCmtUpdateForm()">수정</button>
	<button class="cmt-delete" onclick="cmtDeleteAction()">삭제</button>
	<div class="cmt-content">글내용입니담나어롸먼외라ㅓㅁ노아ㅓ리ㅗㅁ나ㅣ어뢰만ㅇㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹ</div>
	<!--cmt-react-container   -->
	<div class="cmt-react-container" style="display: none;">
		<textarea class="cmt-react-textarea">ssadasd</textarea>
		<button class="cmt-react-button">댓글수정하기</button>
	</div>
	
	<div class="cmt-info">유저닉네임/생성일자</div>
	<button class="cmt-update" onclick="showCmtUpdateForm()">수정</button>
	<button class="cmt-delete" onclick="cmtDeleteAction()">삭제</button>
	<div class="cmt-content">글내용입니담나어롸먼외라ㅓㅁ노아ㅓ리ㅗㅁ나ㅣ어뢰만ㅇㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹ</div>
	<!--cmt-react-container   -->
	<div class="cmt-react-container" style="display: none;">
		<textarea class="cmt-react-textarea">ssadasd</textarea>
		<button class="cmt-react-button">댓글수정하기</button>
	</div>
</div>
<c:if test="${not empty sessionScope.userId }">
	<div class="cmt-write-container">
		<textarea class="cmt-write-form"></textarea>
		<button class="cmt-write-button" onclick="cmtWriteAction()">댓글 작성하기</button>
	</div>
</c:if>
<div class="cmt-page-container"><!--DOM 검색 대상  -->
	<button class="cmt-prev-style">이전</button>
	<button class="cmt-page-style" onclick="reqCmtPage(1)">1</button>
	<button class="cmt-page-style" onclick="reqCmtPage(2)">2</button>
	<button class="cmt-page-style" onclick="reqCmtPage(3)">3</button>
	<button class="cmt-page-style" onclick="reqCmtPage(4)">4</button>
	<button class="cmt-page-style" onclick="reqCmtPage(5)">5</button>
	<button class="cmt-page-style" onclick="reqCmtPage(6)">6</button>
	<button class="cmt-page-style" onclick="reqCmtPage(7)">7</button>
	<button class="cmt-page-style" onclick="reqCmtPage(8)">8</button>
	<button class="cmt-page-style" onclick="reqCmtPage(9)">9</button>
	<button class="cmt-page-style" onclick="reqCmtPage(10)">10</button>
	<button class="cmt-next-style">다음</button>
</div>
<script type="text/javascript">
	let res;
	let cmtArray = [];
	let cmtUserNickNameArray = [];
	let adminId;
	function deleteAction() {
		const result = confirm("정말로 삭제하시겠습니까?");
		if (result) {
	        location.href="frBoardDelete.sg?page=${page}&id=${frb.getFrb_id()}";
	    }
	}
	window.onload = function() {
		axios.post("http://localhost:8080/HealthChain/FrbLoadServlet", {
			frbId: ${frb.getFrb_id()}
		})
		.then(response => {
			res = response.data;
			cmtArray = res.cmtList;
			cmtUserNickNameArray = res.cmtUserNickNameList;
			adminId = res.adminId;
			
			clearCmtPageContainer();
			insertCmtPageButton();
			
			clearCmt();
			insertCmt();
			//console.log(res);
		})
		.catch(error => {
			console.error('window.onload error : ', error);
		});
	}
	function reqCmtPage(cmtPageParam) {
		axios.post("http://localhost:8080/HealthChain/FrbCmtPageResServlet", {
			frbId: ${frb.getFrb_id()},
			cmtPage: cmtPageParam
		})
		.then(response => {
			res = response.data;
			cmtArray = res.cmtList;
			cmtUserNickNameArray = res.cmtUserNickNameList;
			adminId = res.adminId;
			
			clearCmtPageContainer();
			insertCmtPageButton();
			
			clearCmt();
			insertCmt();
			//console.log(res);
		})
		.catch(error => {
			console.error('reqCmtPage error : ', error);
		});
	}
	function clearCmtPageContainer() {
		const container = document.querySelector('.cmt-page-container');
		container.innerHTML = "";
	}
	function insertCmtPageButton() {
		const container = document.querySelector('.cmt-page-container');
		
		if(res.cmtStartPage !== 1) {
			const prevButton = document.createElement("button");
			prevButton.textContent = "이전";
			prevButton.classList.add("cmt-prev-style");
			prevButton.onclick = function() {
			    reqCmtPage(res.cmtPrevPage);
			};
			container.appendChild(prevButton);
		}
		for(let i = res.cmtStartPage; i <= res.cmtEndPage; i++) {
			const pageButton = document.createElement("button");
			pageButton.textContent = "" + i;
			pageButton.classList.add("cmt-page-style");
			pageButton.onclick = function() {
			    reqCmtPage(i);
			};
			container.appendChild(pageButton);
		}
		if(res.cmtEndPage !== res.cmtMaxPage) {
			const nextButton = document.createElement("button");
			nextButton.textContent = "다음";
			nextButton.classList.add("cmt-next-style");
			nextButton.onclick = function() {
			    reqCmtPage(res.cmtNextPage);
			};
			container.appendChild(nextButton);
		}
	}
	function clearCmt() {
		const container = document.querySelector('.cmt-container');
		container.innerHTML = "";
	}
	function insertCmt() {
		const container = document.querySelector('.cmt-container');
		const userId = "<%=(String)session.getAttribute("userId")%>";
		
		for (let i = 0; i < cmtArray.length; i++) {
			const cmtInfo = document.createElement("div");
			cmtInfo.textContent = "" + cmtUserNickNameArray[i] + "/" + cmtArray[i].frb_cmt_date;
			cmtInfo.classList.add("cmt-info");
			
			const cmtUpdate = document.createElement("button");
			cmtUpdate.textContent = "수정";
			cmtUpdate.classList.add("cmt-update");
			cmtUpdate.onclick = function() {
			    showCmtUpdateForm(i, cmtArray[i].frb_cmt_id, res.cmtPage, cmtArray[i].frb_cmt_reply);
			};
			
			const cmtDelete = document.createElement("button");
			cmtDelete.textContent = "삭제";
			cmtDelete.classList.add("cmt-delete");
			cmtDelete.onclick = function() {
			    cmtDeleteAction(cmtArray[i].frb_cmt_id, res.cmtPage);
			};
			//react 컨테이너 넣기
			const cmtReactContainer = document.createElement("div");
			cmtReactContainer.classList.add("cmt-react-container");
			cmtReactContainer.style.display = "none";
			//
			const cmtContent = document.createElement("div");
			cmtContent.textContent = cmtArray[i].frb_cmt_reply;
			cmtContent.classList.add("cmt-content");
			
			container.appendChild(cmtInfo);
			if(userId !== 'null') { //세션 존재할떄
				if(cmtArray[i].user_id === userId) {
					container.appendChild(cmtUpdate);
				}
				if(cmtArray[i].user_id === userId || userId === adminId) {
					container.appendChild(cmtDelete);
				}
			}
			container.appendChild(cmtContent);
			container.appendChild(cmtReactContainer);
		}
	}
	function showCmtUpdateForm(eleIdxParam, frbCmtIdParam, cmtPageParam, frbCmtReplyParam) {
		const eleIdx = eleIdxParam;
		const frbCmtId = frbCmtIdParam;
		const cmtPage = cmtPageParam;
		const frbCmtReply = frbCmtReplyParam;
		const cmtReactContainers = document.querySelectorAll(".cmt-react-container");
		
		cmtReactContainers[eleIdx].innerHTML = "";
		
		const cmtReactTextArea = document.createElement("textarea");
		cmtReactTextArea.classList.add("cmt-react-textarea");
		cmtReactTextArea.textContent = frbCmtReply;
		cmtReactContainers[eleIdx].appendChild(cmtReactTextArea);
		
		const cmtReactButton = document.createElement("button");
		cmtReactButton.classList.add("cmt-react-button");
		cmtReactButton.textContent = "댓글수정하기";
		cmtReactButton.onclick = function() {
			cmtUpdateAction(eleIdx, frbCmtId, cmtPage);
		}
		cmtReactContainers[eleIdx].appendChild(cmtReactButton);
		
		if(cmtReactContainers[eleIdx].style.display === "block") {
			cmtReactContainers[eleIdx].style.display = "none"
		}
		else {
			cmtReactContainers[eleIdx].style.display = "block"
		}
		//console.log("showCmtUpdateForm() clicked");
		/* console.log("eleIdx : " + eleIdx);
		console.log("frbCmtId : " + frbCmtId);
		console.log("cmtPage : " + cmtPage); */
	}
	function cmtUpdateAction(eleIdxParam, frbCmtIdParam, cmtPageParam) {
		const cmtReactContainers = document.querySelectorAll(".cmt-react-container");
		const cmtReactTextArea = cmtReactContainers[eleIdxParam].querySelector(".cmt-react-textarea");
		
		if(cmtReactTextArea.value === "") {
			alert("수정할 댓글을 입력해주세요");
			return;
		}
		
		/* console.log("cmtUpdateAction() clicked");
		console.log("eleIdx : " + eleIdxParam);
		console.log("frbCmtReply : " + cmtReactTextArea.value);
		console.log("cmtPage : " + cmtPageParam); */
		axios.post("http://localhost:8080/HealthChain/FrbCmtUpdateServlet", {
			frbCmtId: frbCmtIdParam,
			frbCmtReply: cmtReactTextArea.value,
			cmtPage: cmtPageParam
		})
		.then(response => {
			reqCmtPage(response.data.cmtPage);
			//console.log("댓글 수정성공");
		})
		.catch(error => {
			console.error('cmtDeleteAction() error : ', error);
		});
	}
	function cmtDeleteAction(frbCmtIdParam, cmtPageParam) {
		/* console.log("cmtDeleteAction() clicked");
		console.log("frbCmtId : " + frbCmtId);
		console.log("cmtPage : " + cmtPage); */
		
		axios.post("http://localhost:8080/HealthChain/FrbCmtDeleteServlet", {
			frbCmtId: frbCmtIdParam,
			cmtPage: cmtPageParam
		})
		.then(response => {
			reqCmtPage(response.data.cmtPage);
			//console.log("댓글 삭제성공");
		})
		.catch(error => {
			console.error('cmtDeleteAction() error : ', error);
		});
	}
	function cmtWriteAction() {
		const cmtWriteForm = document.querySelector(".cmt-write-form");
		//console.log("cmtWriteAction() clicked");
		//console.log("cmtWriteForm value : " + cmtWriteForm.value);
		if(cmtWriteForm.value === "") {
			alert("작성할 댓글을 입력해주세요");
			return;
		}
		
		axios.post("http://localhost:8080/HealthChain/FrbCmtWriteServlet", {
			frbCmtReply: cmtWriteForm.value,
			frbId: ${frb.getFrb_id()}
		})
		.then(response => {
			cmtWriteForm.value = "";
			reqCmtPage(1);
			//console.log("댓글 작성성공");
		})
		.catch(error => {
			console.error('cmtWriteAction() error : ', error);
		});
	}
</script>























<br>
frb_id : ${frb.getFrb_id() }<br>
user_id : ${user.getUser_id() }<br>
page : ${page }<br>
</body>
</html>