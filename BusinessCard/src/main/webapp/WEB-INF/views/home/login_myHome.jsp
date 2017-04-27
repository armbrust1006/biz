<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" class="wide wow-animation">
<head>
<title>OBOE</title>
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="css/css.css?family=Montserrat:400,700%7CLato:300,300italic,400,400italic,700,900%7CPlayfair+Display:700italic,900">
<link rel="stylesheet" href="css/style.css">
</head>
<body style="">
	<div class="page">
		<%@include file="../modules/header.jsp"%>
		<main class="page-content bg-wrap" style="background:url(images/temp_bg2.jpg);"> 

		<section class="section-60 section-sm-75 section-lg-100 ">
			<div class="shell">
				<div class="range range-sm-center">

					<!-- 내 명함 부분 : 가장 왼쪽 시작 -->
					<div class="cell-md-4 cell-lg-5">
						<div class="group-lg group-middle group-sm" style="padding-left:30px">
								<h5 class="text-muted"><a href="#">${sessionScope.m_id}님 반갑습니다!</a></h5>
								<a href="myPage" class="btn btn-xs btn-white-outline-variant-1">회원정보</a>
								<a href="logout" class="btn btn-xs btn-white-outline">로그아웃</a>
						</div>
						<div class="range">
							<div class="cell-xs-6 cell-sm-4">
								<div class="box-counter box-counter-inverse">
									<span class="icon icon-md icon-primary fa-connectdevelop"></span>
									<div class="text-large counter">${countMyCardIndex}</div>
									<h5 class="box-header">보유카드수</h5>
								</div>
							</div>
							<div class="cell-xs-6 cell-sm-4 offset-top-40 offset-xs-top-0">
								<div class="box-counter box-counter-inverse">
									<span class="icon icon-md icon-primary fa-slideshare"></span>
									<div class="text-large counter">${countMyCardBooks}</div>
									<h5 class="box-header">개설공유함</h5>
								</div>
							</div>
							<div class="cell-xs-6 cell-sm-4 offset-top-40 offset-sm-top-0">
								<div class="box-counter box-counter-inverse">
									<span
										class="icon icon-md icon-primary fa-envelope"></span>
									<div class="text-large counter">500</div>
									<h5 class="box-header">새 메시지</h5>
								</div>
							</div>
						</div>
					</div>

					
					<div class="cell-md-5 cell-lg-7" style="padding-bottom:30px">
						<!-- test시작 -->
						<div class="cell-xs-12 cell-sm-12 offset-bottom-50">
							<div class="product-order-item" style="background: rgba(255,255,255,0.2); padding:0 0 20px 20px">
							<div class="product-body">
								<ul class="list-marked-bordered offset-top-15" style="width:580px;">
                      				<li><a href="#"><span>새 타인 명함 등록</span><span class="text-dusty-gray">(4)</span></a></li>
                    				<li><a href="#"><span>명함 공유 요청</span><span class="text-dusty-gray">(4)</span></a></li>
                   					<li><a href="#"><span>읽지 않은 메시지</span><span class="text-dusty-gray">(4)</span></a></li>
                   				</ul>
							</div>
							</div>
						</div>
					</div>
	
<!-- 아이콘박스 시작 -->
<!-- <div class="shell">
        <div class="range offset-top-40 offset-lg-top-50">
          <div class="cell-sm-6 cell-md-4 height-fill">
            <article class="icon-box" style="background: rgba(255,255,255,0.5);">
              <div class="box-top">
                <div class="box-icon"><span class="icon icon-primary icon-lg-variant-2 material-icons-device_hub"></span></div>
                <div class="box-header">
                  <h5><a href="#">보유카드목록</a></h5>
                </div>
              </div>
              <div class="divider"></div>
              <div class="box-body">
                <p>Starbis has full set of social icons and styling options which allow you to share any content.</p>
              </div>
            </article>
          </div>
          <div class="cell-sm-6 cell-md-4 height-fill offset-top-40 offset-sm-top-0">
            <article class="icon-box" style="background: rgba(255,255,255,0.5);">
              <div class="box-top">
                <div class="box-icon"><span class="icon icon-primary icon-md material-icons-filter"></span></div>
                <div class="box-header">
                  <h5><a href="#">공유명함방</a></h5>
                </div>
              </div>
              <div class="divider"></div>
              <div class="box-body">
                <p>Everyone loves parallax scrolling effects, they are simply beautiful. Starbis has advanced parallax options </p>
              </div>
            </article>
          </div>
          <div class="cell-sm-6 cell-md-4 height-fill offset-top-40 offset-md-top-0">
            <article class="icon-box" style="background: rgba(255,2555,255,0.5);">
              <div class="box-top">
                <div class="box-icon"><span class="icon icon-primary icon-lg material-icons-build"></span></div>
                <div class="box-header">
                  <h5><a href="#">메시지 함</a></h5>
                </div>
              </div>
              <div class="divider"></div>
              <div class="box-body">
                <p>Starbis provides a poweful and flexible exntended toolkit in addition to basic Bootsrap. </p>
              </div>
            </article>
          </div>
        </div>
      </div> -->
<!-- 아이콘 박스 끝 -->
        <div class="cell-sm-6 cell-md-4 height-fill offset-top-40 offset-md-top-0">
 
            <article class="icon-box" style="background: rgba(255,2555,255,0.5);">
 
              <div class="box-top">
 
                <div class="box-icon"><span class="icon icon-primary icon-lg material-icons-build"></span></div>
 
                <div class="box-header">
 
                  <h5><a href="#">메시지 함</a></h5>
 
                </div>
 
              </div>
 
              <div class="divider"></div>
 
              <div class="box-body">
 
                <p>Starbis provides a poweful and flexible exntended toolkit in addition to basic Bootsrap. </p>
 
              </div>
 
            </article>
 
					</div>
				</div>
		</section>
   </main>    
    
<%@include file="../modules/footer.jsp" %>
</div>
<%@include file="../modules/form-output-global.jsp" %>
<script src="js/core.min.js"></script> 
<script src="js/script.js"></script>
</body>
</html>