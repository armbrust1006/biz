<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" class="wide wow-animation">
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
.makebutton {
	position: relative;
	background-color: #4982e5;
	border: none;
	font-size: 15px;
	color: #FFFFFF;
	padding: 5px;
	width: 200px;
	text-align: center;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	text-decoration: none;
	overflow: hidden;
	cursor: pointer;
}

.makebutton:after {
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

.makebutton:active:after {
	padding: 0;
	margin: 0;
	opacity: 1;
	transition: 0s
}

.makebutton span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.makebutton span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.makebutton:hover span {
	padding-right: 25px;
}

.makebutton:hover span:after {
	opacity: 1;
	right: 0;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$("#makeRoomForm").on('show.bs.modal', function(event) {
		var button = $(event.relatedTarget)
		var modal = $(this)
		modal.find('.modal-body input').val(recipient)
	})
</script>
</head>
<body>
	<!-- 공유 modal -->
	<div class="modal fade" id="makeRoomForm" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<br> <br> <br> <br> <br> <br>
				<div class="modal-header">
					<form method="post" action="makeRoom">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="exampleModalLabel">명함첩 만들기</h4>
						<h6 class="modal-title">공유할 명함방 이름을 작성하세요.</h6>
						<input type="text" class="form-control" id="memo-title"
							name="book_name" placeholder="이름을 입력하세요."> <input
							type="button" class="btn btn-primary-outline btn-shadow"
							data-dismiss="modal" value="취소"> <input type="submit"
							class="btn btn-primary btn-shadow" id="writeMemo" value="만들기">
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- modal 끝 -->
	<div class="page">
		<%@include file="../modules/header.jsp"%>
		<main class="page-content">
		<section class="section-60 section-sm-90 section-lg-bottom-15">
			<div class="shell">
				<div class="range range-lg-center">
					<div class="cell-sm-6 cell-md-6 cell-lg-8 ">
						<h3>Create New Room</h3>
						<p>공유 명함첩을 개설하여 사람들과 명함을 공유하세요.</p>
					</div>
					<div
						class="cell-sm-5 cell-md-4 cell-lg-3 cell-lg-preffix-1 offset-top-40 offset-sm-top-0">
						<!-- <input type="button" class="btn btn-primary btn-block"
						onclick="makeRoomForm()" value="명함첩 만들기"> -->

						<!-- 모달버튼 -->
						<button type="button" class="makebutton"
							style="vertical-align: middle" data-toggle="modal"
							data-target="#makeRoomForm" data-whatever="@mdo"
							id="showShareRoom">
							<span>명함첩 만들기</span>
						</button>
						<!-- 모달버튼 -->


					</div>
				</div>
			</div>
		</section>

		<section
			class="bg-decoration-wrap bg-decoration-bottom section-bottom-60 section-lg-top-100 section-lg-bottom-100 bg-whisper">
			<div class="shell bg-decoration-content">
				<div class="range range-sm-center">
					<div class="cell-md-10 cell-lg-12">
						<div class="range range-sm-bottom">

							<c:forEach var="card" items="${CardBooks}">
								<div class="cell-sm-6 cell-lg-3" style="margin-bottom: 40px">
									<div class="pricing-table">
										<div class="pricing-table-label">
											<p>${card.grade}</p>
										</div>
										<div class="pricing-table-body">
											<h5 class="pricing-table-header">
												<span>${card.book_name}</span>
											</h5>
											<div class="pricing-object pricing-object-lg">
												<span class="small small-top">명함</span><span class="price">0</span><span
													class="small small-bottom">개</span>
											</div>
											<div class="divider-circle"></div>
											<ul class="pricing-list">
												<li>개설날짜| <span class="text-ubold">칼럼추가필요</span></li>
												<li>개설자| <span class="text-ubold">${card.room_host}&nbsp님</span></li>
												<li>구성원| <span class="text-ubold">${card.memberCount}&nbsp명</span></li>
											</ul>
										</div>
										<div class="pricing-table-footer">
											<a href="selectOneRoom?book_num=${card.book_num}"
												class="btn btn-round-bottom btn-default btn-block">입장하기</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- 이 폼을 써 보는건 어떨까 --> <!-- <section class="section-66 section-sm-90 bg-gray-light">
      <div class="shell">
        <h4>내가 개설한 공유방 목록</h4>
        <p style="max-width: 440px;">Can't find the job you want? Send your resume to <a class="__cf_email__" href="" data-cfemail="93fafdf5fcd3f7f6fefcfffafdf8bdfce1f4">philip@gmail.com</a>, and we'll contact you when a new position opens.</p>
        <div class="range">
         
          <div class="cell-sm-6"><a href="#" class="block-vacation">
            <h5>1</h5>
            <div class="block-meta">
              <ul class="list-objects-inline">
                <li><span class="icon icon-xs-smaller icon-primary material-icons-location_on"></span><span>London</span></li>
                <li><span class="icon icon-xs-smaller icon-primary material-icons-av_timer"></span><span>Full Time</span></li>
                <li><span class="icon icon-xs-smaller icon-primary mdi mdi-calendar"></span>
                  <time datetime="2016-01-01">6 hours ago</time>
                </li>
              </ul>
            </div>
            </a> </div>
          <div class="cell-sm-6 offset-top-30 offset-sm-top-0"><a href="#" class="block-vacation">
            <h5>2</h5>
            <div class="block-meta">
              <ul class="list-objects-inline">
                <li><span class="icon icon-xs-smaller icon-primary material-icons-location_on"></span><span>Athlanta</span></li>
                <li><span class="icon icon-xs-smaller icon-primary material-icons-av_timer"></span><span>Freelance</span></li>
                <li><span class="icon icon-xs-smaller icon-primary mdi mdi-calendar"></span>
                  <time datetime="2016-01-01">3 day ago</time>
                </li>
              </ul>
            </div>
            </a> </div>
        </div>
      </div>
 </section> --> <!-- 추천 폼 끝 --> </main>
		<%@include file="../modules/footer.jsp"%>
	</div>
	<%@include file="../modules/form-output-global.jsp"%>
	<script src="js/core.min.js"></script>
	<script src="js/script.js"></script>
</body>
</html>
