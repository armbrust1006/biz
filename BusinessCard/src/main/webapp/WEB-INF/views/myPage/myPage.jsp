<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" class="wide wow-animation">
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
<style>
#formation {
	position: relative;
	left: 25%;
}

#table2 th {
	width: 30px;
	vertical-align: middle;
}

#table2 td {
	padding-left: 20px;
	vertical-align: middle;
}

#button1 {
	float: left;
	padding: 10px;
	width: 50%;
}
#button2 {
	float: right;
	padding: 10px;
	width: 50%;
}

.makebutton {
	position: relative;
	background-color: #4982e5;
	border: none;
	font-size: 15px;
	color: #FFFFFF;
	padding: 5px;
	width: 200px;
	text-align: center;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	text-decoration: none;
	overflow: hidden;
	cursor: pointer;
}

.makebutton:after {
	content: "";
	background: #f1f1f1;
	display: block;
	position: absolute;
	padding-top: 300%;
	padding-left: 350%;
	margin-left: -20px !important;
	margin-top: -120%;
	opacity: 0;
	transition: all 0.8s
}

.makebutton:active:after {
	padding: 0;
	margin: 0;
	opacity: 1;
	transition: 0s
}

.makebutton span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.makebutton span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.makebutton:hover span {
	padding-right: 25px;
}

.makebutton:hover span:after {
	opacity: 1;
	right: 0;
}
</style>

<script type="text/javascript" src="resources/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script>
	var emailflag = false;
	var checknumflag = false;

	$(document).ready(function() {

		/* $('#userid').on('keyup', idcheck); */
		$('#m_email').on('keyup', emailcheck);
		//처음 접근할때 text박스를 숨긴다.
		$('#test').hide();

		/* $('#userid').on('change', idcheck2); */
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
			if (id.length == 0) {
				$('#idcheck').text('');
			} else {
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
			if (email.length == 0) {
				$('#emailcheck2').text('');
			} else {
				$('#emailcheck2').text('이 이메일은 사용할 수 있습니다.');
				emailflag = true;
			}
		}

	};

	function flag() {
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
				|| email.value.length == 0 || name.value.length == 0
				|| checknumflag == false) {

			$('#myModal').modal({
				backdrop : true,
				keyboard : true,
				show : true
			});
			return false;
		} else {
			alert('완료');
			location.href = "myPage";

		}
	}
	
	function goBack(){
		location.href = "login_home";
	}
</script>
</head>
<body>
	<div class="modal fade" id="myModal">

		<div class="modal-dialog">
			<div class="modal-content" style="margin-top: 30%">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-body" id="modal-body">메일 인증을 완료해주세요</div>
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
	<!-- modal 끝 -->
	<div class="page">
		<%@include file="../modules/header.jsp"%>
		<main class="page-content">
		<section class="section-66 section-sm-90 section-lg-bottom-120">
			<div class="shell">
				<h3 class="text-center">회원정보 수정</h3>
				<div class="range offset-top-20	">
					<div class="cell-sm-8 offset-top-20 offset-sm-top-0">

						<div class="inset-lg-left-60 inset-lg-right-60" id="formation">
							<blockquote class="quote-bordered">
								<div class="quote-body">
									<div class="quote-open">
										<svg version="1.1" baseprofile="tiny"
											xmlns="https://www.w3.org/2000/svg"
											xmlns:xlink="https://www.w3.org/1999/xlink" width="37px"
											height="27px" viewbox="0 0 21 15" preserveAspectRatio="none">
                    					  <path
												d="M9.597,10.412c0,1.306-0.473,2.399-1.418,3.277c-0.944,0.876-2.06,1.316-3.349,1.316                    c-1.287,0-2.414-0.44-3.382-1.316C0.482,12.811,0,11.758,0,10.535c0-1.226,0.58-2.716,1.739-4.473L5.603,0H9.34L6.956,6.37                    C8.716,7.145,9.597,8.493,9.597,10.412z M20.987,10.412c0,1.306-0.473,2.399-1.418,3.277c-0.944,0.876-2.06,1.316-3.35,1.316                    c-1.288,0-2.415-0.44-3.381-1.316c-0.966-0.879-1.45-1.931-1.45-3.154c0-1.226,0.582-2.716,1.74-4.473L16.994,0h3.734l-2.382,6.37                    C20.106,7.145,20.987,8.493,20.987,10.412z"></path>
                  						  </svg>
									</div>
									<div class="quote-body-inner" align="center">

										<form
											class="rd-mailform form-modern form-darker offset-top-20"
											action="updateM" method="POST">
											<table id="table2" class="table table-primary">
												<thead>
													<tr>
														<th>ID</th>
														<td><div class="form-group">
																<input id="userid" type="text" name="m_id"
																	value="${member.m_id }"
																	class="form-control form-control-has-validation"
																	readonly="readonly"> <span id="idcheck"
																	style="color: red"></span> <label for="userid"
																	class="form-validation"></label>
															</div></td>
													</tr>
													<tr>
														<th>Password</th>
														<td><div class="form-group offset-top-22">
																<input id="m_password" type="password" name="m_password"
																	value="${member.m_password }"
																	class="form-control form-control-has-validation">
																<label for="m_password" class="form-label"></label> <span
																	id="pass" style="color: red"></span> <span
																	class="form-validation"></span>
															</div></td>
													</tr>

													<tr>
														<th rowspan="2">Email</th>
														<td><div class="form-group offset-top-10">
																<input id="m_email" type="email" name="m_email"
																	value="${member.m_email }" class="form-control">
																<input type="button" id="checknumc" name="checknumc"
																	value="메일인증" class="btn btn-info btn-shadow btn-xs" style="margin-top:10px">
																<label for="m_email" class="form-label"></label> <span
																	id="emailcheck2" style="color: red"> </span> <span
																	class="form-validation"> </span>
																<!-- 메일 인증버튼 누르면 화면이 바뀌고, 줄도 변경되어서 조금 깔끔하게 나옴 -->
																<!-- style="float: middle; margin-top:15px" -->
															</div>
															<div id="test2" class="form-group ofset-top-22">
																<div class="form-group" id="test">
																	<input id="checknum" type="text" name="checknum"
																		class="form-control" placeholder="메일로 전송된 인증번호 입력">
																	<span class="form-validation"></span> <label
																		class="form-label rd-input-label" for="checknum"></label>
																</div>
															</div></td>
													</tr>
													<tr>
														<td></td>
													</tr>
													<tr>
														<th>Name</th>
														<td>
															<div class="form-group offset-top-22">
																<input id="m_name" type="text" name="m_name"
																	value="${member.m_name }" class="form-control">
																<span id="namecheck" style="color: red"></span> <span
																	class="form-validation"></span>
															</div>
														</td>
													</tr>
													<tr>
														<td colspan="2"></td>
													</tr>
												</thead>
											</table>
											
											<input type="hidden" id="_chk_id" name="chk_Id" value="0" style="display:none">
											<div class="group-lg group-middle group-sm offset-top-30">
							                     <button type="submit" class="btn btn-primary btn-sm" onclick="return modalCheck();">회원수정</button>
							                     <button type="button" class="btn btn-primary btn-sm" onclick="return goBack();">취소</button>
                     						</div>
											
										</form>
										

									</div>
								</div>
							</blockquote>
						</div>
					</div>
				</div>
			</div>
		</section>
		</main>
		<%@include file="../modules/footer.jsp"%>
	</div>
	<%@include file="../modules/form-output-global.jsp"%>
	<script src="js/core.min.js"></script>
	<script src="js/script.js"></script>
</body>
</html>
