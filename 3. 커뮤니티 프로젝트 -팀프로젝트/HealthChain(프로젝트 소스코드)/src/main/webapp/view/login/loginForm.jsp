<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta charset="utf-8">
<link rel="stylesheet" href="./view/login/login.css">
</head>
<body>
	<div class="login" >
	<div class="logo"><a href="main.jb">헬스체인</a></div>
		<form action="login.sw" method="post" onsubmit="return chk()"
			name="frm">
			<input type="text" name="userId" required="required"
				autofocus="autofocus" placeholder="아이디를 입력해 주세요." class="text-field">
			<input type="password" name="userPw" required="required"
				placeholder="비밀번호를 입력해 주세요." class="text-field">
				<input type="submit" value="로그인" class="submit-btn">
			<input type="hidden" name="fdURL" value="${param.fdURL }">
			<input type="hidden" name="page" value="${param.page }">
			<input type="hidden" name="order" value="${param.order }">
		</form>
	<hr>
	<button onclick="location.href='joinForm.sw'" class="submit-btn">회원가입</button>
	<!-- <a class="find" href="findIdForm.sw">아이디 찾기</a> <a class="find">|</a> <a class="find" href="findPwForm.sw">비밀번호 찾기</a> -->
	</div>
</body>
</html>