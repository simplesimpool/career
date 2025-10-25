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
<c:if test="${commentCategory == 'all' }">
	<script type="text/javascript">
		location.href = "myAllComment.sg?commentCategory=${commentCategory}&page=${page}";
	</script>
</c:if>
<c:if test="${commentCategory == 'qsbCmt' }">
	<script type="text/javascript">
		location.href = "myQsBoardComment.sg?commentCategory=${commentCategory}&page=${page}";
	</script>
</c:if>
<c:if test="${commentCategory == 'rvbCmt' }">
	<script type="text/javascript">
		location.href = "myRvBoardComment.sg?commentCategory=${commentCategory}&page=${page}";
	</script>
</c:if>
<c:if test="${commentCategory == 'frbCmt' }">
	<script type="text/javascript">
		location.href = "myFrBoardComment.sg?commentCategory=${commentCategory}&page=${page}";
	</script>
</c:if>
</body>
</html>