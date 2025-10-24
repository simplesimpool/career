<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문 완료 목록</title>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<link rel="stylesheet" href="../resources/sg/order/acceptedorders/css/style.css">
	<%@ include file="sessionChk.jsp" %>
</head>
<body class="bg-light">

	<%@ include file="acceptedOrdersHeader.jsp" %>

	<div class="container" id="acpted-order-container">
		<c:forEach var="acptedOrder" items="${acptedOrderList}">
			<div class="card mb-4 shadow-sm">
				<div class="card-header d-flex justify-content-between">
					<div><strong>주문번호:</strong> ${acptedOrder.orderId}</div>
					<div class="text-muted"><small>📅 ${acptedOrder.orderDate}</small></div>
				</div>

				<div class="card-body">
					<h6 class="fw-bold mb-3">📚 주문 도서 목록</h6>
					<div class="row row-cols-1 row-cols-md-2 g-3">
						<c:forEach var="acptedOrderBook" items="${acptedOrderBookList}">
							<c:if test="${acptedOrder.orderId == acptedOrderBook.orderId}">
								<div class="col d-flex align-items-center gap-3 border rounded p-2 bg-white">
									<c:choose>
										<c:when test="${acptedOrderBook.bookImg != null}">
											<img src="../resources/sw/bookImg/${acptedOrderBook.bookImg}" class="rounded" width="60" height="80">
										</c:when>
										<c:otherwise>
											<img src="../resources/sw/bookImg/noBookImg.png" class="rounded" width="60" height="80">
										</c:otherwise>
									</c:choose>
									<div>
										<div class="fw-semibold">${acptedOrderBook.bookName}</div>
										<%-- <small class="text-muted">주문 수량: ${acptedOrderBook.odrCnt}권</small> --%>
									</div>
									<div>
										<div class="fw-semibold">주문수량 : ${acptedOrderBook.odrCnt}권</div>
									</div>
									<div>
										<div class="fw-semibold">단가 : <fmt:formatNumber value="${acptedOrderBook.bookPrice}" type="number" groupingUsed="true"/>원</div>
									</div>
									<div>
										<div class="fw-semibold">총 합계 : <fmt:formatNumber value="${acptedOrderBook.bookPrice * acptedOrderBook.odrCnt}" type="number" groupingUsed="true"/>원</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="container text-center my-4 p-4 bg-light border rounded shadow-sm fs-4 fw-semibold text-primary">
						총 주문금액 : 
						<span class="fw-bold">
						  <fmt:formatNumber value="${acptedOrder.totalOrderPrice }" type="number" groupingUsed="true"/>원
						</span>
					</div>
				</div>
			</div>
		</c:forEach>

		<!-- 페이지네이션 -->
		<div class="d-flex justify-content-center mt-4" id="page-container">
			<c:if test="${pgData.startPage != 1}">
				<button class="btn btn-outline-secondary me-2" onclick="reqPage(${pgData.prevPage})">이전</button>
			</c:if>

			<c:forEach var="page" begin="${pgData.startPage}" end="${pgData.endPage}">
				<c:choose>
					<c:when test="${pgData.page == page}">
						<button class="btn btn-primary me-1" id="cur-page-btn" onclick="reqPage(${page})">${page}</button>
					</c:when>
					<c:otherwise>
						<button class="btn btn-outline-secondary me-1" onclick="reqPage(${page})">${page}</button>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:if test="${pgData.endPage != pgData.maxPage}">
				<button class="btn btn-outline-secondary ms-2" onclick="reqPage(${pgData.nextPage})">다음</button>
			</c:if>
		</div>
	</div>

	<script src="../resources/sg/order/acceptedorders/js/script.js"></script>
</body>
</html>
