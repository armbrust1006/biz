<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="page-head">
    <div class="rd-navbar-wrap">
      <nav data-layout="rd-navbar-fixed" data-sm-layout="rd-navbar-fixed" data-md-device-layout="rd-navbar-fixed" data-lg-layout="rd-navbar-static" data-lg-device-layout="rd-navbar-static" data-stick-up-clone="false" data-md-stick-up-offset="53px" data-lg-stick-up-offset="53px" data-md-stick="true" data-lg-stick-up="true" class="rd-navbar rd-navbar-corporate-light">
        <div class="rd-navbar-inner">
          <div class="rd-navbar-aside-wrap">
            <div class="rd-navbar-aside">
              <div data-rd-navbar-toggle=".rd-navbar-aside" class="rd-navbar-aside-toggle"><span></span></div>
            <!-- 전화번호와 이메일 정보를 표시하는 부분 -->
              <div class="rd-navbar-aside-content">
                <ul class="rd-navbar-aside-group list-units">
                  <li>
                    <div class="unit unit-horizontal unit-spacing-xs unit-middle">
                      <div class="unit-left"><span class="icon icon-xxs icon-primary fa-sign-in"></span></div>
                      <div class="unit-body">
                      <a href="login" class="link-secondary">로그인</a></div>
                    </div>
                  </li>
                </ul> 
              </div>
            </div> 
           
           <!-- 검색 아이콘 클릭시 처리 -->
            <div class="rd-navbar-search">
              <form action="#" method="GET" data-search-live="rd-search-results-live" data-search-live-count="6" class="rd-search">
                <div class="rd-search-inner">
                  <div class="form-group">
                    <label for="rd-search-form-input" class="form-label">Search...</label>
                    <input id="rd-search-form-input" type="text" name="s" autocomplete="off" class="form-control">
                  	<ul>
                  		<li><a href="./">Home</a> </li>
                  		<li><a href="about-us">About</a></li>
                	</ul>
                  </div>
                  <button type="submit" class="rd-search-submit"></button>
                </div>
                <div id="rd-search-results-live" class="rd-search-results-live"></div>
              </form>
              <button data-rd-navbar-toggle=".rd-navbar-search, .rd-navbar-search-wrap" class="rd-navbar-search-toggle"></button>
            </div>
           <!-- 검색 아이콘 처리 부분 끝 --> 
          </div>
          
          <div class="rd-navbar-group">
            <div class="rd-navbar-panel">
              <button data-rd-navbar-toggle=".rd-navbar-nav-wrap" class="rd-navbar-toggle"><span></span></button>
              <a href="./" class="rd-navbar-brand brand"><img src="images/logo-black.png" width="200" height="22" alt="logo"/></a> </div>
            <div class="rd-navbar-nav-wrap">
              <div class="rd-navbar-nav-inner">
                <ul class="rd-navbar-nav">
                  <li><a href="./">Home</a> </li>
                  <li><a href="about-us">About</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </nav>
    </div>
  </header>