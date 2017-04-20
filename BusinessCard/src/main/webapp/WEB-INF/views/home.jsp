<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/jquery-ui.css" rel="stylesheet">
<style type="text/css">
</style>
<style type="text/css">
.container {
	position: relative; /* 뒤로 보내기 */
}

#bg {
	opacity: 0.3;
}

#dd {
	top: 10px;
	left: 45%;
	position: absolute; /* 이미지 앞으로 */
	z-index: 10;
}

#dd2 {
	top: 130px;
	left: 45%;
	position: absolute; /* 이미지 앞으로 */
	z-index: 10;
}
</style>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/html2canvas.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				var element = $("#html-content-holder"); // global variable
				var getCanvas; // global variable

				$("#btn-Preview-Image").on('click', function() {
					html2canvas(element, {
						onrendered : function(canvas) {
							$("#previewImage").append(canvas);
							getCanvas = canvas;
						}
					});
				});

				$("#btn-Convert-Html2Image").on(
						'click',
						function() {
							var imgageData = getCanvas.toDataURL("image/png");
							// Now browser starts downloading it instead of just showing it
							var newData = imgageData.replace(
									/^data:image\/png/,
									"data:application/octet-stream");
							$("#btn-Convert-Html2Image").attr("download",
									"your_pic_name.png").attr("href", newData);
						});
			});
	
	function layoutForm(){
		alert('명함생성으로 이동');
		location.href="${pageContext.request.contextPath}/layoutForm";
	}
	
	function textToSpeech(){
		alert('textToSpeech로 이동');
		location.href="${pageContext.request.contextPath}/textToSpeech";
	}
	
	
</script>
<title>Insert title here</title>
</head>
<body>
<input type="button" value="명함 생성" onclick="layoutForm()">
<input type="button" value="textToSpeech" onclick="textToSpeech()">
	<div id="html-content-holder">
		<img id="bg" src="img/trolltunga.jpg">
		<div id="dd">
			<img src="img/8.jpg" width="200" height="100">
		</div>
		<div id="dd2">
			<img src="img/8.jpg" width="200" height="100">
		</div>
	</div>
	<input type="button" id="btn-Preview-Image" value="copy">
	<input type="button" id="btn-Convert-Html2Image" value="save">
	<div id="previewImage"></div>
	
</body>
</html>