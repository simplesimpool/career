<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <%
		HttpSession sess = request.getSession(true);
		session.setAttribute("userId", "userId1");
	%> --%>
	<%-- <%
		HttpSession sess = request.getSession(true);
		session.setAttribute("userId", "userId2");
	%> --%>
	<%
		HttpSession sess = request.getSession(true);
		session.setAttribute("userId", "admin");
	%>
	<script type="text/javascript">
		location.href="main.jb";
	</script>
</body>
</html>