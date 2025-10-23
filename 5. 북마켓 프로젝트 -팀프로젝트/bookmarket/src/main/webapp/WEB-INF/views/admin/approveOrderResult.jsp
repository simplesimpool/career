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
	<c:if test="${result > 1 }">
		<script type="text/javascript">
			alert('승인 완료');
			location.href = '/admin/order/requestOrders?page=' + ${page};
		</script>
	</c:if>
	<c:if test="${result == 0 || result == 1}">
		<script type="text/javascript">
			alert('승인 업데이트 오류');
			history.back();
		</script>
	</c:if>
	<c:if test="${result < 0 }">
		<script type="text/javascript">
			let msg = '';
		</script>
		<c:forEach var="book" items="${zeroStkOrOverReqBookList }">
			<script type="text/javascript">
				msg += ${book.bookName} + '(책아이디 : ' + ${book.bookId} + ') 의 재고가 0이거나 요청 갯수가 재고 보다 많습니다\n';
			</script>
		</c:forEach>
		<script type="text/javascript">
			alert(msg);
			history.back();
		</script>
	</c:if>
</body>
</html>