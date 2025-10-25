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
<c:if test="${userCategory == 'all' }">
	<script type="text/javascript">
		location.href = "allUserList.sg?userCategory=${userCategory}&page=${page}";
	</script>
</c:if>
<c:if test="${userCategory == 'normalUser' }">
	<script type="text/javascript">
		location.href = "normalUserList.sg?userCategory=${userCategory}&page=${page}";
	</script>
</c:if>
<c:if test="${userCategory == 'doctorUser' }">
	<script type="text/javascript">
		location.href = "doctorUserList.sg?userCategory=${userCategory}&page=${page}";
	</script>
</c:if>
<c:if test="${userCategory == 'resignedUser' }">
	<script type="text/javascript">
		location.href = "resignedUserList.sg?userCategory=${userCategory}&page=${page}";
	</script>
</c:if>
</body>
</html>