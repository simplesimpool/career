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
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("회원정보 수정성공");
		location.href = "userUpdateForm.sg";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("회원정보 업데이트에 실패 하였습니다 값을 다시 확인해 주세요");
		history.back();
	</script>
</c:if>
<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("중복된 닉네임 입니다");
		history.back();
	</script>
</c:if>
<c:if test="${result == -2 }">
	<script type="text/javascript">
		alert("중복된 이메일 입니다");
		history.back();
	</script>
</c:if>
<c:if test="${result == -3 }">
	<script type="text/javascript">
		alert("중복된 전화번호 입니다");
		history.back();
	</script>
</c:if>
</body>
</html>