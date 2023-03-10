<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
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
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=547998bf23fd4dc95fc3ee0ad6d8b8ce&libraries=services"></script>
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
				<div class="navbar navbar-expand navbar-dark" style="margin:auto">
				<a class="navbar-brand ps-3" href="main"><h1
				style="font-family: 'SBAggroB'; text-align:center">Mth</h1></a>
				</div>
				<div class="sb-sidenav-menu" style="position: relative">
					<div class="nav">
						<a class="nav-link" href="main" style="font-family: 'SBAggroB'; margin:auto">
							<div class="sb-nav-link-icon"></div> HOME
						</a> <a class="nav-link collapsed" href="landmark"
							style="font-family: 'SBAggroB'; margin:auto">
							<div class="sb-nav-link-icon"></div> 관광지
						</a> <a class="nav-link collapsed" href="store"
							style="font-family: 'SBAggroB'; margin:auto">
							<div class="sb-nav-link-icon"></div> 홍보
						</a>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
			<div class="container px-4">
					<p style="float: right">${username}님 환영합니다.<br><br><button class="btn btn-logout" type="button" onclick="location.href='logout'"
						style="font-family: 'Pretendard-Regular'; float: right">로그아웃</button></p>
				</div>
				<div class="container px-4">
					<h1 class="mt-4" style="font-family: 'SBAggroB'">홍보 DB</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active" style="font-family: 'SBAggroB'">등록된
							가게 목록</li>
					</ol>
					<div class="card mb-4">
						<div class="card-header" style="font-family: KIMM_Bold">
							<i class="fas fa-store"></i> 가게 현황
						</div>
						<div class="card-body">
							<table
								class="table table-sm  border-grey margin-left:auto margin-right:auto">
								<thead class="bg-warning" style="font-family: KIMM_Bold">
									<tr>
										<th scope="col" class="text-center"><i class="fas fa-tag"></i><a> </a>이름</th>
										<th scope="col" class="text-center"><i
											class="fas fa-stream"></i><a> </a>업종</th>
										<th scope="col" class="text-center"><i class="fas fa-map-marker-alt"></i><a>
										</a>주소</th>
										<th scope="col" class="text-center"><i
											class="fas fa-utensils"></i><a> </a>대표 메뉴</th>
									</tr>
								</thead>
								<tbody id="storeListArea"
									style="font-family: Pretendard-Regular">
									<c:forEach items="${list}" var="data">
										<tr>
											<td class="text-center"><a
												href="/viewStore?st_nm=${data.st_nm}"
												style="text-decoration: none; color: black;">${data.st_nm}</a></td>
											<td class="text-center">${data.st_dt}</td>
											<td class="text-center">${data.st_mp}</td>
											<td class="text-center">${data.st_mu}</td>
										</tr>
									</c:forEach>
									<!-- 모델에 담아둔 list를 forEach구문을 사용해서 테이블에 출력. var = data로 모델에 담아둔 리스트의 이름을 data로 선언 -->
								</tbody>
							</table>
							<div class="btnList">
								<button type="button" class="writeBtn btn btn-warning"
									onclick="location.href='writeStore'" style="float: right; font-family: Pretendard-Regular">
									<i class="fas fa-edit"></i><a> </a>신규 등록
								</button>
								<!-- 누르면 writeStore.jsp 요청하고 controller는 writeStore 메소드 실행해서 writeStore.jsp 리턴-->
							</div>

						</div>
					</div>
					<div class="card mb-4">
						<div class="card-header" style="font-family: KIMM_Bold">
							<i class="far fa-map"></i> 위치 지도
						</div>
						<div class="card-body">
							<div id="map" style="width: 100%; height: 400px;"></div>
						</div>
					</div>
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
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(35.8708319225878, 128.588677095755), // 지도의 중심좌표
			level : 4
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다

		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		var geocoder = new kakao.maps.services.Geocoder();
		
		var positions = [];
		var landName = [];
		<c:forEach items="${list}" var="data">
			positions.push("${data.st_mp}");
			landName.push("${data.st_nm}");
		</c:forEach>
		console.log(landName);
		console.log(positions);
		
		for(let i = 0; i < positions.length; i++) {
			
		// 주소로 좌표를 검색합니다
			geocoder.addressSearch(positions[i], function(result, status) {	

			// 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
	
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        
			        var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			        
			        var imageSize = new kakao.maps.Size(24, 35);
			        
			        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
	
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords,
			            image : markerImage
			            
			        });   
			    } 
			
		  // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:2px 0;">' + landName[i] + '</div>'
			        });
			        infowindow.open(map, marker);	
		});
			
	}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
