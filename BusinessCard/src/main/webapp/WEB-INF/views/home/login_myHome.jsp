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

	<section class="section-35 section-sm-bottom-60 section-lg-bottom-100">
      <div class="shell">
        <div class="range range-sm-center">
          
          
<!--           <div class="cell-sm-10 cell-md-3">
            <h5>최근 등록된 회원목록</h5>
            <div class="offset-top-40">
              <div class="product-order-item">
                <div class="product-image"><img src="" alt="" width="130" height="75"/> </div>
                <div class="product-body">
                  <h6 class="product-header"><a href="shop-product.html">Engineered Rib Cashmere</a></h6>
                  <p class="product-count">2</p>
                  <div class="pricing-object pricing-object-sm"><span class="small small-middle">$</span><span class="price">41</span><span class="small small-bottom">.06</span></div>
                </div>
              </div>
              <div class="product-order-item">
                <div class="product-image"><img src="images/170x122.png" alt="" width="170" height="122"/> </div>
                <div class="product-body">
                  <h6 class="product-header"><a href="shop-product.html">Collar Leather Jacket</a></h6>
                  <p class="product-count">1</p>
                  <div class="pricing-object pricing-object-sm"><span class="small small-middle">$</span><span class="price">145</span><span class="small small-bottom">.00</span></div>
                </div>
              </div>
            </div>
          </div> -->
          <div class="cell-sm-10 cell-md-8 offset-top-50 offset-md-top-0">
            <h3>${m_id}님 반갑습니다.</h3>
            <ul class="list-wide-bordered offset-top-40">
              <li>
                <dl>
                  <dt>보유명함</dt>
                  <dd>${countMyCardIndex} 개</dd>
                </dl>
              </li>
              <li>
                <dl>
                  <dt>공유명함첩</dt>
                  <dd>${countMyCardBooks }</dd>
                </dl>
              </li>
              <li>
                <dl>
                  <dt>Total</dt>
                  <dd>$ 186.06</dd>
                </dl>
              </li>
            </ul>
          </div>
          
          
           <div class="cell-sm-10 cell-md-4">
           <!--  <div class="offset-top-40"> -->
            <h5>내 메시지 알림 영역</h5>
              <div class="product-order-item">
                <div class="product-image"><img src="" alt="" width="130" height="75"/> </div>
                <div class="product-body">
                  <h6 class="product-header"><a href="shop-product.html">Engineered Rib Cashmere</a></h6>
                  <p class="product-count">2</p>
                  <div class="pricing-object pricing-object-sm"><span class="small small-middle">$</span><span class="price">41</span><span class="small small-bottom">.06</span></div>
                <!-- </div> -->
              </div>
              
              <div class="offset-top-40">
              <h5>다가올 일정 알림</h5>
              <div class="product-order-item">
                <div class="product-image"><img src="images/170x122.png" alt="" width="170" height="122"/> </div>
                <div class="product-body">
                  <h6 class="product-header"><a href="shop-product.html">Collar Leather Jacket</a></h6>
                  <p class="product-count">1</p>
                  <div class="pricing-object pricing-object-sm"><span class="small small-middle">$</span><span class="price">145</span><span class="small small-bottom">.00</span></div>
                </div>
              </div>
              </div>
            </div>
          </div>
          
        </div>
       
        <div class="cell-xs-12 offset-top-40 text-center"><a href="#" class="btn btn-xl btn-red-orange">내 정보 수정</a></div>
        <div class="cell-xs-12 offset-top-40 text-center"><a href="#" class="btn btn-xl btn-red-orange">보유 명함 목록</a></div>
        <div class="cell-xs-12 offset-top-40 text-center"><a href="#" class="btn btn-xl btn-red-orange">공유 명함첩</a></div>
      </div>
    </section>
    <section id="section-start-journey" class="section-50 section-sm-90 section-lg-top-120 section-lg-bottom-145">
      <div class="shell">
        <div class="range range-md-bottom range-sm-center">
          <div data-wow-duration="2s" data-wow-offset="200" class="cell-sm-10 cell-md-5 wow fadeInLeft">
            <h2 class="text-red-orange">Most Flexible</h2>
            <p class="h3 offset-top-0">Bootstrap theme</p>
            <p class="offset-top-40 text-secondary">Created by the industry leaders, Starbis Bootstrap theme includes a comprehensive set of tools which are super easy to pick up and run. This template gives you a huge leg up to create your own beautiful site using powerful options & tools, unlimited designs, and responsive framework.</p>
            <a href="#" class="btn btn-xl btn-primary">get starbis now</a> </div>
          <div class="cell-sm-11 cell-md-7 offset-top-40 offset-sm-top-60 offset-md-top-0">
            <div class="image-group">
              <figure data-wow-duration=".6s" data-wow-delay=".0s" data-wow-offset="80" class="wow fadeInRightSmall"><img src="images/243x199.png" alt="" width="243" height="199"/> </figure>
              <figure data-wow-duration=".9s" data-wow-delay=".4s" data-wow-offset="200" class="wow fadeInRightMedium"><img src="images/508x341.png" alt="" width="508" height="341"/> </figure>
              <figure data-wow-duration=".9s" data-wow-delay=".8s" data-wow-offset="300" class="wow fadeInRightSmall"><img src="images/689x469.png" alt="" width="689" height="469"/> </figure>
            </div>
          </div>
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