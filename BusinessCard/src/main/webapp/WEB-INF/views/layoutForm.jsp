<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	function layoutCheck(){
		var layout = document.getElementsByName("layout");
		var layout_check = 0;
		for(var i=0; i<layout.length; i++){
			if(layout[i].checked==true){
				alert(layout[i].value);
				layout_check ++;
				document.getElementById('layoutForm').submit();
			}
		}
		
		if(layout_check==0){
			alert("레이아웃을 선택하세요.");
			return;
		}
	}
	
	
</script>
<title>OBOE</title>
</head>
<body>

	<h2>명함만들기</h2>
	<p>레이아웃 선택</p>
	<form method="post" id="layoutForm" action="make">
		<table>
			<tr>
				<td>1번</td>
				<td><img src="img/sample1.png"></td>
			</tr>
			<tr>
				<td>2번</td>
				<td><img src="img/sample2.png"></td>
			</tr>
			<tr>
				<td><input type="radio" name="layout" value="1">1번 레이아웃</td>
				<td><input type="radio" name="layout" value="2">2번 레이아웃</td>
			</tr>
		</table>
		<input type="button" value="명함 만들기" onclick="layoutCheck()">
	</form>
</body>
</html>