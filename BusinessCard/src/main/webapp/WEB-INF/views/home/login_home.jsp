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
<%@include file="../modules/header.jsp" %>
  <main class="page-content">
    <section>
      <div data-loop="false" data-autoplay="false" data-simulate-touch="true" class="swiper-container swiper-slider swiper-variant-1 bg-gray-base">
        <div class="swiper-wrapper text-center">
          <div data-slide-bg="images/registerMyCard.jpg" class="swiper-slide">
            <div class="swiper-slide-caption">
              <div class="shell">
                <div class="range range-sm-center">
                  <div class="cell-sm-11 cell-md-10 cell-lg-9">
                    <h2 data-caption-animate="fadeInUp" data-caption-delay="0s" class="slider-header">내 명함 등록</h2>
                    <p data-caption-animate="fadeInUp" data-caption-delay="100" class="text-bigger slider-text">아직 명함을 등록하지 않으셨다구요?<br> 지금 명함을 등록하시면 더 많은 편리한 기능을 사용할 수 있답니다! </p>
                    <div class="group-xl-responsive offset-top-30 offset-sm-top-45">
                    <!-- <a data-caption-animate="fadeInUp" data-caption-delay="250" href="#" data-custom-scroll-to="section-start-journey" class="btn btn-xl btn-white-outline-variant-1">Start a journey</a> -->
                    <a data-caption-animate="fadeInUp" data-caption-delay="250" href="selectCardType?type=my" class="btn btn-xl btn-primary-contrast">내 명함 등록하러 가기</a></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div data-slide-bg="images/registerYourCard.jpg" class="swiper-slide">
            <div class="swiper-slide-caption">
              <div class="shell">
                <div class="range range-sm-center">
                  <div class="cell-sm-11 cell-md-10 cell-lg-9">
                    <h2 data-caption-animate="fadeInUp" data-caption-delay="0s" class="slider-header">보유 명함 등록</h2>
                    <p data-caption-animate="fadeInUp" data-caption-delay="100" class="text-bigger slider-text">효과적인 명함관리로 확실한 고객관리가 성공적 비즈니스의 핵심이죠. <br> 더 쉽고 간단하게 당신이 가진 명함을 관리해 보세요.<br> 성공을 위한 기회는 저절로 생길거예요!
                      </p>
                    <div class="group-xl-responsive offset-top-30 offset-sm-top-45">
                    <a data-caption-animate="fadeInUp" data-caption-delay="250" href="registerPoss" class="btn btn-xl btn-primary-contrast">보유 명함 등록하러 가기</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div data-slide-bg="images/shareRoom.jpg" class="swiper-slide">
            <div class="swiper-slide-caption">
              <div class="shell">
                <div class="range range-sm-center">
                  <div class="cell-sm-11 cell-md-10 cell-lg-9">
                    <h2 data-caption-animate="fadeInUp" data-caption-delay="0s" class="slider-header">명함 공유방 개설</h2>
                    <p data-caption-animate="fadeInUp" data-caption-delay="100" class="text-bigger slider-text">동료들과 아이디어를 나누어 보세요. 더 새롭고 나은 기회는  </p>
                    <div class="group-xl-responsive offset-top-30 offset-sm-top-45"><a data-caption-animate="fadeInUp" data-caption-delay="250" href="#" data-custom-scroll-to="section-start-journey" class="btn btn-xl btn-white-outline-variant-1">Start a journey</a><a data-caption-animate="fadeInUp" data-caption-delay="250" href="#" class="btn btn-xl btn-primary-contrast">get starbis now</a></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="swiper-scrollbar"></div>
        <div class="swiper-nav-wrap">
          <div class="swiper-button-prev"></div>
          <div class="swiper-button-next"></div>
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