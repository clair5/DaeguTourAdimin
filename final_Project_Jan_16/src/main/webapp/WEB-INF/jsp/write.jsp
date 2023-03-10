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
				<li class="nav-item"><a class="nav-link" href="landmark"
					style="font-family: KIMM_Bold">뒤로 가기</a></li>
			</ul>
		</div>
	</nav>
	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-12">
				<h2 style="font-family: 'KIMM_Bold'">문화재 DB 등록</h2>
				<form action='<c:url value='/writeAction'/>' method="POST"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="usr" style="font-family: 'KIMM_Bold'">이름:</label> <input type="text"
							class="form-control" id="la_nm" name="la_nm">
					</div>
					<div class="form-group">
						<input type="file" class="form-control-file border" name="file" style="font-family: 'KIMM_Bold'">
					</div>
					<div class="form-group">
						<label for="comment" style="font-family: 'KIMM_Bold'">내용(국문):</label>
						<textarea class="form-control" rows="5" id="la_dt_k"
							name="la_dt_k"></textarea>
					</div>
					<div class="form-group">
						<label for="comment" style="font-family: 'KIMM_Bold'">내용(영문):</label>
						<textarea class="form-control" rows="5" id="la_dt_e"
							name="la_dt_e"></textarea>
					</div>
					<div class="form-group">
						<label for="comment" style="font-family: 'KIMM_Bold'">주소:</label>
						<textarea class="form-control" rows="5" id="la_mp" name="la_mp"></textarea>
					</div>
					<div class="form-group">
						<label for="comment" style="font-family: 'KIMM_Bold'">기기 번호:</label>
						<textarea class="form-control" rows="5" id="dev_ui" name="dev_ui"></textarea>
					</div>
					<div class="form-group" style="display: none">
						<textarea class="form-control" id="la_mp_x" name="la_mp_x"></textarea>
					</div>
					<div class="form-group" style="display: none">
						<textarea class="form-control" id="la_mp_y" name="la_mp_y"></textarea>
					</div>
					<button type="submit" class="btn btn-warning" style="font-family: Pretendard-Regular">등록</button>
					<button type="button" class="btn btn-warning"
						onclick="location.href='landmark'" style="font-family: Pretendard-Regular">취소</button>
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
				$("#la_mp_x").html(result[0].y);
				$("#la_mp_y").html(result[0].x);
			}
		};

		$("#la_mp").change(function() {
			geocoder.addressSearch($("#la_mp").val(), callback);
		})
	</script>
</body>
</html>