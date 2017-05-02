<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="wide wow-animation">
<head>
<title>Business</title>
<meta name="format-detection" content="telephone=no">
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="css/css.css?family=Montserrat:400,700%7CLato:300,300italic,400,400italic,700,900%7CPlayfair+Display:700italic,900">
<link rel="stylesheet" href="css/style.css">
<!-- /* hover 효과  css*/ -->
<style>
.view {
	width: 562px;
	height: 282px;
	margin: 10px;
	float: left;
	border: 5px solid #fff;
	overflow: hidden;
	position: relative;
	text-align: center;
	box-shadow: 0px 0px 5px #aaa;
	cursor: default;
}

.view .mask, .view .content {
	width: 562px;
	height: 282px;
	position: absolute;
	overflow: hidden;
	top: 0;
	left: 0;
}

.view img {
	display: block;
	position: relative;
}

.view a.info {
	background: url(../img/link.png) center no-repeat;
	display: inline-block;
	text-decoration: none;
	padding: 0;
	text-indent: -9999px;
	width: 20px;
	height: 20px;
}

.fifth-effect img {
	opacity: 1;
	transition: all 0.3s ease-in;
}

.fifth-effect .mask {
	cursor: pointer;
	opacity: 0.5;
	visibility: visible;
	border: 200px solid rgba(0, 0, 0, 1);
	box-sizing: border-box;
	transition: all 0.4s cubic-bezier(0.940, 0.850, 0.100, 0.620);
}

.fifth-effect:hover .mask {
	border: 0px double rgba(0, 0, 0, 1);
	opacity: 0;
	visibility: hidden;
	border: 10px solid #217ED3;
}

.fifth-effect:hover img {
	opacity: 1;
}

.fifth-effect:hover view {
	border: 10px solid #217ED3;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	var error = "${error}";
	if (error != null && error != "") {
		alert(error);
		document.location.href = "${pageContext.request.contextPath}/login_home";
	}
</script>
</head>
<body style="">
	<div class="page">
		<%@include file="../modules/header.jsp"%>
		<main class="page-content">
		<section style="background-image: url(images/cardTypeEx/sample.jpg);"
			class="section-30 section-sm-40 section-md-66 section-lg-bottom-90 bg-gray-dark page-title-wrap">
			<div class="shell">
				<div class="page-title">
					<h2>Select ${cardType} Card Type</h2>
				</div>
			</div>
		</section>

		<section class="section-30 section-sm-100 section-lg-100">
			<div class="shell">
				<div class="range range-sm-center range-md-left">
					<c:forEach begin="0" end="5" step="1" var="layout">
						<div class="cell-sm-9 cell-md-6 height-fill offset-top-30">
						
							<div class="view fifth-effect">
								<a href="selectCardLayout?layout_num=${layout}"
									title="${layout}-Image"><img
									src="images/cardTypeEx/layout${layout}.png" alt="4" width="562"
									height="282" /></a>
								<div class="mask" id="type1"></div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
		</main>
		<%@include file="../modules/footer.jsp"%>
	</div>
	<%@include file="../modules/form-output-global.jsp"%>
	<script src="js/core.min.js"></script>
	<script src="js/script.js"></script>
</body>
</html>