<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.list-wide-bordered li {
	min-height: 35px;
	padding: 6px 50px;
}

#fileImage {
	max-height: 300px;
	max-width: 600px;
}
</style>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		document.getElementById("saveOCRData").onclick = dataCheck;
	}

	function dataCheck() {
		var name = document.getElementById("name").value;
		var company = document.getElementById("company").value;
		var mobile = document.getElementById("mobile").value;

		if (name == null || name == "") {
			$('#myInput').html("Please select a name area!");
			$("#myModal").modal();
			console.log("woops");
			return;
		}
		if (company == null || company == "") {
			$('#myInput').html("Please select a company area!");
			$("#myModal").modal();
			console.log("woops");
			return;
		}
		if (mobile == null || mobile == "") {
			$('#myInput').html("Please select a mobile area!");
			$("#myModal").modal();
			console.log("woops");
			return;
		}
		document.getElementById("cardForm").submit();
	}
</script>
</head>
<body style="">
	<!-- Error Modal -->
	<div class="modal-open">
		<div id="myModal" class="modal">
			<!-- Modal content -->
			<div class="modal-dialog">
				<div class="modal-content">
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

	<div class="page">
		<%@include file="../modules/header.jsp"%>
		<main class="page-content">
		<!-- <section 
			class="section-30 section-sm-40 section-md-66 section-lg-bottom-90 bg-gray-dark page-title-wrap">
			<div class="shell">
				<div class="page-title">
					<h2>Register My Business Card</h2>
				</div>
			</div>
		</section> -->
		<section class="section-60 section-sm-top-90 section-sm-bottom-100">
			<div class="shell">
				<div class="range">
					<!-- 왼쪽 -->
					<div class="cell-md-12 cell-lg-12">
						<div class="cell-md-4 cell-lg-4" id="rightImage">
							<h3>Scan Image</h3>
							<img src="downloadOCRImage?card=${card.imagePath}" alt=""
								id="fileImage" />
						</div>
					</div>
					<!-- 오른쪽 부분 -->
					<div class="cell-xs-12 offset-top-30">
						<h3>Insert Informations</h3>
						<form action="ocrImageDataSave"
							class="rd-mailform form-modern offset-top-30" method="post"
							id="cardForm" name="cardForm"
							data-form-output="form-output-global" data-form-type="order"
							enctype="multipart/form-data">
							<div class="range range-7">
								<input type="hidden" id="m_id" name="m_id" value="${m_id}">
								<input type="hidden" id="cardType" name="cardType"
									value="${card.cardType}"> <input type="hidden"
									id="imagePath" name="imagePath" value="${card.imgOriginal}"><input
									type="hidden" id="layout_num" name="layout_num"
									value="${card.layout_num}">
								<!--항목  -->
								<div class="cell-sm-3">
									<div class="form-group">
										<input type="text" id="name" name="name"
											<c:if test="${OCRResultData.name!=null}">value="${OCRResultData.name}"</c:if>
											data-constraints="@Required" class="form-control"> <label
											for="name" class="form-label rd-input-label">Name</label>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<input type="text" id="company" name="company"
											<c:if test="${OCRResultData.company!=null}">value="${OCRResultData.company}"</c:if>
											data-constraints="@Required" class="form-control"> <label
											for="company" class="form-label rd-input-label">Company</label>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<div>
											<input type="text" id="depart" name="depart"
												<c:if test="${OCRResultData.depart!=null}">value="${OCRResultData.depart}"</c:if>
												data-constraints="@Required" class="form-control"> <label
												for="depart" class="form-label rd-input-label">Department</label>
										</div>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<input type="text" id="position" name="position"
											<c:if test="${OCRResultData.position!=null}">value="${OCRResultData.position}"</c:if>
											data-constraints="@Required" class="form-control"> <label
											for="position" class="form-label rd-input-label">Position</label>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<input type="text" id="address" name="address"
											<c:if test="${OCRResultData.address!=null}">value="${OCRResultData.address}"</c:if>
											data-constraints="@Required" class="form-control"> <label
											for="address" class="form-label rd-input-label">Address</label>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<input type="email" id="email" name="email"
											<c:if test="${OCRResultData.email!=null}">value="${OCRResultData.email}"</c:if>
											data-constraints="@Email @Required" class="form-control">
										<label for="email" class="form-label rd-input-label">E-mail</label>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<input type="text" id="telephone" name="telephone"
											<c:if test="${OCRResultData.telephone!=null}">value="${OCRResultData.telephone}"</c:if>
											data-constraints="@Required" class="form-control"> <label
											for="telephone" class="form-label rd-input-label">Telephone</label>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<input type="text" id="fax" name="fax"
											<c:if test="${OCRResultData.fax!=null}">value="${OCRResultData.fax}"</c:if>
											data-constraints="@Required" class="form-control"> <label
											for="fax" class="form-label rd-input-label">Fax</label>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<input type="text" id="mobile" name="mobile"
											<c:if test="${OCRResultData.mobile!=null}">value="${OCRResultData.mobile}"</c:if>
											data-constraints="@Required" class="form-control"> <label
											for="mobile" class="form-label rd-input-label">Mobile</label>
									</div>
								</div>
								<div class="cell-sm-3">
									<div id="selLan" style="font-size: 20px">
										<ul class="list-wide-bordered">
											<li><label class="radio-inline"> <input
													id="language" type="radio" name="language"
													<c:if test="${card.language eq 'eng'}">checked</c:if>
													value="eng" class="radio-custom"><span
													class="radio-custom-dummy"></span> English
											</label><label class="radio-inline"> <input id="language"
													type="radio" name="language"
													<c:if test="${card.language eq 'eng+kor'}">checked</c:if>
													value="eng+kor" class="radio-custom"><span
													class="radio-custom-dummy"></span> Korean
											</label><label class="radio-inline"> <input id="language"
													type="radio" name="language"
													<c:if test="${card.language eq 'eng+jpn'}">checked</c:if>
													value="eng+jpn" class="radio-custom"><span
													class="radio-custom-dummy"></span> Japanese
											</label></li>
										</ul>
									</div>
								</div>

								<div></div>
								<div
									class="cell-xs-2 offset-top-30 offset-xs-top-30 offset-sm-top-50">
									<button type="button" id="saveOCRData" name="saveOCRData"
										class="btn btn-primary btn-block">Register</button>
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