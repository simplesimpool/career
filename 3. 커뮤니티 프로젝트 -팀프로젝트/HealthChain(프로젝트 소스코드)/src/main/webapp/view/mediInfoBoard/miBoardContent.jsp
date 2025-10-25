<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
}

  .id-style, .view-cnt-style {
    display: inline-block;
    margin-right: 10px;
    font-size: 14px;
    color: #6d8c50;
}

  .title-style, .writer-style {
    font-size: 18px;
    font-weight: bold;
    margin: 10px 0;
}

  .content-style {
    margin: 20px 0;
    padding: 15px;
    border-radius: 4px;
    line-height: 1.6;
    color: #2b473e;
    overflow-wrap: break-word;
}

 .reg-date-style {
    text-align: right;
    font-size: 14px;
    color: #999;
}

/* 반응 컨테이너 */
 .react-container {
    text-align: center;
    margin-top: 20px;
    display: flex;
    justify-content: flex-end; /* 버튼들을 오른쪽으로 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
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
</style>
</head>
<body>
<div class="content-container">
	<div class="id-style">글번호 : ${mib.getMib_id() }</div>
	<div class="view-cnt-style">조회수 : ${mib.getMib_view_cnt() }</div><br>
	<div class="title-style">제목 : ${mib.getMib_title() }</div>
	<div class="writer-style">작성자 : ${user.getUser_nickname() }</div>
	<div class="content-style">${mib.getMib_content() }</div>
	<div class="reg-date-style">작성일 : ${mib.getMib_reg_date() }</div>
	<div class="react-container">
		<c:if test="${not empty sessionScope.userId && mib.getUser_id() == sessionScope.userId && 'admin' != sessionScope.userId}"><!-- 세션이 설정되어있고 작성글 아이디와 세션아이디가 같을떄 그리고 운영자가 아닐떄 -->
			<button onclick="location.href='miBoardUpdateForm.sg?page=${page}&id=${mib.getMib_id()}'">수정</button>
			<button onclick="deleteAction()" style="display: inline-block; background-color: #f44336;">삭제</button>
		</c:if>
		<c:if test="${not empty sessionScope.userId && 'admin' == sessionScope.userId}"><!--세션이 설정되어 있고 관리자 일떄  -->
			<button onclick="deleteAction()" style="background-color: #f44336;">삭제</button>
			<c:if test="${mib.getUser_id() == 'admin'}"><!--관리자글일때만 수정버튼생김  -->
				<button onclick="location.href='miBoardUpdateForm.sg?page=${page}&id=${mib.getMib_id()}'">수정</button>
			</c:if>
		</c:if>
		<button onclick="location.href='miBoard.sg?&page=${page}'">목록</button> <br>
	</div>
</div>
<script type="text/javascript">
	function deleteAction() {
		const result = confirm("정말로 삭제하시겠습니까?");
		if (result) {
	        location.href="miBoardDelete.sg?page=${page}&id=${mib.getMib_id()}";
	    }
	}
</script>





















<%-- <br>
mib_id : ${mib.getMib_id() }<br>
user_id : ${user.getUser_id() }<br>
page : ${page }<br> --%>
</body>
</html>