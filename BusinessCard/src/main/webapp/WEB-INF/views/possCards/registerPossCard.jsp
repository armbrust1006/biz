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
</head>
<body style="">
<div class="page">
  <%@include file="../modules/header.jsp" %>
  <main class="page-content">
   <!--  <section style="background-image: url(images/1920x900.jpg);" class="section-30 section-sm-40 section-md-66 section-lg-bottom-90 bg-gray-dark page-title-wrap">
      <div class="shell">
        <div class="page-title">
          <h2>Register My Business Card</h2>
        </div>
      </div>
    </section> -->
    <section class="section-60 section-sm-top-90 section-sm-bottom-100">
      <div class="shell">
        <div class="range">
        
          <div class="cell-md-9 cell-lg-7">
            <h3>Insert Informations</h3>
            <form data-form-output="form-output-global" data-form-type="order" method="post" action="insertCard" id="insertForm" class="rd-mailform form-modern offset-top-30">
              <div class="range range-7">
                <input type="hidden" id="m_id" name="m_id"> 
                <input type="hidden" id="cardType" name="cardType" value="my">
                <input type="hidden" id="imagePath" name="imagePath">
                <!--항목  -->
                
                <div class="cell-sm-3">
                  <div class="form-group">
                    <input id="name" type="text" name="name" data-constraints="@Required" class="form-control">
                    <label for="appointment-name" class="form-label">Name</label>
                  </div>
                </div>
    
           <div class="cell-sm-3">
                  <div class="form-group">
                    <input id="company" type="text" name="company" data-constraints="@Required" class="form-control">
                    <label for="appointment-company" class="form-label">Company</label>
                  </div>
                </div>
                
                <div class="cell-sm-3">
                  <div class="form-group">
              
                  <div>
                    <input id="depart" type="text" name="depart" data-constraints="@Required" class="form-control">
                    <label for="appointment-department" class="form-label">Department</label>
                  </div>
                  
                  </div>
                </div>
                
                <div class="cell-sm-3">
                  <div class="form-group">
                     
                    <input id="position" type="text" name="position" data-constraints="@Required" class="form-control">
                    <label for="appointment-position" class="form-label">Position</label>
                  </div>
                </div>
                
                <div class="cell-sm-3">
                  <div class="form-group">
                    <input id="address" type="text" name="address" data-constraints="@Required" class="form-control">
                    <label for="appointment-address" class="form-label">Address</label>
                  </div>
                </div>
               
                 <div class="cell-sm-3">
                  <div class="form-group">
                    <input id="email" type="email" name="email" data-constraints="@Email @Required" class="form-control">
                    <label for="appointment-email" class="form-label">Email</label>
                  </div>
                </div>
                
                <div class="cell-sm-3">
                  <div class="form-group">
                    <input id="telphone" type="text" name="telphone" data-constraints="@Required" class="form-control">
                    <label for="appointment-phone" class="form-label">Phone Number</label>
                  </div>
                </div>

                <div class="cell-sm-3">
                  <div class="form-group">
                    <input id="fax" type="text" name="fax" data-constraints="@Required" class="form-control">
                    <label for="appointment-fax" class="form-label">Fax</label>
                  </div>
                </div>

                <div class="cell-sm-3">
                  <div class="form-group">
                    <input id="mobile" type="text" name="mobile" data-constraints="@Required" class="form-control">
                    <label for="appointment-mobile" class="form-label">Mobile</label>
                  </div>
                </div>
               
                <div class="cell-sm-3 offset-top-20">
                  <div class="form-group">
                    <input id="appointment-date" type="text" name="date" data-constraints="@Required" data-time-picker="date" class="form-control">
                    <label for="appointment-date" class="form-label">Date</label>
                  </div>
                </div>
               
                <div class="cell-sm-3 offset-top-20">
                  <div class="form-group">
                   <!-- 화면 레이아웃 균형을 위해 만든 유령div. -->
                  </div>
                </div>
                <div class="cell-sm-3 offset-top-20">
                  <div class="form-group">
                    <input id="originalImg" type="file" name="originalImg" data-constraints="@Required" class="form-control">
                  </div>
                </div>

                <div></div>
                <div class="cell-xs-4 offset-top-30 offset-xs-top-30 offset-sm-top-50">
                  <button type="submit" class="btn btn-primary btn-block">Make Example</button>
                </div>
                <div class="cell-xs-2 offset-top-22 offset-xs-top-30 offset-sm-top-50">
                  <button type="reset" class="btn btn-silver-outline btn-block">Reset</button>
                </div>
              </div>
            </form>
            
             <!--폼 끝  -->
            
          </div>
       <!-- 오른쪽 부분 -->
              <div class="cell-xs-2 offset-top-30 offset-xs-top-30 offset-sm-top-50">
               <canvas id="myCanvas" width="600" height="300" style="border: 2px solid #d3d3d3;"></canvas>
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