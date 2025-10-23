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
아이디 : ${user.getUser_id() }<br>
<c:if test="${user.getDr_lic_code() == null }">
	의사코드 : 없음<br>
</c:if>
<c:if test="${user.getDr_lic_code() != null }">
	의사코드 : ${user.getDr_lic_code() }<br>
</c:if>
비밀번호 : ${user.getUser_pw() }<br>
이름 : ${user.getUser_name() }<br>
전화번호 : ${user.getUser_tel() }<br>
주소 : ${user.getUser_addr() }<br>
<c:if test="${user.getUser_del() == 'n'}">
	탈퇴여부 : 탈퇴상태아님<br>
</c:if>
<c:if test="${user.getUser_del() == 'y'}">
	탈퇴여부 : 탈퇴상태<br>
</c:if>
닉네임 : ${user.getUser_nickname() }<br>
가입일 : ${user.getUser_reg_date() }<br>
이메일 : ${user.getUser_email() }<br>
<c:if test="${user.getUser_activity() == 'n' }">
	정지여부 : 정지상태아님<br>
</c:if>
<c:if test="${user.getUser_activity() == 'y' }">
	정지여부 : 정지상태<br>
</c:if>
</body>
</html>