<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>textToSpeech</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("#listen").on("click", listen);
	});

	function listen() {
		var textToSpeech = $("#textToSpeech").val();
		if(textToSpeech.length<1){
			alert("텍스트를 입력하세요.");
			return;
		}
		$.ajax({
			type: "post"
			, url: "listen"
			, data: {"textToSpeech":textToSpeech}
			, success: function(resp){
				alert("성공");
			}
		});
	}
</script>
</head>
<body>
	음성으로 읽을 텍스트를 입력하세요.
	<br>
	<input type="text" id="textToSpeech">
	<input type="button" id="listen" value="음성듣기">
	<audio src="1490227109863.mp3" controls="controls"></audio>
	<div id="result"></div>
	이것입니다.
</body>
</html>