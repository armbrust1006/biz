<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="wide wow-animation">

<head>
<title>Business</title>
<meta name="format-detection" content="telephone=no">
<meta name="viewport"
   content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css"
   href="css/css.css?family=Montserrat:400,700%7CLato:300,300italic,400,400italic,700,900%7CPlayfair+Display:700italic,900">
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="./resources/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
   //resources 설정하면 바로 그

   var emailflag = false;
   var checknumflag = false;

   function check() {
      var id = document.getElementById('userid');
      var password = document.getElementById('register-form-password');
      var email = document.getElementById('userEmail');
      var name = document.getElementById('register-form-name');

      if (id.value.length == 0 || password.value.length == 0
            || email.value.length == 0 || name.value.length == 0) {
         alert('정확하게 입력해주세요.');
         return false;
      }
   }

   function check() {

   }

   $(document).ready(function() {
      $('#userid').on('keyup', idcheck);
      $('#userEmail').on('keyup', emailcheck);
      //처음 접근할때 text박스를 숨긴다.
      $('#test').hide();

   });

   function idcheck() {

      var id = $('#userid').val();
      $.ajax({
         url : 'idcheck',
         type : 'POST',
         data : {
            id : id
         },
         dataType : 'text',
         success : idsuccess
      });
   }

   function idsuccess(text) {
      if (text == '1') {
         $('#idcheck').text('중복된 아이디가 존재합니다.');
      } else if (text == '0') {
         $('#idcheck').text('이 아이디는 사용할 수 있습니다.');

      }

   }
   function emailcheck() {
      var email = $('#userEmail').val();
      $.ajax({
         url : 'emailchecksss',
         type : 'POST',
         data : {
            email : email
         },
         dataType : 'text',
         success : emailsuccess

      });
   }

   function emailsuccess(text) {
      if (text == '1') {
         $('#emailcheck').text('중복된 이메일입니다.');
      } else if (text == '0') {
         $('#emailcheck').text('이 이메일은 사용할 수 있습니다.');
         emailflag = true;
      }
   };

   $(function() {
      $("#checknumc").on("click", function() {
         var email = $("#userEmail").val();
         var checkbutton = $("#checknumc").val();
         var num = $("#checknum").val();

         if (checkbutton == "메일인증") {
            $.ajax({
               type : "post",
               url : "emailcheck",

               data : {
                  user : email
               },

               success : function(data) {
                  if (emailflag == true) {
                     console.log("메일로 인증번호가 전송되었습니다.");
                     alert("메일로 인증번호가 발송되었습니다.");

                     document.getElementById("checknumc").value = "확인";
                     //text박스가 보여지게된다.
                     $('#test').show();
                  }

                  else {
                     alert("이메일 인증이 완료되지 않았습니다. 이메일 인증을 완료하세요");
                     return false;
                  }
               },

               error : function(e) {
                  console.log(e);
               }
            })
         
            
         }

         else {
            //if (checkbutton == "인증번호 체크")
            $.ajax({
               type : "post",
               url : "checknum",

               success : function(data) {
                  if (num == data) {
                     alert("인증에 성공하였습니다.");
                     checknumflag = true;

                     return true;
                  }

                  else {
                     alert("인증번호가 일치하지 않습니다.");
                     checknumflag = false;

                     return false;
                  }
               },

               error : function(e) {
                  console.log(e);
               }
            })
         }
      })
   })
</script>
</head>
<body style="background-image: url(images/1920x900.jpg);"
   class="one-screen-page bg-gray-darker bg-image">
   <form action="register" method="post">
      <div class="page">
         <div class="page-inner">
            <header class="page-head">
               <div class="divider-spectrum"></div>
               <div class="page-head-inner">
                  <div class="shell text-center">
                     <a href="./" class="brand brand-md">
                     <img src="images/LOGO_VER1_WHITE.png" width="250" height="22" alt="logo" /></a>
                  </div>
               </div>
            </header>
            <section class="page-content">
               <div class="shell">
                  <div class="range range-sm-center">
                     <div class="cell-sm-7 cell-md-5 cell-lg-4">
                        <div class="block-shadow text-center">
                           <div class="block-inner">
                              <p class="h7">Create your account</p>
                              <div class="offset-top-40 offset-sm-top-60">
                                 <span class="icon icon-xl icon-gray-base material-icons-face"></span>
                              </div>
                           </div>
                           <form class="rd-mailform form-modern form-darker offset-top-40">
                              <div class="block-inner">
                                 <div class="form-group has-error">
                                    <input id="userid" type="text" name="m_id"
                                       data-constraints="@Required" class="form-control form-control-has-validation"
                                       placeholder="ID">
                                    <!-- <input type="button" value="중복검사" id="idcheck">  -->
                                    <span id="idcheck" style="color: red" ></span>
                                    <label
                                       for="userid" class="form-label rd-input-label focus not-empty"></label>
                                 </div>
                                 <div class="form-group offset-top-22">
                                    <input id="register-form-password" type="password"
                                       name="m_password" data-constraints="@Required"
                                       class="form-control" placeholder="Password"> <label
                                       for="register-form-password" class="form-label"></label>
                                 </div>
                                 <div class="form-group offset-top-22">
                                    <input id="userEmail" type="email" name="m_email" data-constraints="@Email @Required" class="form-control"
                                       placeholder="Email"> <span id="emailcheck"
                                       style="color: red"> </span>
                                       
                                       <!-- 메일 인증버튼 누르면 화면이 바뀌고, 줄도 변경되어서 조금 깔끔하게 나옴 -->
                                    <div id="test2" style="float: middle; margin-top:15px">
                                       <input type="button" id="checknumc" name="checknumc"
                                          value="메일인증">
                                       <div id="test" style="float: left; margin-left:15px">
                                          <input type="text" id="checknum" name="checknum"
                                             style="color: black">
                                       </div>
                                    </div>

                                    <label for="userEmail" class="form-label"></label>


                                 </div>
                                 <div class="form-group offset-top-22">
                                    <input id="register-form-name" type="text" name="m_name"
                                       data-constraints="@Required" class="form-control"
                                       placeholder="Name"> <label for="register-form-name"
                                       class="form-label"></label>
                                 </div>
                                 <!--    <div class="offset-top-22 text-left text-secondary">
                                    <label class="checkbox-inline checkbox-small"> <input
                                       name="input-checkbox" value="checkbox-1" type="checkbox">
                                       입력한 내용이 맞으면 체크해주세요.
                                    </label>
                                 </div> -->
                              </div>
                              <div class="offset-top-30 offset-sm-top-40">
                                 <input type="hidden" id="_chk_id" name="chk_Id" value="0">
                                 <button type="submit" class="btn btn-primary btn-block"
                                    onclick="return check()">Join</button>

                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
               </div>
            </section>
            <footer class="page-foot">
               <div class="page-foot-inner">
                  <div class="shell text-center">
                     <div class="range">
                        <div class="cell-xs-12">
                           <p class="rights">
                              <span>Business</span><span>&nbsp;&#169;&nbsp;</span><span
                                 id="copyright-year"></span><span>All Rights Reserved</span><br
                                 class="veil-sm"> <a href="#"
                                 class="link-primary-inverse">Terms of Use</a><span>and</span><a
                                 href="privacy-policy.html" class="link-primary-inverse">Privacy
                                 Policy</a>
                           </p>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="divider-spectrum"></div>
            </footer>
         </div>
      </div>
      <div id="form-output-global" class="snackbars"></div>
      <div tabindex="-1" role="dialog" aria-hidden="true" class="pswp">
         <div class="pswp__bg"></div>
         <div class="pswp__scroll-wrap">
            <div class="pswp__container">
               <div class="pswp__item"></div>
               <div class="pswp__item"></div>
               <div class="pswp__item"></div>
            </div>
            <div class="pswp__ui pswp__ui--hidden">
               <div class="pswp__top-bar">
                  <div class="pswp__counter"></div>
                  <button title="Close (Esc)"
                     class="pswp__button pswp__button--close"></button>
                  <button title="Share" class="pswp__button pswp__button--share"></button>
                  <button title="Toggle fullscreen"
                     class="pswp__button pswp__button--fs"></button>
                  <button title="Zoom in/out"
                     class="pswp__button pswp__button--zoom"></button>
                  <div class="pswp__preloader">
                     <div class="pswp__preloader__icn">
                        <div class="pswp__preloader__cut">
                           <div class="pswp__preloader__donut"></div>
                        </div>
                     </div>
                  </div>
               </div>
               <div
                  class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                  <div class="pswp__share-tooltip"></div>
               </div>
               <button title="Previous (arrow left)"
                  class="pswp__button pswp__button--arrow--left"></button>
               <button title="Next (arrow right)"
                  class="pswp__button pswp__button--arrow--right"></button>
               <div class="pswp__caption">
                  <div class="pswp__caption__cent"></div>
               </div>
            </div>
         </div>
      </div>
      <!--  <script src="./resources/js/core.min.js"></script>  
<script src="./resources/js/script.js"></script> -->
   </form>
</body>
</html>