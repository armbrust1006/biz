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
	padding: 6px 0px;
	font-size: 13px;
}

#downbutton input[type=button] {
	padding: 6px 90px;
}

#nologo {
	background-color: #fe4a21;
}
</style>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	var canvas = null;
	var ctx = null;
	var topSize = 0;
	var startX = 0;
	var startY = 0;
	var img = new Image();
	var items = [];
	var selectItem = -1;
	var layout_num = -1;
	
	window.onload = function() {
		canvas = document.getElementById("myCanvas");
		ctx = canvas.getContext("2d");
		
		document.getElementById("reset").onclick = canvasClear;
		document.getElementById("cardView").onclick = cardView;
		document.getElementById("updateCard").onclick = imageSave;
		topSize = document.getElementById("topSize").offsetTop;

		canvas.addEventListener("mousedown", function (e) {
		 	e.preventDefault();
		 	startX = e.pageX - this.offsetLeft;
		    startY = e.pageY - (this.offsetTop+topSize);
		    for (var i = 0; i < items.length; i++) {
		        if (hitItem(startX, startY, i)) {
		        	selectItem = i;
			        console.log(selectItem);
		        }
		    }
	    }, true);
	 
	    canvas.addEventListener("mousemove", function (e) {
	        if (selectItem < 0) {
	            return;
	        }
	        e.preventDefault();
	        mouseX = e.pageX - this.offsetLeft;
	        mouseY = e.pageY - (this.offsetTop+topSize);

	        var dx = mouseX - startX;
	        var dy = mouseY - startY;
	        startX = mouseX;
	        startY = mouseY;

	        var item = items[selectItem];
	        item.x += dx;
	        item.y += dy;
	        draw();
	    }, true);
	    
	    canvas.addEventListener("mouseup", function (e) {
	    	e.preventDefault();
	    	selectItem = -1;
	    }, true);
	    
	    canvas.addEventListener("mouseout", function (e) {
    	 	e.preventDefault();
    	    selectedText = -1;
	    });
	}
	
	function hitItem(x, y, itemIndex) {
	    var item = items[itemIndex];
	    if(item.type =="image"){
	    	return (x >= item.x && x <= item.x + item.width && y >= item.y && y <= item.y + item.height);
	    }
	    return (x >= item.x && x <= item.x + item.width && y >= item.y - item.height && y <= item.y);
	}

	/* 명함 clear */
	function canvasClear(){
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
	
	function draw() {
	    ctx.clearRect(0, 0, canvas.width, canvas.height);
	    for (var i = 0; i < items.length; i++) {
	        var item = items[i];
	        if(i==0 && item.type != "image"){
	        	ctx.font = "40px Arial";
	        	ctx.fillText(item.item, item.x, item.y);
	        }else if (item.type == "image") {
				ctx.drawImage(item.item, item.x, item.y, item.width, item.height);
			}else if(item.type != "image"){
	        	ctx.font = "20px Arial";
	        	ctx.fillText(item.item, item.x, item.y);
	        }
	    }
	}
	
	/* 명함 생성 */
	function cardView() {
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		items = [];
		var file = document.querySelector("input[type=file]").files[0];
		var reader = new FileReader();

		var fieldText = [];
		$("input[type=text]").each(function () {
			var text = $(this).val()
			if(text != null && text != ""){
				if($(this).attr("id") == "telephone"){
					text = "TelePhone : " + text;
				}else if($(this).attr("id") == "mobile"){
					text = "Mobiel : " + text;
				}else if($(this).attr("id") == "fax"){
					text = "Fax : " + text;
				}
				fieldText.push(text);
			}			
		});

		for(var i = 0; i < fieldText.length; i++) {
			var startY =  items.length * 20 + 140;
			
			var item = {
				item : fieldText[i],
				x : 10,
				y : startY
			};
			
			if(i == 0){
				ctx.font = "40px Arial";
				item.width = ctx.measureText(item.item).width;
				item.height = 40;
			} else {
				ctx.font = "20px Arial";
				item.width = ctx.measureText(item.item).width;
				item.height = 20;
			}
			items.push(item);
		}

		/* 명함 로고 */
		if (file != null) {
			reader.readAsDataURL(file); // 이미지 JSP Load
			reader.addEventListener("load", function() {
				img.src = reader.result;
				img.onload = function() {
					var item = {
							item : img,
							x : 10,
							y : 10,
							width : 100,
							height : 100,
							type : "image"
					};
					ctx.drawImage(item.item, item.x, item.y, item.width, item.height);
					items.push(item);
				}
			}, false);
		}
	    draw();
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
		var cardnum = document.getElementById("cardNum").value;

		$.ajax({
			type : 'post',
			url : 'updateCanvasImage',
			dataType : 'json',
			data : {
				imageBase64 : imageData,
				m_id : loginID,
				"cardNum" : cardnum
			},
			timeout : 100000,
			async : false,
			error : function() {
				console.log("WOOPS");
			},
			success : function(res) {
				if (res.ret == 0) {
					document.getElementById('insertForm').submit();
					console.log("SUCCESS");
				} else {
					console.log("FAIL : " + res.msg);
				}
			}
		});
	}
</script>
</head>
<body style="">
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content" style="margin-top: 35%">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body">
					<h6 id="myInput"></h6>
				</div>
				<div class="modal-footer">
					<div class="group-lg group-middle group-sm offset-top-30">
						<button type="button" class="btn btn-default btn-sm"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
			<!-- modal-content -->
		</div>
		<!-- modal-dialog -->
	</div>
	<!-- modal -->

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
						<h3>Insert Informations</h3>
						<form action="saveCardData"
							class="rd-mailform form-modern offset-top-30" method="post"
							id="insertForm" name="insertForm"
							data-form-output="form-output-global" data-form-type="order"
							enctype="multipart/form-data">
							<div class="range range-7">
								<input type="hidden" id="m_id" name="m_id" value="${m_id}">
								<input type="hidden" id="cardNum" name="cardNum"
									value="${card.cardNum}">
								<!--항목  -->

								<div class="cell-sm-3">
									<div class="form-group">
										<input id="name" type="text" name="name" value="${card.name}"
											data-constraints="@Required" class="form-control"> <label
											for="name" class="form-label rd-input-label">Name</label>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<input id="company" type="text" name="company"
											value="${card.company}" data-constraints="@Required"
											class="form-control"> <label for="company"
											class="form-label rd-input-label">Company</label>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<div>
											<input id="depart" type="text" name="depart"
												value="${card.depart}" data-constraints="@Required"
												class="form-control"> <label for="depart"
												class="form-label rd-input-label">Department</label>
										</div>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<input id="position" type="text" name="position"
											value="${card.position}" data-constraints="@Required"
											class="form-control"> <label for="position"
											class="form-label rd-input-label">Position</label>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<input id="address" type="text" name="address"
											value="${card.address}" data-constraints="@Required"
											class="form-control"> <label for="address"
											class="form-label rd-input-label">Address</label>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<input id="email" type="email" name="email"
											value="${card.email}" data-constraints="@Email @Required"
											class="form-control"> <label for="email"
											class="form-label rd-input-label">E-mail</label>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<input id="telephone" type="text" name="telephone"
											value="${card.telephone}" data-constraints="@Required"
											class="form-control"> <label for="telephone"
											class="form-label rd-input-label">Telephone</label>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<input id="fax" type="text" name="fax" value="${card.fax}"
											data-constraints="@Required" class="form-control"> <label
											for="fax" class="form-label rd-input-label">Fax</label>
									</div>
								</div>

								<div class="cell-sm-3">
									<div class="form-group">
										<input id="mobile" type="text" name="mobile"
											value="${card.mobile}" data-constraints="@Required"
											class="form-control"> <label for="mobile"
											class="form-label rd-input-label">Mobile</label>
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
													<c:if test="${card.language eq 'kor'}">checked</c:if>
													value="kor" class="radio-custom"><span
													class="radio-custom-dummy"></span> Korean
											</label><label class="radio-inline"> <input id="language"
													type="radio" name="language"
													<c:if test="${card.language eq 'jpn'}">checked</c:if>
													value="jpn" class="radio-custom"><span
													class="radio-custom-dummy"></span> Japanese
											</label></li>
										</ul>
									</div>
								</div>

								<div class="cell-sm-3 offset-top-30">
									<div class="form-group">
										<input class="inputfile inputfile-1" type="file" id="logo"
											name="logo" value="${card.logoimg}" style="display: none;"
											data-multiple-caption="{count} files selected" multiple=""
											accept="image/*"> <label for="logo" id="stext"><svg
												xmlns="http://www.w3.org/2000/svg" width="20" height="17"
												viewBox="0 0 20 17">
											<path
													d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"></path></svg>
											<span>Choose a file…</span></label>
									</div>
								</div>

								<div class="cell-sm-3 offset-top-30">
									<c:choose>
										<c:when test="${card.logoImg != null}">
											<input type="button" value="Download"
												class="btn btn-info btn-shadow btn-xs"
												onclick="location.href='downloadlogo?logoImg=${card.logoImg}&imgOriginal=${card.imgOriginal}'">
										</c:when>
										<c:otherwise>
											<input type="button" value="No Logo Image" id="nologo"
												class="btn btn-info btn-shadow btn-xs">
										</c:otherwise>
									</c:choose>
								</div>

								<div
									class="cell-xs-2 offset-top-32 offset-xs-top-30 offset-sm-top-50">
									<button type="button" id="updateCard"
										class="btn btn-primary btn-block">Update</button>
								</div>

								<div
									class="cell-xs-2 offset-top-30 offset-xs-top-30 offset-sm-top-50">
									<button type="button" id="cardView"
										class="btn btn-primary btn-block">Make Example</button>
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
</body>
</html>