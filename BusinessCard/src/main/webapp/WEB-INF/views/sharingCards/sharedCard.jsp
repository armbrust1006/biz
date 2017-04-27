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
<style>
i {
	color: #ffcc00;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.1.1.min.js"></script>
<script>
$(document).ready(function() {
	init(); ///CRUD 작업 및 페이지 로딩시 댓글 갱신
	$("#replyInsert").on("click", replyInsert);
});

function init(){
	var shared_cardnum = $("#shared_cardnum").val();
	$.ajax({
		type: "get"
		, url: "replyList"
		, data : {"shared_cardnum" : shared_cardnum}
		, dataType: "Json"
		, success: output // 모든 댓글 화면에 출력하는 작업
	});
}

function output(resp){
	$("#result").empty();
	var msg = '<table>';
	var list;
	$.each(resp, function(index, item){
		list += "<div class='comment-list inset-sm-right-60 inset-md-right-30 inset-lg-right-100 offset-top-30'>"
		list += "<div class='comment-group'>"
		list +=	"<article class='comment'>"
		list +=	"<div class='unit unit-spacing-md unit-xs-horizontal'>"
		list +=	"<div class='unit-left'>"
		list +=	"<figure>"
		list +=	"<span class='icon icon-md icon-primary fa-user'></span>"
		list += "</figure></div><div class='unit-body'><div class='comment-body'>"
		list += "<div class='comment-body-header'>"			
		list += "<div class='comment-meta'>"				
		list += "<p class='user'>"+item.m_id+"</p></div><div class='comment-time'><div class='object-inline'>"
		list += "<span class='icon icon-xxs-smaller icon-dusty-gray mdi mdi-clock'></span>"						
		list +=	"<time>"+item.inputdate+"</time>"						
		list += "</div></div></div><div class='comment-body-text'>"						
		list +=	"<p>"+item.reply+"</p></div></div></div></div><article></div></div>"					
		
		msg += "<tr>";
		msg += "<td class='tdNum'>" + item.m_id + "</td>";
		msg += "<td class='tdName'>" + item.inputdate + "</td>";
		msg += "<td class='tdText'>" + item.reply+ "</td>";
		msg += "<td class='tdBtn'><input type='button' class='del' data-num='" + item.num + "' value='삭제'/></td>";
		msg += "<td class=tdModi'><input type='button' class='modi' data-num='"+ item.num + "' value='수정'/></td>"
		msg += "<td><input type='hidden' data-name='"+item.name+"'></td>"
		msg += "<td><input type='hidden' data-text1='"+item.text1+"'></td>"
		msg += "</tr>"; 
	});
	msg += '</table>';
	$("#result").html(list);
/* 	$("input:button.del").on('click', replyDel);
	$("input:button.modi").on('click', replyModi); */
	$("tr").on({
		mouseenter : function(){$(this).addClass('over')}
		, mouseleave : function(){$(this).removeClass('over')}
	});
	
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
				alert("댓글 등록 완료");
				$("#reply").val('');
			} 
			else alert("댓글 등록 실패");
		}
	});
}
</script>
</head>
<body style="">
	<div class="page">
		<%@include file="../modules/header.jsp"%>
		<main class="page-content">

		<section class="section-60 section-sm-75 section-lg-90">
			<div class="shell">

				<div
					class="inset-sm-right-70 inset-lg-left-50 inset-lg-right-120 offset-top-10 offset-sm-top-50">
					<blockquote class="quote-minimal-bordered">
						<q>공유방이름넣기? 아니면 그냥 지우기</q>
					</blockquote>
				</div>

				<div class="range">
					<div class="cell-md-8 cell-lg-9">
						<article class="post post-single">
							<div class="post-image">
								<figure>
									<img src=downloadImage?card=${sharedCard.IMAGEPATH} alt=''
										width='400' height='200' />
								</figure>
							</div>
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
									<li>
										<dl class="list-terms-inline">
											<dt>Comments</dt>
											<dd>댓글 숫자 표시하기</dd>
										</dl>
									</li>
								</ul>
							</div>
							<div class="divider-fullwidth bg-gray-light offset-top-15"></div>
							<div class="post-body">
								<table class="table table-primary table-striped" border=1>
									<tr>
										<th><i class="fa fa-drivers-license fa-2x"></i></th>
										<th>회사</th>
										<td>${sharedCard.COMPANY}</td>
										<th><i class="fa fa-list-ol fa-2x"></i></th>
										<th>부서</th>
										<td>${sharedCard.DEPART}</td>
									</tr>
									<tr>
										<th><i class="fa fa-id-badge fa-2x"></i></th>
										<th>직책</th>
										<td>${sharedCard.POSITION}</td>
										<th><i class="fa fa-user-circle fa-2x"></i></th>
										<th>이름</th>
										<td>${sharedCard.NAME}</td>
									</tr>
									<tr>
										<th><i class="fa fa-fax fa-2x"></i></th>
										<th>회사전화</th>
										<td>${sharedCard.MOBILE}</td>
										<th><i class="fa fa-mobile fa-2x"></i></th>
										<th>휴대폰</th>
										<td>${sharedCard.MOBILE}</td>
									</tr>
									<tr>
										<th><i class="fa fa-envelope fa-2x"></i></th>
										<th>이메일</th>
										<td>${sharedCard.EMAIL}</td>
										<th><i class="fa fa-paste fa-2x"></i></th>
										<th>팩스</th>
										<td>${sharedCard.FAX}</td>
									</tr>
									<tr>
										<th><i class="fa fa-crosshairs fa-2x"></i></th>
										<th>주소</th>
										<td colspan=2>${sharedCard.ADDRESS}</td>
										<td colspan=2><input type="button"
											class="btn btn-sm btn-primary" value="길 찾기"></td>
									</tr>

								</table>


							</div>
							<div class="divider-fullwidth bg-gray-light offset-top-15"></div>

						</article>
						<div class="divider-fullwidth bg-gray-lighter offset-top-40"></div>
						<div class="offset-top-40">
							<h4>개수달기 Comments</h4>
							<div id="result"></div>
							<div
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
							</div>
						</div>
						<div class="offset-top-40 offset-sm-top-60">
							<h4>Leave a comment</h4>
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
								<div class="cell-sm-6 cell-md-12">
									<div class="offset-top-50">
										<h6 class="text-uppercase">Menu</h6>
										<ul class="list-marked-bordered offset-top-15">
											<li><a href="#"><span>뒤로가기</span></a></li>
											<li><a href="#"><span>Home</span></a></li>
											<li><a href="#"><span>보유명함목록</span></a></li>
											<li><a href="#"><span>공유명함첩목록</span></a></li>
										</ul>
									</div>
									<div class="offset-top-50">
										<h6 class="text-uppercase">Top Ranking</h6>
										<div class="offset-top-30">
											<article class="post post-preview offset-top-15">
												<a href="blog-post.html">
													<div class="unit unit-horizontal unit-spacing-sm">
														<div class="unit-left">
															<figure class="post-image">
																<img src="images/70x70.jpg" alt="" width="70"
																	height="70" />
															</figure>
														</div>
														<div class="unit-body">
															<div class="post-header">
																<p>The Ultimate Technique to Pitch Anything</p>
															</div>
															<div class="post-meta">
																<ul class="list-meta">
																	<li>공유왕</li>
																	</li>
																</ul>
															</div>
														</div>
													</div>
												</a>
											</article>
											<article class="post post-preview offset-top-15">
												<a href="blog-post.html">
													<div class="unit unit-horizontal unit-spacing-sm">
														<div class="unit-left">
															<figure class="post-image">
																<img src="images/70x70.jpg" alt="" width="70"
																	height="70" />
															</figure>
														</div>
														<div class="unit-body">
															<div class="post-header">
																<p>Four Types of Verbal Communication</p>
															</div>
															<div class="post-meta">
																<ul class="list-meta">
																	<li>댓글왕</li>
																	</li>
																</ul>
															</div>
														</div>
													</div>
												</a>
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