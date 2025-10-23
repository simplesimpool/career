<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${category == 'mib'}">
    <script type="text/javascript">
    	location.href = "miBoardContent.sg?page=${page}&id=${id}";
    </script>
</c:if>
<c:if test="${category == 'qsb'}">
   <script type="text/javascript">
    	location.href = "qsBoardContent.sg?page=${page}&id=${id}";
    </script>
</c:if>
<c:if test="${category == 'cs'}">
    <script type="text/javascript">
    	location.href = "csBoardContent.sg?page=${page}&lvl=${lvl}&id=${id}&parentId=${parentId}";
    </script>
</c:if>
<c:if test="${category == 'frb'}">
    <script type="text/javascript">
    	location.href = "frBoardContent.sg?page=${page}&id=${id}"
    </script>
</c:if>
<c:if test="${category == 'rvb'}">
    <script type="text/javascript">
    	location.href = "rvBoardConent.sg?order=${order}&page=${page}&id=${id}"
    </script>
</c:if>



id : ${id }<br>
category : ${category }<br>
fdURL : ${fdURL }<br>
</body>
</html>