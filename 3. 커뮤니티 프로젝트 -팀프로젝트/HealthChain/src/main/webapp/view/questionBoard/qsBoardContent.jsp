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
/* 전체 배경 및 폰트 */
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
}

/* 글번호 및 조회수 */
.id-style, .view-cnt-style {
    display: inline-block;
    margin-right: 10px;
    font-size: 14px;
    color: #6d8c50;

    padding: 5px 10px;
    border-radius: 4px;
}

/* 제목 및 작성자 */
.title-style, .writer-style {
    font-size: 18px;
    font-weight: bold;
    margin: 10px 0;
    color: #2b473e;

    padding: 5px 10px;
    border-radius: 4px;
    display: inline-block;
}

/* 내용 스타일 */
.content-style {
    margin-top: 15px;
    padding: 15px;
    border-radius: 4px;
    font-size: 16px;
    line-height: 1.6;
    color: #2b473e;
    overflow-wrap: break-word;
}

/* 작성일 */
.reg-date-style {
    font-size: 14px;
    color: #6d8c50;
    text-align: right;
 }

/* 반응 컨테이너 */
.react-container {
   text-align: center;
    margin-top: 20px;
    display: flex;
    justify-content: flex-end; /* 버튼들을 오른쪽으로 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
}

/* 댓글 작성 토글 버튼 */
.cmt-write-toggle-container {
    text-align: right;
    margin-top: 10px;
}

.cmt-write-toggle-button {
    background: #3b82f6;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s;
}

.cmt-write-toggle-button:hover {
    background: #2563eb;
}

/* 댓글 컨테이너 */
.cmt-container {
    background: #f3efe6;
    border: 1px solid #6d8c50;
    padding: 20px;
    border-radius: 8px;
    margin-top: 20px;
}

/* 댓글 정보 */
.cmt-info {
    font-size: 14px;
    color: #6d8c50;
    margin-bottom: 10px;
    display: inline;
}

/* 댓글 내용 */
.cmt-content {
    margin: 10px 0;
    padding: 10px;
    border: 1px solid #6d8c50;
    border-radius: 8px;
    background-color:#F5F6CE;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
    color: #2b473e;
  	overflow-wrap: break-word;
}

/* 댓글 수정 및 삭제 버튼 */
.cmt-update, .cmt-delete {
    background-color: #6d8c50;
    color: white;
    border: none;
    padding: 5px 10px;
    margin: 5px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 12px;
    transition: background-color 0.3s;
}

.cmt-update:hover, .cmt-delete:hover {
    background-color: #2b473e;
}

/* 댓글 작성 폼 */
.cmt-write-container {
    display: none;
    margin-top: 20px;
    padding: 20px;
    border: 1px solid #6d8c50;
    border-radius: 8px;
    background: #f3efe6;
    text-align: center;
}

.cmt-write-form {
    width: 80%;
    height: 120px;
    padding: 10px;
    border: 1px solid #6d8c50;
    border-radius: 4px;
    font-size: 14px;
    color: #2b473e;
    margin-bottom: 10px;
    display: inline-block; /* 같은 줄에 배치 */
    vertical-align: middle; /* 버튼과 수직 정렬 */
    resize: none; 
}

.cmt-write-button {
    margin-left: 10px;
    height: 50px;
    background-color: #6d8c50;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s;
    white-space: nowrap;
    display: inline-block; /* 같은 줄에 배치 */
    vertical-align: middle; /* 버튼과 수직 정렬 */
 
}

.cmt-write-button:hover {
    background-color: #2b473e;
}

/* 댓글 페이지 네비게이션 */
.cmt-page-container {
    text-align: center;
    margin-top: 20px;
}

.cmt-prev-style, .cmt-next-style, .cmt-page-style {
    background-color: #6d8c50;
    color: white;
    border: none;
    padding: 5px 15px;
    margin: 5px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 12px;
    transition: background-color 0.3s;
}

.cmt-prev-style:hover, .cmt-next-style:hover, .cmt-page-style:hover {
    background-color: #2b473e;
}

/* 대댓글 컨테이너 */
.cmt2-container {
    border: 1px solid #6d8c50;
    padding: 20px;
    border-radius: 8px;
    margin-top: 20px;
    text-align: left;
}

/* 대댓글 정보 */
.cmt2-info {
    font-size: 14px;
    color: #6d8c50;
    margin-bottom: 10px;
   position: relative;
	white-space: pre;
	margin-left: 20px;
}


.cmt2-write-form {
    flex: 1; /* 남은 공간을 채움 */
    height: 60px; /* 높이 고정 */
    width: 90%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-bottom: 10px;
    resize: none;
    box-sizing: border-box; /* 패딩과 테두리 포함 */
    display: inline-block;
    vertical-align: middle;
}

.cmt2-write-button {
    background-color: #6d8c50;
    color: white;
    margin-left: 10px; /* 버튼과 입력창 간격 */
    height: 40px; /* 입력창과 같은 높이 */
    border: none;
    padding: 10px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s;
    display: inline-block;
    vertical-align: middle;
}

.cmt2-write-button:hover {
    background-color: #2b473e;
}

/* 대댓글 페이지 네비게이션 */
.cmt2-page-container {
    text-align: center;
    margin-top: 20px;
}

.cmt2-prev-style, .cmt2-next-style, .cmt2-page-style {
    background-color: #6d8c50;
    color: white;
    border: none;
    padding: 5px 15px;
    margin: 5px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 12px;
    transition: background-color 0.3s;
}

.cmt2-prev-style:hover, .cmt2-next-style:hover, .cmt2-page-style:hover {
    background-color: #2b473e;
}

.react-container button {
    background-color: #6d8c50;
    color: white;
    border: none;
    padding: 10px 20px;
     margin: 5px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s;
}

.react-container button:hover {
    background-color: #2b473e;
}

/* 삭제 확인창 */
.react-container .delete-button {
    background-color: #f44336;
}

.react-container .delete-button:hover {
    background-color: #d32f2f;
}

.show-cmt2-button{
  background-color: #6d8c50;
  color: white;
  border: none;
  border-radius: 4px;
  padding: 8px 16px;
  margin: 3px;
  cursor: pointer;
  font-size: 14px;
} 

.cmt2-content {
	background-color: #ffffff;
	border: 1px solid #ccc;
	border-radius: 4px;
	padding: 10px;
	margin-bottom: 20px;
	line-height: 1.4;
	overflow-wrap: break-word;
}

.cmt2-reply, .cmt2-update, .cmt2-delete  {
 background-color: #6d8c50;
  color: white;
  border: none;
  border-radius: 4px;
 padding: 8px 16px;
  margin: 3px;
  cursor: pointer;
  font-size: 10px;
} 

.cmt-react-container {
    display: none;
    margin-top: 20px;
    padding: 20px;
    border: 1px solid #6d8c50;
    border-radius: 8px;
    background: #f3efe6;
   
    
}

.cmt-react-textarea, .cmt2-react-textarea  {
    width: 95%;
    height: 100px;
    padding: 10px;
    border: 1px solid #6d8c50;
    border-radius: 4px;
    font-size: 14px;
    color: #2b473e;
    margin-bottom: 10px;
    display: inline-block; /* 같은 줄에 배치 */
    vertical-align: middle; /* 버튼과 수직 정렬 */
}

.cmt-react-button, .cmt2-react-button {
    background-color: #6d8c50;
    color: white;
    border: none;
    padding: 10px 20px;
     margin: 5px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s;
    display: inline-block; /* 같은 줄에 배치 */
    vertical-align: middle; /* 버튼과 수직 정렬 */
}

.cmt-page-input {
	
}

.cmt2-page-input {
	
}

.cmt-page-search-container {
	margin-top: 10px;
    display: flex;            /* flexbox 사용 */
    justify-content: center;  /* 가로 중앙 정렬 */
    align-items: center;      /* 세로 중앙 정렬 */
}

.cmt2-page-search-container {
	margin-top: 10px;
    display: flex;            /* flexbox 사용 */
    justify-content: center;  /* 가로 중앙 정렬 */
    align-items: center;      /* 세로 중앙 정렬 */
}
</style>
</head>
<body>
<div class="content-container">
	<div class="id-style">글번호 : ${qsb.getQsb_id() }</div>
	<div class="view-cnt-style">조회수 : ${qsb.getQsb_view_cnt() }</div><br>
	<div class="title-style">제목 : ${qsb.getQsb_title() }</div>
	<div class="writer-style">작성자 : ${user.getUser_nickname() }</div>
	<div class="content-style">${qsb.getQsb_content() }</div>
	<div class="reg-date-style">작성일 : ${qsb.getQsb_reg_date() }</div>
	<div class="react-container">
		<c:if test="${not empty sessionScope.userId && qsb.getUser_id() == sessionScope.userId && 'admin' != sessionScope.userId}"><!-- 세션이 설정되어있고 작성글 아이디와 세션아이디가 같을떄 그리고 운영자가 아닐떄 -->
			<button onclick="location.href='qsBoardUpdateForm.sg?page=${page}&id=${qsb.getQsb_id()}'">수정</button>
			<button onclick="deleteAction()" style="display: inline-block; background-color: #f44336;">삭제</button>
		</c:if>
		<c:if test="${not empty sessionScope.userId && 'admin' == sessionScope.userId}"><!--세션이 설정되어 있고 관리자 일떄  -->
			<button onclick="deleteAction()" style="background-color: #f44336;">삭제</button>
			<c:if test="${qsb.getUser_id() == 'admin'}"><!--관리자글일때만 수정버튼생김  -->
				<button onclick="location.href='qsBoardUpdateForm.sg?page=${page}&id=${qsb.getQsb_id()}'">수정</button>
			</c:if>
		</c:if>
		<button onclick="location.href='qsBoard.sg?page=${page}'">목록</button>
	</div>
</div>
<div class="cmt-write-toggle-container">
	<c:if test="${qsb.getUser_id() != 'admin' }">
		<button class="cmt-write-toggle-button" onclick="showCmtWriteForm()">답변</button>
	</c:if>
</div>
<c:if test="${not empty sessionScope.userId}">
	<div class="cmt-write-container">
		<textarea class="cmt-write-form" maxlength="800" placeholder="최대 800자"></textarea>
		<button class="cmt-write-button" onclick="cmtWriteAction()">답변작성하기</button>
	</div>
</c:if>
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
	cmt-react-container  
	--------------------------------------------------------------------------------- 
	<div class="cmt-info">유저닉네임/생성일자</div>
	<button class="cmt-update" onclick="showCmtUpdateForm()">수정</button>
	<button class="cmt-delete" onclick="cmtDeleteAction()">삭제</button>
	<div class="cmt-content">글내용입니담나어롸먼외라ㅓㅁ노아ㅓ리ㅗㅁ나ㅣ어뢰만ㅇㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹ</div>
	cmt-react-container  
	<div class="cmt-react-container" style="display: none;">
		<textarea class="cmt-react-textarea">ssadasd</textarea>
		<button class="cmt-react-button">댓글수정하기</button>
	</div>
	cmt-react-container -->
</div>
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
<div class="cmt-page-search-container">
	검색 폐이지 : <input type="number" class="cmt-page-input">
	<button onclick="moveToCmtPage()">이동</button>
</div>
<script type="text/javascript">
	function deleteAction() {
		const result = confirm("정말로 삭제하시겠습니까?");
		if (result) {
	        location.href="qsBoardDelete.sg?page=${page}&id=${qsb.getQsb_id()}";
	    }
	}
	function showCmtWriteForm() {
		axios.get("http://localhost:8080/HealthChain/QsbCheckDoctorServlet")
		.then(response => {
			if(response.data.result === 0) {
				alert("로딩에러");
				return;
			}
			else if(response.data.result === -1) {
				alert("의사회원만 답변할 수 있습니다");
				return;
			}
			else if(response.data.result === -2) {
				alert("비회원은 답변할 수 없습니다");
				return;
			}
			
			const container = document.querySelector(".cmt-write-container");
			if(container.style.display === "block") {
				container.style.display = "none";
			} else {
				container.style.display = "block";
			}
		})
		.catch(error => {
			console.error('isDoctor error : ', error);
			result = 0;
		});
	}
	function moveToCmtPage() {
		const inputPage = document.querySelector(".cmt-page-input").value;
		
		if (inputPage === "") {
			alert("이동할 폐이지를 입력하세요");
		} else {
			reqCmtPage(inputPage, "displayPage");
		}
	}
	function moveToCmt2Page(eleIdxParam) {
		const eleIdx = eleIdxParam;
		const inputPage = document.querySelectorAll(".cmt2-page-input")[eleIdx].value;
		
		if (inputPage === "") {
			alert("이동할 폐이지를 입력하세요");
		} else {
			reqCmt2Page(eleIdx, inputPage, "displayPage");
		}
	}
</script>
<script type="text/javascript">
	let res;
	let cmtArray = [];
	let cmtUserNickNameArray = [];
	let adminId;
	
	window.onload = function loadCmt() {
		axios.post("http://localhost:8080/HealthChain/QsbLoadServlet", {
			qsbId: ${qsb.getQsb_id()}
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
			
			loadCmt2();
			
			const pageElements = document.querySelectorAll(".cmt-page-style");
			for (const element of pageElements) {
				if ("1" === element.textContent) {
					element.style.textDecoration = "underline";
				}
			}
			//console.log(res);
		})
		.catch(error => {
			console.error('window.onload error : ', error);
		});
	}
	function reqCmtPage(cmtPageParam, actionParam) {
		axios.post("http://localhost:8080/HealthChain/QsbCmtPageResServlet", {
			qsbId: ${qsb.getQsb_id()},
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
			
			if (actionParam === "displayPage") {
				const pageElements = document.querySelectorAll(".cmt-page-style");
				
				for (const element of pageElements) {
					if ("" + res.cmtPage === element.textContent) {
						element.style.textDecoration = "underline";
					}
				}
			} 
			else if (actionParam === "cmtDelete") {
				if(res.cmtMaxPage < cmtPageParam) {
					reqCmtPage(res.cmtMaxPage, "displayPage");
					return;
				}
				
				const pageElements = document.querySelectorAll(".cmt-page-style");
				
				for (const element of pageElements) {
					if ("" + res.cmtPage === element.textContent) {
						element.style.textDecoration = "underline";
					}
				}
			}
			
			loadCmt2();
			
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
			    reqCmtPage(res.cmtPrevPage, "displayPage");
			};
			container.appendChild(prevButton);
		}
		for(let i = res.cmtStartPage; i <= res.cmtEndPage; i++) {
			const pageButton = document.createElement("button");
			pageButton.textContent = "" + i;
			pageButton.classList.add("cmt-page-style");
			pageButton.onclick = function() {
			    reqCmtPage(i, "displayPage");
			};
			container.appendChild(pageButton);
		}
		if(res.cmtEndPage !== res.cmtMaxPage) {
			const nextButton = document.createElement("button");
			nextButton.textContent = "다음";
			nextButton.classList.add("cmt-next-style");
			nextButton.onclick = function() {
			    reqCmtPage(res.cmtNextPage, "displayPage");
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
			cmtInfo.textContent = "" + cmtUserNickNameArray[i];
			cmtInfo.classList.add("cmt-info");
			
			const cmtUpdate = document.createElement("button");
			cmtUpdate.textContent = "수정";
			cmtUpdate.classList.add("cmt-update");
			cmtUpdate.onclick = function() {
			    showCmtUpdateForm(i, cmtArray[i].qsb_cmt_id, res.cmtPage, cmtArray[i].qsb_cmt_reply);
			};
			
			const cmtDelete = document.createElement("button");
			cmtDelete.textContent = "삭제";
			cmtDelete.classList.add("cmt-delete");
			cmtDelete.onclick = function() {
			    cmtDeleteAction(cmtArray[i].qsb_cmt_id, res.cmtPage);
			};
			//react 컨테이너 넣기
			const cmtReactContainer = document.createElement("div");
			cmtReactContainer.classList.add("cmt-react-container");
			cmtReactContainer.style.display = "none";
			//
			const cmtContent = document.createElement("div");
			cmtContent.innerHTML = "" + cmtArray[i].qsb_cmt_reply + "<p></p>" + cmtArray[i].qsb_cmt_date;
			cmtContent.classList.add("cmt-content");
			
			////////////////////////////////////////////////////////////cmt 연결 코드
			const cmtActionContainer = document.createElement("div");
			cmtActionContainer.classList.add("cmt-action-container");
			
			const showCmt2Button = document.createElement("button");
			showCmt2Button.textContent = "댓글보기";
			showCmt2Button.classList.add("show-cmt2-button");
			showCmt2Button.onclick = function() {
			    showCmt2(i);
			};
			cmtActionContainer.appendChild(showCmt2Button);
			
			const cmt2Container = document.createElement("div");
			cmt2Container.classList.add("cmt2-container");
			cmt2Container.textContent = "cmt2Container";
			cmt2Container.style.display = "none";
			
			const cmt2PageContainer = document.createElement("div");
			cmt2PageContainer.classList.add("cmt2-page-container");
			cmt2PageContainer.textContent = "cmt2PageContainer";
			cmt2PageContainer.style.display = "none";
			
			/////////////////////////////////////////////////////////////
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
			container.appendChild(cmtActionContainer);//////cmt 연결 코드
			container.appendChild(cmt2Container);//////cmt 연결 코드
			container.appendChild(cmt2PageContainer);//////cmt 연결 코드
		}
	}
	function showCmt2(eleIdxParam) {
		const eleIdx = eleIdxParam;
		const cmt2Containers = document.querySelectorAll(".cmt2-container");
		const cmt2PageContainers = document.querySelectorAll(".cmt2-page-container");
		
		if(cmt2Containers[eleIdx].style.display === "none") {
			cmt2Containers[eleIdx].style.display = "block";
		} else {
			cmt2Containers[eleIdx].style.display = "none";
		}
		
		if(cmt2PageContainers[eleIdx].style.display === "none") {
			cmt2PageContainers[eleIdx].style.display = "block";
		} else {
			cmt2PageContainers[eleIdx].style.display = "none";
		}
	}
	function showCmtUpdateForm(eleIdxParam, qsbCmtIdParam, cmtPageParam, qsbCmtReplyParam) {
		const eleIdx = eleIdxParam;
		const qsbCmtId = qsbCmtIdParam;
		const cmtPage = cmtPageParam;
		const qsbCmtReply = qsbCmtReplyParam;
		const cmtReactContainers = document.querySelectorAll(".cmt-react-container");
		
		cmtReactContainers[eleIdx].innerHTML = "";
		
		const cmtReactTextArea = document.createElement("textarea");
		cmtReactTextArea.classList.add("cmt-react-textarea");
		cmtReactTextArea.textContent = qsbCmtReply;
		cmtReactTextArea.setAttribute("maxlength", "800");
		cmtReactTextArea.setAttribute("placeholder", "최대 800자");
		cmtReactContainers[eleIdx].appendChild(cmtReactTextArea);
		
		const cmtReactButton = document.createElement("button");
		cmtReactButton.classList.add("cmt-react-button");
		cmtReactButton.textContent = "답변수정하기";
		cmtReactButton.onclick = function() {
			cmtUpdateAction(eleIdx, qsbCmtId, cmtPage);
		}
		cmtReactContainers[eleIdx].appendChild(cmtReactButton);
		
		if(cmtReactContainers[eleIdx].style.display === "block") {
			cmtReactContainers[eleIdx].style.display = "none";
		} else {
			cmtReactContainers[eleIdx].style.display = "block";
		}
		//console.log("showCmtUpdateForm() clicked");
		/* console.log("eleIdx : " + eleIdx);
		console.log("frbCmtId : " + frbCmtId);
		console.log("cmtPage : " + cmtPage); */
	}
	function cmtUpdateAction(eleIdxParam, qsbCmtIdParam, cmtPageParam) {
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
		axios.post("http://localhost:8080/HealthChain/QsbCmtUpdateServlet", {
			qsbCmtId: qsbCmtIdParam,
			qsbCmtReply: cmtReactTextArea.value,
			cmtPage: cmtPageParam
		})
		.then(response => {
			reqCmtPage(response.data.cmtPage, "displayPage");
			//console.log("댓글 수정성공");
		})
		.catch(error => {
			console.error('cmtDeleteAction() error : ', error);
		});
	}
	function cmtDeleteAction(qsbCmtIdParam, cmtPageParam) {
		/* console.log("cmtDeleteAction() clicked");
		console.log("frbCmtId : " + frbCmtId);
		console.log("cmtPage : " + cmtPage); */
		
		axios.post("http://localhost:8080/HealthChain/QsbCmtDeleteServlet", {
			qsbCmtId: qsbCmtIdParam,
			cmtPage: cmtPageParam
		})
		.then(response => {
			reqCmtPage(response.data.cmtPage, "cmtDelete");
			//console.log("댓글 삭제성공");
		})
		.catch(error => {
			console.error('cmtDeleteAction() error : ', error);
		});
	}
	async function cmtWriteAction() {
		const cmtWriteForm = document.querySelector(".cmt-write-form");
		const isActivityBlocked = await cmtUserActivityChk() + "";
		
		//console.log("cmtWriteAction() clicked");
		//console.log("cmtWriteForm value : " + cmtWriteForm.value);
		
		if(isActivityBlocked === "true") {
			alert("활동이 정지된 상태입니다");
			return;
		}
		
		if(cmtWriteForm.value === "") {
			alert("작성할 답변을 입력해주세요");
			return;
		}
		
		await axios.post("http://localhost:8080/HealthChain/QsbCmtWriteServlet", {
			qsbCmtReply: cmtWriteForm.value,
			qsbId: ${qsb.getQsb_id()}
		})
		.then(response => {
			cmtWriteForm.value = "";
			reqCmtPage(1, "displayPage");
			//console.log("답변 작성성공");
		})
		.catch(error => {
			console.error('cmtWriteAction() error : ', error);
		});
	}
	async function cmtUserActivityChk() {
		let response = null;
		
		try {
			response = await axios.post("http://localhost:8080/HealthChain/QsbCmtCheckUserActivityServlet", {
				id : "<%=(String)session.getAttribute("userId")%>"
			});
			return response.data.result;
		}
		catch(error) {
			return "error";
		}
	}
</script>
<script type="text/javascript">
	let res2 = [];
	let cmt2Array = [];
	let cmt2UserNickNameArray = [];
	
	async function loadCmt2() {
		cmt2Array = new Array(cmtArray.length);
		cmt2UserNickNameArray = new Array(cmtArray.length);
		res2 = new Array(cmtArray.length);
		
		const showCmt2Buttons = document.querySelectorAll(".show-cmt2-button");
		
		for(let i = 0; i < cmtArray.length; i++) {
			await axios.post("http://localhost:8080/HealthChain/QsbLoadCmt2Servlet", {
				qsbId: ${qsb.getQsb_id()},
				qsbCmtId: cmtArray[i].qsb_cmt_id
			})
			.then(response => {
				res2[i] = response.data;
				cmt2Array[i] = res2[i].cmt2List;
				cmt2UserNickNameArray[i] = res2[i].cmt2UserNickNameList;
				
				clearCmt2PageContainer(i);
				insertCmt2PageButton(i);
				insertCmt2PageSearchContainer(i);
				
				clearCmt2(i);
				insertCmt2(i);
				
				const cmt2PageContainer = document.querySelectorAll(".cmt2-page-container")[i];
				const pageElements = cmt2PageContainer.querySelectorAll(".cmt2-page-style");
				for (const element of pageElements) {
					if ("1" === element.textContent) {
						element.style.textDecoration = "underline";
					}
				}
				
				showCmt2Buttons[i].textContent += "(" + res2[i].totalCmt2Num + ")";
				
				if(i === cmtArray.length - 1) {
					if(sessionStorage.getItem("fromMyPageCmtPageStatus") !== "false" && sessionStorage.getItem("fromMyPageCmtPageStatus") !== null) {
						reqCmtPage(sessionStorage.getItem("cmtPage"), "displayPage");
						sessionStorage.setItem("fromMyPageCmtPageStatus", "false");
						//////////////////////////////////////////////////////////////////////////////
						const targetQsbCmtId = parseInt(sessionStorage.getItem("qsbCmtId"));
						const checkInterval = setInterval(() => {
							 for(let i = 0; i < cmtArray.length; i++) {
								 if(targetQsbCmtId === cmtArray[i].qsb_cmt_id) {
									 let isUndefined = true;
									 
									 const undefinedCheckInterval = setInterval(() => {
										 if(res2[i] !== undefined && res !== undefined) {
											 isUndefined = false;
											 reqCmt2Page(i, sessionStorage.getItem("cmt2Page"), "myPage");
										 }
										 if(isUndefined === false) {
											 clearInterval(undefinedCheckInterval);
										 }
									 }, 0);
									 clearInterval(checkInterval);
								 }
							 }
						}, 0);
					}
				}
			})
			.catch(error => {
				console.error('window.onload error : ', error);
			});
		}
		
		//console.log("res2 : ", res2);
		//console.log("cmt2Array : ", cmt2Array);
		//console.log("cmt2UserNickNameArray : ", cmt2UserNickNameArray);
	}
	function reqCmt2Page(eleIdxParam, cmt2PageParam, actionParam) {
		const eleIdx = eleIdxParam;//해당 cmt2의 eleIdx
		const action = actionParam;

		axios.post("http://localhost:8080/HealthChain/QsbCmt2PageResServlet", {
			qsbId: ${qsb.getQsb_id()},
			qsbCmtId: cmtArray[eleIdx].qsb_cmt_id,
			cmt2Page: cmt2PageParam
		})
		.then(response => {
			res2[eleIdx] = response.data;
			cmt2Array[eleIdx] = res2[eleIdx].cmt2List;
			cmt2UserNickNameArray[eleIdx] = res2[eleIdx].cmt2UserNickNameList;
			
			clearCmt2PageContainer(eleIdx);
			insertCmt2PageButton(eleIdx);
			insertCmt2PageSearchContainer(eleIdx);
			
			clearCmt2(eleIdx);
			insertCmt2(eleIdx);
			
			if (action === "cmt2Write") {
				const ShowCmt2Buttons = document.querySelectorAll(".show-cmt2-button");
				ShowCmt2Buttons[eleIdx].textContent = "댓글보기" + "(" + res2[eleIdx].totalCmt2Num + ")";
				reqCmt2Page(eleIdxParam, cmt2PageParam, "displayPage");
			} else if (action === "cmt2Delete") {
				const ShowCmt2Buttons = document.querySelectorAll(".show-cmt2-button");
				ShowCmt2Buttons[eleIdx].textContent = "댓글보기" + "(" + res2[eleIdx].totalCmt2Num + ")";
				
				if (res2[eleIdx].cmt2MaxPage < cmt2PageParam) {
					reqCmt2Page(eleIdx, res2[eleIdx].cmt2MaxPage, "displayPage");
				} else {
					reqCmt2Page(eleIdxParam, cmt2PageParam, "displayPage");
				}
				//console.log("cmt2PageParam : ", cmt2PageParam);
				//console.log("cmt2MaxPage : ", res2[eleIdx].cmt2MaxPage);
			} else if (action === "cmt2Reply") {
				const ShowCmt2Buttons = document.querySelectorAll(".show-cmt2-button");
				ShowCmt2Buttons[eleIdx].textContent = "댓글보기" + "(" + res2[eleIdx].totalCmt2Num + ")";
				reqCmt2Page(eleIdxParam, cmt2PageParam, "displayPage");
			} else if (action === "myPage") {
				const ShowCmt2Buttons = document.querySelectorAll(".show-cmt2-button");
				ShowCmt2Buttons[eleIdx].click();
				reqCmt2Page(eleIdxParam, cmt2PageParam, "displayPage");
			} else if (action === "displayPage") {
				const cmt2PageContainer = document.querySelectorAll(".cmt2-page-container")[eleIdx];
				const pageElements = cmt2PageContainer.querySelectorAll(".cmt2-page-style");
				
				for (const element of pageElements) {
					if ("" + res2[eleIdx].cmt2Page === element.textContent) {
						element.style.textDecoration = "underline";
					}
				}
			}
		})
		.catch(error => {
			console.error('reqCmt2Page error : ', error);
		});
		
		//console.log("res2 : ", res2);
		//console.log("cmt2Array : ", cmt2Array);
		//console.log("cmt2UserNickNameArray : ", cmt2UserNickNameArray);
	}
	function clearCmt2PageContainer(eleIdxParam) {
		const eleIdx = eleIdxParam;
		const cmt2PageContainers = document.querySelectorAll(".cmt2-page-container");
		cmt2PageContainers[eleIdx].innerHTML = "";
	}
	function insertCmt2PageButton(eleIdxParam) {
		const eleIdx = eleIdxParam;
		const cmt2PageContainers = document.querySelectorAll(".cmt2-page-container");
		
		if(res2[eleIdx].cmt2StartPage !== 1) {
			const prevButton = document.createElement("button");
			prevButton.textContent = "이전";
			prevButton.classList.add("cmt2-prev-style");
			prevButton.onclick = function() {
			    reqCmt2Page(eleIdx, res2[eleIdx].cmt2PrevPage, "displayPage");
			};
			cmt2PageContainers[eleIdx].appendChild(prevButton);
		}
		for(let i = res2[eleIdx].cmt2StartPage; i <= res2[eleIdx].cmt2EndPage; i++) {
			const pageButton = document.createElement("button");
			pageButton.textContent = "" + i;
			pageButton.classList.add("cmt2-page-style");
			pageButton.onclick = function() {
			    reqCmt2Page(eleIdx, i, "displayPage");
			};
			cmt2PageContainers[eleIdx].appendChild(pageButton);
		}
		if(res2[eleIdx].cmt2EndPage !== res2[eleIdx].cmt2MaxPage) {
			const nextButton = document.createElement("button");
			nextButton.textContent = "다음";
			nextButton.classList.add("cmt2-next-style");
			nextButton.onclick = function() {
			    reqCmt2Page(eleIdx, res2[eleIdx].cmt2NextPage, "displayPage");
			};
			cmt2PageContainers[eleIdx].appendChild(nextButton);
		}
	}
	function clearCmt2(eleIdxParam) {
		const eleIdx = eleIdxParam;
		const cmt2Containers = document.querySelectorAll(".cmt2-container");
		cmt2Containers[eleIdx].innerHTML = "";
	}
	function insertCmt2(eleIdxParam) {
		const eleIdx = eleIdxParam;
		const cmt2Containers = document.querySelectorAll(".cmt2-container");
		const userId = "<%=(String)session.getAttribute("userId")%>";
		
		if(userId != 'null') {
			const cmt2WriteContainer = document.createElement("div");
			cmt2WriteContainer.classList.add("cmt2-write-container");
			
			const cmt2WriteForm = document.createElement("textarea");
			cmt2WriteForm.setAttribute("maxlength", "300");
			cmt2WriteForm.setAttribute("placeholder", "최대 300자");
			cmt2WriteForm.classList.add("cmt2-write-form");
			
			const cmt2WriteButton = document.createElement("button");
			cmt2WriteButton.classList.add("cmt2-write-button");
			cmt2WriteButton.textContent = "댓글작성하기";
			cmt2WriteButton.onclick = function() {
				cmt2WriteAction(eleIdx, cmtArray[eleIdx].qsb_cmt_id);
			}
			
			cmt2WriteContainer.appendChild(cmt2WriteForm);
			cmt2WriteContainer.appendChild(cmt2WriteButton);
			cmt2Containers[eleIdx].appendChild(cmt2WriteContainer);
		}
		
		for (let i = 0; i < cmt2Array[eleIdx].length; i++) {
			const cmt2Info = document.createElement("div");
			cmt2Info.textContent = "";
			for(let j = 0; j < cmt2Array[eleIdx][i].qsb_cmt2_level; j++) {
				cmt2Info.textContent += "  ";
			}
			for(let j = 0; j < cmt2Array[eleIdx][i].qsb_cmt2_level; j++) {
				cmt2Info.textContent += "↪";
			}
			cmt2Info.textContent += cmt2UserNickNameArray[eleIdx][i];
			cmt2Info.textContent += "/" + cmt2Array[eleIdx][i].qsb_cmt2_date;
			cmt2Info.classList.add("cmt2-info");
			
			const cmt2Reply = document.createElement("button");
			cmt2Reply.textContent = "답변";
			cmt2Reply.classList.add("cmt2-reply");
			cmt2Reply.onclick = function() {
			    showCmt2ReplyForm(eleIdx, i, res2[eleIdx].cmt2Page);
			};
			
			const cmt2Update = document.createElement("button");
			cmt2Update.textContent = "수정";
			cmt2Update.classList.add("cmt2-update");
			cmt2Update.onclick = function() {
			    showCmt2UpdateForm(eleIdx, i, res2[eleIdx].cmt2Page);
			};
			
			const cmt2Delete = document.createElement("button");
			cmt2Delete.textContent = "삭제";
			cmt2Delete.classList.add("cmt2-delete");
			cmt2Delete.onclick = function() {
			    cmt2DeleteAction(eleIdx, i, res2[eleIdx].cmt2Page);
			};
			
			const cmt2ReactContainer = document.createElement("div");
			cmt2ReactContainer.classList.add("cmt2-react-container");
			cmt2ReactContainer.style.display = "none";
			
			const cmt2Content = document.createElement("div");
			cmt2Content.textContent = "";
			for(let j = 0; j < cmt2Array[eleIdx][i].qsb_cmt2_level; j++) {
				cmt2Content.textContent += "  ";
			}
			for(let j = 0; j < cmt2Array[eleIdx][i].qsb_cmt2_level; j++) {
				cmt2Content.textContent += " ";
			}
			cmt2Content.textContent += "" + cmt2Array[eleIdx][i].qsb_cmt2_reply;
			cmt2Content.classList.add("cmt2-content");
			
			cmt2Containers[eleIdx].appendChild(cmt2Info);
			if(userId !== 'null') {
				cmt2Containers[eleIdx].appendChild(cmt2Reply);
				if(cmt2Array[eleIdx][i].user_id === userId) {
					cmt2Containers[eleIdx].appendChild(cmt2Update);
				}
				if(cmt2Array[eleIdx][i].user_id === userId || userId === adminId) {
					cmt2Containers[eleIdx].appendChild(cmt2Delete);
				}
			}
			cmt2Containers[eleIdx].appendChild(cmt2Content);
			cmt2Containers[eleIdx].appendChild(cmt2ReactContainer);
			
			//console.log(cmt2Array[eleIdx][i]);
		}
	}
	function insertCmt2PageSearchContainer(eleIdxParam) {
		const eleIdx = eleIdxParam;
		const cmt2PageContainers = document.querySelectorAll(".cmt2-page-container");
		const cmt2PageSearchContainer = document.createElement("div");
		const cmt2PageInput = document.createElement("input");
		const cmt2PageMoveButton = document.createElement("button");
		
		cmt2PageSearchContainer.textContent = "검색폐이지 : ";
		cmt2PageSearchContainer.classList.add("cmt2-page-search-container");
		
		cmt2PageInput.setAttribute("type", "number");
		cmt2PageInput.classList.add("cmt2-page-input");
		
		cmt2PageMoveButton.textContent = "이동";
		cmt2PageMoveButton.onclick = function() {
		    moveToCmt2Page(eleIdx);
		};
		
		cmt2PageSearchContainer.appendChild(cmt2PageInput);
		cmt2PageSearchContainer.appendChild(cmt2PageMoveButton);
		cmt2PageContainers[eleIdx].appendChild(cmt2PageSearchContainer);
	}
	function showCmt2ReplyForm(eleIdxParam, ele2IdxParam, cmt2PageParam) {
		const eleIdx = eleIdxParam;
		const ele2Idx = ele2IdxParam;
		const cmt2Page = cmt2PageParam;
		const buttonText = "댓글답변하기";
		
		const cmt2Containers = document.querySelectorAll(".cmt2-container");
		const cmt2ReactContainers = cmt2Containers[eleIdx].querySelectorAll(".cmt2-react-container");
		const cmt2Contents = cmt2Containers[eleIdx].querySelectorAll(".cmt2-content");
		
		if(cmt2ReactContainers[ele2Idx].style.display === "block") {
			const prevButtonText = cmt2ReactContainers[ele2Idx].querySelector(".cmt2-react-button").textContent;
			
			if(prevButtonText !== buttonText) {
				cmt2ReactContainers[ele2Idx].style.display = "none";
				showCmt2ReplyForm(eleIdx, ele2Idx, cmt2Page);
				return;
			}
			
			//console.log("prevButtonText : ", prevButtonText);
			
			cmt2ReactContainers[ele2Idx].style.display = "none";
		} else {
			cmt2ReactContainers[ele2Idx].innerHTML = "";
			
			const cmt2ReactTextArea = document.createElement("textarea");
			cmt2ReactTextArea.classList.add("cmt2-react-textarea");
			cmt2ReactTextArea.setAttribute("maxlength", "300");
			cmt2ReactTextArea.setAttribute("placeholder", "최대 300자");
			
			const cmt2ReactButton = document.createElement("button");
			cmt2ReactButton.classList.add("cmt2-react-button");
			cmt2ReactButton.textContent = buttonText;
			cmt2ReactButton.onclick = function() {
				cmt2ReplyAction(eleIdx, ele2Idx, cmt2Page);
			};
			
			cmt2ReactContainers[ele2Idx].appendChild(cmt2ReactTextArea);
			cmt2ReactContainers[ele2Idx].appendChild(cmt2ReactButton);
			
			cmt2ReactContainers[ele2Idx].style.display = "block";
		}
		
		//console.log("eleIdx : ", eleIdx);
		//console.log("ele2Idx : ", ele2Idx);
		//console.log("qsbCmtId : ", cmtArray[eleIdx].qsb_cmt_id);
		//console.log("qsbCmt2Id : ", cmt2Array[eleIdx][ele2Idx].qsb_cmt2_id);
		//console.log("cmt2Page : ", cmt2Page);
		//console.log("=========================================================");
	}
	function showCmt2UpdateForm(eleIdxParam, ele2IdxParam, cmt2PageParam) {
		const eleIdx = eleIdxParam;
		const ele2Idx = ele2IdxParam;
		const cmt2Page = cmt2PageParam;
		const buttonText = "댓글수정하기";
		
		const cmt2Containers = document.querySelectorAll(".cmt2-container");
		const cmt2ReactContainers = cmt2Containers[eleIdx].querySelectorAll(".cmt2-react-container");
		const cmt2Contents = cmt2Containers[eleIdx].querySelectorAll(".cmt2-content");
		
		if(cmt2ReactContainers[ele2Idx].style.display === "block") {
			const prevButtonText = cmt2ReactContainers[ele2Idx].querySelector(".cmt2-react-button").textContent;
			
			if(prevButtonText !== buttonText) {
				cmt2ReactContainers[ele2Idx].style.display = "none";
				showCmt2UpdateForm(eleIdx, ele2Idx, cmt2Page);
				return;
			}
			
			//console.log("prevButtonText : ", prevButtonText);
			
			cmt2ReactContainers[ele2Idx].style.display = "none";
		} else {
			cmt2ReactContainers[ele2Idx].innerHTML = "";
			
			const cmt2ReactTextArea = document.createElement("textarea");
			cmt2ReactTextArea.classList.add("cmt2-react-textarea");
			cmt2ReactTextArea.setAttribute("maxlength", "300");
			cmt2ReactTextArea.setAttribute("placeholder", "최대 300자");
			cmt2ReactTextArea.textContent = cmt2Contents[ele2Idx].textContent;
			
			const cmt2ReactButton = document.createElement("button");
			cmt2ReactButton.classList.add("cmt2-react-button");
			cmt2ReactButton.textContent = buttonText;
			cmt2ReactButton.onclick = function() {
				cmt2UpdateAction(eleIdx, ele2Idx, cmt2Page);
			};
			
			cmt2ReactContainers[ele2Idx].appendChild(cmt2ReactTextArea);
			cmt2ReactContainers[ele2Idx].appendChild(cmt2ReactButton);
			
			cmt2ReactContainers[ele2Idx].style.display = "block";
		}
		
		//console.log("eleIdx : ", eleIdx);
		//console.log("ele2Idx : ", ele2Idx);
		//console.log("qsbCmtId : ", cmtArray[eleIdx].qsb_cmt_id);
		//console.log("qsbCmt2Id : ", cmt2Array[eleIdx][ele2Idx].qsb_cmt2_id);
		//console.log("cmt2Page : ", cmt2Page);
		//console.log("=========================================================");
	}
	async function cmt2ReplyAction(eleIdxParam, ele2IdxParam, cmt2PageParam) {
		const eleIdx = eleIdxParam;
		const ele2Idx = ele2IdxParam;
		const cmt2Page = cmt2PageParam;
		
		const cmt2Containers = document.querySelectorAll(".cmt2-container");
		const cmt2ReactContainers = cmt2Containers[eleIdx].querySelectorAll(".cmt2-react-container");
		const cmt2ReactTextArea = cmt2ReactContainers[ele2Idx].querySelector(".cmt2-react-textarea");
		
		const isActivityBlocked = await cmt2ReplyUserActivityChk() + "";
		
		if(isActivityBlocked === "true") {
			alert("활동이 정지된 상태입니다");
			return;
		}
		
		if (cmt2ReactTextArea.value === "") {
			alert("답변할 내용을 입력해주세요");
			return;
		}
		
		await axios.post("http://localhost:8080/HealthChain/QsbCmt2ReplyServlet", {
			qsbId: ${qsb.getQsb_id()},
			qsbCmtId: cmt2Array[eleIdx][ele2Idx].qsb_cmt_id,
			lvl: cmt2Array[eleIdx][ele2Idx].qsb_cmt2_level,
			targetId: cmt2Array[eleIdx][ele2Idx].qsb_cmt2_id,
			qsbCmt2Reply: cmt2ReactTextArea.value,
			cmt2Page : cmt2PageParam
		})
		.then(response => {
			reqCmt2Page(eleIdx, response.data.cmt2Page, "cmt2Reply");
		})
		.catch(error => {
			console.error('cmt2UpdateAction() error : ', error);
		});
		
		//console.log("qsbCmt2Id : ", cmt2Array[eleIdx][ele2Idx].qsb_cmt2_id);
		//console.log("qsbCmt2Level : ", cmt2Array[eleIdx][ele2Idx].qsb_cmt2_level);
		//console.log("qsbCmt2ParentId : ", cmt2Array[eleIdx][ele2Idx].qsb_cmt2_parent_id);
		//console.log(cmt2Array[eleIdx][ele2Idx]);
		//console.log("qsbCmt2Reply : ", cmt2ReactTextArea.value);
		//console.log("cmt2Page : ", cmt2Page);
		//console.log("=========================================");
	}
	async function cmt2ReplyUserActivityChk() {
		let response = null;
		
		try {
			response = await axios.post("http://localhost:8080/HealthChain/QsbCmt2ReplyCheckUserActivityServlet", {
				id : "<%=(String)session.getAttribute("userId")%>"
			});
			return response.data.result;
		}
		catch(error) {
			return "error";
		}
	}
	function cmt2UpdateAction(eleIdxParam, ele2IdxParam, cmt2PageParam) {
		const eleIdx = eleIdxParam;
		const ele2Idx = ele2IdxParam;
		
		const cmt2Containers = document.querySelectorAll(".cmt2-container");
		const cmt2ReactContainers = cmt2Containers[eleIdx].querySelectorAll(".cmt2-react-container");
		const cmt2ReactTextArea = cmt2ReactContainers[ele2Idx].querySelector(".cmt2-react-textarea");
		
		if(cmt2ReactTextArea.value === "") {
			alert("수정할 댓글을 입력하세요");
			return;
		}
		
		axios.post("http://localhost:8080/HealthChain/QsbCmt2UpdateServlet", {
			qsbCmt2Id: cmt2Array[eleIdx][ele2Idx].qsb_cmt2_id,
			qsbCmt2Reply: cmt2ReactTextArea.value,
			cmt2Page : cmt2PageParam
		})
		.then(response => {
			reqCmt2Page(eleIdx, response.data.cmt2Page, "displayPage");
		})
		.catch(error => {
			console.error('cmt2UpdateAction() error : ', error);
		});
		
		//console.log("qsbCmt2Id : ", cmt2Array[eleIdx][ele2Idx].qsb_cmt2_id);
		//console.log("qsbCmt2Reply : ", cmt2ReactTextArea.value);
		//console.log("cmt2Page : ", cmt2Page);
	}
	function cmt2DeleteAction(eleIdxParam, ele2IdxParam, cmt2PageParam) {
		const eleIdx = eleIdxParam;
		const ele2Idx = ele2IdxParam;
		
		axios.post("http://localhost:8080/HealthChain/QsbCmt2DeleteServlet", {
			qsbCmt2Id: cmt2Array[eleIdx][ele2Idx].qsb_cmt2_id,
			cmt2Page: cmt2PageParam
		})
		.then(response => {
			reqCmt2Page(eleIdx, response.data.cmt2Page, "cmt2Delete");
		})
		.catch(error => {
			console.error('cmt2DeleteAction() error : ', error);
		});
		
		//console.log("qsbCmt2Id : ", cmt2Array[eleIdx][ele2Idx].qsb_cmt2_id);
		//console.log("cmt2Page : ", cmt2PageParam);
	}
	async function cmt2WriteAction(eleIdxParam, qsbCmtIdParam) {
		const eleIdx = eleIdxParam;
		const cmt2WriteForms = document.querySelectorAll(".cmt2-write-form");
		const showCmt2Buttons = document.querySelectorAll(".show-cmt2-button");
		const isActivityBlocked = await cmt2UserActivityChk() + "";
		
		if(isActivityBlocked === "true") {
			alert("활동이 정지된 상태입니다");
			return;
		}
		
		if(cmt2WriteForms[eleIdx].value === "") {
			alert("댓글을 작성해 주세요");
			return;
		}
		
		await axios.post("http://localhost:8080/HealthChain/QsbCmt2WriteServlet", {
			qsbId: ${qsb.getQsb_id()},
			qsbCmtId: qsbCmtIdParam,
			qsbCmt2Reply: cmt2WriteForms[eleIdx].value
		})
		.then(response => {
			cmt2WriteForms[eleIdx].value = "";
			reqCmt2Page(eleIdx, 1, "cmt2Write");
		})
		.catch(error => {
			console.error('cmt2WriteAction() error : ', error);
		});
	}
	async function cmt2UserActivityChk() {
		let response = null;
		
		try {
			response = await axios.post("http://localhost:8080/HealthChain/QsbCmt2CheckUserActivityServlet", {
				id : "<%=(String)session.getAttribute("userId")%>"
			});
			return response.data.result;
		}
		catch(error) {
			return "error";
		}
	}
</script>
















<%-- <br>
qsb_id : ${qsb.getQsb_id() }<br>
user_id : ${user.getUser_id() }<br>
page : ${page }<br>
drCode : ${user.getDr_lic_code() }<br> --%>
</body>
</html>