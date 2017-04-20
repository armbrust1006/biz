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
<script type="text/javascript">
	(function(e, t, n) {
		var r = e.querySelectorAll("html")[0];
		r.className = r.className.replace(/(^|\s)no-js(\s|$)/, "$1js$2")
	})(document, window, 0);

	window.onload = function() {
		document.getElementById("cardScan").onclick = imageSave;
	}

	/* 이미지 체크 및 스캔 시작 */
	function imageSave() {
		var file = document.querySelector("input[type=file]").files[0];
		if (file == null) {
			$('#myInput').html("Please check the Image!");
			$("#myModal").modal();
			console.log("woops");
			return;
		}
		console.log("Yep!");
		document.getElementById("ocrForm").submit();
	}

	function getThumbnailPrivew(html, $target) {
		if (html.files && html.files[0]) {
			var reader = new FileReader();
			reader.readAsDataURL(html.files[0]);
			reader.onload = function(e) {
				$target.css('display', '');
				//$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
				$target
						.html('<img src="' + e.target.result + '" border="0" alt="" />');
			}
		} else {
			$target.html('');
		}
	}
</script>
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
					<div class="cell-md-9 cell-lg-7">
						<h3>Scan Data</h3>
						<form action="imageScan"
							class="rd-mailform form-modern offset-top-30" method="post"
							id="ocrForm" name="ocrForm" data-form-output="form-output-global"
							data-form-type="order" enctype="multipart/form-data">
							<div class="filebox">
								<input type="hidden" id="m_id" name="m_id" value="${m_id}">
								<input type="hidden" id="cardType" name="cardType" value="other">
								<!--항목  -->

								<div class="cell-sm-3 offset-top-20">
									<div class="form-group">
										<input class="inputfile inputfile-1" type="file" id="file"
											name="file" accept="image/*" capture="camera"
											style="display: none"
											data-multiple-caption="{count} files selected" multiple=""
											onchange="getThumbnailPrivew(this,$('#cma_image'))">
										<label for="file"><svg
												xmlns="http://www.w3.org/2000/svg" width="20" height="17"
												viewBox="0 0 20 17">
												<path
													d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"></path></svg>
											<span>Choose a file…</span></label> <br /> <br />
										<div id="selLan" style="font-size: 20px">
											<label>Language :</label> <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
											<input type="radio" name="language" value="eng+kor" id="language"
												checked="checked" style="cursor: pointer"> <label
												for="kor" style="cursor: pointer">KOR</label>&nbsp;&nbsp;&nbsp;
											<input type="radio" name="language" value="eng" id="language"
												style="cursor: pointer"> <label for="eng"
												style="cursor: pointer">ENG</label>&nbsp;&nbsp;&nbsp; <input
												type="radio" name="language" value="jpn" id="language"
												style="cursor: pointer"> <label for="jpn"
												style="cursor: pointer">JAP</label>
										</div>
										<div id="cma_image"
											style="width: 100%; max-width: 100%; border: 1px solid #000; display: none;"></div>
									</div>
								</div>


								<div></div>
								<div
									class="cell-xs-2 offset-top-30 offset-xs-top-30 offset-sm-top-50">
									<input type="button" id="cardScan"
										class="btn btn-primary btn-block" value="Image Scan">
								</div>
							</div>
						</form>

						<!--폼 끝  -->

					</div>
					<!-- 오른쪽 부분 -->
					<div class="cell-xs-5 offset-top-30">
						<div class="form-group">
							<textarea id="imageScan" name="imageScan"
								class="form-control form-control-has-validation" readonly></textarea>
							<label for="imageScan" class="form-label rd-input-label">ScanData</label>
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