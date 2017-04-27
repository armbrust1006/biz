<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="wide wow-animation">
<head>
<title>OBOE</title>
<meta name="format-detection" content="telephone=no">
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="css/css.css?family=Montserrat:400,700%7CLato:300,300italic,400,400italic,700,900%7CPlayfair+Display:700italic,900">
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script>
	window.onload = function() {
		listSort("date");
		document.getElementById("date").onclick = function() {
			listSort("date");
		}
		document.getElementById("name").onclick = function() {
			listSort("name");
		}
		document.getElementById("company").onclick = function() {
			listSort("company");
		}
	}

	function listSort(data) {
		$.ajax({
			type : "post",
			url : "listSort",
			dataType : "json",
			data : {
				sort : data
			},
			success : function(res) {
				console.log("SUCCESS!");
				innerList(res);
			},
			error : function() {
				console.log("WOOPS...");
			}
		});
	}

	function innerList(list) {
		var listDiv = document.getElementById("list");
		var tempHtml = "";
		for (var i = 0; i < list.length; i++) {
			tempHtml += "<div class='cell-xs-6 cell-sm-4 cell-md-4'> <div class='thumbnail-variant-2-wrap'> <a href='selectOneCard?cardnum="
					+ list[i].cardNum
					+ "'> <div class='thumbnail thumbnail-variant-2'> <!-- <figure class='thumbnail-image'> --> <img src='downloadImage?card="
					+ list[i].imagePath
					+ "' alt='' style='width: 300px; height: 150px; border: 5px outset #217ED3;' /> <div class='thumbnail-caption'> <p class='text-header'>"
					+ list[i].company
					+ '&nbsp;'
					+ list[i].depart
					+ "</p> <div class='divider divider-md'></div> <p class='text-caption'>"
					+ list[i].position
					+ '&nbsp;'
					+ list[i].name
					+ "</p></div></div></a></div></div>";
		}
		listDiv.innerHTML = tempHtml;
	}
</script>
<style>


</style>


</head>
<body style="">
	<div class="page">
		<%@include file="../modules/header.jsp"%>
		<main class="page-content">
		<section class="section-66 section-sm-bottom-90 section-lg-bottom-120">
			<div class="shell offset-top-60 offset-sm-top-75">
				<h3 class="text-center">보유 명함 목록</h3>
				<input type="button" class="btn btn-sm btn-primary" id="date" value="등록날짜순">
				<input type="button" class="btn btn-sm btn-primary" id="name" value="이름순">
				<input type="button" class="btn btn-sm btn-primary" id="company" value="회사이름순">
				<div class="range offset-top-40" id="list">
					<!-- 여기서부터 for문 돌리기 -->
					<%-- <c:forEach items="${list}" var="getCard">
						<div class="cell-xs-6 cell-sm-4 cell-md-4">
							<div class="thumbnail-variant-2-wrap">
								<a href="selectOneCard?cardnum=${getCard.cardNum}">
									<div class="thumbnail thumbnail-variant-2">
										<!-- <figure class="thumbnail-image"> -->
										<img src="downloadImage?card=${getCard.imagePath}" alt=""
											style="width: 300px; height: 150px" />
										<div class="thumbnail-caption">
											<p class="text-header">
												${getCard.company}&nbsp;${getCard.depart}</p>
											<div class="divider divider-md"></div>
											<p class="text-caption">${getCard.position}&nbsp;${getCard.name}</p>
										</div>
									</div>
								</a>
							</div>
						</div>
					</c:forEach> --%>
					<!-- 여기까지 포문 돌리면 됩니다. -->
				</div>
			</div>
		</section>
		</main>
		<%@include file="../modules/footer.jsp"%>
	</div>
	<%@include file="../modules/form-output-global.jsp"%>
	<script src="js/core.min.js"></script>
	<script src="js/script.js"></script>
</body>
</html>