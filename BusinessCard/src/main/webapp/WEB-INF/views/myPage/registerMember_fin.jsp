<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="wide wow-animation">
<head>
<title>OBOE</title>
<meta name="format-detection" content="telephone=no">
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="css/css.css?family=Montserrat:400,700%7CLato:300,300italic,400,400italic,700,900%7CPlayfair+Display:700italic,900">
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script>
   var emailflag = false;
   var checknumflag = false;


   $(document).ready(function() {
      
      $('#userid').on('keyup', idcheck);
      $('#m_email').on('keyup', emailcheck);
      //처음 접근할때 text박스를 숨긴다.
      $('#test').hide();

      $('#userid').on('change', idcheck2);
      $('#m_email').on('change', emailcheck2);
   });

   
 
   function idcheck2() {
      var id2 = $('#userid').val();

      if (id2.length == 0) {
         $('#idcheck').text('');
      }

   }
   function emailcheck2() {
      var email2 = $('#m_email').val();

      if (email2.length == 0) {
         $('#emailcheck2').text('');
      }
   }

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
      var id = $('#userid').val();
      if (text == '1') {
         $('#idcheck').text('중복된 아이디가 존재합니다.');
      } else if (text == '0') {
         if(id.length==0){
            $('#idcheck').text('');
         }else{
         $('#idcheck').text('이 아이디는 사용할 수 있습니다.');
         }
      } 
   }
   function emailcheck() {
      var email = $('#m_email').val();
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
      var email = $('#m_email').val();
      if (text == '1') {
         $('#emailcheck2').text('중복된 이메일입니다.');
      } else if (text == '0') {
            if(email.length==0){
            $('#emailcheck2').text('');
         }else{
         $('#emailcheck2').text('이 이메일은 사용할 수 있습니다.');
         emailflag=true;
         }
      }
      
   };
   
   function flag(){
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

   $(function() {
      $("#checknumc").on("click", function() {
         var email = $("#m_email").val();
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
     function c_alert(output_msg, title_msg) {
      if (!title_msg)
         title_msg = 'Alert';
      if (!output_msg)
         output_msg = 'No Message to Display.';
      $("<div></div>").html(output_msg).dialog({
         title : title_msg,
         resizable : false,
         modal : true,
         buttons : {
            "Ok" : function() {
               $(this).dialog("close");
            }
         }
      }); 
   } 
   function c_alert(output_msg) {
       $('#modal-body').html(output_msg);         
      $('#myModal').modal({
         backdrop : true,
         keyboard : true,
         show : true
      });
   }
    
   

    function modalCheck() {
    	 var id = document.getElementById('userid');
         var password = document.getElementById('m_password');
         var email = document.getElementById('m_email');
         var name = document.getElementById('m_name');

         if (id.value.length == 0 || password.value.length == 0
               || email.value.length == 0 || name.value.length == 0 ||
               checknumflag == false) {
            
        	 $('#myModal').modal({
                 backdrop : true,
                 keyboard : true,
                 show : true
              });  
            return false;
         }
         else{
        	 alert('완료');
      location.href="login";
        	 
         }
       
   }
</script>
</head>
<!-- body 배경화면 이미지크기 1920x900 -->

<body style="background-image: url(images/register_BG.jpg);background-attachment: fixed;"
   class="one-screen-page bg-gray-darker bg-image">

   <div class="modal fade" id="myModal">
      <div class="modal-dialog">
         <div class="modal-content" style="margin-top: 30%">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">Modal Header</h4>
            </div>
            <div class="modal-body" id="modal-body">
            	<p>메일 인증에 실패하였습니다</p>
            </div>
            <div class="modal-footer">
               <div class="group-lg group-middle group-sm offset-top-30">
                  <button type="button" class="btn btn-default btn-sm"
                     data-dismiss="modal">닫기</button>
               </div>
            </div>
         </div>
         <!-- modal-content -->
      </div>
      <!-- modal-dialog -->
   </div>
   <!-- modal -->


   <div class="page">
      <div class="page-inner">
         <header class="page-head">
           <!--  <div class="divider-spectrum"></div> -->
            <div class="page-head-inner" style=" margin-bottom: -41px;">
               <div class="shell text-center">
                  <a href="./" class="brand brand-md"> <img
                     src="images/logo-white.png" width="200" height="22" alt="logo" /></a>
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
                           <div class="offset-top-20 offset-sm-top-30">
                              <span class="icon icon-xl icon-gray-base material-icons-face"></span>
                           </div>
                        </div>

                        <form class="rd-mailform form-modern form-darker offset-top-20"
                           action="register" method="POST">
                           <div class="block-inner">
                              <div class="form-group">
                                 <input id="userid" type="text" name="m_id"
                                    data-constraints="@Required"
                                    class="form-control form-control-has-validation"
                                    placeholder="ID"> <span id="idcheck"
                                    style="color: red;"></span> <label for="userid"
                                    class="form-validation"></label>
                              </div>
                              <div class="form-group offset-top-22">
                                 <input id="m_password" type="password" name="m_password"
                                    data-constraints="@Required"
                                    class="form-control form-control-has-validation"
                                    placeholder="Password"> <label for="m_password"
                                    class="form-label"></label> <span id="pass"
                                    style="color: red"></span> <span class="form-validation"></span>
                              </div>
                              <div class="form-group offset-top-22">
                                 <input id="m_email" type="email" name="m_email"
                                    class="form-control"
                                    placeholder="Email"> <label for="m_email"
                                    class="form-label"></label> <span id="emailcheck2"
                                    style="color: red"> </span> <span class="form-validation"></span>
                                 <!-- 메일 인증버튼 누르면 화면이 바뀌고, 줄도 변경되어서 조금 깔끔하게 나옴 -->
                                 <!-- style="float: middle; margin-top:15px" -->
                              </div>
                              <div id="test2" class="form-group ofset-top-22">
                                 <div class="form-group" id="test">
                                    <input id="checknum" type="text" name="checknum"
                                       data-constraints="@Required" class="form-control"
                                       placeholder="인증번호">
                                    <span class="form-validation"></span> 
                                    <label class="form-label rd-input-label" for="checknum"></label>
                                 </div>


                                 <input type="button" id="checknumc" name="checknumc"
                                    value="메일인증" class="btn btn-info btn-shadow btn-xs">
                              </div>

                              <div class="form-group offset-top-22">
                                 <input id="m_name" type="text" name="m_name"
                                    data-constraints="@Required" class="form-control"
                                    placeholder="Name"> <span id="namecheck"
                                    style="color: red"></span> <span class="form-validation"></span>
                              </div>
                           </div>
                           <div class="offset-top-30 offset-sm-top-40">
                              <input type="hidden" id="_chk_id" name="chk_Id" value="0">
                              <button type="submit" class="btn btn-primary btn-block" onclick= "return modalCheck();">Join</button>


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
                     <div class="cell-xs-12"></div>
                  </div>
               </div>
            </div>
            <!-- <div class="divider-spectrum"></div> -->
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
               <button title="Zoom in/out" class="pswp__button pswp__button--zoom"></button>
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
   <%@include file="../modules/form-output-global.jsp"%>
   <script src="js/core.min.js"></script>
   <script src="js/script.js"></script>
   <!--    </form> -->




</body>
</html>