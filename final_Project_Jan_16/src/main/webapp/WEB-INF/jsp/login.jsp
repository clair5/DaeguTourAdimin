<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Daegu Tour Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<style type="text/css">
@font-face {
	font-family: 'SBAggroB';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
</style>
<style type="text/css">
@font-face {
	font-family: 'KIMM_Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KIMM_Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}
</style>
<style type="text/css">
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}
</style>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="navbar navbar-expand navbar-dark" style="margin: auto">
					<a class="navbar-brand ps-3"><h1
							style="font-family: 'SBAggroB'; text-align: center">Mth</h1></a>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container px-4" style="width: 500px; margin-top: 250px;">
					<h2 class="mt-4"
						style="text-align: center; font-family: 'SBAggroB'">관리자 로그인</h2>
						
					<form name="login" action="/login" method="post" th:if="${param.logout == null}">
						<div class="my-3">
							<input id="inputId" type="text" class="form-control" name="username"
								placeholder="ID를 입력하세요." style="text-align: center; font-family: 'KIMM_Bold'">
						</div>
						<div class="my-3">
							<input id="inputPw" type="password" class="form-control" name="password"
								placeholder="PW를 입력하세요." style="text-align: center; font-family: 'KIMM_Bold'">
						</div>
						<div style="text-align: center">
							<button id="btn_login" type="submit" class="btn"
								style="display: inline-block; background-color: #1f6322; color: #fff; font-family: 'SBAggroB'">LOGIN</button>
						</div>
					</form>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container px-4">
					<div
						class="d-flex align-items-center justify-content-between small"
						style="float: right;">
						<div class="text-muted" style="font-family: 'KIMM_Bold'">Copyright &copy; Mth 2023</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
