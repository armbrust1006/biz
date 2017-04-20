<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="wide wow-animation">
<head>
<title>Connexio</title>
<meta name="format-detection" content="telephone=no">
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="css/css.css?family=Montserrat:400,700%7CLato:300,300italic,400,400italic,700,900%7CPlayfair+Display:700italic,900">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/component.css">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
</head>
<body style="">
	<div class="page">
		<%@include file="../modules/header.jsp"%>
		<main class="page-content">
		<section style="background-image: url(images/1920x900.jpg);"
			class="section-30 section-sm-40 section-md-66 section-lg-bottom-90 bg-gray-dark page-title-wrap">
			<div class="shell">
				<div class="page-title">
					<h2>Register My Business Card</h2>
				</div>
			</div>
		</section>
		<section class="section-60 section-sm-top-90 section-sm-bottom-100">
			<div class="shell">
				<div class="range">
					<!-- 오른쪽 부분 -->
					<div class="cell-xs-5 offset-top-30">
						<div class="form-group">
							<!-- <textarea id="imageScan" name="imageScan"
								class="form-control form-control-has-validation" readonly> -->
							<output>${result}</output>
							<!-- </textarea>
							<label for="imageScan" class="form-label rd-input-label">ScanData</label> -->
						</div>
					</div>
				</div>
			</div>
		</section>
		</main>
		<%@include file="../modules/footer.jsp"%>
	</div>
	<%@include file="../modules/form-output-global.jsp"%>
	<script src="js/core.min.js"></script>
	<script src="js/script.js"></script>
	<script src="js/custom-file-input.js"></script>
	<!-- The Modal -->
	<div class="modal-open">
		<div id="myModal" class="modal">
			<!-- Modal content -->
			<div class="modal-dialog">
				<div class="modal-content">
					<br> <br>
					<div class="modal-header">
						<h3>
							Warning
							<button id="modal-close" data-dismiss="modal" class="close">
								&times;</button>
						</h3>
					</div>
					<div class="modal-body">
						<h6 id="myInput"></h6>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>