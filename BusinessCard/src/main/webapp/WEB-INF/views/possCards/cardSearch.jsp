<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="wide wow-animation">
<head>
<title>Business</title>
<meta name="format-detection" content="telephone=no">
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="css/css.css?family=Montserrat:400,700%7CLato:300,300italic,400,400italic,700,900%7CPlayfair+Display:700italic,900">
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
.select-group {
	float: left;
	width: 20%;
}

.rd-search rd-search-classic {
	float: left;
	width: 80%;
}
</style>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
</head>
<body style="">
	<div class="page">
		<%@include file="../modules/header.jsp"%>
		<main class="page-content">
		<section class="section-66 section-sm-bottom-90 section-lg-bottom-120" style="background-color: #f2f4f7;">
			<div class="shell offset-top-60 offset-sm-top-75">
				<h3 class="text-center">명함 검색</h3>
				<form action="searchCard" method="GET"
					onsubmit="return searchCheck();">
					<div class="select-group">
						<select id="select" name="select">
							<option value="Name">Name</option>
							<option value="Company">Company</option>
						</select>
					</div>
					<div class="rd-search rd-search-classic">
						<label for="search" class="form-label rd-input-label">Search...</label>
						<input id="search" type="text" name="search" autocomplete="off"
							class="form-control">
						<button type="submit" class="rd-search-submit"></button>
					</div>
				</form>
				<div class="clearfix"></div>
				<div class="range offset-top-40">
					<!-- 여기서부터 for문 돌리기 -->
					<c:forEach items="${list}" var="getCard">
						<div class="cell-xs-6 cell-sm-4 cell-md-4">
							<div class="thumbnail-variant-2-wrap">
								<a href="searchCardSelect?cardnum=${getCard.cardNum}">
									<div class="thumbnail thumbnail-variant-2">
										<!-- <figure class="thumbnail-image"> -->
										<img src="downloadImage?card=${getCard.imagePath}" alt=""
											style="width: 300px; height: 150px;border: 1px solid;border-radius: 5px;" />
										<div class="thumbnail-caption" style="border-radius:5px">
											<p class="text-header">
												${getCard.company}&nbsp;${getCard.depart}</p>
											<div class="divider divider-md"></div>
											<p class="text-caption">${getCard.position}&nbsp;${getCard.name}</p>
										</div>
									</div>
								</a>
							</div>
						</div>
					</c:forEach>
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