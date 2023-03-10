<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>Daegu Tour Admin</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=547998bf23fd4dc95fc3ee0ad6d8b8ce&libraries=services"></script>
<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}

.subReply {
	padding-left: 50px;
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
</head>
<body>
	<nav class="navbar navbar-expand-sm navbar-dark nav-fixed">
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="main" style="font-family : KIMM_Bold">홈</a></li>
				<li class="nav-item"><a class="nav-link" href="store"
					style="font-family: KIMM_Bold">뒤로 가기</a></li>
			</ul>
		</div>
	</nav>
	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-12">
				<h2 style="font-family: 'KIMM_Bold'">홍보 DB 등록</h2>
				<form action='<c:url value='/writeStoreAction'/>' method="POST"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="usr" style="font-family: 'KIMM_Bold'">상호명:</label> <input type="text"
							class="form-control" id="st_nm" name="st_nm">
					</div>
					<div class="form-group">
						<label for="comment" style="font-family: 'KIMM_Bold'">업종:</label>
						<textarea class="form-control" rows="5" id="st_dt" name="st_dt"></textarea>
					</div>
					<div class="form-group" style="display: none">
						<textarea class="form-control" id="st_mp_x" name="st_mp_x"></textarea>
					</div>
					<div class="form-group" style="display: none">
						<textarea class="form-control" id="st_mp_y" name="st_mp_y"></textarea>
					</div>
					<div class="form-group">
						<label for="comment" style="font-family: 'KIMM_Bold'">주소 :</label>
						<textarea class="form-control" rows="5" id="st_mp" name="st_mp"></textarea>
					</div>
					<div class="form-group">
						<label for="comment" style="font-family: 'KIMM_Bold'">대표 메뉴 :</label>
						<textarea class="form-control" rows="5" id="st_mu" name="st_mu"></textarea>
					</div>
					<div class="form-group">
						<label for="comment" style="font-family: 'KIMM_Bold'">전화번호</label>
						<textarea class="form-control" rows="5" id="st_tel" name="st_tel"></textarea>
					</div>


					<button type="submit" class="btn btn-warning" id="submit" style="font-family: Pretendard-Regular">등록</button>
					<button type="button" class="btn btn-warning"
						onclick="location.href='store'" style="font-family: Pretendard-Regular">취소</button>
				</form>
			</div>
		</div>
	</div>

	<script>
		var geocoder = new kakao.maps.services.Geocoder();

		var callback = function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				console.log(result[0].x);
				console.log(result[0].y);
				$("#st_mp_x").html(result[0].y);
				$("#st_mp_y").html(result[0].x);
			}
		};

		// geocoder.addressSearch('경북 경산시 펜타힐즈2로 20', callback);

		$("#st_mp").change(function() {
			geocoder.addressSearch($("#st_mp").val(), callback);
		})
	</script>

</body>
</html>