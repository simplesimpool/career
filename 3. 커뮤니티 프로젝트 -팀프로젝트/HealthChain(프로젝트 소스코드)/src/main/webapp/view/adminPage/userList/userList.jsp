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

.user-container {
	border: 1px solid black;
	margin-top: 10px;
	text-align: center;
}

.page-container {
	margin-top: 40px;
	text-align: center;
}

.user-list-button {
	width: 100%;
    font-size: larger;
    margin-bottom: 10px;
    text-decoration: underline;
}

.notice-list-button {
	width: 100%;
    font-size: larger;
    margin-bottom: 10px;
}

.cs-reply-list-button {
	width: 100%;
    font-size: larger;
    margin-bottom: 10px;
}

.user-detail-info {
	display: inline-block;
	border: 1px solid black;
	margin-right: 10px;
}

.user-detail-info:hover {
	cursor: pointer;
}

.user-activity {
	display: inline-block;
	border: 1px solid black;
	margin-right: 10px;
}

.user-activity:hover {
	cursor: pointer;
}

.user-del {
	display: inline-block;
	border: 1px solid black;
	margin-right: 10px;
}

.user-del:hover {
	cursor: pointer;
}

.page-input {
	
}

#user-category {
	
}
</style>
</head>
<body>
	<h2>관리자 폐이지</h2>
	<div class="display-container">
		<div class="category-container">
			<button class="user-list-button" onclick="location.href='adminPageController.sg?category=userList'">회원목록</button><br>
			<button class="notice-list-button" onclick="location.href='adminPageController.sg?category=noticeList'">공지사항 관리</button><br>
			<button class="cs-reply-list-button" onclick="location.href='adminPageController.sg?category=csReplyList'">고객센터<br>답변관리</button><br>
		</div>
		<div class="update-container">
			<h3>회원목록</h3>
			<select id="user-category" onchange="userSelectAction()">
				<option value="all">전체</option>
				<option value="normalUser">일반회원</option>
				<option value="doctorUser">의사회원</option>
				<option value="resignedUser">탈퇴회원</option>
			</select>
			<c:if test="${userCategory == 'all' }">
				<c:forEach var="user" items="${userList}" varStatus="status">
					<div class=user-container>
						<c:if test="${user.getDr_lic_code() == null }">
							${user.getUser_id() } | ${user.getUser_nickname() } | 일반회원
							<div class="user-detail-info" onclick="showUserDetailInfo('${user.getUser_id()}')">세부정보</div>
							<c:if test="${user.getUser_activity() == 'n' }">
								<div class="user-activity" onclick="updateUserActivity('${user.getUser_activity()}', '${user.getUser_id() }')">정지상태아님</div>
							</c:if>
							<c:if test="${user.getUser_activity() == 'y' }">
								<div class="user-activity" onclick="updateUserActivity('${user.getUser_activity()}', '${user.getUser_id() }')">정지상태</div>
							</c:if>
							<div class="user-del" onclick="updateUserDel('${user.getUser_del()}', '${user.getUser_id() }')">탈퇴</div>
						</c:if>
						<c:if test="${user.getDr_lic_code() != null }">
							${user.getUser_id() } | ${user.getUser_nickname() } | 의사회원
							<div class="user-detail-info" onclick="showUserDetailInfo('${user.getUser_id()}')">세부정보</div>
							<c:if test="${user.getUser_activity() == 'n' }">
								<div class="user-activity" onclick="updateUserActivity('${user.getUser_activity()}', '${user.getUser_id() }')">정지상태아님</div>
							</c:if>
							<c:if test="${user.getUser_activity() == 'y' }">
								<div class="user-activity" onclick="updateUserActivity('${user.getUser_activity()}', '${user.getUser_id() }')">정지상태</div>
							</c:if>
							<div class="user-del" onclick="updateUserDel('${user.getUser_del()}', '${user.getUser_id() }')">탈퇴</div>
						</c:if>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${userCategory == 'normalUser' }">
				<c:forEach var="user" items="${userList}" varStatus="status">
					<div class=user-container>
						${user.getUser_id() } | ${user.getUser_nickname() } | 일반회원
						<div class="user-detail-info" onclick="showUserDetailInfo('${user.getUser_id()}')">세부정보</div>
						<c:if test="${user.getUser_activity() == 'n' }">
							<div class="user-activity" onclick="updateUserActivity('${user.getUser_activity()}', '${user.getUser_id() }')">정지상태아님</div>
						</c:if>
						<c:if test="${user.getUser_activity() == 'y' }">
							<div class="user-activity" onclick="updateUserActivity('${user.getUser_activity()}', '${user.getUser_id() }')">정지상태</div>
						</c:if>
						<div class="user-del" onclick="updateUserDel('${user.getUser_del()}', '${user.getUser_id() }')">탈퇴</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${userCategory == 'doctorUser' }">
				<c:forEach var="user" items="${userList}" varStatus="status">
					<div class=user-container>
						${user.getUser_id() } | ${user.getUser_nickname() } | 의사회원
						<div class="user-detail-info" onclick="showUserDetailInfo('${user.getUser_id()}')">세부정보</div>
						<c:if test="${user.getUser_activity() == 'n' }">
							<div class="user-activity" onclick="updateUserActivity('${user.getUser_activity()}', '${user.getUser_id() }')">정지상태아님</div>
						</c:if>
						<c:if test="${user.getUser_activity() == 'y' }">
							<div class="user-activity" onclick="updateUserActivity('${user.getUser_activity()}', '${user.getUser_id() }')">정지상태</div>
						</c:if>
						<div class="user-del" onclick="updateUserDel('${user.getUser_del()}', '${user.getUser_id() }')">탈퇴</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${userCategory == 'resignedUser' }">
				<c:forEach var="user" items="${userList}" varStatus="status">
					<div class=user-container>
						${user.getUser_id() } | ${user.getUser_nickname() } | 탈퇴회원
						<div class="user-detail-info" onclick="showUserDetailInfo('${user.getUser_id()}')">세부정보</div>
						<c:if test="${user.getUser_activity() == 'n' }">
							<div class="user-activity" onclick="updateUserActivity('${user.getUser_activity()}', '${user.getUser_id() }')">정지상태아님</div>
						</c:if>
						<c:if test="${user.getUser_activity() == 'y' }">
							<div class="user-activity" onclick="updateUserActivity('${user.getUser_activity()}', '${user.getUser_id() }')">정지상태</div>
						</c:if>
						<div class="user-del" onclick="updateUserDel('${user.getUser_del()}', '${user.getUser_id() }')">탈퇴복구</div>
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
		let userInfoWindow = null;
		const userCategoryElement = document.querySelector("#user-category");//init action
		userCategoryElement.value = "${userCategory }";//init action
		
		function userSelectAction() {
			const value = document.querySelector("#user-category").value;
			location.href = "userListController.sg?userCategory=" + value + "&page=${pgData.page}";
			//if the page parameter is added, it will remained and can send it to the each of services.
			//but if remove the page parameter, each selection will lead the page to 1.
		}
		function pageClickAction(page) {
			const value = document.querySelector("#user-category").value;
			location.href = "userListController.sg?userCategory=" + value + "&page=" + page;
		}
		function moveToPage() {
			const inputPage = document.querySelector(".page-input").value;
			const value = document.querySelector("#user-category").value;
			
			if(inputPage === "") {
				alert("이동할 폐이지를 입력해주세요");
				return;
			} else {
				location.href = "userListController.sg?userCategory=" + value + "&page=" + inputPage;
			}
		}
		function updateUserActivity(activity, id) {
			const userActivity = "" + activity;
			const userId = "" + id;
			
			if (userActivity === "n") {
				if (confirm("현재 유저를 정지시키겠습니까?")) {
					location.href = "updateUserActivity.sg?userCategory=${userCategory}&page=${pgData.page}&userActivity=" + userActivity + "&userId=" + userId;
				}
			} else {
				if (confirm("현재 유저의 정지를 푸시겠습니까?")) {
					location.href = "updateUserActivity.sg?userCategory=${userCategory}&page=${pgData.page}&userActivity=" + userActivity + "&userId=" + userId;
				}
			}
		}
		function updateUserDel(del, id) {
			const userDel = "" + del;
			const userId = "" + id;
			
			if (userDel === "n") {
				if (confirm("현재 유저를 탈퇴시키겠습니까?")) {
					location.href = "updateUserDel.sg?userCategory=${userCategory}&page=${pgData.page}&userDel=" + userDel + "&userId=" + userId;
				}
			} else {
				if (confirm("현재 유저의 탈퇴를 복구하시겠습니까?")) {
					location.href = "updateUserDel.sg?userCategory=${userCategory}&page=${pgData.page}&userDel=" + userDel + "&userId=" + userId;
				}
			}
		}
		function showUserDetailInfo(id) {
			const userId = "" + id;
			userInfoWindow = window.open("showUserInfoWindow.sg?userId=" + userId, "_blank", "width=800,height=600");
		}
	</script>
userCategory : ${userCategory }<br>
page : ${pgData.page }<br>
fdURL : ${fdURL }<br>
</body>
</html>