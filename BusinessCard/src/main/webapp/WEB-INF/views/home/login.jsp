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
<script src="js/jquery-3.1.1.min.js"></script>
<script>
function idCheck() {
	var result = "${errorMSG}";
	if(result.length==0) {
		return true;
	} else {
		$('#myModal').modal({
	    	backdrop : true,
	    	keyboard : true,
	    	show : true
		});
		return false;
	};
}
</script>
</head>
<!-- body 배경화면 이미지크기 1920x900 -->
<body style="background-image: url(images/main3.jpg);" class="one-screen-page bg-gray-darker bg-image">
	
	<div class="modal fade" id="myModal">
				<div class="modal-dialog">
					<div class="modal-content" style="margin-top:30%">
						<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Modal Header</h4>
						</div>
						<div class="modal-body">
							<p>${errorMSG}</p>
						</div>
						<div class="modal-footer">
							<div class="group-lg group-middle group-sm offset-top-30">
							<button type="button" class="btn btn-primary btn-sm" >아이디찾기</button>
							<button type="button" class="btn btn-primary btn-sm" >비밀번호찾기</button>
							<button type="button" class="btn btn-default btn-sm" data-dismiss="modal" >닫기</button>
							</div>
						</div>
					</div> <!-- modal-content -->
				</div> <!-- modal-dialog -->
			</div> <!-- modal -->

<div class="page">
  <div class="page-inner">
    <header class="page-head">
      <div class="divider-spectrum"></div>
      <div class="page-head-inner">
        <div class="shell text-center"><a href="./" class="brand brand-md"><img src="images/logo-white.png" width="200" height="22" alt="logo"/></a> </div>
      </div>
    </header>
   
    <section class="page-content">
      <div class="shell">
        <div class="range range-sm-center">
          <div class="cell-sm-7 cell-md-5 cell-lg-4">
            <div class="block-shadow text-center">
              <div class="block-inner">
                <p class="h7">Login to your account</p>
                <div class="offset-top-20 offset-sm-top-30">
                <span class="icon icon-xl icon-gray-base material-icons-lock_open"></span></div>
              </div>

              <!-- novalidate은 유효성 검사를 하지 않도록 지정할 때 사용.  -->
              <form class="form-modern form-darker offset-top-40" novalidate="novalidate" action="login" method="POST" onsubmit="return idCheck();">
                <div class="block-inner">
                  <div class="form-group">
                    <input type="text" class="form-control form-control-has-validation" data-constraints="@Required" name="m_id" id="m_id" placeholder="ID">
                    <span class="form-validation"></span>
                  </div>
                  <div class="form-group offset-top-22">
                    <input type="password" class="form-control form-control-has-validation" data-constraints="@Required" name="m_password" id="m_password" placeholder="PASSWORD">
                    <span class="form-validation"></span>
                  </div>
                </div>
                <div class="offset-top-30 offset-sm-top-60">
                  <button class="btn btn-primary btn-block" type="submit">ログイン</button>
                </div>
              </form>
            </div>
            <div class="group-inline offset-top-15 text-center"><span class="text-white">まだ会員はありませんか。</span><a class="link link-primary-inverse" href="register">会員加入</a></div>
          </div>
        </div>
      </div>
    </section>
	
	<footer class="page-foot">
      <div class="page-foot-inner">
        <div class="shell text-center">
          <div class="range">
          </div>
        </div>
      </div>
     <!--  <div class="divider-spectrum"></div> -->
    </footer>
  </div>
</div>
<%@include file="../modules/form-output-global.jsp" %>
<script src="js/core.min.js"></script> 
<script src="js/script.js"></script>
</body>
</html>