<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<div>
<canvas id="myCanvas" width="578" height="200"></canvas>
</div>
<script>
	function writeMessage(canvas, message) {
		var context = canvas.getContext('2d');
		context.clearRect(0, 0, canvas.width, canvas.height);
		context.font = '18pt Calibri';
		context.fillStyle = 'black';
		context.fillText(message, 10, 25);
	}
	function getMousePos(canvas, evt) {
		var rect = canvas.getBoundingClientRect();
		return {
			x : evt.clientX - rect.left,
			y : evt.clientY - rect.top
		};
	}
	var canvas = document.getElementById('myCanvas');
	var context = canvas.getContext('2d');
	canvas.addEventListener('mousemove', function(evt) {
		var mousePos = getMousePos(canvas, evt);
		var message = 'Mouse position: ' + mousePos.x + ',' + mousePos.y;
		writeMessage(canvas, message);
	}, false);
</script>


</body>
</html>

>>>>>>> 홍준0430
