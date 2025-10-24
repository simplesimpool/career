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
    text-decoration: underline;
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
}
.resign-button {
	position: relative;
    width: 100%;
}
.user-update-form {
	border: 1px solid black;
}
.nickname-dup-chk-msg {
	color: red;
	display: none;
}
.form-submit {
	right: 100%;
}
#address {
	resize: none;
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
			<h3>회원정보 수정</h3>
			<c:if test="${user.getDr_lic_code() != null }">
				<h4>의사회원</h4>
			</c:if>
			<c:if test="${user.getDr_lic_code() == null }">
				<h4>일반회원</h4>
			</c:if>
			<form action="userUpdate.sg" method="post" class="user-update-form" onsubmit="return chkUserUpdateForm()">
				<label for="nickname">닉네임 : </label>
				<input type="text" id="nickname" name="nickName" value="${user.getUser_nickname() }" required="required" autofocus="autofocus">
				<button type="button" onclick="chkNickNameDup()">중복확인</button>
				<div class="nickname-dup-chk-msg"></div>
				<br>
				<label for="password">비밀번호 : </label>
				<input type="password" id="password" name="passWord" required="required" autofocus="autofocus" autocomplete="off">
				<label for="password2">비밀번호 확인 : </label>
				<input type="password" id="password2" required="required" autofocus="autofocus" autocomplete="off">
				<br>
				<label for="email">이메일 : </label>
				<input type="text" id="email" name="email" value="${user.getUser_email() }" required="required" autofocus="autofocus">
				<br>
				<label for="tel">전화번호 : </label>
				<input type="tel" id="tel" name="tel" value="${user.getUser_tel() }"required="required" autofocus="autofocus" pattern="010-\d{3,4}-\d{4}" title="전화형식은 010-0000-0000입니다">
				<br>
				<label for="address">주소 : </label>
				<textarea rows="5" cols="70" id="address" name="address" required="required" autofocus="autofocus">${user.getUser_addr() }</textarea>
				<br>
				<input type="submit" class="form-submit" value="수정">
			</form>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script type="text/javascript">
		let nickRes = null;
		
		async function chkNickNameDup() {
			const msg = document.querySelector(".nickname-dup-chk-msg");
			let dupResult = false;
			dupResult = await reqNickNameDupChk();
			
			if (dupResult === true) {
				if (nickRes.data.result > 0) {
					msg.style.display = "block";
					msg.style.color = "blue";
					msg.textContent = "사용 가능한 닉네임 입니다";
				} else if (nickRes.data.result === 0) {
					msg.style.display = "block";
					msg.style.color = "red";
					msg.textContent = "서버오류 잠시후 다시 시도해 주세요";
				} else {
					msg.style.display = "block";
					msg.style.color = "red";
					msg.textContent = "이미 사용중인 닉네임 입니다";
				}
			}
		}
		async function reqNickNameDupChk() {
			const nickNameInput = document.querySelector("#nickname");
			let emptyResult = false;
			let strLenOverResult = false;
			
			emptyResult = chkNickNameEmpty();
			if(emptyResult === false) {
				return false;
			}
			/* strLenOverResult = chkNickNameLength();
			if(strLenOverResult === false) {
				return false;
			} */
			
			try {
				nickRes = await axios.post("http://localhost:8080/HealthChain/NickNameDupChkServlet", {
					nickName: nickNameInput.value
				});
				return true;
			}
			catch(error) {
				nickRes = null;
				alert("닉네임 중복확인 요청 에러");
				return false;
			}
		}
		function chkNickNameEmpty() {
			const nickNameInput = document.querySelector("#nickname");
			const msg = document.querySelector(".nickname-dup-chk-msg");
			
			if(nickNameInput.value === "") {
				msg.style.display = "block";
				msg.style.color = "red";
				msg.textContent = "닉네임을 입력해주세요";
				return false;
			} else {
				return true;
			}
		}
		/* function chkNickNameLength() {
			const maxLength = 20;
			const nickNameInput = document.querySelector("#nickname");
			const msg = document.querySelector(".nickname-dup-chk-msg");
			
			if(nickNameInput.value.length > maxLength) {
				msg.style.display = "block";
				msg.style.color = "red";
				msg.textContent = "" + maxLength + "자 이내로 해주세요";
				return false;
			} else {
				return true;
			}
		} */
	</script>
	<script type="text/javascript">
		function chkUserUpdateForm() {
			if(chkPassWord()) {
				return true;
			} else {
				return false;
			}
		}
		function chkPassWord() {
			const pw = document.querySelector("#password");
			const pw2 = document.querySelector("#password2");
			
			if(pw.value !== pw2.value) {
				alert("비밀번호와 비밀번호 확인이 다릅니다");
				return false;
			} else {
				return true;
			}
		}
	</script>

























<br><br><br>
userId : ${user.getUser_id() }<br>
drLicCode : ${user.getDr_lic_code() }<br>
userPw : ${user.getUser_pw() }<br>
userName : ${user.getUser_name() }<br>
userTel : ${user.getUser_tel() }<br>
userAddr : ${user.getUser_addr() }<br>
userDel : ${user.getUser_del() }<br>
userNickName : ${user.getUser_nickname() }<br>
userRegDate : ${user.getUser_reg_date() }<br>
userEmail : ${user.getUser_email() }<br>
</body>
</html>