<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${result > 0}">
		<script type="text/javascript">
			alert("로그인성공")
		</script>
		<c:if test="${fdResult == 0 }">
			<script type="text/javascript">
				location.href = "main.jb"
			</script>
		</c:if>
		<c:if test="${fdResult == 1 }">
			<script type="text/javascript">
				location.href = "${param.fdURL}?page=${param.page}"
			</script>
		</c:if>
		<c:if test="${fdResult == 2 }">
			<script type="text/javascript">
			location.href = "${param.fdURL}?order=${param.order}&page=${param.page}"
			</script>
		</c:if>
	</c:if>

	<c:if test="${result <= 0}">
		<script type="text/javascript">
			alert("암호가 다르거나 없는 아이디입니다")
			history.back();
		</script>
	</c:if>



</body>
</html>