<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OBOE</title>
<script type="text/javascript" src="resources/jquery-3.1.1.min.js"></script>
<script>
	function uploadCanvas(){
		var canvas = document.getElementById('myCanvas');
		var canvImgStr = canvas.toDataURL('image/png',1.0);
		$.ajax({
			url: "save"
			, data: {strImg:canvImgStr}
			, type: "post"
			, success: function(json){
				alert('성공');
				$('img[id=rstImg]').show();
				$('img[id=rstImg]').attr('src','/'+json.replace('\\','/'));
			}
			, error: function(a,b,c){
				alert('ng:'+a+'//'+b+'//'+c);
			}
		});
		return;
	}
</script>

</head>
<body>
	<h2>명함을 가라로 만들어서 고멘네...</h2>
	<p>1번 레이아웃</p>
	이름
	<input type="text" id="name" name="name" value="주현택">
	<br> 부서
	<input type="text" id="depart" name="depart" value="IT개발부">
	<br> 직위
	<input type="text" id="position" name="position" value="부장">
	<br> 주소
	<input type="text" id="address" name="address"
		value="부산 북구 화명3동 대우이안 101동 906호">
	<br> 이메일
	<input type="text" id="email" name="email"
		value="creativetelly@gmail.com">
	<br> 전화번호
	<input type="text" id="telphone" name="telphone" value="051-363-2527">
	<br> 팩스
	<input type="text" id="fax" name="fax" value="123456">
	<br> 휴대폰
	<input type="text" id="mobile" name="mobile" value="010-4765-4536">
	<br> 등록날짜
	<input type="text" id="inputdate" name="inputdate">
	<br> 등록날짜
	<input type="text" id="language" name="language">
	<br> 원본로고
	<input type="text" id="originalimg" name="language" value="원본로고">
	<br> 변환로고
	<input type="text" id="saveimg" name="language" value="변환로고">
	<br>
	<input type="button" value="명함생성" onclick="uploadCanvas()">
	<br>


	<canvas id="myCanvas" width="400" height="200"
		style="border: 2px solid #d3d3d3;"></canvas>

	<script>
var name = document.getElementById("name").value;
var depart =document.getElementById("depart").value;
var position = document.getElementById("position").value;
var address = document.getElementById("address").value;
var email = document.getElementById("email").value;
var telphone = document.getElementById("telphone").value;
var fax = document.getElementById("fax").value;
var mobile = document.getElementById("mobile").value;



var c = document.getElementById("myCanvas");
var ctx = c.getContext("2d");
ctx.font = "10px Arial";
ctx.fillText(depart, 255, 100);
ctx.fillText(position, 299, 100);
ctx.fillText("전화| "+telphone,10,150);
ctx.fillText("email| "+email,110,150);
ctx.fillText("fax|" + fax, 270,150);
ctx.fillText("주소| "+address, 10, 170);
ctx.font = "20px Arial";
ctx.fillText(name, 320, 100);

</script>

</body>
</html>