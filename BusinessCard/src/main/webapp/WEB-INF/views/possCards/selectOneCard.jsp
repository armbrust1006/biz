<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

.routebutton, .sharebutton {
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

.routebutton {
	width: 350px;
}

.routebutton:after, .sharebutton:after {
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

.routebutton:active:after, .sharebutton:active:after {
	padding: 0;
	margin: 0;
	opacity: 1;
	transition: 0s
}

.routebutton span, .sharebutton span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.routebutton span:after, .sharebutton span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.routebutton:hover span, .sharebutton:hover span {
	padding-right: 25px;
}

.routebutton:hover span:after, .sharebutton:hover span:after {
	opacity: 1;
	right: 0;
}

#routeChoice {
	display: none;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#showShareRoom").on('click', shareRoomAjax);
		$("#addStop").on("click", routeStopBy);

		document.getElementById("cardDelete").onclick = function() {
			updateTOdelteForm("cardDelete");
		};
	});

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
				"cardnum" : cardnum
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
	/* share modal end*/

	/*    $(document).ready(function() {
	 $("#writeMemo").on("click", writeMemo);

	 }); */

	/*    function writeMemo() {
	 var title = $("#memo-title").val();
	 var memo = $("#memo-text").val();
	 $("#exampleModal").modal('hide'); // 모달 숨기기
	 $("#memo-text").val(''); // 썻던 내용 지우기
	 $("#memo-title").val(''); // 썼던 내용 지우기
	 alert(title);
	 alert(memo);
	 } */
	/* route modal end*/

	function textToSpeech() {
		var textToSpeech = $("#textToSpeech").val();
		alert(textToSpeech);
		$.ajax({
			type : "post",
			url : "listen",
			data : {
				"textToSpeech" : textToSpeech
			},
			success : listen
		});
	}

	function listen(resp) {
		var source = resp.toDataURL();
		alert(source);
		var audio = '';
		audio = "<embed src="+source+" autostart='true' allowscriptaccess='always'"+
      "enablehtmlaccess='true' allowfullscreen='true' width='422' height='240' type='video/mp4'></embed><br>";
		$("#resultAudio").html(audio);
	}

	function showRouteChoice() {

		var start = '901 Cherry Ave, San Bruno';
		var end = document.getElementById('address').value;
		window.open("searchRoute?start=" + start + "&end=" + end);

	}

	function routeStopBy() {
		window.open("routeStopBy");
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
	<div class="modal fade" id="exampleModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<form>
					<div class="modal-body">
						<div class="form-group">
							<label for="message-text" class="control-label">NOTE</label>
							<textarea class="form-control" id="memo-text"></textarea>
							<br> 시작 날짜: <input type="date"> 종료 날짜: <input
								type="date">
						</div>
					</div>
					<div class="modal-footer">
						<div class="group-lg group-middle group-sm offset-top-30">
							<button type="button" class="btn btn-primary btn-sm"
								id="writeMemo">쓰기</button>
							<button type="button" class="btn btn-default btn-sm"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</form>
			</div>
			<!-- modal-content -->
		</div>
		<!-- modal-dialog -->
	</div>
	<!-- modal -->



	<!-- 공유 modal -->
	<div class="modal fade" id="shareModal">
		<div class="modal-dialog">
			<div class="modal-content">
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
							<div class="form-group" id="shareRoomList">가입된 공유방이 없습니다.</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<div class="group-lg group-middle group-sm offset-top-30">
						<button type="button" class="btn btn-default btn-sm"
							data-dismiss="modal" id="routeClose">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

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
										<img src="downloadImage?card=${selectedCard.imagePath}" alt=""
											width="800" height="400" />
									</div>

									<!-- 지도 시작 -->
									<h5></h5>
									<div id="map"></div>
									<!-- 지도 끝 -->
									<h5></h5>

									<button type="button" class="button"
										style="vertical-align: middle" onclick="showRouteChoice()">
										<span>길 찾기</span>
									</button>

									<button type="button" class="button" id="addStop"
										style="vertical-align: middle">
										<span>경유 설정</span>
									</button>

									<!--       <div id="routeChoice">


                              <button type="button" class="routebutton"
                                 style="vertical-align: middle">
                                 <span>내 회사에서 출발</span>
                              </button>

                              <button type="button" class="routebutton"
                                 style="vertical-align: middle">
                                 <span>출발지 직접 입력</span>
                              </button>

                           </div> -->

								</div>
								<div class="product-body">
									<input type="hidden" id="cardNum"
										value="${selectedCard.cardNum}">
									<h5 class="product-brand">${selectedCard.company}&nbsp;${selectedCard.depart}</h5>
									<h4 class="product-header">
										${selectedCard.name}&nbsp;${selectedCard.position} <a
											href="javascript:;" onclick="textToSpeech();"> <span
											class="icon icon-md icon-primary fa-bullhorn"></span></a> <input
											type="hidden" value="주현택" id="textToSpeech">
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
														<p>${selectedCard.mobile}</p>
														<div class="panel-arrow"></div>
													</a>
												</div>
											</div>
											<div id="accordionOneCollapse1" role="tabpanel"
												aria-labelledby="accordionOneHeading1"
												class="panel-collapse collapse">
												<div class="panel-body">
													<p>개짜증</p>
												</div>
											</div>
										</div>

										<div class="panel panel-custom panel-light">
											<div id="accordionOneHeading2" role="tab"
												class="panel-heading">
												<div class="panel-title">
													<a role="button" data-toggle="collapse"
														data-parent="#accordionOne" href="#accordionOneCollapse2"
														aria-controls="accordionOneCollapse2" class="collapsed">
														<span class="icon icon-md icon-primary fa-envelope-o"></span>
														&nbsp;&nbsp;이메일
														<p>${selectedCard.email}</p>
														<div class="panel-arrow"></div>
													</a>
												</div>
											</div>
											<div id="accordionOneCollapse2" role="tabpanel"
												aria-labelledby="accordionOneHeading2"
												class="panel-collapse collapse">
												<div class="panel-body">
													<p>이메일 보내기 기능 추가 하기</p>
												</div>
											</div>
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
														<p>${selectedCard.telephone}</p>
														<div class="panel-arrow"></div>
													</a>
												</div>
											</div>
											<div id="accordionOneCollapse3" role="tabpanel"
												aria-labelledby="accordionOneHeading3"
												class="panel-collapse collapse">
												<div class="panel-body">
													<p>회사로 전화하기</p>
												</div>
											</div>
										</div>
										<div class="panel panel-custom panel-light">
											<div id="accordionOneHeading4" role="tab"
												class="panel-heading">
												<div class="panel-title">
													<a role="button" data-toggle="collapse"
														data-parent="#accordionOne" href="#accordionOneCollapse4"
														aria-controls="accordionOneCollapse4" class="collapsed">
														<span class="icon icon-md icon-primary fa-fax"></span>&nbsp;&nbsp;&nbsp;팩스
														<p>${selectedCard.fax}</p>
														<div class="panel-arrow"></div>
													</a>
												</div>
											</div>
											<div id="accordionOneCollapse4" role="tabpanel"
												aria-labelledby="accordionOneHeading4"
												class="panel-collapse collapse">
												<div class="panel-body">
													<p>팩스 보내기</p>
												</div>
											</div>
										</div>
										<div class="panel panel-custom panel-light">
											<div id="accordionOneHeading5" role="tab"
												class="panel-heading">
												<div class="panel-title">
													<a role="button" data-toggle="collapse"
														data-parent="#accordionOne" href="#accordionOneCollapse5"
														aria-controls="accordionOneCollapse5" class="collapsed">
														<span class="icon icon-md icon-primary fa-map-marker"></span>&nbsp;&nbsp;&nbsp;회사
														주소
														<p>${selectedCard.address}</p> <input type="hidden"
														id="address" value="${selectedCard.address}">
														<div class="panel-arrow"></div>
													</a>
												</div>
											</div>
											<div id="accordionOneCollapse5" role="tabpanel"
												aria-labelledby="accordionOneHeading5"
												class="panel-collapse collapse">
												<div class="panel-body">
													<p>주소입력</p>
												</div>
											</div>
										</div>
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
