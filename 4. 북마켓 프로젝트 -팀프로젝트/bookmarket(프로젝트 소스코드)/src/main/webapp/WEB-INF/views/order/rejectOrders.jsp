<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문 반려 목록</title>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<link rel="stylesheet" href="../resources/sg/order/rejectorders/css/style.css">
	<%@ include file="sessionChk.jsp" %>
</head>
<body class="bg-light">
	<%@ include file="rejectOrdersHeader.jsp" %>
	<div class="container" id="request-order-container">
		<c:forEach var="rejectOrder" items="${rejectOrderList}">
			<div class="card mb-4 shadow-sm">
				<div class="card-header d-flex justify-content-between">
					<div><strong>주문번호:</strong> ${rejectOrder.orderId}</div>
					<div class="text-muted"><small>📅 ${rejectOrder.orderDate}</small></div>
				</div>
				
				<div class="card-body">
					<h6 class="fw-bold mb-3">📚 주문 도서 목록</h6>
					<div class="row row-cols-1 row-cols-md-2 g-3">
						<c:forEach var="rejectOrderBook" items="${rejectOrderBookList}">
							<c:if test="${rejectOrder.orderId == rejectOrderBook.orderId}">
								<div class="col d-flex align-items-center gap-3 border rounded p-2 bg-white">
									<!-- 이미지 -->
									<c:choose>
										<c:when test="${rejectOrderBook.bookImg != null}">
											<img src="../resources/sw/bookImg/${rejectOrderBook.bookImg}" class="rounded" width="60" height="80">
										</c:when>
										<c:otherwise>
											<img src="../resources/sw/bookImg/noBookImg.png" class="rounded" width="60" height="80">
										</c:otherwise>
									</c:choose>

									<!-- 텍스트 -->
									<div>
										<div class="fw-semibold">${rejectOrderBook.bookName}</div>
										<%-- <small class="text-muted">주문 수량: ${rejectOrderBook.odrCnt}권</small> --%>
									</div>
									<div>
										<div class="fw-semibold">주문수량 : ${rejectOrderBook.odrCnt}권</div>
									</div>
									<div>
										<div class="fw-semibold">단가 : <fmt:formatNumber value="${rejectOrderBook.bookPrice}" type="number" groupingUsed="true"/>원</div>
									</div>
									<div>
										<div class="fw-semibold">총 합계 : <fmt:formatNumber value="${rejectOrderBook.bookPrice * rejectOrderBook.odrCnt}" type="number" groupingUsed="true"/>원</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="container text-center my-4 p-4 bg-light border rounded shadow-sm fs-4 fw-semibold text-primary">
						총 환불금액 : 
						<span class="fw-bold">
						  <fmt:formatNumber value="${rejectOrder.totalOrderPrice }" type="number" groupingUsed="true"/>원
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
						<button id="cur-page-btn" class="btn btn-primary me-1" onclick="reqPage(${page})">${page}</button>
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
	<script src="../resources/sg/order/rejectorders/js/script.js"></script>
</body>
</html>