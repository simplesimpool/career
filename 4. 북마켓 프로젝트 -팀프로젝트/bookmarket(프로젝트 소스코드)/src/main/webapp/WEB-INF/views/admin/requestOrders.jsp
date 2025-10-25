<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="../../resources/sg/admin/requestorders/css/style.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
</head>
<body>
	<div class="container text-center" style="border: 1px solid black;">
		<div class="row">
			<div class="col">
				주문번호
			</div>
			<div class="col">
			    유저아이디
			</div>
			<div class="col">
			  	주문날짜
			</div>
			<div class="col">
			  	상세정보
			</div>
			<div class="col">
			  	주문승인
			</div>
			<div class="col">
			  	주문반려
			</div>
		</div>
		<c:forEach var="order" items="${reqOrderList }">
			<div class="row">
				<div class="col">
					${order.orderId }
				</div>
				<div class="col">
					${order.userId }
				</div>
				<div class="col">
					${order.orderDate }
				</div>
				<div class="col">
					<button class="btn btn-info" onclick="showOrderDetail(${order.orderId})">상세보기</button>
				</div>
				<div class="col">
					<form action="/admin/order/approveOrder?page=${pgData.page }" method="post">
						<input type="hidden" name="orderId" value="${order.orderId }">
						<button type="submit" class="btn btn-success">승인</button>
					</form>
				</div>
				<div class="col">
					<form action="/admin/order/rejectOrder?page=${pgData.page }" method="post">
						<input type="hidden" name="orderId" value="${order.orderId }">
						<button type="submit" class="btn btn-danger">반려</button>
					</form>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="text-center">
		<c:if test="${pgData.startPage != 1}">
			<button class="btn btn-primary" onclick="reqPage(${pgData.prevPage})">이전</button>
		</c:if>
		<c:forEach var="page" begin="${pgData.startPage}" end="${pgData.endPage}">
			<c:if test="${pgData.page == page}">
				<button class="btn btn-dark" onclick="reqPage(${page})">${page}</button>
			</c:if>
			<c:if test="${pgData.page != page}">
				<button class="btn btn-primary" onclick="reqPage(${page})">${page}</button>
			</c:if>
		</c:forEach>
		<c:if test="${pgData.endPage != pgData.maxPage}">
			<button class="btn btn-primary" onclick="reqPage(${pgData.nextPage})">다음</button>
		</c:if>
	</div>
	<script type="text/javascript" src="../../resources/sg/admin/requestorders/js/script.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.min.js" integrity="sha384-VQqxDN0EQCkWoxt/0vsQvZswzTHUVOImccYmSyhJTp7kGtPed0Qcx8rK9h9YEgx+" crossorigin="anonymous"></script>
</body>
</html>