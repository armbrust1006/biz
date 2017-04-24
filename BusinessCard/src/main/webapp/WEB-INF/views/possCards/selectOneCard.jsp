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
</style>

<script type="text/javascript" src="resources/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
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

	$(document).ready(function() {
		$("#showShareRoom").on('click', shareRoomAjax);
		$("#sc").on('click',clickSendMail);
		$("#my_id").on('keyup', checkGmail);
	});

function checkGmail(){
		
		
		var my_id =  $("#my_id").val();
		var domain = my_id.substring(my_id.indexOf("@")+1, my_id.length);
		
		if (domain != "gmail.com"){
		$("#my_Password").attr('disabled',true);
		$("#title").attr('disabled',true);
		$("#message").attr('disabled',true);
		
		}else{
			$("#my_Password").attr('disabled',false);
			$("#title").attr('disabled',false);
			$("#message").attr('disabled',false);
		}
		
	}
	
	function clickSendMail(){
		/* document.sendForm.action = "sendMail";
		document.sendForm.submit(); */
	var my_id =  $("#my_id").val();
	var my_Password =  $("#my_Password").val();
	var user =  $("#user").val();
	var title =  $("#title").val();
	var message =  $("#message").val();
	var domain = my_id.substring(my_id.indexOf("@")+1, my_id.length);
	
	if (domain != "gmail.com"){
		alert("gmail.만 가능합니다.");
	}else{
		if(my_Password.length==0){
			alert("password를 입력하세요");
			return false;
		}
		if(title.length==0||message.length==0){
			alert("제목과 내용을 입력해주세요");
			return false;
		}else{
		$.ajax({
			type:"post",
			url : "sendMail",
			data : {
					"my_id" : my_id,
					"my_Password" : my_Password,
					"user" : user,
					"title" : title,
					"message" : message,
					},
			
			success : function(resp){
				if (resp==0){
					alert("전송성공했습니다.");
					$("#title").val('');
					$("#message").val('');
				}else if(resp==1){
					alert("전송실패하였습니다. 상대방의 메일주소를 확인해주세요.");
				}else if(resp==2){
					alert("전송실패하였습니다. 본인의 gmail비밀번호 및 상대방의 메일 주소를 확인해주세요.");
				}
				}
		})
		}
	}
	}
	
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
		alert(textToSpeech);
		$.ajax({
			type : "post",
			url : "listen",
			data : {
				"textToSpeech" : textToSpeech
			},
			success : listen
		});
		/* 		var url = "listen?textToSpeech=textToSpeech";
		 window.location.href = url; */
	}

	function listen(resp) {
		var source = resp.toDataURL();
		alert(source);
		var audio = '';
		audio = "<embed src="+source+" autostart='true' allowscriptaccess='always'"+
		"enablehtmlaccess='true' allowfullscreen='true' width='422' height='240' type='video/mp4'></embed><br>";
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
										<img src="downloadImage?card=${selectedCard.imagePath}" alt=""
											width="800" height="400" />
									</div>

									<!-- 지도 시작 -->
									<h5></h5>
									<div id="map"></div>
									<!-- 지도 끝 -->

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
													
													<h5>[gmail일 경우에만 입력창이 활성화됩니다.]</h5>
														<form name="sendForm" method="post">
														<input type="text" name="my_id" id="my_id" value="${m_email}"><br>
														<input type="password" placeholder="gmail 비밀번호" id="my_Password" name="my_Password" width="100%"><br>
														<input type="hidden" name="user" id="user" value="${selectedCard.email}">
														<input type="text" placeholder="제목" id="title" name="title" width="100%"><br>
														<textarea placeholder="내용" name="message" id="message" cols="60"  rows="10"></textarea>
														<input type="button" value="보내기" name="sc" id="sc">
														<input type="reset">
														</form>
													
													
													
													
													
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
