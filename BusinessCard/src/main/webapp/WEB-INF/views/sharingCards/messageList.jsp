<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" class="wide wow-animation">
<head>
<title>OBEO</title>
<meta name="format-detection" content="telephone=no">
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<meta charset="utf-8">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="css/css.css">
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="resources/js/jquery-3.1.1.min.js"></script>
<script>
	$(document).ready(function() {
		inBoxList();
		$("#outBoxList").on("click", outBoxList)
		$("#inBoxList").on("click", inBoxList)
		$("#writeMessageForm").on("click", writeMessageForm)
		$("#flip").on("click", flip)
	})

	//inbox(수신함) 요청
	function inBoxList() {
		$.ajax({
			type : "get",
			url : "inBoxList",
			success : showInBoxList
		});
	}
	//inbox(수신함) 결과 보여주기
	function showInBoxList(resp) {
		$("#showMessage").empty();
		var msg = ''
		msg = "<table class='table table-primary' id='tbl'>";
		msg += "<thead>";
		msg += "<tr>";
		msg += "<th>보낸사람</th>";
		msg += "<th>내용</th>";
		msg += "<th>날짜</th>";
		msg += "<th>확인</th>";
		msg += "<th>삭제</th>";
		msg += "</tr>";
		msg += "</thead>";
		$
				.each(
						resp,
						function(index, item) {
							msg += "<tbody>";
							msg += "<tr>";
							msg += "<td>" + item.sender + "</td>";
							msg += "<td>" + item.message + "</td>";
							msg += "<td>" + item.senddate + "</td>";
							if (item.type == 'message') {
								msg += "<td><button class='btn btn-info btn-xs' id='flip1"+index+"' book_num=0 ><span>메시지</span></button></td></td>";
							} else if (item.type == 'invitation') {
								msg += "<td><button class='btn btn-info btn-xs' id='flip2"+index+"' book_num='" + item.book_num + "'><span>초대장</span></button></td>";
							}
							msg += "<td><button class='btn btn-info btn-xs' id='del"+index+"' delSender='"+item.sender+"' delMessage='"+item.message+"'><span>삭제</span></td>"
							msg += "</tr>";
							msg += "</tbody>";

						});
		msg += '</table>';
		$("#showMessage").html(msg);

		for (var i = 0; i < resp.length; i++) {
			$("#flip1" + i).on("click", flip);
			$("#flip2" + i).on("click", flip);
			$("#del" + i).on("click", deleteMessage);
		}
	}

	//메세지 삭제
	function deleteMessage() {
		var delSender = $(this).attr("delSender");
		var delMessage = $(this).attr("delMessage");
		alert(typeof(delSender));
 		alert('보낸이: ' + delSender + ' 내용: ' + delMessage);
		var data = { delSender : delSender, delMessage: delMessage};
		
 		$.ajax({
			method : "POST",
			url : "delMessage",
			type : "JSON",
			data : data,
			success: function(resp) {
				alert('삭제하였습니다');
				inBoxList();
			}
		});

	}

	function flip() {
		var book_num = $(this).attr("book_num");
		var sender = $(this).closest('tr').find('td:eq(0)').text();
		var message = $(this).closest('tr').find('td:eq(1)').text();
		var date = $(this).closest('tr').find('td:eq(2)').text();
		var url = 'invitedCard?book_num=' + book_num + '&sender=' + sender
				+ '&message=' + message + '&date=' + date;
		window.open(url, "invitedCard",
				"top=200, left=400, width=300, height=500, resizable=no");
	}

	//outbox(발신함) 요청
	function outBoxList() {
		$.ajax({
			type : "get",
			url : "outBoxList",
			success : showOutBoxList
		});
	}

	//outbox(발신함) 결과 보여주기
	function showOutBoxList(resp) {
		$("#showMessage").empty();
		var msg = '<table class="table table-primary">';
		msg += "<thead>";
		msg += "<tr>";
		msg += "<th>Target</th>";
		msg += "<th>Text</th>";
		msg += "<th>SendDate</th>";
		msg += "<th>ReadDate</th>";
		msg += "<th>Type</th>";
		msg += "</tr>";
		msg += "</thead>";
		$.each(resp, function(index, item) {
			msg += "<tbody>";
			msg += "<tr>";
			msg += "<td>" + item.targetId + "</td>";
			msg += "<td>" + item.message + "</td>";
			msg += "<td>" + item.senddate + "</td>";
			if (item.opendate != null) {
				msg += "<td>" + item.opendate + "</td>";
			} else {
				msg += "<td>not yet</td>";
			}
			msg += "<td>" + item.type + "</td>";
			msg += "</tr>";
			msg += "</tbody>";
		});
		msg += '</table>';
		$("#showMessage").html(msg);
	}

	function writeMessageForm() {
		$("#showMessage").empty();
		var form = "<form method='post' action='writeMessage'>";
		form += '<h4 class="text-left">Write Message</h4>';
		form += '<div class="cell-sm-6">'
		form += '<div class="inset-lg-left-60 inset-lg-right-40">'
		form += '<blockquote class="quote-bordered">'
		form += '<div class="quote-body">'
		form += '<div class="quote-open">'
		form += '<svg version="1.1" baseprofile="tiny" xmlns="https://www.w3.org/2000/svg" xmlns:xlink="https://www.w3.org/1999/xlink" width="37px" height="27px" viewbox="0 0 21 15" preserveAspectRatio="none">'
		form += '<path d="M9.597,10.412c0,1.306-0.473,2.399-1.418,3.277c-0.944,0.876-2.06,1.316-3.349,1.316 c-1.287,0-2.414-0.44-3.382-1.316C0.482,12.811,0,11.758,0,10.535c0-1.226,0.58-2.716,1.739-4.473L5.603,0H9.34L6.956,6.37 C8.716,7.145,9.597,8.493,9.597,10.412z M20.987,10.412c0,1.306-0.473,2.399-1.418,3.277c-0.944,0.876-2.06,1.316-3.35,1.316 c-1.288,0-2.415-0.44-3.381-1.316c-0.966-0.879-1.45-1.931-1.45-3.154c0-1.226,0.582-2.716,1.74-4.473L16.994,0h3.734l-2.382,6.37 C20.106,7.145,20.987,8.493,20.987,10.412z"></path>'
		form += '</svg>'
		form += '</div>'
		form += '<div class="quote-body-inner">'
		form += "<h6>받는사람</h6> <input type='text' class='form-control' placeholder='받는 사람을 입력하세요.' name='targetId'>"
		form += "<h6>메시지</h6><p><textarea name='message' data-constraints='@Required' class='form-control' placeholder='메시지를 작성하세요.'></textarea></p>"
		form += '</div>'
		form += '</div>'
		form += '<div class="quote-footer">'
		form += '<div class="unit unit-horizontal unit-spacing-sm unit-middle">'
		form += '<div class="unit-body"> <cite><p class="text-primary">From</p></cite>'
		form += '<cite>${m_id}</cite>';
		form += '</div>';
		form += '</div>';
		form += '</blockquote>';
		form += '</div>';
		form += '</div>';
		form += '</div>';
		form += "<button type='submit' class='btn btn-primary'>보내기</button>"
		form += "<button type='reset' class='btn btn-primary-outline'>다시쓰기</button>"
		form += '</form>';
		$("#showMessage").html(form);
	}
</script>
</head>
<body style="">
	<div class="page">
		<%@include file="../modules/header.jsp"%>
		<main class="page-content">
		<section class="section-60 section-sm-90 section-lg-bottom-120">
			<div class="shell">
				<div class="range range-sm-center range-lg-center range-lg-10">
					<div class="cell-sm-10 cell-md-10 ">
						<h3>메세지 박스</h3>
						<p>회원들과 주고 받은 메세지를 확인하세요</p>
						<div
							class="group-middle group-lg offset-top-30 offset-bottom-40 text-center">
							<div class="btn btn-primary-outline btn-shadow" id="inBoxList">InBox</div>
							<div class="btn btn-primary-outline btn-shadow" id="outBoxList">OutBox</div>
							<div class="btn btn-primary-outline btn-shadow"
								id="writeMessageForm">Write</div>
						</div>
					</div>
					<div class="cell-sm-10 cell-md-10 cell-top-40">
						<div class="group-middle offset-top-30 offset-bottom-40">
							<div id="showMessage"></div>
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