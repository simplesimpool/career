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
/* 전체 배경과 폰트 */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f1eb;
    color: #2b473e;
    margin: 20px;
}

/* 게시글 컨테이너 */
.content-container {
    background: #ffffff;
    border: 1px solid #6d8c50;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    height: auto;
}

.id-style, .view-cnt-style, .like-cnt-style {
    display: inline-block;
    margin-right: 10px;
    font-size: 14px;
    color: #6d8c50;
}

.title-style, .writer-style {
    font-size: 18px;
    font-weight: bold;
    margin: 10px 0;
    color: #2b473e;
}

.content-style {
    margin: 20px 0;
    padding: 15px;
    border-radius: 4px;
    line-height: 1.6;
    position: relative;
}

.like-container {
    position: absolute;
    bottom: -90px;
    width: 100%;
    text-align: center;
}

.like-button {
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s;
    margin: 10px 10px 20px auto;
    align-content: center;
    background-color: orange;
}

.like-button:hover {
    background-color: #F3E2A9;
}

.like-view {
    margin-top: 10px;
    font-size: 14px;
    color: #2b473e;
}



.reg-date-style {
    text-align: right;
    font-size: 14px;
    color: #999;
    margin-top: 10px;
}


/* 반응 컨테이너 */

.react-container {
    display: flex;
    justify-content: flex-end; /* 수평으로 오른쪽 정렬 */
    align-items: flex-end; /* 수직으로 아래 정렬 */
    height: 100%; /* 컨테이너의 전체 높이를 차지하도록 설정 */
    position: relative; /* 필요 시 위치 제어 */
    margin-top: 30px; 
}

.react-container button {
    background-color: #6d8c50;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    margin-left: 10px; /* 버튼 간 간격 */
    margin-top: 20px;
    bottom: 0;
    cursor: pointer;
 
}


.react-container button:hover {
    background-color: #2b473e;
}
 


/* 댓글 컨테이너 */
.cmt-container {
    background: #f4f1eb;
    border: 1px solid #6d8c50;
    padding: 20px;
    border-radius: 8px;
    margin-bottom: 20px;
}

.cmt-info {
    font-size: 14px;
    color: #6d8c50;
    margin-bottom: 5px;
}

.cmt-content {
    background: #ffffff;
    border: 1px solid #ccc;
    border-radius: 4px;
    padding: 10px;
    margin-bottom: 20px;
    line-height: 1.4;
}

.cmt-update, .cmt-delete {
    background-color: #6d8c50;
    color: white;
    border: none;
    padding: 5px 10px;
    margin: 5px 5px 10px 0;
    border-radius: 4px;
    cursor: pointer;
}

.cmt-update:hover, .cmt-delete:hover {
    background-color: #2b473e;
}

/* 댓글 작성 컨테이너 */
.cmt-write-container {
    display: flex;
    align-items: center;
    margin-top: 20px;
}

.cmt-write-form {
    flex: 1;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: none;
    margin-right: 10px;
}

.cmt-write-button {
    background-color: #6d8c50;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s;
}

.cmt-write-button:hover {
    background-color: #2b473e;
}

/* 댓글 페이지 네비게이션 */
.cmt-page-container {
    text-align: center;
    margin-top: 20px;
}

.cmt-page-container button {
    background-color: #6d8c50;
    color: white;
    border: none;
    padding: 5px 10px;
    margin: 0 5px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s;
}

.cmt-page-container button:hover {
    background-color: #2b473e;
}

</style>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body>
<div class="content-container">
	<div class="id-style">글번호 : ${rvb.getRvb_id() }</div>
	<div class="view-cnt-style">조회수 : ${rvb.getRvb_view_cnt() }</div>
	<div class="like-cnt-style">추천수 : ${rvb.getRvb_like_cnt() }</div><br>
	<div class="title-style">제목 : ${rvb.getRvb_title() }</div>
	<div class="writer-style">작성자 : ${user.getUser_nickname() }</div>
	<div class="content-style">${rvb.getRvb_content() }
		<div class="like-container">
			<button class="like-button" onclick="clickLike()">추천하기</button>
			<%-- <div class="like-view">${rvb.getRvb_like_cnt() }</div> --%>
		</div>
	</div>
	<div class="reg-date-style">작성일 : ${rvb.getRvb_reg_date() }</div>	
	<div class="react-container">
		<c:if test="${not empty sessionScope.userId && rvb.getUser_id() == sessionScope.userId && 'admin' != sessionScope.userId}"><!-- 세션이 설정되어있고 작성글 아이디와 세션아이디가 같을떄 그리고 운영자가 아닐떄 -->
			<button onclick="location.href='rvBoardUpdateForm.sg?order=${order }&page=${page }&id=${rvb.getRvb_id() }'">수정</button>
			<button style="display: inline-block; background-color: #f44336;" onclick="deleteAction()">삭제</button>
		</c:if>
		<c:if test="${not empty sessionScope.userId && 'admin' == sessionScope.userId}"><!--세션이 설정되어 있고 관리자 일떄  -->
			<button onclick="deleteAction()" style="background-color: #f44336;">삭제</button>
			<c:if test="${rvb.getUser_id() == 'admin'}"><!--관리자글일때만 수정버튼생김  -->
				<button onclick="location.href='rvBoardUpdateForm.sg?page=${page}&id=${rvb.getRvb_id()}'">수정</button>
			</c:if>
		</c:if>
		    <button onclick="location.href='rvBoard.sg?order=${order }&page=${page}'">목록</button> 
	</div>
</div>
<div class="cmt-container"><!--DOM 검색 대상  -->
	<!-- <div class="cmt-info">유저닉네임/생성일자</div>
	<button class="cmt-update" onclick="showCmtUpdateForm()">수정</button>
	<button class="cmt-delete" onclick="cmtDeleteAction()">삭제</button>
	<div class="cmt-content">글내용입니담나어롸먼외라ㅓㅁ노아ㅓ리ㅗㅁ나ㅣ어뢰만ㅇㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹ</div>
	cmt-react-container  
	<div class="cmt-react-container" style="display: none;">
		<textarea class="cmt-react-textarea">ssadasd</textarea>
		<button class="cmt-react-button">댓글수정하기</button>
	</div>
	
	<div class="cmt-info">유저닉네임/생성일자</div>
	<button class="cmt-update" onclick="showCmtUpdateForm()">수정</button>
	<button class="cmt-delete" onclick="cmtDeleteAction()">삭제</button>
	<div class="cmt-content">글내용입니담나어롸먼외라ㅓㅁ노아ㅓ리ㅗㅁ나ㅣ어뢰만ㅇㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹ</div>
	cmt-react-container  
	<div class="cmt-react-container" style="display: none;">
		<textarea class="cmt-react-textarea">ssadasd</textarea>
		<button class="cmt-react-button">댓글수정하기</button>
	</div> -->
</div>
<c:if test="${not empty sessionScope.userId && rvb.getUser_id() != 'admin'}">
	<div class="cmt-write-container">
		<textarea class="cmt-write-form"></textarea>
		<button class="cmt-write-button" onclick="cmtWriteAction()">댓글 작성하기</button>
	</div>
</c:if>
<div class="cmt-page-container"><!--DOM 검색 대상  -->
	<!-- <button class="cmt-prev-style">이전</button>
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
	<button class="cmt-next-style">다음</button> -->
</div>
<script type="text/javascript">
	function clickLike() {
		axios.post("http://localhost:8080/HealthChain/RvbLikeServlet", {
			rvbId: ${rvb.getRvb_id()}
		})
		.then(response => {
			let userId = "<%=(String)session.getAttribute("userId")%>";
			if(userId === "null") {
				alert("비회원은 추천할 수 없습니다");
				return;
			}
			alert("추천완료");
			const likeCntStyle = document.querySelector(".like-cnt-style");
			//const likeView = document.querySelector(".like-view");
			
			likeCntStyle.textContent = "추천수 : " + response.data.likeCnt;
			//likeView.textContent = "" + response.data.likeCnt;
		})
		.catch(error => {
			console.error('clickLike() error : ', error);
		});
	}
	function deleteAction() {
		const result = confirm("정말로 삭제하시겠습니까?");
		if (result) {
	        location.href="rvBoardDelete.sg?order=${order }&page=${page }&id=${rvb.getRvb_id() }";
	    }
	}
</script>
<script type="text/javascript">
	let res;
	let cmtArray = [];
	let cmtUserNickNameArray = [];
	let adminId;
	
	window.onload = function() {
		axios.post("http://localhost:8080/HealthChain/RvbLoadServlet", {
			rvbId: ${rvb.getRvb_id()}
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
			if(sessionStorage.getItem("fromMyPageCmtPageStatus") !== "false") {
				reqCmtPage(sessionStorage.getItem("cmtPage"));
				sessionStorage.setItem("fromMyPageCmtPageStatus", "false");
			}
			//console.log(res);
		})
		.catch(error => {
			console.error('window.onload error : ', error);
		});
	}
	function reqCmtPage(cmtPageParam) {
		axios.post("http://localhost:8080/HealthChain/RvbCmtPageResServlet", {
			rvbId: ${rvb.getRvb_id()},
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
			cmtInfo.textContent = "" + cmtUserNickNameArray[i] + "/" + cmtArray[i].rvb_cmt_date;
			cmtInfo.classList.add("cmt-info");
			
			const cmtUpdate = document.createElement("button");
			cmtUpdate.textContent = "수정";
			cmtUpdate.classList.add("cmt-update");
			cmtUpdate.onclick = function() {
			    showCmtUpdateForm(i, cmtArray[i].rvb_cmt_id, res.cmtPage, cmtArray[i].rvb_cmt_reply);
			};
			
			const cmtDelete = document.createElement("button");
			cmtDelete.textContent = "삭제";
			cmtDelete.classList.add("cmt-delete");
			cmtDelete.onclick = function() {
			    cmtDeleteAction(cmtArray[i].rvb_cmt_id, res.cmtPage);
			};
			//react 컨테이너 넣기
			const cmtReactContainer = document.createElement("div");
			cmtReactContainer.classList.add("cmt-react-container");
			cmtReactContainer.style.display = "none";
			//
			const cmtContent = document.createElement("div");
			cmtContent.textContent = cmtArray[i].rvb_cmt_reply;
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
	function cmtUpdateAction(eleIdxParam, rvbCmtIdParam, cmtPageParam) {
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
		axios.post("http://localhost:8080/HealthChain/RvbCmtUpdateServlet", {
			rvbCmtId: rvbCmtIdParam,
			rvbCmtReply: cmtReactTextArea.value,
			cmtPage: cmtPageParam
		})
		.then(response => {
			reqCmtPage(response.data.cmtPage);
			//console.log("댓글 수정성공");
		})
		.catch(error => {
			console.error('cmtUpdateAction() error : ', error);
		});
	}
	function cmtDeleteAction(rvbCmtIdParam, cmtPageParam) {
		/* console.log("cmtDeleteAction() clicked");
		console.log("frbCmtId : " + frbCmtId);
		console.log("cmtPage : " + cmtPage); */
		
		axios.post("http://localhost:8080/HealthChain/RvbCmtDeleteServlet", {
			rvbCmtId: rvbCmtIdParam,
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
		
		axios.post("http://localhost:8080/HealthChain/RvbCmtWriteServlet", {
			rvbCmtReply: cmtWriteForm.value,
			rvbId: ${rvb.getRvb_id()}
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












<%-- order : ${order }<br>
page : ${page }<br>
rvbId : ${rvb.getRvb_id() }<br>
userId : ${user.getUser_id() }<br> --%>
</body>
</html>