<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<style>
#map {
	height: 250px;
	width: 100%;
}

.button {
	display: inline-block;
	border-radius: 1px;
	background-color: #0da375;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 15px;
	padding: 5px;
	width: 100px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 0px;
}

#sharedChange {
	display: inline-block;
	border-radius: 1px;
	background-color: #0da375;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 15px;
	padding: 5px;
	width: 150px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 0px;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}

.sharebutton {
	position: relative;
	background-color: #4CAF50;
	border: none;
	font-size: 15px;
	color: #FFFFFF;
	padding: 5px;
	width: 100px;
	text-align: center;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	text-decoration: none;
	overflow: hidden;
	cursor: pointer;
}

.sharebutton:after {
	content: "";
	background: #f1f1f1;
	display: block;
	position: absolute;
	padding-top: 300%;
	padding-left: 350%;
	margin-left: -20px !important;
	margin-top: -120%;
	opacity: 0;
	transition: all 0.8s
}

.sharebutton:active:after {
	padding: 0;
	margin: 0;
	opacity: 1;
	transition: 0s
}

.sharebutton span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.sharebutton span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.sharebutton:hover span {
	padding-right: 25px;
}

.sharebutton:hover span:after {
	opacity: 1;
	right: 0;
}

.item {
	border: 5px outset #217ED3;
	height: auto;
	padding: 10px;
}
</style>

<script type="text/javascript" src="resources/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	var error = "${error}";
	if (error != null && error != '') {
		alert(error);
		document.location.href = "${pageContext.request.contextPath}/selectCardType?type=my";
		//document.location.href = "selectCardType";
	}

	/* Open Select */
	window.onload = function() {

		var openValue = document.getElementById("shared").value;
		if (openValue == "y" || openValue == "Y") {
			$("#sharedChange").css("background-color", "#ff2b32");
		} else if (openValue == "n" || openValue == "N") {
			$("#sharedChange").css("background-color", "#8c8c8c");
		}

		document.getElementById("sharedChange").onclick = function() {
			if (openValue == "y" || openValue == "Y") {
				document.getElementById("shared").value = "n";
			} else if (openValue == "n" || openValue == "N") {
				document.getElementById("shared").value = "y";
			}
			document.getElementById("sharedChangeForm").submit();
		};

		document.getElementById("cardUpdate").onclick = function() {
			updateTOdelteForm("myCardUpdate");
		};
		document.getElementById("cardDelete").onclick = function() {
			updateTOdelteForm("cardDelete");
		};

	}

	/* 수정 및 삭제 함수 */
	function updateTOdelteForm(path) {
		var cardnum = document.getElementById("cardNum").value;
		var method = method || "post";
		var form = document.createElement("form");
		form.setAttribute("method", method);
		form.setAttribute("action", path);

		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("id", "cardNum");
		hiddenField.setAttribute("name", "cardNum");
		hiddenField.setAttribute("value", cardnum);
		form.appendChild(hiddenField);

		document.body.appendChild(form);
		form.submit();
	}

	/* map start */
	function initMap() {
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 15,
			center : {
				lat : 35.907,
				lng : 127.76
			}
		});
		var geocoder = new google.maps.Geocoder();

		var address = document.getElementById('address').value;
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			if (status === 'OK') {
				map.setCenter(results[0].geometry.location);
				var marker = new google.maps.Marker({
					map : map,
					zoom : 18,
					position : results[0].geometry.location
				});
			} else {
				alert('Geocode was not successful for the following reason: '
						+ status);
			}
		});
	}

	/* memo modal start*/
	$("#exampleModal").on('show.bs.modal', function(event) {
		var button = $(event.relatedTarget)
		var modal = $(this)
		modal.find('.modal-body input').val(recipient)
	})
	$(document).ready(function() {
		$("#writeMemo").on("click", writeMemo);
		var audioContext = new window.AudioContext();//한번만 mp3
	});

	function writeMemo() {
		var title = $("#memo-title").val();
		var memo = $("#memo-text").val();
		$("#exampleModal").modal('hide'); // 모달 숨기기
		$("#memo-text").val(''); // 썻던 내용 지우기
		$("#memo-title").val(''); // 썼던 내용 지우기
		alert(title);
		alert(memo);
	}
	/* memo modal end*/
	/* share modal start*/
	$("#shareModal").on('show.bs.modal', function(event) {
		var button = $(event.relatedTarget)
		var modal = $(this)
		modal.find('.modal-body input').val(recipient)
	})

	$(document).ready(function() {
		$("#showShareRoom").on('click', shareRoomAjax);
	});

	function shareRoomAjax() {
		$.ajax({
			type : "get",
			url : "showShareRoom",
			success : showShareRoom
		});
	}

	function showShareRoom(resp) {
		var msg = '<table class="table table-primary table-striped">';
		msg += "<thead>";
		msg += "<tr>";
		msg += "<th>" + "공유방 목록" + "</th>";
		msg += "<th>" + "바로 공유" + "</th>";
		msg += "</tr>";
		msg += "</thead>";
		$
				.each(
						resp,
						function(index, item) {
							msg += "<tbody>";
							msg += "<tr>";
							msg += "<td>" + item.book_name + "</td>";
							msg += "<td><button type='button' class='sharebutton' style='vertical-align: middle' book_num='"+item.book_num+"'><span>공유하기</span></button>";
							msg += "</tr>";
							msg += "<tbody>";
						});
		msg += '</table>';
		$("#shareRoomList").html(msg);
		$("button:button.sharebutton").on("click", share);

	}

	function share() {
		var book_num = $(this).attr("book_num"); //공유할 방
		var cardnum = $("#cardNum").val();//공유할 명함 번호
		$.ajax({
			type : "get",
			url : "share",
			data : {
				"book_num" : book_num,
				"cardNum" : cardnum
			},
			success : function(resp) {
				if (resp == 1) {
					alert('공유하였습니다.');
				} else {
					alert('이미 공유되어 있는 카드입니다.');
				}
			}
		});
	}

	/* $("#showMessage").empty();
	var msg = '<table class="table table-primary">';
	msg += "<thead>";
	msg += "<tr>";
	msg += "<th>Target</th>";
	msg += "<th>Text</th>";
	msg += "<th>SendDate</th>";
	msg += "<th>ReadDate</th>";
	msg += "<th>Type</th>";
	msg += "</tr>";
	msg += "</thead>";
	$.each(resp, function(index, item) {
		msg += "<tbody>";
		msg += "<tr>";
		msg += "<td>" + item.targetId + "</td>";
		msg += "<td>" + item.message + "</td>";
		msg += "<td>" + item.senddate + "</td>";
		if (item.opendate != null) {
			msg += "<td>" + item.opendate + "</td>";
		} else {
			msg += "<td>not yet</td>";
		}
		msg += "<td>" + item.type + "</td>";
		msg += "</tr>";
		msg += "</tbody>";
	});
	msg += '</table>';
	$("#showMessage").html(msg);
	 */

	/* share modal end*/

	function textToSpeech() {
		var textToSpeech = $("#textToSpeech").val();
		var language = $("#language").val();
		$.ajax({
			type : "post",
			url : "listen",
			data : {
				"textToSpeech" : textToSpeech,
				"language" : language
			},
			success : listen
		});
	}

	function listen(resp) {
	
		var audio = '';
		audio = "<embed src="+resp+" autostart='true' allowscriptaccess='always'"+
			"enablehtmlaccess='true' allowfullscreen='true' width='0' height='0' type='video/mp4'></embed><br>";
		$("#resultAudio").html(audio);
	}
</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwT77mHP1Yu98_PplRBCkXycOfTAGZLTI&callback=initMap">
	/* 이 스크립트 소스는 구글 map보다 아래에 위치해야함. */
</script>
</head>
<body style="">
	<!-- modal 시작-->
	<!-- 메모 modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<br> <br> <br> <br> <br> <br>
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">Write Note</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="message-text" class="control-label">TITLE</label> <input
								type="text" class="form-control" id="memo-title"
								placeholder="타이틀을 입력하세요."> <label for="message-text"
								class="control-label">NOTE</label>
							<textarea class="form-control" id="memo-text"></textarea>
							<br> 시작 날짜: <input type="date"> 종료 날짜: <input
								type="date">
						</div>
						<input type="button" class="btn btn-primary-outline btn-shadow"
							data-dismiss="modal" value="취소"> <input type="button"
							class="btn btn-primary btn-shadow" id="writeMemo" value="쓰기">
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 공유 modal -->
	<div class="modal fade" id="shareModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<br> <br> <br> <br> <br> <br>
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">공유하기</h4>
					<h6 class="modal-title">공유할 명함방을 선택하세요.</h6>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<!-- 						<label for="message-text" class="control-label">공유방</label> <input
								type="text" class="form-control" id="message-title"
								placeholder="타이틀을 입력하세요."> <label for="message-text"
								class="control-label">NOTE</label> <label>안녕?</label>
							<textarea class="form-control" id="message-text"></textarea>
							<label for="message-text" class="control-label">NOTE</label>
							<textarea class="form-control" id="message-text"></textarea> -->
							<div class="form-group" id="shareRoomList">d</div>
						</div>
						<input type="button" class="btn btn-primary-outline btn-shadow"
							data-dismiss="modal" value="닫기"> <input type="button"
							class="btn btn-primary btn-shadow" id="writeMemo" value="저장">
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 공유 modal -->
	<div class="modal fade" id="errorModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<br> <br> <br> <br> <br> <br>
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">공유하기</h4>
					<h6 class="modal-title">공유할 명함방을 선택하세요.</h6>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<!-- 						<label for="message-text" class="control-label">공유방</label> <input
								type="text" class="form-control" id="message-title"
								placeholder="타이틀을 입력하세요."> <label for="message-text"
								class="control-label">NOTE</label> <label>안녕?</label>
							<textarea class="form-control" id="message-text"></textarea>
							<label for="message-text" class="control-label">NOTE</label>
							<textarea class="form-control" id="message-text"></textarea> -->
							<div class="form-group" id="shareRoomList">d</div>
						</div>
						<input type="button" class="btn btn-primary-outline btn-shadow"
							data-dismiss="modal" value="닫기"> <input type="button"
							class="btn btn-primary btn-shadow" id="writeMemo" value="저장">
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- modal 끝 -->
	<div class="page">
		<%@include file="../modules/header.jsp"%>
		<main class="page-content">
		<section class="section-50 section-sm-75 section-lg-bottom-20">
			<div class="shell">

				<div class="range range-lg-center">
					<div class="cell-lg-10">
						<div class="product product-single">
							<div class="product-main">
								<div class="product-slider">
									<div class="item">
										<img src="downloadImage?card=${myCard.imagePath}" alt=""
											width="800" height="400" />
									</div>
									<!-- 지도 시작 -->
									<h1></h1>
									<div id="map"></div>
									<!-- 지도 끝 -->
									<h1></h1>
									<div>
									<div id="resultAudio"></div>
										<form action="myCard" method="post" id="sharedChangeForm"
											name="sharedChangeForm">
											<input type="hidden" value="${myCard.cardNum}" id="cardNum"
												name="cardNum"> <input type="hidden"
												value="${myCard.shared}" id="shared" name="shared">
											<button type="button" class="button"
												style="vertical-align: middle" data-whatever="@mdo"
												id="sharedChange" name="sharedChange">
												<c:choose>
													<c:when test="${myCard.shared == 'y'}">
														<span>공개 중</span>
													</c:when>
													<c:when test="${myCard.shared == 'n'}">
														<span>공개 중지 중</span>
													</c:when>
												</c:choose>
											</button>
										</form>
									</div>
									<br>
								</div>


								<div class="product-body">
									<h5 class="product-brand" style="color: gray">${myCard.company}&nbsp;|&nbsp;${myCard.depart}</h5>
									<h4 class="product-header">${myCard.name}&nbsp;${myCard.position}

										<a href="javascript:;" onclick="textToSpeech();"> <span
											class="icon icon-md icon-primary fa-bullhorn"></span></a> 
										<input type="hidden" value="${myCard.name }" id="textToSpeech">
										<input type="hidden" value=${myCard.language } id="language">
										<br>
										<button type="button" class="button"
											style="vertical-align: middle" data-toggle="modal"
											data-target="#exampleModal" data-whatever="@mdo">
											<span>메모하기</span>
										</button>
										<button type="button" class="button"
											style="vertical-align: middle" data-toggle="modal"
											data-target="#shareModal" data-whatever="@mdo"
											id="showShareRoom">
											<span>공유하기</span>
										</button>
									</h4>


									<div id="accordionOne" role="tablist"
										aria-multiselectable="true"
										class="panel-group panel-group-custom panel-group-light product-accordion">

										<div class="panel panel-custom panel-light">
											<div id="accordionOneHeading1" role="tab"
												class="panel-heading">
												<div class="panel-title">
													<a role="button" data-toggle="collapse"
														data-parent="#accordionOne" href="#accordionOneCollapse1"
														aria-controls="accordionOneCollapse1" class="collapsed">
														<span class="icon icon-md icon-primary fa-tablet"></span>
														&nbsp;&nbsp;휴대전화
														<p>${myCard.mobile}</p> <!-- <div class="panel-arrow"></div> -->
													</a>
												</div>
											</div>
											<!-- <div id="accordionOneCollapse1" role="tabpanel"
												aria-labelledby="accordionOneHeading1"
												class="panel-collapse collapse">
												<div class="panel-body">
													<p>개짜증</p>
												</div>
											</div>
										</div> -->

											<div class="panel panel-custom panel-light">
												<div id="accordionOneHeading2" role="tab"
													class="panel-heading">
													<div class="panel-title">
														<a role="button" data-toggle="collapse"
															data-parent="#accordionOne" href="#accordionOneCollapse2"
															aria-controls="accordionOneCollapse2" class="collapsed">
															<span class="icon icon-md icon-primary fa-envelope-o"></span>
															&nbsp;&nbsp;이메일
															<p>${myCard.email}</p> <!-- <div class="panel-arrow"></div> -->
														</a>
													</div>
												</div>
												<%-- <div id="accordionOneCollapse2" role="tabpanel"
												aria-labelledby="accordionOneHeading2"
												class="panel-collapse collapse">
												<div class="panel-body">

													<form action="sendMail" method="post">

														<label>보내는사람 : ${m_email}</label><br> <input
															type="hidden" name="my_id" value="${m_email}"> <input
															type="text" placeholder="gmail 비밀번호" name="my_Password"
															width="100%"><br> <input type="hidden"
															name="user" value="${myCard.email}"> <input
															type="text" placeholder="제목" name="title" width="100%"><br>
														<textarea placeholder="내용" name="message" cols="60"
															rows="10"></textarea>
														<input type="submit" value="보내기">
													</form>
												</div>
											</div> --%>
											</div>
											<div class="panel panel-custom panel-light">
												<div id="accordionOneHeading3" role="tab"
													class="panel-heading">
													<div class="panel-title">
														<a role="button" data-toggle="collapse"
															data-parent="#accordionOne" href="#accordionOneCollapse3"
															aria-controls="accordionOneCollapse3" class="collapsed">
															<span class="icon icon-md icon-primary fa-phone"></span>
															&nbsp;&nbsp;회사 전화
															<p>${myCard.telephone}</p> <!-- <div class="panel-arrow"></div> -->
														</a>
													</div>
												</div>
												<!-- <div id="accordionOneCollapse3" role="tabpanel"
												aria-labelledby="accordionOneHeading3"
												class="panel-collapse collapse">
												<div class="panel-body">
													<p>회사로 전화하기</p>
												</div>
											</div>
										</div> -->
												<div class="panel panel-custom panel-light">
													<div id="accordionOneHeading4" role="tab"
														class="panel-heading">
														<div class="panel-title">
															<a role="button" data-toggle="collapse"
																data-parent="#accordionOne"
																href="#accordionOneCollapse4"
																aria-controls="accordionOneCollapse4" class="collapsed">
																<span class="icon icon-md icon-primary fa-fax"></span>&nbsp;&nbsp;&nbsp;팩스
																<p>${myCard.fax}</p> <!-- <div class="panel-arrow"></div> -->
															</a>
														</div>
													</div>
													<!-- <div id="accordionOneCollapse4" role="tabpanel"
												aria-labelledby="accordionOneHeading4"
												class="panel-collapse collapse">
												<div class="panel-body">
													<p>팩스 보내기</p>
												</div>
											</div> -->
												</div>
												<div class="panel panel-custom panel-light">
													<div id="accordionOneHeading5" role="tab"
														class="panel-heading">
														<div class="panel-title">
															<a role="label" data-toggle="collapse"
																data-parent="#accordionOne"
																href="#accordionOneCollapse5"
																aria-controls="accordionOneCollapse5" class="collapsed">
																<span class="icon icon-md icon-primary fa-map-marker"></span>&nbsp;&nbsp;&nbsp;회사
																주소
																<p>${myCard.address}</p> <input type="hidden"
																id="address" value="${myCard.address}"> <!-- <div class="panel-arrow"></div> -->
															</a>
														</div>
													</div>
													<!-- <div id="accordionOneCollapse5" role="tabpanel"
												aria-labelledby="accordionOneHeading5"
												class="panel-collapse collapse">
												<div class="panel-body">
													<p>주소입력</p>
												</div>
											</div> -->
												</div>
												<div class="btn btn-primary-outline btn-shadow"
													id="cardUpdate">수정</div>
												<div class="btn btn-primary-outline btn-shadow"
													id="cardDelete">삭제</div>
											</div>
										</div>


									</div>
								</div>
							</div>
						</div>
					</div>
		</section>
		</main>
	</div>
	<%@include file="../modules/footer.jsp"%>
	<%@include file="../modules/form-output-global.jsp"%>
	<script src="js/core.min.js"></script>
	<script src="js/script.js"></script>
</body>
</html>
