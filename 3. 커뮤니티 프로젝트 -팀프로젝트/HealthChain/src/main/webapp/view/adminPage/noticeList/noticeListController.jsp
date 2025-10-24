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
		location.href = "allNoticeList.sg?boardCategory=${boardCategory}&page=${page}";
	</script>
</c:if>
<c:if test="${boardCategory == 'frb' }">
	<script type="text/javascript">
		location.href = "frbNoticeList.sg?boardCategory=${boardCategory}&page=${page}";
	</script>
</c:if>
<c:if test="${boardCategory == 'rvb' }">
	<script type="text/javascript">
		location.href = "rvbNoticeList.sg?boardCategory=${boardCategory}&page=${page}";
	</script>
</c:if>
<c:if test="${boardCategory == 'qsb' }">
	<script type="text/javascript">
		location.href = "qsbNoticeList.sg?boardCategory=${boardCategory}&page=${page}";
	</script>
</c:if>
<c:if test="${boardCategory == 'mib' }">
	<script type="text/javascript">
		location.href = "mibNoticeList.sg?boardCategory=${boardCategory}&page=${page}";
	</script>
</c:if>
<c:if test="${boardCategory == 'cs' }">
	<script type="text/javascript">
		location.href = "csNoticeList.sg?boardCategory=${boardCategory}&page=${page}";
	</script>
</c:if>
</body>
</html>