<!-- login_home 기본 헤더 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <header class="page-head">
    <div class="rd-navbar-wrap">
      <nav data-layout="rd-navbar-fixed" data-sm-layout="rd-navbar-fixed" data-md-device-layout="rd-navbar-fixed" data-lg-layout="rd-navbar-static" data-lg-device-layout="rd-navbar-static" data-stick-up-clone="false" data-md-stick-up-offset="53px" data-lg-stick-up-offset="53px" data-md-stick="true" data-lg-stick-up="true" class="rd-navbar rd-navbar-corporate-light">
        <div class="rd-navbar-inner">
          <div class="rd-navbar-aside-wrap">
            <div class="rd-navbar-aside">
              <div data-rd-navbar-toggle=".rd-navbar-aside" class="rd-navbar-aside-toggle"><span></span></div>
              <div class="rd-navbar-aside-content">
                <ul class="rd-navbar-aside-group list-units">
                  <li>
                    <div class="unit unit-horizontal unit-spacing-xs unit-middle">
                      <div class="unit-left"><span class="icon icon-xxs icon-primary fa-user"></span></div>
                      <div class="unit-body"><a href="myPage" class="link-secondary">${m_id}様の接続中</a></div>
                    </div>
                  </li>
                  <li>
                    <div class="unit unit-horizontal unit-spacing-xs unit-middle">
                      <div class="unit-left"><span class="icon icon-xxs icon-primary fa-envelope-o"></span></div>
                      <div class="unit-body">
                      <a href="messageList" class="link-secondary">
                      <span class="__cf_email__" data-cfemail="81e8efe7eec1e5e4eceeede8efeaafeef3e6"></span>私のメッセージ</a></div>
                    </div>
                  </li>
                  <li>
                    <div class="unit unit-horizontal unit-spacing-xs unit-middle">
                      <div class="unit-left"><span class="icon icon-xxs icon-primary fa-sign-out"></span></div>
                      <div class="unit-body">
                      <a href="logout" class="link-secondary" >
                      <span class="__cf_email__" data-cfemail="81e8efe7eec1e5e4eceeede8efeaafeef3e6"></span>ログアウト</a></div>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
            <div class="rd-navbar-search">
              <form action="search-results.html" method="GET" data-search-live="rd-search-results-live" data-search-live-count="6" class="rd-search">
                <div class="rd-search-inner">
                  <div class="form-group">
                    <label for="rd-search-form-input" class="form-label">Search...</label>
                    <input id="rd-search-form-input" type="text" name="s" autocomplete="off" class="form-control">
                  </div>
                  <button type="submit" class="rd-search-submit"></button>
                </div>
                <div id="rd-search-results-live" class="rd-search-results-live"></div>
              </form>
              <button data-rd-navbar-toggle=".rd-navbar-search, .rd-navbar-search-wrap" class="rd-navbar-search-toggle"></button>
            </div>
          </div>
          <div class="rd-navbar-group">
            <div class="rd-navbar-panel">
              <button data-rd-navbar-toggle=".rd-navbar-nav-wrap" class="rd-navbar-toggle"><span></span></button>
              <a href="login_home" class="rd-navbar-brand brand">
              <img src="images/logo-black.png" width="200" height="22" alt="logo"/></a>
            </div>
            <div class="rd-navbar-nav-wrap">
              <div class="rd-navbar-nav-inner">
                <ul class="rd-navbar-nav">
                  <li><a href="login_home">Home</a>
                  <ul></ul>
                  </li>
                  
                  <li><a href='#'>マイページ</a>
                        <ul class="rd-navbar-dropdown">
                          <li><a href="selectCardType?type=my">自分の名刺登録</a></li>
                          <li><a href="myCard">自分の名刺管理</a></li>
                          <li><a href="myPage">私の情報管理</a></li>
                          <li><a href="mySchedule">スケジュール管理</a></li> <!-- 캘린더API구현 위치 -->
                        </ul>
                  </li>
                  <li><a href="#">保有名刺妾</a>
                    <ul class="rd-navbar-dropdown">
                    	<li><a href="searchCard">名刺検索</a> </li> <!-- 명함 검색 -->
                    	<li><a href="selectCardType">他人の名刺登録</a> </li> <!-- 명함 검색 -->
                      	<li><a href="myCardList">保有名刺リスト</a> </li> <!-- 갤러리 형식으로 명함을 나열해서 보여만 주는 간단한 sort기능만 구현 -->
                      	<!-- <li><a href="#">명함 목록 관리</a> </li> 실제로 명함 등록, 수정, 삭제하고 리스트에 기본으로 나타낼 sorting기준 등 수정가능. -->
                    </ul>
                  </li>
                  
                  
                  <li><a href="#">共有名刺妾</a>
                    <ul class="rd-navbar-dropdown">
                      <li><a href="sharingRoom">私の共有名刺妾</a> </li>
                      <!-- <li><a href="test">공유 명함첩 관리</a> </li> -->
                    </ul>
                  </li>
                  
                 <li><a href="about-us">About Us</a>
                 <ul class="rd-navbar-nav"></ul>
                 </li>
                  
                  </ul>
                
              </div>
            </div>
          </div>
        </div>
      </nav>
    </div>
  </header>
