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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="navbar navbar-expand navbar-dark" style="margin: auto">
					<a class="navbar-brand ps-3" href="main"><h1
							style="font-family: 'SBAggroB'; text-align: center">Mth</h1></a>
				</div>
				<div class="sb-sidenav-menu" style="position: relative">
					<div class="nav">
						<a class="nav-link" href="main"
							style="font-family: 'SBAggroB'; margin: auto">
							<div class="sb-nav-link-icon"></div> HOME
						</a> <a class="nav-link collapsed" href="landmark"
							style="font-family: 'SBAggroB'; margin: auto">
							<div class="sb-nav-link-icon"></div> 관광지
						</a> <a class="nav-link collapsed" href="store"
							style="font-family: 'SBAggroB'; margin: auto">
							<div class="sb-nav-link-icon"></div> 홍보
						</a>
					</div>
				</div>
			</nav>
		</div>
		x
		<div id="layoutSidenav_content">
			<main>
				<div class="container px-4">
					<p style="float: right">${username}님 환영합니다.<br><br><button class="btn btn-logout" type="button" onclick="location.href='logout'"
						style="font-family: 'Pretendard-Regular'; float: right">로그아웃</button></p>
				</div>
				<div class="container px-4">
					<h1 class="mt-4" style="font-family: 'SBAggroB'">종합 통계</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active" style="font-family: 'SBAggroB'">Dashboard</li>
					</ol>
					<div class="row"></div>
					<div class="row">
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header" style="font-family: KIMM_Bold">
									<i class="fas fa-chart-area me-1"></i>방문자 통계
								</div>
								<div class="card-body">
									<canvas id="myAreaChart" width="100%" height="40"></canvas>
								</div>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header" style="font-family: KIMM_Bold">
									<i class="fas fa-chart-bar me-1"></i> 막대 차트
								</div>
								<div class="card-body">
									<canvas id="myBarChart" width="100%" height="40"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container px-4">
					<div
						class="d-flex align-items-center justify-content-between small"
						style="float: right;">
						<div class="text-muted" style="font-family: 'KIMM_Bold'">Copyright
							&copy; Mth 2023</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<!-- 	<script src="assets/demo/chart-area-demo.js"></script> -->
	<!-- 	<script src="assets/demo/chart-bar-demo.js"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
	<script>
		var ctx = document.getElementById('myAreaChart');
		var myLineChart = new Chart(ctx, {
			type : 'line',
			data : {
				labels : [ "Jan 8", "Jan 9", "Jan 10", "Jan 11", "Jan 12" ],
				datasets : [ {
					label : "방문자 수",
					lineTension : 0.3,
					backgroundColor : "rgba(31, 99, 34, 0.2)",
					borderColor : "rgba(31, 99, 34, 1)",
					pointRadius : 5,
					pointBackgroundColor : "rgba(31, 99, 34, 1)",
					pointBorderColor : "rgba(255,255,255,0.8)",
					pointHoverRadius : 5,
					pointHoverBackgroundColor : "rgba(31, 99, 34, 1)",
					pointHitRadius : 50,
					pointBorderWidth : 2,
					data : [ 17, 14, 24, 15, 20, 25 ],
				} ],
			},
			options : {
				scales : {
					xAxes : [ {
						time : {
							unit : 'date'
						},
						gridLines : {
							display : false
						},
						ticks : {
							maxTicksLimit : 7
						}
					} ],
					yAxes : [ {
						ticks : {
							min : 0,
							max : 40,
							maxTicksLimit : 5
						},
						gridLines : {
							color : "rgba(0, 0, 0, .125)",
						}
					} ],
				},
				legend : {
					display : false
				}
			}
		});

		var barChart = document.getElementById("myBarChart");
		var myLineChart = new Chart(barChart, {
			type : 'bar',
			data : {
				labels : [ "계산성당", "약령시", "대구근대역사박물관", "서문시장", "2.28공원" ],
				datasets : [ {
					label : "Revenue",
					backgroundColor : "rgba(2,117,216,1)",
					borderColor : "rgba(31, 99, 34, 1)",
					data : [ 4215, 5312, 6251, 7841, 9821 ],
				} ],
			},
			options : {
				scales : {
					xAxes : [ {
						time : {
							unit : 'month'
						},
						gridLines : {
							display : false
						},
						ticks : {
							maxTicksLimit : 6
						}
					} ],
					yAxes : [ {
						ticks : {
							min : 0,
							max : 15000,
							maxTicksLimit : 5
						},
						gridLines : {
							display : true
						}
					} ],
				},
				legend : {
					display : false
				}
			}
		});
	</script>
</body>
</html>
