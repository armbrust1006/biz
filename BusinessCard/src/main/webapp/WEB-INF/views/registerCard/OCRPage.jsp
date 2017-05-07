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
<link rel="stylesheet" type="text/css"
	href="css/imgareaselect-default.css" />
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/component.css">
<style type="text/css">
#scanList li div{
width:70%;
}

.radio-inline {
	width: 30%;
}

output {
	float: right;
}

#canvasM {
	width: auto;
	height: auto;
	max-width: 970px;
	max-height: 300px;
}
</style>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.imgareaselect.pack.js"></script>
<script type="text/javascript">
	(function(e, t, n) {
		var r = e.querySelectorAll("html")[0];
		r.className = r.className.replace(/(^|\s)no-js(\s|$)/, "$1js$2")
	})(document, window, 0);

	var layout_num;
	var file;
	var reader;

	var imgSize = new Array();

	var getterValue = new Array();
	for (var i = 0; i < 9; i++) {
		getterValue[i] = new Array(4);
	}

	$(document).ready(function($) {
		layout_num = document.getElementById("layout_num").value;

		document.getElementById("getName").onclick = function() {
			$('#upimg').imgAreaSelect({
				instance : true,
				autoHide : true,
				onSelectEnd : function(i, e) {
					getterValue[0][0] = e.x1;
					getterValue[0][1] = e.y1;
					getterValue[0][2] = e.width;
					getterValue[0][3] = e.height;
					document.getElementById("nameState").value = "OK";
					console.log(getterValue);
					imgSize[0] = $("#upimg").width();
					imgSize[1] = $("#upimg").height();
					console.log(imgSize);
				}
			});
		}
		document.getElementById("getCompany").onclick = function() {
			$('#upimg').imgAreaSelect({
				instance : true,
				autoHide : true,
				onSelectEnd : function(i, e) {
					getterValue[1][0] = e.x1;
					getterValue[1][1] = e.y1;
					getterValue[1][2] = e.width;
					getterValue[1][3] = e.height;
					document.getElementById("companyState").value = "OK";
					console.log(getterValue);
				}
			});
		}
		document.getElementById("getDepart").onclick = function() {
			$('#upimg').imgAreaSelect({
				instance : true,
				autoHide : true,
				onSelectEnd : function(i, e) {
					getterValue[2][0] = e.x1;
					getterValue[2][1] = e.y1;
					getterValue[2][2] = e.width;
					getterValue[2][3] = e.height;
					document.getElementById("departState").value = "OK";
					console.log(getterValue);
				}
			});
		}
		document.getElementById("getPosition").onclick = function() {
			$('#upimg').imgAreaSelect({
				instance : true,
				autoHide : true,
				onSelectEnd : function(i, e) {
					getterValue[3][0] = e.x1;
					getterValue[3][1] = e.y1;
					getterValue[3][2] = e.width;
					getterValue[3][3] = e.height;
					document.getElementById("positionState").value = "OK";
					console.log(getterValue);
				}
			});
		}
		document.getElementById("getAddress").onclick = function() {
			$('#upimg').imgAreaSelect({
				instance : true,
				autoHide : true,
				onSelectEnd : function(i, e) {
					getterValue[4][0] = e.x1;
					getterValue[4][1] = e.y1;
					getterValue[4][2] = e.width;
					getterValue[4][3] = e.height;
					document.getElementById("addressState").value = "OK";
					console.log(getterValue);
				}
			});
		}
		document.getElementById("getEmail").onclick = function() {
			$('#upimg').imgAreaSelect({
				instance : true,
				autoHide : true,
				onSelectEnd : function(i, e) {
					getterValue[5][0] = e.x1;
					getterValue[5][1] = e.y1;
					getterValue[5][2] = e.width;
					getterValue[5][3] = e.height;
					document.getElementById("emailState").value = "OK";
					console.log(getterValue);
				}
			});
		}
		document.getElementById("getTelephone").onclick = function() {
			$('#upimg').imgAreaSelect({
				instance : true,
				autoHide : true,
				onSelectEnd : function(i, e) {
					getterValue[6][0] = e.x1;
					getterValue[6][1] = e.y1;
					getterValue[6][2] = e.width;
					getterValue[6][3] = e.height;
					document.getElementById("telephoneState").value = "OK";
					console.log(getterValue);
				}
			});
		}
		document.getElementById("getFax").onclick = function() {
			$('#upimg').imgAreaSelect({
				instance : true,
				autoHide : true,
				onSelectEnd : function(i, e) {
					getterValue[7][0] = e.x1;
					getterValue[7][1] = e.y1;
					getterValue[7][2] = e.width;
					getterValue[7][3] = e.height;
					document.getElementById("faxState").value = "OK";
					console.log(getterValue);
				}
			});
		}
		document.getElementById("getMobile").onclick = function() {
			$('#upimg').imgAreaSelect({
				instance : true,
				autoHide : true,
				onSelectEnd : function(i, e) {
					getterValue[8][0] = e.x1;
					getterValue[8][1] = e.y1;
					getterValue[8][2] = e.width;
					getterValue[8][3] = e.height;
					document.getElementById("mobileState").value = "OK";
					console.log(getterValue);
				}
			});
		}

		document.addEventListener("mouseup", function(e) {
			$('#upimg').imgAreaSelect({
				disable : true
			});
		}, true);
	});

	function clearSetting() {
		getterValue = new Array();
		for (var i = 0; i < 9; i++) {
			document.getElementsByName("state")[i].value = "No Data";
			getterValue[i] = new Array(4);
		}
	}

	/* 이미지 체크 및 스캔 시작 */
	function imageSave() {
		var file = null;
		file = document.querySelector("input[type=file]").files[0];
		if (document.getElementById("nameState").value != "OK") {
			$('#myInput').html("Please select a name area!");
			$("#myModal").modal();
			console.log("woops");
			return false;
		}
		if (document.getElementById("companyState").value != "OK") {
			$('#myInput').html("Please select a company area!");
			$("#myModal").modal();
			console.log("woops");
			return false;
		}
		if (document.getElementById("mobileState").value != "OK") {
			$('#myInput').html("Please select a mobile area!");
			$("#myModal").modal();
			console.log("woops");
			return false;
		}
		if (file == null) {
			$('#myInput').html("Please check the Image!");
			$("#myModal").modal();
			console.log("woops");
			return false;
		}
		document.getElementById("imgSize").value = imgSize;
		document.getElementById("getterValue").value = getterValue;
		document.getElementById("ocrForm").submit();
	}

	function getThumbnailPrivew(html, $target) {
		if (html.files && html.files[0]) {
			var reader = new FileReader();
			reader.readAsDataURL(html.files[0]);
			reader.onload = function(e) {
				$target.css('display', '');
				//$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
				//$target.html('<img src="' + e.target.result + '" id="upimg" border="0" alt=""/>');
				$("#upimg").attr("src", e.target.result);
				$("#selectimg").attr("src", e.target.result);
			}
		} else {
			$("#upimg").attr("src", "");
			$("#selectimg").attr("src", "");
			clearSetting();
		}
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
		<%-- <section 
			class="section-30 section-sm-40 section-md-66 section-lg-bottom-90 bg-gray-dark page-title-wrap">
			<div class="shell">
				<div class="page-title">
					<h2>Register ${cardType } Business Card</h2>
				</div>
			</div>
		</section> --%>
		<section class="section-60 section-sm-top-90 section-sm-bottom-100">
			<div class="shell">
				<div class="range">
					<div class="cell-md-9 cell-lg-9">
						<h3>Scan Data</h3>
						<form action="imageScan"
							class="rd-mailform form-modern offset-top-30" method="post"
							onsubmit="return imageSave();" id="ocrForm" name="ocrForm"
							data-form-output="form-output-global" data-form-type="order"
							enctype="multipart/form-data">
							<input type="hidden" id="getterValue" name="getterValue">
							<input type="hidden" id="imgSize" name="imgSize">
							<div id="selLan" style="font-size: 20px">
								<ul class="list-wide-bordered">
									<li><label class="radio-inline"> <input
											id="language" type="radio" name="language" checked
											value="eng" class="radio-custom"><span
											class="radio-custom-dummy"></span> English
									</label><label class="radio-inline"> <input id="language"
											type="radio" name="language" value="eng+kor"
											class="radio-custom"><span class="radio-custom-dummy"></span>
											Korean
									</label><label class="radio-inline"> <input id="language"
											type="radio" name="language" value="eng+jpn"
											class="radio-custom"><span class="radio-custom-dummy"></span>
											Japanese
									</label></li>
								</ul>
							</div>
							<br> <br>
							<div class="filebox">
								<input type="hidden" id="m_id" name="m_id" value="${m_id}">
								<input type="hidden" id="cardType" name="cardType"
									value="${cardType}"> <input type="hidden"
									id="layout_num" name="layout_num" value="${layout_num}">
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
											<span>Choose a file…</span></label>

										<div id="cma_image"
											style="width: 100%; max-width: 100%; border: 1px solid #000; display: none;">
											<img src="" id="upimg" border="0" alt="" />
										</div>
									</div>
								</div>


								<div></div>
								<div
									class="cell-xs-2 offset-top-30 offset-xs-top-30 offset-sm-top-50">
									<input type="submit" class="btn btn-primary btn-block"
										value="Image Scan">
								</div>
							</div>
						</form>
						<!--폼 끝  -->
					</div>

					<!-- 오른쪽 부분 -->
					<div class="cell-xs-3 offset-top-30">
						<div class="form-group">
							<br>
							<br>
							<br>
							<br>
							<h3>Position Getter</h3>
							<br>
							<ul id='scanList'>
								<li>
									<div class="btn btn-primary-outline btn-shadow" toggle="modal"
										data-target="#canvasModal" id="getName">Name Select</div> <output
										name="state" id="nameState">No Data</output>
								</li>
								<li>
									<div class="btn btn-primary-outline btn-shadow" toggle="modal"
										data-target="#canvasModal" id="getCompany">Company
										Select</div> <output name="state" id="companyState">No Data</output>
								</li>
								<li>
									<div class="btn btn-primary-outline btn-shadow" toggle="modal"
										data-target="#canvasModal" id="getDepart">Department
										Select</div> <output name="state" id="departState">No Data</output>
								</li>
								<li>
									<div class="btn btn-primary-outline btn-shadow" toggle="modal"
										data-target="#canvasModal" id="getPosition">Position
										Select</div> <output name="state" id="positionState">No
										Data</output>
								</li>
								<li>
									<div class="btn btn-primary-outline btn-shadow" toggle="modal"
										data-target="#canvasModal" id="getAddress">Address
										Select</div> <output name="state" id="addressState">No Data</output>
								</li>
								<li>
									<div class="btn btn-primary-outline btn-shadow" toggle="modal"
										data-target="#canvasModal" id="getEmail">E-mail Select</div> <output
										name="state" id="emailState">No Data</output>
								</li>
								<li>
									<div class="btn btn-primary-outline btn-shadow" toggle="modal"
										data-target="#canvasModal" id="getTelephone">Telephone
										Select</div> <output name="state" id="telephoneState">No
										Data</output>
								</li>
								<li>
									<div class="btn btn-primary-outline btn-shadow" toggle="modal"
										data-target="#canvasModal" id="getFax">Fax Select</div> <output
										name="state" id="faxState">No Data</output>
								</li>
								<li>
									<div class="btn btn-primary-outline btn-shadow" toggle="modal"
										data-target="#canvasModal" id="getMobile">Mobile Select</div>
									<output name="state" id="mobileState">No Data</output>
								</li>
							</ul>
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
</body>
</html>