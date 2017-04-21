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

	var canvas;
	$(document).ready(function() {
		$("input").on("keyup", cardView);
		$('input:file').on("change", cardView);
		document.getElementById("reset").onclick = canvasClear;
		document.getElementById("creatCard").onclick = imageSave;
	});

	/* 명함 clear */
	function canvasClear() {
		if (canvas != null) {
			var ctx = canvas.getContext("2d");
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			canvas = null;
			$("#logo").val("");
			$("#stext")
					.html(
							"<svg xmlns='http://www.w3.org/2000/svg' width='20' height='17' viewBox='0 0 20 17'> <path d='M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z'></path></svg> <span>Choose a file…</span>");
		}
	}

	/* 카드 캔버스 이미지 던지기 */
	function imageSave() {
		var nameV = document.getElementById("name").value;
		var companyV = document.getElementById("company").value;
		var mobileV = document.getElementById("mobile").value;
		var languageV = document.getElementById("language").value;

		if (canvas == null) {
			$('#myInput').html("Please create card!");
			$("#myModal").modal();
			return;
		}
		if (nameV == null || nameV == "") {
			$('#myInput').html("Please check the name!");
			$("#myModal").modal();
			return;
		}
		if (companyV == null || companyV == "") {
			$('#myInput').html("Please check the company!");
			$("#myModal").modal();
			return;
		}
		if (mobileV == null || mobileV == "") {
			$('#myInput').html("Please check the mobile!");
			$("#myModal").modal();
			return;
		}
		if (languageV == null || languageV == "") {
			$('#myInput').html("Please check the language!");
			$("#myModal").modal();
			return;
		}

		var imageData = canvas.toDataURL("image/png");
		var loginID = document.getElementById("m_id").value;

		$.ajax({
			type : 'post',
			url : 'saveCanvasImage',
			dataType : 'json',
			data : {
				imageBase64 : imageData,
				m_id : loginID,
				cardType : "my"
			},
			timeout : 100000,
			async : false,
			error : function() {
				console.log("WOOPS");
			},
			success : function(res) {
				if (res.ret == 0) {
					document.getElementById("cardForm").submit();
					console.log("SUCCESS");
				} else {
					console.log("FAIL : " + res.msg);
				}
			}
		});
	}

	/* 명함 생성 */
	function cardView() {
		canvas = document.getElementById("myCanvas");
		var context = canvas.getContext("2d");
		var file = document.querySelector("input[type=file]").files[0];
		var reader = new FileReader();

		/* 명함 clear */
		context.clearRect(0, 0, canvas.width, canvas.height);
		var type = window.location.search;

		if (type == "?type=2") {

			/* 명함 로고 */
			if (file != null) {
				reader.addEventListener("load", function() {
					var img = new Image();
					img.onload = function() {
						context.drawImage(img, 50, 35, 100, 100);
					}
					img.src = reader.result;
				}, false);

				if (file) {
					reader.readAsDataURL(file);
				}
			}

			context.font = "25px Arial";
			context.fillText("James Cloud"
					+ document.getElementById("name").value, 270, 70);

			context.font = "20px Arial";
			context.fillText("Komorebi Co"
					+ document.getElementById("company").value, 200, 130);

			context.font = "15px Arial";
			context.fillText("영업부" + document.getElementById("depart").value,
					200, 60);
			context.fillText("부장 " + document.getElementById("position").value,
					200, 80);

			context.font = "15px Arial";
			context.fillText("서울시 강남구 삼성동 코엑스 4층 101호"
					+ document.getElementById("address").value, 200, 180);
			context.fillText("Mobile | 010-4013-1414"
					+ document.getElementById("mobile").value, 200, 200);
			context.fillText("Tel | 02-3213-2132"
					+ document.getElementById("telephone").value, 200, 220);
			context.fillText("Fax | 02-2133-2131"
					+ document.getElementById("fax").value, 200, 240);
			context.fillText("E-mail | komorebi@komorebi.com"
					+ document.getElementById("email").value, 200, 260);

		}//2번 if

		else if (type == "?type=3") {
			/* 명함 로고 */
			if (file != null) {
				reader.addEventListener("load", function() {
					var img = new Image();
					img.onload = function() {
						context.drawImage(img, 250, 30, 100, 100);
					}
					img.src = reader.result;
				}, false);

				if (file) {
					reader.readAsDataURL(file);
				}
			}

			context.font = "20px Arial";
			context.fillText("James Cloud"
					+ document.getElementById("name").value, 50, 180);

			context.font = "15px Arial";
			context.fillText("영업부" + document.getElementById("depart").value,
					50, 220);
			context.fillText("부장 " + document.getElementById("position").value,
					50, 240);

			context.font = "20px Arial";
			context.fillText("Komorebi Co."
					+ document.getElementById("company").value, 50, 270);

			context.font = "15px Arial";
			context.fillText("서울시 강남구 삼성동 코엑스 4층 101호"
					+ document.getElementById("address").value, 300, 180);
			context.fillText("Mobile | 010-4013-1414"
					+ document.getElementById("mobile").value, 300, 200);
			context.fillText("Tel | 02-3213-2132"
					+ document.getElementById("telephone").value, 300, 220);
			context.fillText("Fax | 02-2133-2131"
					+ document.getElementById("fax").value, 300, 240);
			context.fillText("E-mail | komorebi@komorebi.com"
					+ document.getElementById("email").value, 300, 260);
		}//3번 if

		else if (type == "?type=4") {
			/* 명함 로고 */
			if (file != null) {
				reader.addEventListener("load", function() {
					var img = new Image();
					img.onload = function() {
						context.drawImage(img, 80, 40, 100, 100);
					}
					img.src = reader.result;
				}, false);

				if (file) {
					reader.readAsDataURL(file);
				}
			}

			context.font = "20px Arial";
			context.fillText("Komorebi Co. |"
					+ document.getElementById("company").value, 50, 220);

			context.font = "15px Arial";
			context.fillText("서울시 강남구 삼성동 코엑스 4층 101호"
					+ document.getElementById("address").value, 250, 220);
			context.fillText("Tel | 02-3213-2132"
					+ document.getElementById("telephone").value, 250, 240);
			context.fillText("Fax | 02-2133-2131"
					+ document.getElementById("fax").value, 400, 240);
			context.fillText("E-mail  |komorebi@komorebi.com"
					+ document.getElementById("email").value, 250, 260);

			context.font = "15px Arial";
			context.fillText("부장 " + document.getElementById("position").value,
					300, 140);
			context.fillText("| 영업부" + document.getElementById("depart").value,
					350, 140);

			context.font = "35px Arial";
			context.fillText("주 현 택" + document.getElementById("name").value,
					420, 140);

			context.font = "20px Arial";
			context.fillText("C.P. 010-4013-1414"
					+ document.getElementById("mobile").value, 350, 180);

		}//4번 if

		else if (type == "?type=5") {
			/* 명함 로고 */
			if (file != null) {
				reader.addEventListener("load", function() {
					var img = new Image();
					img.onload = function() {
						context.drawImage(img, 400, 50, 100, 100);
					}
					img.src = reader.result;
				}, false);

				if (file) {
					reader.readAsDataURL(file);
				}
			}
			context.font = "30px Arial";
			context.fillText("주 현 택" + document.getElementById("name").value,
					50, 80);

			context.font = "15px Arial";
			context.fillText("CEO" + document.getElementById("position").value,
					50, 110);
			context.fillText("Administrator"
					+ document.getElementById("depart").value, 50, 130);

			context.font = "20px Arial";
			context.fillText("Komorebi Co."
					+ document.getElementById("company").value, 380, 230);

			context.font = "15px Arial";
			context.fillText("서울시 강남구 삼성동 코엑스 4층 101호"
					+ document.getElementById("address").value, 70, 180);
			context.fillText("Mobile | 010-4013-1414"
					+ document.getElementById("mobile").value, 70, 200);
			context.fillText("Tel | 02-3213-2132"
					+ document.getElementById("telephone").value, 70, 220);
			context.fillText("Fax | 02-2133-2131"
					+ document.getElementById("fax").value, 70, 240);
			context.fillText("E-mail  | komorebi@komorebi.com"
					+ document.getElementById("email").value, 70, 260);

		}//5번 if

		else if (type == "?type=6") {
			/* 명함 로고 */
			if (file != null) {
				reader.addEventListener("load", function() {
					var img = new Image();
					img.onload = function() {
						context.drawImage(img, 400, 50, img.width, img.height);
					}
					img.src = reader.result;
				}, false);

				if (file) {
					reader.readAsDataURL(file);
				}
			}
			context.font = "30px Arial";
			context.fillText("주 현 택" + document.getElementById("name").value,
					50, 80);

			context.font = "15px Arial";
			context.fillText("CEO" + document.getElementById("position").value,
					50, 110);
			context.fillText("Administrator"
					+ document.getElementById("depart").value, 50, 130);

			context.font = "20px Arial";
			context.fillText("Komorebi Co."
					+ document.getElementById("company").value, 380, 230);

			context.font = "15px Arial";
			context.fillText("서울시 강남구 삼성동 코엑스 4층 101호"
					+ document.getElementById("address").value, 70, 180);
			context.fillText("Mobile | 010-4013-1414"
					+ document.getElementById("mobile").value, 70, 200);
			context.fillText("Tel | 02-3213-2132"
					+ document.getElementById("telephone").value, 70, 220);
			context.fillText("Fax | 02-2133-2131"
					+ document.getElementById("fax").value, 70, 240);
			context.fillText("E-mail  | komorebi@komorebi.com"
					+ document.getElementById("email").value, 70, 260);

		}//6번 if

	}//cardview 메소드 if
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
					<h2>Register My Business Card</h2>
				</div>
			</div>
		</section>
		<section class="section-60 section-sm-top-90 section-sm-bottom-100">
			<div class="shell">
				<div class="range">
					<div class="cell-md-9 cell-lg-7">
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

								<div class="cell-sm-3 offset-top-20">
									<div class="form-group">
										<input class="inputfile inputfile-1" type="file" id="logo"
											name="logo" style="display: none;"
											data-multiple-caption="{count} files selected" multiple=""
											accept="image/*"> <label for="logo" id="stext"><svg
												xmlns="http://www.w3.org/2000/svg" width="20" height="17"
												viewBox="0 0 20 17">
											<path
													d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"></path></svg>
											<span>Choose a file…</span></label>
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

						<!--폼 끝  -->

					</div>
					<!-- 오른쪽 부분 -->
					<div
						class="cell-xs-2 offset-top-30 offset-xs-top-30 offset-sm-top-50">
						<canvas id="myCanvas" width="600" height="300"
							style="border: 2px solid #d3d3d3;"></canvas>
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