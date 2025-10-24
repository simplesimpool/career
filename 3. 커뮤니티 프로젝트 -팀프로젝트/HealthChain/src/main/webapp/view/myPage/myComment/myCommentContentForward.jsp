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
<c:if test="${category == 'frb_cmt' }">
	<script type="text/javascript">
		sessionStorage.removeItem("fromMyPageCmtPageStatus");
		sessionStorage.removeItem("cmtPage");
		
		sessionStorage.setItem("fromMyPageCmtPageStatus", "true");
		sessionStorage.setItem("cmtPage", ${cmtPage});
		
		location.href = "frBoardContent.sg?page=${page}&id=${frbId}";
	</script>
	frbCmtId : ${id }<br>
	frbId : ${frbId }<br>
	category : ${category }<br>
	page : ${page }<br>
	cmtPage : ${cmtPage }<br>
</c:if>
<c:if test="${category == 'rvb_cmt' }">
	<script type="text/javascript">
		sessionStorage.removeItem("fromMyPageCmtPageStatus");
		sessionStorage.removeItem("cmtPage");
		
		sessionStorage.setItem("fromMyPageCmtPageStatus", "true");
		sessionStorage.setItem("cmtPage", ${cmtPage});
		
		location.href = "rvBoardContent.sg?order=new&page=${page}&id=${rvbId}";
	</script>
	rvbCmtId : ${id }<br>
	rvbId : ${rvbId }<br>
	category : ${category }<br>
	page : ${page }<br>
	cmtPage : ${cmtPage }<br>
</c:if>
<c:if test="${category == 'qsb_cmt' }">
	<script type="text/javascript">
		sessionStorage.removeItem("fromMyPageCmtPageStatus");
		sessionStorage.removeItem("cmtPage");
		
		sessionStorage.setItem("fromMyPageCmtPageStatus", "true");
		sessionStorage.setItem("cmtPage", ${cmtPage});
		
		location.href = "qsBoardContent.sg?page=${page}&id=${qsbId}";
	</script>
	qsbCmtId : ${id }<br>
	qsbId : ${qsbId }<br>
	category : ${category }<br>
	page : ${page }<br>
	cmtPage : ${cmtPage }<br>
</c:if>
<c:if test="${category == 'qsb_cmt2' }">
	<script type="text/javascript">
		sessionStorage.removeItem("fromMyPageCmtPageStatus");
		sessionStorage.removeItem("qsbCmtId");
		sessionStorage.removeItem("cmtPage");
		sessionStorage.removeItem("cmt2Page");
		
		sessionStorage.setItem("fromMyPageCmtPageStatus", "true");
		sessionStorage.setItem("qsbCmtId", ${qsbCmtId});
		sessionStorage.setItem("cmtPage", ${cmtPage});
		sessionStorage.setItem("cmt2Page", ${cmt2Page});
		
		location.href = "qsBoardContent.sg?page=${page}&id=${qsbId}";
	</script>
	category : ${category }<br>
	qsbCmt2Id : ${id }<br>
	qsbId : ${qsbId }<br>
	qsbCmtId : ${qsbCmtId }<br>
	page : ${page }<br>
	cmtPage : ${cmtPage }<br>
	cmt2Page : ${cmt2Page }<br>
</c:if>
</body>
</html>