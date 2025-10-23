<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 유형 선택</title>
	<link rel="stylesheet" href="/resources/sw/join/css/select-form.css">	
</head>
<body>
	<div class="select-container">
		<h2 class="select-title">회원 유형을 선택하세요</h2>
		<button class="select-button" onclick="selectUserJoinForm()">일반회원</button>
		<button class="select-button" onclick="selectPubJoinForm()">출판사회원</button>
	</div>
	<script type="text/javascript" src="/resources/sw/join/js/select-form.js"></script>
</body>
</html>
