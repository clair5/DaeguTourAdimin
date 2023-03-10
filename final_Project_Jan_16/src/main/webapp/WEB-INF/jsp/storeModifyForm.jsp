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
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}
</style>
</head>
<body>

	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-12">
				<h2>홍보 DB 수정</h2>
				<form action="storeModify" method="POST"
					enctype="multipart/form-data">
					<div class="form-group">
						<input type="file" class="form-control-file border" name="file">
					</div>
					<div class="form-group">
						<label>상호명</label>
						<textarea class="form-control" rows="5" id="st_nm" name="st_nm">${data.st_nm}</textarea>
					</div>
					<div class="form-group">
						<label>주소</label>
						<textarea class="form-control" rows="5" id="st_mp" name="st_mp">${data.st_mp}</textarea>
					</div>
					<div class="form-group">
						<label>소개</label>
						<textarea class="form-control" rows="5" id="st_dt" name="st_dt">${data.st_dt}</textarea>
					</div>
					<div class="form-group">
						<label>대표 메뉴</label>
						<textarea class="form-control" rows="5" id="st_mu" name="st_mu">${data.st_mu}</textarea>
					</div>
					<div class="form-group">
						<label>전화번호</label>
						<textarea class="form-control" rows="5" id="st_tel" name="st_tel">${data.st_tel}</textarea>
					</div>

					<div class="form-group" style="display: none">
						<textarea class="form-control" id="st_mp_x" name="st_mp_x"></textarea>
					</div>
					<div class="form-group" style="display: none">
						<textarea class="form-control" id="st_mp_y" name="st_mp_y"></textarea>
					</div>

					<button type="submit" class="btn btn-primary">
						<i class="far fa-save"></i><a> </a>완료
					</button>
					<button type="button" class="btn btn-primary"
						onclick="location.href='store'">돌아가기</button>
				</form>
				<input type="hidden" name="st_nm_data" value="${data.st_nm}">
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