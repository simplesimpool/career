<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.84.0">
<title>Carousel Template · Bootstrap v5.0</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/carousel/">

<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="carousel.css" rel="stylesheet">
<link href="headers.css" rel="stylesheet">
<link href="sticky-footer.css" rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.parent {
	width: 100%;
	margin: 10px auto;
}

#list {
	float: left;
	width: 20px;
}

#list a {
	color: #6d8c50;
}

#header-line {
	margin-left: 10px;
	width: 100%;
}

#n1 {
	float: left;
}

#n2 {
	float: right;
}

#questgo {
	background-color: #2b473e;
	color: #f4f1eb;
}

header {
	background-color: #2b473e;
}

#btn {
	background-color: #6d8c50;
	border: white;
	color: white;
}

#btn:hover {
	background-color: #b0d084;
	color: black;
}

.nav-item {
	margin: 10px;
	font-size: 1.15em;
}

.nav-item:hover {
	background-color: #f4f1eb;
	color: #f4f1eb;
}

#header_logo {
	float: left;
}

#header_search {
	float: right;
}

#dLabel {
	background-color: #2b473e;
}

#dLabel:hover {
	background-color: #6d8c50;
}

#inner {
	width: 100%;
	height: 460px;
}
.search-input {
}
</style>
</head>
<body style="padding-top: 0px; padding-bottom: 0px;">

	<!-- 심볼 -->
	<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="bootstrap" viewBox="0 0 118 94">
    <title>Bootstrap</title>
    <path fill-rule="evenodd" clip-rule="evenodd"
			d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
  </symbol>
  <symbol id="home" viewBox="0 0 16 16">
    <path
			d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"></path>
  </symbol>
  <symbol id="speedometer2" viewBox="0 0 16 16">
    <path
			d="M8 4a.5.5 0 0 1 .5.5V6a.5.5 0 0 1-1 0V4.5A.5.5 0 0 1 8 4zM3.732 5.732a.5.5 0 0 1 .707 0l.915.914a.5.5 0 1 1-.708.708l-.914-.915a.5.5 0 0 1 0-.707zM2 10a.5.5 0 0 1 .5-.5h1.586a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 10zm9.5 0a.5.5 0 0 1 .5-.5h1.5a.5.5 0 0 1 0 1H12a.5.5 0 0 1-.5-.5zm.754-4.246a.389.389 0 0 0-.527-.02L7.547 9.31a.91.91 0 1 0 1.302 1.258l3.434-4.297a.389.389 0 0 0-.029-.518z"></path>
    <path fill-rule="evenodd"
			d="M0 10a8 8 0 1 1 15.547 2.661c-.442 1.253-1.845 1.602-2.932 1.25C11.309 13.488 9.475 13 8 13c-1.474 0-3.31.488-4.615.911-1.087.352-2.49.003-2.932-1.25A7.988 7.988 0 0 1 0 10zm8-7a7 7 0 0 0-6.603 9.329c.203.575.923.876 1.68.63C4.397 12.533 6.358 12 8 12s3.604.532 4.923.96c.757.245 1.477-.056 1.68-.631A7 7 0 0 0 8 3z"></path>
  </symbol>
  <symbol id="table" viewBox="0 0 16 16">
    <path
			d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 2h-4v3h4V4zm0 4h-4v3h4V8zm0 4h-4v3h3a1 1 0 0 0 1-1v-2zm-5 3v-3H6v3h4zm-5 0v-3H1v2a1 1 0 0 0 1 1h3zm-4-4h4V8H1v3zm0-4h4V4H1v3zm5-3v3h4V4H6zm4 4H6v3h4V8z"></path>
  </symbol>
  <symbol id="people-circle" viewBox="0 0 16 16">
    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"></path>
    <path fill-rule="evenodd"
			d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"></path>
  </symbol>
  <symbol id="grid" viewBox="0 0 16 16">
    <path
			d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"></path>
  </symbol>
</svg>
	<!-- 헤더 시작 -->
	<header class="text-white" id="header" style="padding: 16px 8px;">
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-between justify-content-lg-start">
				<a href="main.jb"
					class="d-flex align-items-center me-lg-auto mb-2 mb-lg-0 text-white text-decoration-none">
					헬스체인 </a>
				<form class="col-7 mb-3 mb-lg-0 me-lg-5" onsubmit="return searchChk()" action="srBoard.sg" method="get">
					<input type="search" class="form-control form-control-white search-input" name="keyWord"
						placeholder="Search..." aria-label="Search">
				</form>
				<%
				if (session.getAttribute("userId") != null) {
				%>
				<!-- 로그인 상태 -->
				<div class="text-end">
					<div class="dropdown">
						<div id="dLabel" type="button" data-bs-toggle="dropdown"
							aria-expanded="false">
							[<%=session.getAttribute("userId")%>] 님 환영합니다 ▼
						</div>
						<ul class="dropdown-menu" aria-labelledby="dLabel">
							<%
							// 세션에서 userId 값을 가져옴
							String userId = (String) session.getAttribute("userId");
							if ("admin".equals(userId)) {
							%>
							<li><a class="dropdown-item" href="">관리자페이지</a></li>
							<%
							} else {
							%>
							<li><a class="dropdown-item" href="myPageController.sg?category=userUpdate">마이페이지</a></li>
							<%
							}
							%>
							<li><a class="dropdown-item" href="logout.sw">로그아웃</a></li>
						</ul>
					</div>
				</div>
				<%
				} else {
				%>
				<!-- 비로그인 상태 -->
				<div class="text-end">
					<button type="button" class="btn btn-outline-light me-2"
						onclick="location.href='loginForm.sw'">로그인</button>
					<button type="button" class="btn btn-warning" id="btn"
						onclick="location.href='joinForm.sw'">회원가입</button>
				</div>
				<%
				}
				%>
			</div>

		</div>
	</header>
	<!-- 헤더 종료 -->
	<!-- 메인 시작 -->
	<main>
		<!-- 카러셀, 광고부분 시작 -->
		<div id="carouselExampleAutoplaying" class="carousel slide"
			data-bs-ride="carousel" style="margin-bottom: 5px;">
			<div class="carousel-inner" id="inner">
				<div class="carousel-item">
					<img src="./view/main/images/1.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="./view/main/images/2.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item active">
					<img src="./view/main/images/3.jpg" class="d-block w-100" alt="...">
				</div>
			</div>

			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		</div>
		<!-- 카러셀 종료 -->
		<!-- 좌측 메뉴바 시작 -->
		<div class="parent">
			<div class="position-sticky pt-3" id="list"
				style="padding-top: 8px; width: auto; margin: 0px 8px;"
				align="center">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="frBoard.sg">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="#6d8c50"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-file" aria-hidden="true">
							<path
									d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
							<polyline points="14 2 14 8 20 8"></polyline>
							<line x1="16" y1="13" x2="8" y2="13"></line>
							<line x1="16" y1="17" x2="8" y2="17"></line>
							<polyline points="10 9 9 9 8 9"></polyline></svg> 자유 게시판
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="rvBoard.sg?order=new"> <svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="#6d8c50"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-file" aria-hidden="true">
							<path
									d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
							<polyline points="14 2 14 8 20 8"></polyline>
							<line x1="16" y1="13" x2="8" y2="13"></line>
							<line x1="16" y1="17" x2="8" y2="17"></line>
							<polyline points="10 9 9 9 8 9"></polyline></svg> 후기 게시판
					</a></li>
					<li class="nav-item"><a class="nav-link" href="qsBoard.sg">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="#6d8c50"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-shopping-cart" aria-hidden="true">
							<circle cx="9" cy="21" r="1"></circle>
							<circle cx="20" cy="21" r="1"></circle>
							<path
									d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
							<polyline points="14 2 14 8 20 8"></polyline>
							<line x1="16" y1="13" x2="8" y2="13"></line>
							<line x1="16" y1="17" x2="8" y2="17"></line>
							<polyline points="10 9 9 9 8 9"></polyline></svg> 질문 게시판
					</a></li>
					<li class="nav-item"><a class="nav-link" href="miBoard.sg">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="#6d8c50"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-layers" aria-hidden="true">
							<polygon points="12 2 2 7 12 12 22 7 12 2"></polygon>
							<polyline points="2 17 12 22 22 17"></polyline>
							<polyline points="2 12 12 17 22 12"></polyline></svg> 의료 정보
					</a></li>
				</ul>
				<ul class="nav flex-column mb-2">
					<li class="nav-item"><a class="nav-link" href="csBoard.sg">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="#6d8c50"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-file-text" aria-hidden="true">
							<path
									d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
							<polyline points="14 2 14 8 20 8"></polyline>
							<line x1="16" y1="13" x2="8" y2="13"></line>
							<line x1="16" y1="17" x2="8" y2="17"></line>
							<polyline points="10 9 9 9 8 9"></polyline></svg> 고객센터
					</a></li>
				</ul>
			</div>
			<!-- 좌측 메뉴바 종료 -->
			<div class="row align-items-md-stretch" style="width: auto;"
				align="right" id="board">
				<div class="col-md-6" style="width: 40%">
					<div class="h-100 p-4 pt-5 rounded-3" id="questgo"
						style="width: 100%">
						<h3>자신의 상태가 궁금하다면?</h3>
						<p>아무튼 질문 게시판 소개문구 넣으면 될것같은 자리. 질문게시판 보드로 이어지거나, 바로 질문 작성 란으로
							이어지면 좋겠다는 생각을 하는중</p>
						<button class="btn btn-outline-light" type="button"
							onclick="location.href='qsBoardWriteForm.sg'">질문 하러가기⇀</button>
					</div>
				</div>
				<div class="col-md-6 rounded-3" style="width: 60%">
					<div class="h-100 p-3 pt-4 text-black bg-white rounded-3">
						<h3 style="color: #2b473e;">추천글</h3>
						<hr>
						<div class="bestcontent"></div>
						<script type="text/javascript">
							for (var i = 0; i < 5; i++) {
								if (i == 4) {
									document
											.write("<a href='#'> 글 제목 | 작성자 | 추천수 | 작성일 </a><br>")
								} else
									document
											.write("<a href='#'>글 제목 | 작성자 | 추천수 | 작성일 </a><br><hr>")
							}
						</script>
					</div>
				</div>
			</div>
		</div>
		<!-- Marketing messaging and featurettes
  ================================================== -->


	</main>
	<!-- FOOTER -->
	<footer class="footer mt-auto py-3 bg-light">
		<div class="foot-container">
			<span class="text-muted">footer</span>
		</div>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script type="text/javascript">
		function searchChk() {
			const searchInput = document.querySelector(".search-input");
			if(searchInput.value === "") {
				alert("검색어를 입력해 주세요");
				return false;
			}
			return true;
		}
	</script>
	<script type="text/javascript">
		const getCnt = 5;
		let response = null;
		
		/* getTopNRvbByLike();
		setInterval(() => {
			getTopNRvbByLike();
		}, 10000); */
		
		async function getTopNRvbByLike() {
			await reqTopNRvbByLike();
			doRefresh();
		}
		async function reqTopNRvbByLike() {
			try {
				response = await axios.post("http://localhost:8080/HealthChain/GetRvbByLikeServlet", {
					reqCnt: getCnt
				});
			}
			catch(error) {
				response = null;
				console.error(error);
			}
		}
		function doRefresh() {
			if(response != null) {
				console.log(response.data);
			}
		}
	</script>
</body>
</html>