<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
i {
	color: #ffcc00;
}

#unit-left{
	margin-right: -50px;
}
#map {
	height: 300px;
	width: 100%;
}

#mapButton{
	text-align: right;
}

#rightPanel{
	margin-top: 100px;
}

#ranking{
	margin-left: -35px;
    margin-top: 25px;
}

#kingImg{
	width: 40px;
    margin-top: 8px;
}

</style>
<script type="text/javascript" src="resources/js/jquery-3.1.1.min.js"></script>
<script>
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
/* map end */
var reply_num_update;

$(document).ready(function() {
	init(); ///CRUD 작업 및 페이지 로딩시 댓글 갱신
	$("#replyInsert").on("click", replyInsert); //댓글 등록
	$('table td').mouseover(function(){ 
	      $(this).css("backgroundColor","#ccc"); 
	   }); 
	$('table td').mouseout(function(){ 
		      $(this).css("backgroundColor","#fff"); 
	   }); 
});

function init(){
	var shared_cardnum = $("#shared_cardnum").val();
	$.ajax({
		type: "post"
		, url: "replyList"
		, data : {"shared_cardnum" : shared_cardnum}
		, dataType: "Json"
		, success: function(resp) {
			output(resp);
		} // 모든 댓글 화면에 출력하는 작업
	});
}

function output(resp){
	$("#result").empty();
	var list ='';
	$.each(resp, function(index, item){
		list += "<div class='comment-group'>"
		list +=	"<article class='comment'>"
		list +=	"<div class='unit unit-spacing-md unit-xs-horizontal'>"
		list +=	"<div class='unit-left' id='unit-left'>"
		list +=	"<figure>"
		list +=	"<span class='icon icon-md icon-primary fa-user'></span>"
		list += "</figure></div><div class='unit-body'><div class='comment-body'>"
		list += "<div class='comment-body-header'>"			
		list += "<div class='comment-meta'>"				
		list += "<p class='user'>"+item.m_id+"</p></div><div class='comment-time'><div class='object-inline'>"
		list += "<span class='icon icon-xxs-smaller icon-dusty-gray mdi mdi-clock'></span>"						
		list +=	"<time>"+item.inputdate+"</time>"						
		list += "</div></div></div><div class='comment-body-text'>"						
		list +=	"<span>"+item.reply+"  <input type='button' id='del' class='w3-button w3-red' reply_num='"+item.reply_num+"' value='삭제'>"
		list += "<input type='button' class='w3-button w3-amber' id='update' value='수정' data-toggle='modal' onclick='setDataNum("+item.reply_num+")' data-target='#updateForm' data-whatever='@mdo'>"
		list += "<input type='hidden' id='writer' value='"+item.m_id+"'>"
		list += "<input type='hidden' id='reply_num' value='"+item.reply_num+"'>"
		list += "</span></div></div></div></div><article></div></div>"
	});
	$("#result").html(list);
 	$("input:button#del").on('click', replyDel);
}


function setDataNum(num) {
	reply_num_update = num;
}

	

function replyInsert(){
	var shared_cardnum = $("#shared_cardnum").val();
	var cardnum = $("#cardnum").val();
	var reply = $("#reply").val();
	if(reply.length<1){
		alert("댓글 내용을 입력하세요");
		return;
	} //if
	$.ajax({
		type: "post" //type은 method랑 같은 내용임
		, url: "replyInsert"
		, data: {"shared_cardnum":shared_cardnum, "cardnum":cardnum, "reply":reply}
		, success: function(resp) {
			if(resp==1){
				init();
				alert("댓글을 남겼습니다.");
				$("#reply").val('');
			} 
			else alert("댓글 등록 실패");
		}
	});
}

function replyDel(){
	var writer = $("#writer").val();
	var reply_num = $(this).attr("reply_num");
	if(confirm('정말로 삭제하시겠습니까?')){
		$.ajax({
			type: "post"
			, url: "replyDelete"
			, data: {"reply_num":reply_num, "writer" : writer}
			, success: function(resp){
				if(resp==1){
					alert('댓글을 삭제했습니다.');
					init();
				}else{
					alert('접근 권한이 없습니다.');
				}
			}
		}); 
	}
}

$("#updateForm").on('show.bs.modal', function(event) {
    var button = $(event.relatedTarget)
    var modal = $(this)
    modal.find('.modal-body input').val(recipient)
 })

function replyUpdate(){
	var writer = $("#writer").val();
	var updateReply = $("#updateReply").val();
	$.ajax({
		type: "post"
		, url: "replyUpdate"
		, data: {"reply_num_update":reply_num_update, "writer" : writer, "updateReply":updateReply}
		, success: function(resp){
			if(resp==1){
				alert('댓글을 수정했습니다.');
				init();
				$("#updateReply").val('');
			}else{
				alert('접근 권한이 없습니다.');
			}
		}
	}); 
	
}

//길 찾기
function showRouteChoice() {
	var start = '${myAddressForReply}';
	var end = document.getElementById('address').value;
	window.open("searchRoute?start=" + start + "&end=" + end);
}
</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwT77mHP1Yu98_PplRBCkXycOfTAGZLTI&callback=initMap">
	/* 이 스크립트는 구글 map보다 함수보다 아래에 위치해야함. */
</script>
</head>
<body style="">
<!-- 댓글 수정 modal -->
	<div class="modal fade" id="updateForm">
		<div class="modal-dialog">
			<div class="modal-content" style="margin-top: 30%">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">댓글을 수정합니다.</h4>
				</div>
					<div class="modal-body">
						<input type="text" class="form-control" name="updateReply" id="updateReply"
							placeholder="수정하실 내용을 입력하세요.">
					</div>
					<div class="modal-footer">
						<div class="group-lg group-middle group-sm offset-top-30">
							<button type="button" class="btn btn-primary btn-sm" onclick="replyUpdate()" data-dismiss="modal">확인</button>
							<button type="button" class="btn btn-default btn-sm"
								data-dismiss="modal">닫기</button>
							<input type="hidden" name="updateWriter" id="updateWriter">
							<input type="hidden" name="updateNum" id="updateNum">
						</div>
					</div>
			</div>
			<!-- modal-content -->
		</div>
		<!-- modal-dialog -->
	</div>
	<!-- modal 끝 -->
	<div class="page">
		<%@include file="../modules/header.jsp"%>
		<main class="page-content">

		<section class="section-60 section-sm-75 section-lg-50">
			<div class="shell">

				<div
					class="inset-sm-right-70 inset-lg-left-50 inset-lg-right-120 offset-top-10 offset-sm-top-50">
					<blockquote class="quote-minimal-bordered">
						<q>Leave Your Comment And Share it With Other Members</q>
					</blockquote>
				</div>

				<div class="range">
					<div class="cell-md-8 cell-lg-6">
						<article class="post post-single">
							<div class="post-image">
								<figure>
									<img src=downloadImage?card=${sharedCard.IMAGEPATH} alt=''
										width='400' height='200' />
								</figure>
							</div>
							</div>
							<div class="cell-md-8 cell-lg-9">
							<div class="post-header">
								<h4>
									<span class="icon icon-md icon-primary fa-tag"></span> <span>${sharedCard.COMPANY}
										| ${sharedCard.DEPART} | ${sharedCard.POSITION} |
										${sharedCard.NAME}</span>
								</h4>
							</div>
							<div class="post-meta">
								<ul class="list-bordered-horizontal">
									<li>
										<dl class="list-terms-inline">
											<dt>Shared_Date</dt>
											<dd>
												<time>${sharedCard.INPUTDATE}</time>
											</dd>
										</dl>
									</li>
									<li>
										<dl class="list-terms-inline">
											<dt>Posted by</dt>
											<dd>${sharedCard.M_ID}</dd>
										</dl>
									</li>
								</ul>
							</div>
							<div class="divider-fullwidth bg-gray-light offset-top-15"></div>
							<div class="post-body">
								<table class="table table-primary">
									<tr>
										<th><i class="fa fa-drivers-license fa-1x"></i>  회사</th>
										<td>${sharedCard.COMPANY}</td>
									</tr>
									<tr>
										<th><i class="fa fa-list-ol fa-1x"></i>  부서</th>
										<td>${sharedCard.DEPART}</td>
									</tr>
									<tr>
										<th><i class="fa fa-id-badge fa-1x"></i>  직책</th>
										<td>${sharedCard.POSITION}</td>
									</tr>
									<tr>
									<th><i class="fa fa-user-circle fa-1x"></i>  이름</th>
										<td>${sharedCard.NAME}</td>
									</tr>
									<tr>
										<th><i class="fa fa-fax fa-1x"></i>  전화</th>
										<td>${sharedCard.MOBILE}</td>
									</tr>
									<tr>
										<th><i class="fa fa-mobile fa-1x"></i>  휴대폰</th>
										<td>${sharedCard.MOBILE}</td>
									</tr>
									<tr>
										<th><i class="fa fa-envelope fa-1x"></i>  메일</th>
										<td>${sharedCard.EMAIL}</td>
									</tr>
									<tr>
										<th><i class="fa fa-paste fa-1x"></i>  팩스</th>
										<td>${sharedCard.FAX}</td>
									</tr>
									<tr>
										<th><i class="fa fa-crosshairs fa-1x"></i>  주소</th>
										<td>${sharedCard.ADDRESS}
										<input type="button" class="btn btn-info btn-xs" value="길 찾기" onclick="showRouteChoice()">
										</td>
									</tr>
<!-- 									<tr>
										<th id="mapButton" colspan="2">
										<input type="button" class="btn btn-sm btn-primary" value="길 찾기" onclick="showRouteChoice()">
										</th>
									</tr> -->

								</table>
								<input type="hidden" id="address" value="${sharedCard.ADDRESS}">

							</div>
							<div class="divider-fullwidth bg-gray-light offset-top-15"></div>

						</article>
						<div class="divider-fullwidth bg-gray-lighter offset-top-40"></div>
						<div class="offset-top-40">
							<div
								class="comment-list inset-sm-right-60 inset-md-right-30 inset-lg-right-100 offset-top-30">
								</div>
								<div id="result"></div>
<!-- 							<div
								class="comment-list inset-sm-right-60 inset-md-right-30 inset-lg-right-100 offset-top-30">
								<div class="comment-group">
									<article class="comment">
										<div class="unit unit-spacing-md unit-xs-horizontal">
											<div class="unit-left">
												<figure>
													<span class="icon icon-md icon-primary fa-user"></span>
												</figure>
											</div>
											<div class="unit-body">
												<div class="comment-body">
													<div class="comment-body-header">
														<div class="comment-meta">
															<p class="user">아이디</p>
														</div>
														<div class="comment-time">
															<div class="object-inline">
																<span
																	class="icon icon-xxs-smaller icon-dusty-gray mdi mdi-clock"></span>
																<time>Feb 16, 7:42 PM</time>

															</div>
														</div>
													</div>
													<div class="comment-body-text">
														<p>내용넣기</p>
													</div>
												</div>
											</div>
										</div>
									</article>
								</div>
							</div> -->
						</div>
						<div class="offset-top-40 offset-sm-top-60">
							<div
								class="inset-sm-right-60 inset-md-right-30 inset-lg-right-100 offset-top-15">
								<form
									class="rd-mailform form-classic form-classic-bordered label-outside"
									method="post" action="replyInsert">
									<div class="form-group">
										<label for="comment-message" class="form-label-outside">Comment:</label>
										<textarea id="reply" name="reply" data-constraints="@Required"
											class="form-control"></textarea>
									</div>
									<div class="offset-top-30">
										<input type="button" style="min-width: 200px;"
											class="btn btn-primary" value="E N T E R" id="replyInsert">
									</div>
									<input type="hidden" id="book_num" name="book_num"
										value="${sharedCard.BOOK_NUM}"> <input type="hidden"
										id="shared_cardnum" name="shared_cardnum"
										value="${sharedCard.SHARED_CARDNUM}"> <input
										type="hidden" id="cardnum" name="cardnum"
										value="${sharedCard.CARDNUM}">
								</form>
							</div>
						</div>
					</div>
					<div class="cell-md-4 cell-lg-3 offset-top-50 offset-md-top-0">
						<div class="inset-md-left-15 inset-md-right-10">
							<div class="range">
								<div class="cell-sm-6 cell-md-12" id="rightPanel">
									<div id="map"></div>
	<!-- 								<div class="offset-top-50">
										<h6 class="text-uppercase">Menu</h6>
										<ul class="list-marked-bordered offset-top-15">
											<li><a href="#"><span>뒤로가기</span></a></li>
											<li><a href="#"><span>Home</span></a></li>
											<li><a href="#"><span>보유명함목록</span></a></li>
											<li><a href="#"><span>공유명함첩목록</span></a></li>
										</ul>
									</div> -->
									<div class="offset-top-50">
										<h6 class="text-uppercase">Top Ranking</h6>
										<div class="offset-top-30">
											<article class="post post-preview offset-top-15">
													<div class="unit unit-horizontal unit-spacing-sm">
														<div class="unit-left">
															<figure class="post-image">
																<img src="resources\images\crown.png" alt="" id="kingImg">
																<h6>공유왕</h6>
															</figure>
														</div>
														<div class="unit-body" id="ranking">
															<div class="post-header">
																${shareCount.M_ID}님<br>
																${shareCount.SHARECOUNT}개 명함공유
															</div>
														</div>
													</div>
											</article>
											<article class="post post-preview offset-top-15">
													<div class="unit unit-horizontal unit-spacing-sm">
														<div class="unit-left">
															<figure class="post-image">
																<img src="resources\images\crown.png" alt="" id="kingImg">
																<h6>댓글왕</h6>
															</figure>
														</div>
														<div class="unit-body" id="ranking">
															<div class="post-header">
																${replyCount.M_ID}님<br>
																${replyCount.REPLYCOUNT}개 댓글
															</div>
														</div>
													</div>
											</article>
										</div>
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
	<div id="form-output-global" class="snackbars"></div>
	<script src="js/core.min.js"></script>
	<script src="js/script.js"></script>
</body>
</html>