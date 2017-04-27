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
<%--
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
    <div class="divider-spectrum"></div>
    <section data-on="false" data-md-on="true" style="background-image: url(images/1920x900.jpg);" class="rd-parallax bg-gray-base bg-image">
      <div data-speed="0.33" data-type="media" data-url="images/1920x900.jpg" class="rd-parallax-layer"></div>
      <div data-speed="0" data-type="html" class="rd-parallax-layer">
        <div class="section-50 section-sm-75 section-lg-top-100 section-lg-bottom-120">
          <div class="shell">
            <div class="range range-sm-center">
              <div class="cell-sm-11 cell-md-10 cell-lg-9 text-center">
                <h3><span>Ocean</span><em>of</em><span>Possibilities</span></h3>
                <p> Check out an incredible set of features provided by Starbis. We collected all common required features in one theme. That makes our template one of the most awesome ones on the market. Starbis allows you to take control of almost every element and section of the site. </p>
              </div>
            </div>
            <div class="range">
              <div class="cell-sm-6 cell-md-4">
                <article class="icon-box-vertical"><span class="icon icon-primary icon-md material-icons-security"></span>
                  <h5 class="icon-box-header">Based on Bootstrap 3</h5>
                  <p>Starbis is based on the one of the most popular and flexible CSS Frameworks - Bootstrap. It gives you confidence in quality and flexibility of the product you buy.</p>
                </article>
              </div>
              <div class="cell-sm-6 cell-md-4 offset-top-50 offset-sm-top-0">
                <article class="icon-box-vertical"><span class="icon icon-primary icon-md material-icons-build"></span>
                  <h5 class="icon-box-header">Extended Toolkit</h5>
                  <p>Starbis provides a powerful and flexible extended toolkit in addition to basic Bootstrap. If you've used Bootstrap itself, you'll find this all super familiar and easy-to-use.</p>
                </article>
              </div>
              <div class="cell-sm-6 cell-md-4 offset-top-50 offset-md-top-0">
                <article class="icon-box-vertical"><span class="icon icon-primary icon-md material-icons-palette"></span>
                  <h5 class="icon-box-header">Unlimited Skins &amp; Colors</h5>
                  <p>Starbis includes a wide variety of skins and colors, from which you can easily select what you like to attract the attention of your customers to your company.</p>
                </article>
              </div>
              <div class="cell-sm-6 cell-md-4 offset-top-50 offset-lg-top-60">
                <article class="icon-box-vertical"><span class="icon icon-primary icon-md material-icons-layers"></span>
                  <h5 class="icon-box-header">Parallax Effects</h5>
                  <p>Everyone loves parallax scrolling effects, they are simply beautiful. Starbis has advanced parallax options &amp; controls based on flexible and easy-to-use RD Parallax plugin.</p>
                </article>
              </div>
              <div class="cell-sm-6 cell-md-4 offset-top-50 offset-lg-top-60">
                <article class="icon-box-vertical"><span class="icon icon-primary icon-md material-icons-device_hub"></span>
                  <h5 class="icon-box-header">Social Integration</h5>
                  <p>Starbis has full set of social icons and styling options which allow you to share any content the way you want.</p>
                </article>
              </div>
              <div class="cell-sm-6 cell-md-4 offset-top-50 offset-lg-top-60">
                <article class="icon-box-vertical"><span class="icon icon-primary icon-md material-icons-directions_run"></span>
                  <h5 class="icon-box-header">Made for Speed</h5>
                  <p>We know how embarrassing and time-consuming content loading can be, so we took care of pages optimization for your smooth experience.</p>
                </article>
              </div>
            </div>
            <div class="range offset-top-30 offset-sm-top-45">
              <div class="cell-xs-12 text-center"><a href="#" class="btn btn-xl btn-primary">get starbis now</a></div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="section-60 section-sm-100 bg-primary">
      <div class="shell text-center text-md-left">
        <div class="range range-md-middle range-md-center">
          <div class="cell-md-8 cell-lg-7">
            <h3>Starbis Is Exactly What You Need</h3>
          </div>
          <div class="cell-md-4 cell-lg-3 offset-top-30 offset-md-top-0"><a href="#" class="btn btn-xl btn-white-outline">Get template</a></div>
        </div>
      </div>
    </section>
    <section data-on="false" data-md-on="true" style="background-image: url(images/1920x900.jpg);" class="rd-parallax bg-gray-base bg-image">
      <div data-speed="0.5" data-type="media" data-url="images/1920x900.jpg" class="rd-parallax-layer"></div>
      <div data-speed="0.01" data-type="html" class="rd-parallax-layer">
        <div class="section-60 section-sm-100 section-lg-120">
          <div class="shell text-center">
            <div class="range">
              <div class="cell-xs-12"><a data-lightbox="iframe" href="https://www.youtube.com/watch?v=VrLSBsOkP6k" class="link-circle link-white"><span class="icon icon-xl fl-36-slim-icons-play90"></span></a>
                <h3>About Us</h3>
                <div style="max-width: 740px;" class="reveal-inline-block offset-top-22">
                  <p class="big text-light">We are an internationally recognized web design studio, providing first-class templates at affordable prices. Our designs are used worldwide by companies of any size and type as well as by individuals - musicians, writers, businessmen etc.</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="section-60 section-sm-100 bg-gray-base">
      <div class="shell">
        <div class="range">
          <div class="cell-xs-6 cell-sm-3">
            <div class="box-counter box-counter-inverse"><span class="icon icon-md icon-primary material-icons-content_copy"></span>
              <div class="text-large counter">58249</div>
              <h5 class="box-header">templates</h5>
            </div>
          </div>
          <div class="cell-xs-6 cell-sm-3 offset-top-40 offset-xs-top-0">
            <div class="box-counter box-counter-inverse"><span class="icon icon-md icon-primary material-icons-mood"></span>
              <div class="text-large counter counter-k">246</div>
              <h5 class="box-header">happy clients</h5>
            </div>
          </div>
          <div class="cell-xs-6 cell-sm-3 offset-top-40 offset-sm-top-0">
            <div class="box-counter box-counter-inverse"><span class="icon icon-md icon-primary material-icons-access_time"></span>
              <div class="text-large counter">1200</div>
              <h5 class="box-header">hours of coding</h5>
            </div>
          </div>
          <div class="cell-xs-6 cell-sm-3 offset-top-40 offset-sm-top-0">
            <div class="box-counter box-counter-inverse"><span class="icon icon-md icon-primary material-icons-code"></span>
              <div class="text-large counter counter-k">834</div>
              <h5 class="box-header">lines of code</h5>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="section-50 section-sm-90 section-lg-top-120 section-lg-bottom-145">
      <div class="shell isotope-wrap">
        <div class="range">
          <div class="cell-xs-12 text-center">
            <h3><span>Check</span><em>our portfolio</em><span>with Other Themes</span></h3>
            <ul class="isotope-filters-responsive offset-top-40">
              <li>
                <p>Choose your category:</p>
              </li>
              <li class="block-top-level">
                <button data-custom-toggle="#isotope-1" data-custom-toggle-disable-on-blur="true" class="isotope-filters-toggle btn btn-sm btn-default">Filter<span class="caret"></span></button>
                <div id="isotope-1" class="isotope-filters isotope-filters-minimal isotope-filters-horizontal">
                  <ul class="list-inline">
                    <li><a data-isotope-filter="*" data-isotope-group="gallery" href="#" class="active">All</a></li>
                    <li><a data-isotope-filter="Category 1" data-isotope-group="gallery" href="#">Webdesign</a></li>
                    <li><a data-isotope-filter="Category 2" data-isotope-group="gallery" href="#">UI/UX</a></li>
                    <li><a data-isotope-filter="Category 3" data-isotope-group="gallery" href="#">Branding</a></li>
                  </ul>
                </div>
              </li>
            </ul>
          </div>
          <div class="cell-xs-12 offset-top-40">
            <div class="row">
              <div data-isotope-layout="fitRows" data-isotope-group="gallery" data-photo-swipe-gallery="gallery" class="isotope isotope-gutter-default">
                <div data-filter="Category 1" class="col-xs-12 col-sm-6 col-md-4 isotope-item">
                  <div class="thumbnail thumbnail-variant-3"><a href="gallery-item.html" class="link link-external"><span class="icon icon-sm fa fa-link"></span></a>
                    <figure><img src="images/370x278.jpg" alt="" width="370" height="278"/> </figure>
                    <div class="caption"><a href="images/1200x900" data-photo-swipe-item="" data-size="1200x900" class="link link-original"></a></div>
                  </div>
                </div>
                <div data-filter="Category 2" class="col-xs-12 col-sm-6 col-md-4 isotope-item">
                  <div class="thumbnail thumbnail-variant-3"><a href="gallery-item.html" class="link link-external"><span class="icon icon-sm fa fa-link"></span></a>
                    <figure><img src="images/370x278.jpg" alt="" width="370" height="278"/> </figure>
                    <div class="caption"><a href="1200x900?1" data-photo-swipe-item="" data-size="1200x900" class="link link-original"></a></div>
                  </div>
                </div>
                <div data-filter="Category 3" class="col-xs-12 col-sm-6 col-md-4 isotope-item">
                  <div class="thumbnail thumbnail-variant-3"><a href="gallery-item.html" class="link link-external"><span class="icon icon-sm fa fa-link"></span></a>
                    <figure><img src="images/370x278.jpg" alt="" width="370" height="278"/> </figure>
                    <div class="caption"><a href="images/1200x900?3" data-photo-swipe-item="" data-size="1200x900" class="link link-original"></a></div>
                  </div>
                </div>
                <div data-filter="Category 1" class="col-xs-12 col-sm-6 col-md-4 isotope-item">
                  <div class="thumbnail thumbnail-variant-3"><a href="gallery-item.html" class="link link-external"><span class="icon icon-sm fa fa-link"></span></a>
                    <figure><img src="images/370x278.jpg" alt="" width="370" height="278"/> </figure>
                    <div class="caption"><a href="images/1200x900?6" data-photo-swipe-item="" data-size="1200x900" class="link link-original"></a></div>
                  </div>
                </div>
                <div data-filter="Category 2" class="col-xs-12 col-sm-6 col-md-4 isotope-item">
                  <div class="thumbnail thumbnail-variant-3"><a href="gallery-item.html" class="link link-external"><span class="icon icon-sm fa fa-link"></span></a>
                    <figure><img src="images/370x278.jpg" alt="" width="370" height="278"/> </figure>
                    <div class="caption"><a href="images/1200x900" data-photo-swipe-item="" data-size="1200x900" class="link link-original"></a></div>
                  </div>
                </div>
                <div data-filter="Category 3" class="col-xs-12 col-sm-6 col-md-4 isotope-item">
                  <div class="thumbnail thumbnail-variant-3"><a href="gallery-item.html" class="link link-external"><span class="icon icon-sm fa fa-link"></span></a>
                    <figure><img src="images/370x278.jpg" alt="" width="370" height="278"/> </figure>
                    <div class="caption"><a href="images/1200x900" data-photo-swipe-item="" data-size="1200x900" class="link link-original"></a></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="section-50 section-sm-90 section-lg-120 bg-gray-lighter">
      <div class="shell">
        <div class="range">
          <div class="cell-xs-12 text-center">
            <h3>Meet Our Team</h3>
            <p>We are a team of developers, designers and leads who love what they do.</p>
          </div>
        </div>
        <div class="range offset-top-40">
          <div class="cell-xs-6 cell-sm-4 cell-md-3">
            <div class="thumbnail thumbnail-variant-1">
              <div class="thumbnail-image"><img src="images/189x189.png" alt="" width="189" height="189"/>
                <div class="thumbnail-image-inner"><a href="callto:#" class="icon icon-md material-icons-local_phone link-primary-inverse-v2"></a><a href="#7350" class="icon icon-md-smaller fa-envelope-o link-white"></a></div>
              </div>
              <div class="thumbnail-caption">
                <h5 class="header"><a href="team-member-profile.html">Julien Miro</a></h5>
                <p>Software Developer</p>
              </div>
            </div>
          </div>
          <div class="cell-xs-6 cell-sm-4 cell-md-3 offset-top-60 offset-xs-top-0">
            <div class="thumbnail thumbnail-variant-1">
              <div class="thumbnail-image"><img src="images/189x189.png" alt="" width="189" height="189"/>
                <div class="thumbnail-image-inner"><a href="callto:#" class="icon icon-md material-icons-local_phone link-primary-inverse-v2"></a><a href="#3f1c" class="icon icon-md-smaller fa-envelope-o link-white"></a></div>
              </div>
              <div class="thumbnail-caption">
                <h5 class="header"><a href="team-member-profile.html">Joan Williams</a></h5>
                <p>Support Operator</p>
              </div>
            </div>
          </div>
          <div class="cell-xs-6 cell-sm-4 cell-md-3 offset-top-60 offset-sm-top-0">
            <div class="thumbnail thumbnail-variant-1">
              <div class="thumbnail-image"><img src="images/189x189.png" alt="" width="189" height="189"/>
                <div class="thumbnail-image-inner"><a href="callto:#" class="icon icon-md material-icons-local_phone link-primary-inverse-v2"></a><a href="#c0e3" class="icon icon-md-smaller fa-envelope-o link-white"></a></div>
              </div>
              <div class="thumbnail-caption">
                <h5 class="header"><a href="team-member-profile.html">Benedict Smith</a></h5>
                <p>Creative Director</p>
              </div>
            </div>
          </div>
          <div class="cell-xs-6 cell-sm-4 cell-md-3 offset-top-60 offset-md-top-0">
            <div class="thumbnail thumbnail-variant-1">
              <div class="thumbnail-image"><img src="images/189x189.png" alt="" width="189" height="189"/>
                <div class="thumbnail-image-inner"><a href="callto:#" class="icon icon-md material-icons-local_phone link-primary-inverse-v2"></a><a href="#5b78" class="icon icon-md-smaller fa-envelope-o link-white"></a></div>
              </div>
              <div class="thumbnail-caption">
                <h5 class="header"><a href="team-member-profile.html">Madlen Green</a></h5>
                <p>Sales Manager</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section data-on="false" data-md-on="true" style="background-image: url(images/1920x900.jpg)" class="rd-parallax bg-gray-base bg-image">
      <div data-speed="0.33" data-type="media" data-url="images/1920x900.jpg" class="rd-parallax-layer"></div>
      <div data-speed="0" data-type="html" class="rd-parallax-layer">
        <div class="section-60 section-sm-90 section-lg-120">
          <div class="shell text-center">
            <h3>What People Say</h3>
            <div class="range range-md-center offset-top-40">
              <div class="cell-md-11 cell-lg-9">
                <div class="owl-carousel-inverse">
                  <div data-items="1" data-stage-padding="0" data-loop="false" data-margin="30" data-nav="true" data-numbering="#owl-numbering-1" data-animation-in="fadeIn" data-animation-out="fadeOut" class="owl-carousel owl-nav-position-numbering">
                    <div class="item">
                      <blockquote class="quote-minimal quote-minimal-inverse">
                        <div class="quote-body">
                          <p> <q>I am glad I've purchased Starbis Bootstrap template. It allows me not to worry how to represent my services on the web â everything is already included! Moreover, I think this web design will perfectly suit anyone, even a small local entrepreneur!</q> </p>
                        </div>
                        <div class="quote-meta"> <cite>Jane Wilson</cite>
                          <p class="caption">Freelancer</p>
                        </div>
                      </blockquote>
                    </div>
                    <div class="item">
                      <blockquote class="quote-minimal quote-minimal-inverse">
                        <div class="quote-body">
                          <p> <q>The themes are beautiful! But what really makes the difference is the customer service. Both pre and post sales support is second to none. Very fast, friendly and competent. I can only recommend Starbis.</q> </p>
                        </div>
                        <div class="quote-meta"> <cite>Amanda Smith</cite>
                          <p class="caption">Sales manager</p>
                        </div>
                      </blockquote>
                    </div>
                    <div class="item">
                      <blockquote class="quote-minimal quote-minimal-inverse">
                        <div class="quote-body">
                          <p> <q>We have purchased several themes and contacted support once, the case had to be passed to technical support but it was resolved within the day. Very fast responses and excellent templates to choose from. Would highly recommend.</q> </p>
                        </div>
                        <div class="quote-meta"> <cite>Sam Cole</cite>
                          <p class="caption">Business owner</p>
                        </div>
                      </blockquote>
                    </div>
                  </div>
                  <div id="owl-numbering-1" class="owl-numbering owl-numbering-default">
                    <div class="numbering-current"></div>
                    <div class="numbering-separator"></div>
                    <div class="numbering-count"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="section-50 section-sm-90 section-lg-top-120">
      <div class="shell">
        <div class="text-center">
          <h3>Our Partners</h3>
          <p style="max-width: 580px;" class="reveal-inline-block">We work with the companies that have established a stainless reputation in what they do. They are leaders in various spheres of business, and we appreciate cooperating with them.</p>
        </div>
        <div class="range offset-top-30">
          <div class="cell-xs-6 cell-sm-3">
            <div class="link-image-wrap"><a href="#" class="link-image"><img src="images/126x68.png" alt="" width="126" height="68"/></a></div>
          </div>
          <div class="cell-xs-6 cell-sm-3 offset-top-30 offset-xs-top-0">
            <div class="link-image-wrap"><a href="#" class="link-image"><img src="images/126x100.png" alt="" width="126" height="100"/></a></div>
          </div>
          <div class="cell-xs-6 cell-sm-3 offset-top-30 offset-sm-top-0">
            <div class="link-image-wrap"><a href="#" class="link-image"><img src="images/169x68.png" alt="" width="169" height="68"/></a></div>
          </div>
          <div class="cell-xs-6 cell-sm-3 offset-top-30 offset-sm-top-0">
            <div class="link-image-wrap"><a href="#" class="link-image"><img src="images/138x55.png" alt="" width="138" height="55"/></a></div>
          </div>
        </div>
      </div>
    </section>--%>
  </main> 
  <%@include file="../modules/footer.jsp" %>
</div>
<%@include file="../modules/form-output-global.jsp" %>
<script src="js/core.min.js"></script> 
<script src="js/script.js"></script>
</body>
</html>