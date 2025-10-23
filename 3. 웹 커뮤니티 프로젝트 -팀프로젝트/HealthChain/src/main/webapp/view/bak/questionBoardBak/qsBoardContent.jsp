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
/*================================================cmt part ================================================ */
.cmt-container {
	background: #dbbba0;
	border: 1px solid black;
	width: 100%;
	height: 100%;
	position: relative;
}
.cmt-write-container {
	display: none;/*초기에는 안보여야함  */
	background: #dbbba0;
	border: 1px solid black;
}
.cmt-write-form {
	display: inline-block;
    vertical-align: middle;
    resize: none; 
	width: 100%;
	height: 220px;
}
.cmt-write-button {
	display: inline-block;
	height: 10%;
	width: 10%;
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
.cmt-react-textarea {
	width: 100%;
	height: 300px;
	resize: none;
}
.cmt-react-button {
	
}
.cmt-write-toggle-container {
	text-align: right;
	border: 1px solid black;
}
.cmt-write-toggle-button {
	color: white;
	background: blue;
}
.cmt-action-container {
	border: 1px solid black;
}
.show-cmt2-button {
	display: block;
	border: 1px solid black;
}
/*================================================cmt part ================================================ */
/*========================================================================================================= */
/*================================================cmt2 part ================================================ */
.cmt2-container {
	background: #abebbc;
	border: 1px solid black;
	width: 100%;
	height: 100%;
	position: relative;
}
.cmt2-page-container {
	background: #abebbc;
	border: 1px solid black;
	text-align: center;
}
.cmt2-prev-style {
	
}
.cmt2-page-style {
	
}
.cmt2-next-style {
	
}
.cmt2-write-container {
	background: #dbbba0;
	border: 1px solid black;
}
.cmt2-write-form {
	display: inline-block;
    vertical-align: middle;
    resize: none; 
	width: 100%;
	height: 220px;
}
.cmt2-write-button {
	display: inline-block;
	height: 10%;
	width: 10%;
}
.cmt2-info {
	border: 1px solid black;
	display: inline;
	white-space: pre;
}
.cmt2-update {
	display: inline;
	cursor: pointer;
	border: 1px solid black;
}
.cmt2-delete {
	display: inline;
	cursor: pointer;
	border: 1px solid black;
}
.cmt2-content {
	border: 1px solid black;
	white-space: pre;
}
.cmt2-react-container {
	border: 1px solid black;
}
.cmt2-react-textarea {
	width: 100%;
	height: 100px;
	resize: none;
}
.cmt2-react-button {
	
}
.cmt2-reply {
	display: inline;
	cursor: pointer;
	border: 1px solid black;
}
/*================================================cmt2 part ================================================ */
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
</div>
<div class="react-container">
	<c:if test="${not empty sessionScope.userId && qsb.getUser_id() == sessionScope.userId && 'admin' != sessionScope.userId}"><!-- 세션이 설정되어있고 작성글 아이디와 세션아이디가 같을떄 그리고 운영자가 아닐떄 -->
		<button onclick="location.href='qsBoardUpdateForm.sg?page=${page}&id=${qsb.getQsb_id()}'">수정</button>
		<button onclick="deleteAction()" style="display: inline-block;">삭제</button>
	</c:if>
	<c:if test="${not empty sessionScope.userId && 'admin' == sessionScope.userId}"><!--세션이 설정되어 있고 관리자 일떄  -->
		<button onclick="deleteAction()">삭제</button>
		<%-- <c:if test="${qsb.getUser_id() == 'admin'}">//공지사항 수정코드<!--관리자글일때만 수정버튼생김  -->
			<button onclick="location.href='qsBoardUpdateForm.sg?page=${page}&id=${qsb.getQsb_id()}'">수정</button>
		</c:if> --%>
	</c:if>
</div>
<div class="cmt-write-toggle-container">
	<button class="cmt-write-toggle-button" onclick="showCmtWriteForm()">답변</button>
</div>
<c:if test="${not empty sessionScope.userId}">
	<div class="cmt-write-container">
		<textarea class="cmt-write-form"></textarea>
		<button class="cmt-write-button" onclick="cmtWriteAction()">답변작성하기</button>
	</div>
</c:if>
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
	<!--cmt-react-container   -->
	<!-----------------------------------------------------------------------------------  -->
	<div class="cmt-info">유저닉네임/생성일자</div>
	<button class="cmt-update" onclick="showCmtUpdateForm()">수정</button>
	<button class="cmt-delete" onclick="cmtDeleteAction()">삭제</button>
	<div class="cmt-content">글내용입니담나어롸먼외라ㅓㅁ노아ㅓ리ㅗㅁ나ㅣ어뢰만ㅇㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹ</div>
	<!--cmt-react-container   -->
	<div class="cmt-react-container" style="display: none;">
		<textarea class="cmt-react-textarea">ssadasd</textarea>
		<button class="cmt-react-button">댓글수정하기</button>
	</div>
	<!--cmt-react-container-->
</div>
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
			//console.log(res);
		})
		.catch(error => {
			console.error('window.onload error : ', error);
		});
	}
	function reqCmtPage(cmtPageParam) {
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
			reqCmtPage(response.data.cmtPage);
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
			alert("작성할 답변을 입력해주세요");
			return;
		}
		
		axios.post("http://localhost:8080/HealthChain/QsbCmtWriteServlet", {
			qsbCmtReply: cmtWriteForm.value,
			qsbId: ${qsb.getQsb_id()}
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
<script type="text/javascript">
	let res2 = [];
	let cmt2Array = [];
	let cmt2UserNickNameArray = [];
	
	function loadCmt2() {
		cmt2Array = new Array(cmtArray.length);
		cmt2UserNickNameArray = new Array(cmtArray.length);
		res2 = new Array(cmtArray.length);
		const showCmt2Buttons = document.querySelectorAll(".show-cmt2-button");
		
		for(let i = 0; i < cmtArray.length; i++) {
			axios.post("http://localhost:8080/HealthChain/QsbLoadCmt2Servlet", {
				qsbId: ${qsb.getQsb_id()},
				qsbCmtId: cmtArray[i].qsb_cmt_id
			})
			.then(response => {
				res2[i] = response.data;
				cmt2Array[i] = res2[i].cmt2List;
				cmt2UserNickNameArray[i] = res2[i].cmt2UserNickNameList;
				clearCmt2PageContainer(i);
				insertCmt2PageButton(i);
				
				clearCmt2(i);
				insertCmt2(i);
				
				showCmt2Buttons[i].textContent += "(" + res2[i].totalCmt2Num + ")";
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
			
			clearCmt2(eleIdx);
			insertCmt2(eleIdx);
			
			if(action === "cmt2Write") {
				const ShowCmt2Buttons = document.querySelectorAll(".show-cmt2-button");
				ShowCmt2Buttons[eleIdx].textContent = "댓글보기" + "(" + res2[eleIdx].totalCmt2Num + ")";
			}
			else if(action === "cmt2Delete") {
				const ShowCmt2Buttons = document.querySelectorAll(".show-cmt2-button");
				ShowCmt2Buttons[eleIdx].textContent = "댓글보기" + "(" + res2[eleIdx].totalCmt2Num + ")";
				
				if(res2[eleIdx].cmt2MaxPage < cmt2PageParam) {
					reqCmt2Page(eleIdx, res2[eleIdx].cmt2MaxPage, "");
				}
				//console.log("cmt2PageParam : ", cmt2PageParam);
				//console.log("cmt2MaxPage : ", res2[eleIdx].cmt2MaxPage);
			}
			else if(action === "cmt2Reply") {
				const ShowCmt2Buttons = document.querySelectorAll(".show-cmt2-button");
				ShowCmt2Buttons[eleIdx].textContent = "댓글보기" + "(" + res2[eleIdx].totalCmt2Num + ")";
			}
		})
		.catch(error => {
			console.error('window.onload error : ', error);
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
			    reqCmt2Page(eleIdx, res2[eleIdx].cmt2PrevPage, "");
			};
			cmt2PageContainers[eleIdx].appendChild(prevButton);
		}
		for(let i = res2[eleIdx].cmt2StartPage; i <= res2[eleIdx].cmt2EndPage; i++) {
			const pageButton = document.createElement("button");
			pageButton.textContent = "" + i;
			pageButton.classList.add("cmt2-page-style");
			pageButton.onclick = function() {
			    reqCmt2Page(eleIdx, i, "");
			};
			cmt2PageContainers[eleIdx].appendChild(pageButton);
		}
		if(res2[eleIdx].cmt2EndPage !== res2[eleIdx].cmt2MaxPage) {
			const nextButton = document.createElement("button");
			nextButton.textContent = "다음";
			nextButton.classList.add("cmt2-next-style");
			nextButton.onclick = function() {
			    reqCmt2Page(eleIdx, res2[eleIdx].cmt2NextPage, "");
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
	function cmt2ReplyAction(eleIdxParam, ele2IdxParam, cmt2PageParam) {
		const eleIdx = eleIdxParam;
		const ele2Idx = ele2IdxParam;
		const cmt2Page = cmt2PageParam;
		
		const cmt2Containers = document.querySelectorAll(".cmt2-container");
		const cmt2ReactContainers = cmt2Containers[eleIdx].querySelectorAll(".cmt2-react-container");
		const cmt2ReactTextArea = cmt2ReactContainers[ele2Idx].querySelector(".cmt2-react-textarea");
		
		axios.post("http://localhost:8080/HealthChain/QsbCmt2ReplyServlet", {
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
			reqCmt2Page(eleIdx, response.data.cmt2Page, "");
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
	function cmt2WriteAction(eleIdxParam, qsbCmtIdParam) {
		const eleIdx = eleIdxParam;
		const cmt2WriteForms = document.querySelectorAll(".cmt2-write-form");
		const showCmt2Buttons = document.querySelectorAll(".show-cmt2-button");
		
		if(cmt2WriteForms[eleIdx].value === "") {
			alert("댓글을 작성해 주세요");
			return;
		}
		
		axios.post("http://localhost:8080/HealthChain/QsbCmt2WriteServlet", {
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
</script>



















<br>
qsb_id : ${qsb.getQsb_id() }<br>
user_id : ${user.getUser_id() }<br>
page : ${page }<br>
drCode : ${user.getDr_lic_code() }<br>
</body>
</html>