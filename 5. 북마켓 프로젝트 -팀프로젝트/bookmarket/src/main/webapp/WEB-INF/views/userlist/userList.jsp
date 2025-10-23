<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/sw/userlist/css/user-list.css">
</head>
<body>

	<h2>일반회원 목록</h2>
	<div class="container">
		<table class="table table-custom">
			<thead>
				<tr>
					<th>이름</th>
					<th>아이디</th>
					<th>이메일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${userList}">
					<tr>
						<td>
						<a class="btn btn-outline-success btn-sm" href="/userlist/userDetail?userId=${user.userId}">
						${user.userName} </a>
						</td>
						<td>${user.userId}</td>
						<td>${user.userEmail}
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>