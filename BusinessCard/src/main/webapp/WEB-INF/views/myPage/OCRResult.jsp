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
<style type="text/css">
#leftText {
	width: 30%;
	float: left;
}

#rightImage {
	float: right;
}

#fileImage {
	width: 600px;
	height: 300px;
}
</style>
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
					<!-- 왼쪽 -->
					<div class="cell-md-12 cell-lg-12">
						<div class="cell-md-4 cell-lg-4" id="leftText">
							<h3>Scan Result</h3>
							<div class="form-group">
								<!-- <textarea id="imageScan" name="imageScan"
								class="form-control form-control-has-validation" readonly> -->
								<output>${result}</output>
								<!-- </textarea>
							<label for="imageScan" class="form-label rd-input-label">ScanData</label> -->
							</div>
						</div>
						<div class="cell-md-4 cell-lg-4" id="rightImage">
							<input type="file" id="file"
								value="downloadOCRImage?card=${file}" style="display: none;">
							<img src="downloadOCRImage?card=${file}" alt="" id="fileImage" />
						</div>
					</div>
					<!-- 오른쪽 부분 -->
					<div class="cell-xs-12 offset-top-30">
						<h3>Insert Informations</h3>
						<form action="saveCardData"
							class="rd-mailform form-modern offset-top-30" method="post"
							id="cardForm" name="cardForm"
							data-form-output="form-output-global" data-form-type="order"
							enctype="multipart/form-data">
							<div class="range range-7">
								<input type="hidden" id="m_id" name="m_id" value="${m_id}">
								<input type="hidden" id="cardType" name="cardType" value="my">

								<!--항목  -->
								<div class="cell-sm-3">
									<div class="form-group">
										<input type="text" id="name" name="name"
											data-constraints="@Required" class="form-control"> <label
											for="name" class="form-label rd-input-label">Name</label>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<input type="text" id="company" name="company"
											data-constraints="@Required" class="form-control"> <label
											for="company" class="form-label rd-input-label">Company</label>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<div>
											<input type="text" id="depart" name="depart"
												data-constraints="@Required" class="form-control"> <label
												for="depart" class="form-label rd-input-label">Department</label>
										</div>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<input type="text" id="position" name="position"
											data-constraints="@Required" class="form-control"> <label
											for="position" class="form-label rd-input-label">Position</label>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<input type="text" id="address" name="address"
											data-constraints="@Required" class="form-control"> <label
											for="address" class="form-label rd-input-label">Address</label>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<input type="email" id="email" name="email"
											data-constraints="@Email @Required" class="form-control">
										<label for="email" class="form-label rd-input-label">E-mail</label>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<input type="text" id="telephone" name="telephone"
											data-constraints="@Required" class="form-control"> <label
											for="telephone" class="form-label rd-input-label">Telephone</label>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<input type="text" id="fax" name="fax"
											data-constraints="@Required" class="form-control"> <label
											for="fax" class="form-label rd-input-label">Fax</label>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<input type="text" id="mobile" name="mobile"
											data-constraints="@Required" class="form-control"> <label
											for="mobile" class="form-label rd-input-label">Mobile</label>
									</div>
								</div>
								<br> <br>
								<div class="cell-sm-3">
									<div class="form-group" class="form-control" align="left">
										<label>Language&nbsp;&nbsp;:</label> <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</span> <input type="radio" name="language" value="kor" id="language"
											checked="checked" style="cursor: pointer"> <label
											for="kor" style="cursor: pointer">KOR</label>&nbsp;&nbsp;&nbsp;
										<input type="radio" name="language" value="eng" id="language"
											style="cursor: pointer"> <label for="eng"
											style="cursor: pointer">ENG</label>&nbsp;&nbsp;&nbsp; <input
											type="radio" name="language" value="jap" id="language"
											style="cursor: pointer"> <label for="jap"
											style="cursor: pointer">JAP</label>
									</div>
								</div>

								<div></div>
								<div
									class="cell-xs-2 offset-top-30 offset-xs-top-30 offset-sm-top-50">
									<button type="button" id="creatCard"
										class="btn btn-primary btn-block">Register</button>
								</div>

								<div
									class="cell-xs-2 offset-top-22 offset-xs-top-30 offset-sm-top-50">
									<button type="reset" class="btn btn-silver-outline btn-block"
										id="reset" align="center">Reset</button>
								</div>
							</div>
						</form>
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