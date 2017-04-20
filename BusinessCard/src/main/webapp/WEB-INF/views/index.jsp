<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="https://fonts.googleapis.com/earlyaccess/mplus1p.css" rel="stylesheet" />

</head>
<body style="">
<div class="page">
  <%@include file="./modules/header-index.jsp" %>
  <main class="page-content">
    <section>
      <div data-loop="false" data-autoplay="false" data-simulate-touch="true" class="swiper-container swiper-slider swiper-variant-1 bg-gray-base">
        <div class="swiper-wrapper text-center">
          <div data-slide-bg="images/main2.jpg" class="swiper-slide">
            <div class="swiper-slide-caption">
              <div class="shell">
                <div class="range range-sm-center">
                  <div class="cell-sm-11 cell-md-10 cell-lg-9">
                    <h2 data-caption-animate="fadeInUp" data-caption-delay="0s" class="slider-header">OBOE</h2>
                    <p data-caption-animate="fadeInUp" data-caption-delay="100" class="text-bigger slider-text wf-mplus1p">名刺管理からビジネス生産性を高めていこう！</p>
                    <div class="group-xl-responsive offset-top-30 offset-sm-top-45">
                    <a data-caption-animate="fadeInUp" data-caption-delay="250" href="login"  class="btn btn-xl btn-white-outline-variant-1">Login</a>
                    <a data-caption-animate="fadeInUp" data-caption-delay="250" href="register" class="btn btn-xl btn-primary-contrast">Register now</a></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
<%@include file="./modules/footer-index.jsp" %>
</div>
<%@include file="./modules/form-output-global.jsp" %>
<script src="js/core.min.js"></script> 
<script src="js/script.js"></script>
</body>
</html>