<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<link rel="stylesheet" href="../resources/sg/cart/css/style.css">
	<%@ include file="sessionChk.jsp" %>
</head>
<body>
	<div id="cart-container">
		<!-- cart-container -->
	</div>
	<div id="page-container">
		<!-- page-container -->
	</div>
	<form id="order-form-container" action="/cart/orderBooks" method="post">
		<!-- order-form-container -->
	</form>
	<script type="text/javascript" src="../resources/sg/cart/js/script.js"></script>
</body>
</html>