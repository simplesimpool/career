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
<c:if test="${boardCategory == 'all' }">
	<script type="text/javascript">
		location.href = "myAllBoard.sg?boardCategory=${boardCategory}&page=${page}";
	</script>
</c:if>
<c:if test="${boardCategory == 'frb' }">
	<script type="text/javascript">
		location.href = "myFrBoard.sg?boardCategory=${boardCategory}&page=${page}";
	</script>
</c:if>
<c:if test="${boardCategory == 'qsb' }">
	<script type="text/javascript">
		location.href = "myQsBoard.sg?boardCategory=${boardCategory}&page=${page}";
	</script>
</c:if>
<c:if test="${boardCategory == 'cs' }">
	<script type="text/javascript">
		location.href = "myCsBoard.sg?boardCategory=${boardCategory}&page=${page}";
	</script>
</c:if>
<c:if test="${boardCategory == 'rvb' }">
	<script type="text/javascript">
		location.href = "myRvBoard.sg?boardCategory=${boardCategory}&page=${page}";
	</script>
</c:if>
<c:if test="${boardCategory == 'mib' }">
	<script type="text/javascript">
		location.href = "myMiBoard.sg?boardCategory=${boardCategory}&page=${page}";
	</script>
</c:if>
<!-- //if the page parameter is added, it will remained and can send it to the each of services.
//but if remove the page parameter, each selection will lead the page to 1. -->
</body>
</html>