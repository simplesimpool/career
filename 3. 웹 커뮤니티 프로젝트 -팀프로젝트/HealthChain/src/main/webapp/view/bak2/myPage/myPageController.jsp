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
<c:if test="${category == 'userUpdate'}">
	<script type="text/javascript">
		location.href = "userUpdateForm.sg";
	</script>
</c:if>
<c:if test="${category == 'myBoard'}">
	<script type="text/javascript">
		location.href = "myBoardController.sg?boardCategory=all";
	</script>
</c:if>
<c:if test="${category == 'myComment'}">
	<script type="text/javascript">
		location.href = "myCommentController.sg?commentCategory=all";
	</script>
</c:if>
</body>
</html>