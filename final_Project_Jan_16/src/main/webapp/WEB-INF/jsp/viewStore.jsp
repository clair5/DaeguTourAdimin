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
				<li class="nav-item"><a class="nav-link" href="store"
					style="font-family: KIMM_Bold">뒤로 가기</a></li>
			</ul>
		</div>
	</nav>
	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-20">
				<h2 style="font-family: 'SBAggroB'">
					<i class='fas fa-folder-open'></i><a> </a>${data.st_nm}</h2>
			</div>
		</div>
		<div class="row">
			<form name="form" method="post" style="width: 100%">
				<div class="form-group">
					<i class="fas fa-exclamation-circle"></i><a> </a><label style="font-family: 'KIMM_Bold'">소개</label>
					<textarea class="form-control" rows="5" id="st_dt" name="st_dt"
						readonly style="resize : none; font-family: Pretendard-Regular">${data.st_dt}</textarea>
				</div>
				<div class="form-group">
					<i class="fas fa-utensils"></i><a> </a><label style="font-family: 'KIMM_Bold'">대표 메뉴</label>
					<textarea class="form-control" rows="5" id="st_mu" name="st_mu"
						readonly style="resize : none; font-family: Pretendard-Regular">${data.st_mu}</textarea>
				</div>
				<div class="form-group">
					<label style="font-family: 'KIMM_Bold'"><i class="fas fa-phone"></i><a> </a>전화번호</label>
					<textarea class="form-control" rows="5" id="st_tel" name="st_tel"
						readonly style="resize : none; font-family: Pretendard-Regular">${data.st_tel}</textarea>
				</div>
				<div class="form-group">
					<label style="font-family: 'KIMM_Bold'"><i class="fas fa-map-marker-alt"></i><a> </a>주소</label>
					<textarea class="form-control" rows="5" id="st_mp" name="st_mp"
						readonly style="resize : none; font-family: Pretendard-Regular">${data.st_mp}</textarea>
				</div>
				<button type="button" class="btn btn-warning"
					onclick="location.href ='storeModifyForm?st_nm=${data.st_nm}'" style="font-family: Pretendard-Regular">수정</button>
				<button type="button" class="btn btn-warning"
					onclick="location.href ='storeDelete?st_nm=${data.st_nm}'"style="font-family: Pretendard-Regular">삭제</button>
			</form>
		</div>
	</div>
	</div>
	</div>
</body>
</html>
