<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Daegu Tour Admin</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
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
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
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
			<div class="col-sm-20">
				<h2 style="font-family: 'SBAggroB'">
					<i class='fas fa-folder-open'></i><a> </a>${data.la_nm}</h2>
			</div>
		</div>
		<div class="row">
			<form name="form" method="post" style="width: 100%">
				<div class="form-group">
					<label style="font-family: 'KIMM_Bold'"><i class = "fas fa-language"></i><a> </a>내용(국문)</label>
					<textarea class="form-control" rows="5" id="la_dt_k" name="la_dt_k"
						readonly style="resize : none; font-family: Pretendard-Regular">${data.la_dt_k}</textarea>
				</div>
				<div class="form-group">
					<label style="font-family: 'KIMM_Bold'"><i class = "fas fa-language"></i><a> </a>내용(영문)</label>
					<textarea class="form-control" rows="5" id="la_dt_e" name="la_dt_e"
						readonly style="resize : none; font-family: Pretendard-Regular">${data.la_dt_e}</textarea>
				</div>
				<div class="form-group" style="font-family: 'KIMM_Bold'">
					<i class="fas fa-map-marker-alt"></i><a> </a> <label>주소</label>
					<textarea class="form-control" rows="1" id="la_mp" name="la_mp"
						readonly style="resize : none; font-family: Pretendard-Regular">${data.la_mp}</textarea>
				</div>
				<div class="form-group" style="font-family: 'KIMM_Bold'">
					<i class="fas fa-tablet-alt"></i><a> </a> <label>등록 기기</label>
					<textarea class="form-control" rows="1" id="dev_ui" name="dev_ui"
						readonly style="resize : none; font-family: Pretendard-Regular">${data.dev_ui}</textarea>
				</div>
				<div class="form-group" style="display: none">
					<textarea class="form-control" id="la_mp_x" name="la_mp_x">${data.la_mp_x}</textarea>
				</div>
				<div class="form-group" style="display: none">
					<textarea class="form-control" id="la_mp_y" name="la_mp_y">${data.la_mp_y}</textarea>
				</div>
				<button type="button" class="btn btn-warning"
					onclick="location.href ='landModifyForm?la_nm=${data.la_nm}'" style="font-family: Pretendard-Regular">수정</button>
				<button type="button" class="btn btn-warning"
					onclick="location.href ='landDelete?la_nm=${data.la_nm}'" style="font-family: Pretendard-Regular">삭제</button>
			</form>
		</div>
	</div>
	</div>
	</div>
</body>
</html>
