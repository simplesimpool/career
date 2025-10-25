<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
	<link rel="stylesheet" href="../../../resources/sg/admin/requestorderdetail/css/style.css">
</head>
<body>
	<div class="container text-center" style="border: 1px solid black;">
		<div class="row">
			<div class="col">
				주문상세번호
			</div>
			<div class="col">
				책아이디
			</div>
			<div class="col">
				책이름
			</div>
			<div class="col">
				주문갯수
			</div>
			<div class="col">
				책재고갯수
			</div>
		</div>
		<c:forEach var="book" items="${orderDetailedBookList }">
			<div class="row">
				<div class="col">
					${book.odId }
				</div>
				<div class="col">
					${book.bookId }
				</div>
				<div class="col">
					${book.bookName }
				</div>
				<div class="col">
					${book.odrCnt }
				</div>
				<div class="col">
					${book.bookStock }
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="text-center">
		<c:if test="${pgData.startPage != 1}">
			<button class="btn btn-primary" onclick="reqPage(${orderId }, ${pgData.prevPage})">이전</button>
		</c:if>
		<c:forEach var="page" begin="${pgData.startPage}" end="${pgData.endPage}">
			<c:if test="${pgData.page == page}">
				<button class="btn btn-dark" onclick="reqPage(${orderId }, ${page})">${page}</button>
			</c:if>
			<c:if test="${pgData.page != page}">
				<button class="btn btn-primary" onclick="reqPage(${orderId }, ${page})">${page}</button>
			</c:if>
		</c:forEach>
		<c:if test="${pgData.endPage != pgData.maxPage}">
			<button class="btn btn-primary" onclick="reqPage(${orderId }, ${pgData.nextPage})">다음</button>
		</c:if>
	</div>
	<script type="text/javascript" src="../../../resources/sg/admin/requestorderdetail/js/script.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.min.js" integrity="sha384-VQqxDN0EQCkWoxt/0vsQvZswzTHUVOImccYmSyhJTp7kGtPed0Qcx8rK9h9YEgx+" crossorigin="anonymous"></script>
</body>
</html>