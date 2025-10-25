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
<c:if test="${category == 'userList'}">
	<script type="text/javascript">
		location.href = "userListController.sg?userCategory=all";
	</script>
</c:if>
<c:if test="${category == 'noticeList'}">
	<script type="text/javascript">
		location.href = "noticeListController.sg?boardCategory=all";
	</script>
</c:if>
<c:if test="${category == 'csReplyList'}">
	<script type="text/javascript">
		location.href = "csReplyList.sg";
	</script>
</c:if>
</body>
</html>