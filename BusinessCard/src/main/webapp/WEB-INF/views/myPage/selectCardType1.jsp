<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="wide wow-animation">
<head>
<title>Business</title>
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
    <section style="background-image: url(images/1920x900.jpg);" class="section-30 section-sm-40 section-md-66 section-lg-bottom-90 bg-gray-dark page-title-wrap">
      <div class="shell">
        <div class="page-title">
          <h2>Select Card Type</h2>
        </div>
      </div>
    </section>
    
    <section class="section-50 section-sm-100 section-lg-100">
      <div class="shell">
        <div class="range range-sm-center range-md-left">
        
         <c:forEach begin="0" end="4" step="1" var="type">
          <div class="cell-sm-9 cell-md-6 height-fill offset-top-30">
            <article class="post-block">
                      <a href="registerMyCard?type=${type}"><div class="post-image"><img src="images/570x253.jpg" alt="" width="570" height="253"/> </div></a>
                <h4 class="post-header">Card Type-${type}</h4>
                    <ul class="list-tags-inline">
                    </ul>
            </article>
          </div>
          </c:forEach>
          
          <!-- <div class="cell-sm-9 cell-md-6 height-fill offset-top-30 offset-md-top-0">
             <article class="post-block">
                      <a href="registerMyCard?type=2"><div class="post-image"><img src="images/570x253.jpg" alt="" width="570" height="253"/> </div></a>
                <h4 class="post-header">Card Type-2</h4>
                    <ul class="list-tags-inline">
                    </ul>
            </article>
          </div>
          
          <div class="cell-sm-9 cell-md-6 height-fill offset-top-30">
             <article class="post-block">
                      <a href="registerMyCard?type=3"><div class="post-image"><img src="images/570x253.jpg" alt="" width="570" height="253"/> </div></a>
                <h4 class="post-header">Card Type-3</h4>
                    <ul class="list-tags-inline">
                    </ul>
            </article>
          </div>
          
          <div class="cell-sm-9 cell-md-6 height-fill offset-top-30">
            <article class="post-block">
                      <a href="registerMyCard?type=4"><div class="post-image"><img src="images/570x253.jpg" alt="" width="570" height="253"/> </div></a>
                <h4 class="post-header">Card Type-4</h4>
                    <ul class="list-tags-inline">
                    </ul>
            </article>
          </div> -->
         
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