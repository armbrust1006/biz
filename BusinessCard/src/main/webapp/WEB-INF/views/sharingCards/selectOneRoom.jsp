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
#tabs-1-1 {
	margin-left: -30px;
	margin-top: 10px;
}

.withdrawalbutton {
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

.withdrawalbutton:after {
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

.withdrawalbutton:active:after {
	padding: 0;
	margin: 0;
	opacity: 1;
	transition: 0s
}

.withdrawalbutton span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.withdrawalbutton span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.withdrawalbutton:hover span {
	padding-right: 25px;
}

.withdrawalbutton:hover span:after {
	opacity: 1;
	right: 0;
}

#searchInvite {
	margin-top: initial;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		getSharedCard();
		document.getElementById("searchInvite").onclick = inviteList;// 초대검색
		document.getElementById("tab4").onclick = allMember;// 구성원 클릭

		document.getElementById("tab2").onclick = loadList;
		document.getElementById("writeClick").onclick = asdf;
		document.getElementById("tab1").onclick = getSharedCard;

	}

	//초대 검색
	function inviteList() {
		var searchTitle = $("#searchTitle").val();
		var searchText = $("#searchText").val();
		$.ajax({
			type : "get",
			url : "inviteList",
			data : {
				"searchTitle" : searchTitle,
				"searchText" : searchText
			},
			success : outInviteList
		});
	}
	// 초대할 목록 보여주기
	function outInviteList(resp) {
		$("#inviteListResult").empty();
		var msg = '<table class="table table-primary">';
		msg += "<tr>";
		msg += "<td>" + "I  D" + "</td>";
		msg += "<td>" + "이 름" + "</td>";
		msg += "<td></td>"
		msg += "</tr>";
		$
				.each(
						resp,
						function(index, item) {
							msg += "<tr>";
							msg += "<td>" + item.m_id + "</td>";
							msg += "<td>" + item.m_name + "</td>";
							msg += "<td><input type='button' class='btn btn-info btn-xs' id='invite1"+index+"' target-id='" + item.m_id + "' value='초대'></td>";
							msg += "</tr>";
						});
		msg += '</table>';
		$("#inviteListResult").html(msg);

		for (var i = 0; i < resp.length; i++) {
			$("#invite1" + i).on("click", invite);
		}
	}

	// 초대 목록에서 한 사람 선택
	function invite() {
		var targetId = $(this).attr("target-id"); // 초대할 사람 선택 시 m_id 받아옴
		var book_num = $("#book_num").val();
		var url = 'invitationCard?targetId=' + targetId + '&book_num='
				+ book_num;
		//초대폼 윈도우 새창 띄우기
		window.open(url, "invitationCard",
				"top=200, left=400, width=300, height=500, resizable=no");
	}

	// 공유방의 구성원 목록보기
	function allMember() {
		var book_num = $("#book_num").val();
		$.ajax({
			type : "get",
			url : "allMember",
			data : {
				"book_num" : book_num
			},
			success : outMemberList
		});
	}

	// 공유방의 구성원 목록 보여주기
	function outMemberList(resp) {
		var msg = '<table class="table table-primary">';
		msg += "<tr>";
		msg += "<td>" + "I  D" + "</td>";
		msg += "<td>" + "이 름" + "</td>";
		msg += "<td>" + "가입날짜" + "</td>";
		msg += "</tr>";
		$.each(resp, function(index, item) {
			msg += "<tr>";
			msg += "<td>" + item.M_ID + "</td>";
			msg += "<td>" + item.GRADE + "</td>";
			msg += "<td>" + item.INPUTDATE + "</td>";
			msg += "</tr>";
		});
		msg += '</table>';
		$("#memberList").html(msg);
	}

	function refresh() {
		$('#writeForm').show();
		$('#listView').hide();
	}

	//글쓰기 폼에서 글쓰기버튼을 눌렀을경우 ajax를 통해서 DB에 저장이 됨.
	function asdf() {
		var board_title = $("#board_title").val();
		//var m_id = $("#m_id").val();
		var board_content = $("#board_content").val();
		var book_num = document.getElementById("book_num").value;
		$.ajax({
			url : 'board_write',
			type : 'POST',
			data : {
				book_num : book_num,
				board_title : board_title,
				board_content : board_content
			},
			success : function() {
				alert('성공했습니다.');
				$('#listView').show();
				$('#writeForm').hide();

				loadList();

			},
			error : function() {
				alert('실패');
			}

		});

	}

	//현재 게시판에 있는 리스트전체를 불러옴(book_num에 따라서 값이 다름.)
	function loadList(listB) {
		var book_num = document.getElementById("book_num").value;
		var list = '';
		$.ajax({
			url : 'listB',
			type : 'POST',
			data : {
				book_num : book_num
			},
			dataType : 'JSON',

			success : function(e) {

				for (var i = 0; i < e.length; i++) {
					list += ' <table width="100%">';
					list += ' <tr style=text-align:center>';
					list += ' <td width="73">' + e[i].boardnum + '</td>';
					list += ' <td width="379"><a href="javascript:readB('
							+ e[i].boardnum + ')">' + e[i].board_title
							+ '</a></td>';
					//	list += ' <td width="379"><a href="/readB?boardnum=' + e[i].boardnum + '">'+ e[i].board_title + '</a></td>';
					list += ' <td width="73">' + e[i].m_id + '</td>';
					list += ' <td width="164">' + e[i].inputdate + '</td>';
					list += ' <td width="58">' + e[i].board_hits + '</td>';
					list += ' </tr>';
					list += ' </table>';
				}
				$('#dataCol').html(list);

			},
			error : function(listB) {
				alert('에러: ' + JSON.stringify(listB));
			}

		});

	}

	//리스트에서 글쓰기 폼을 눌렀을경우 글쓰리 페이지가 나옴.
	function check(resp) {

		refresh();
		var book_num = document.getElementById("book_num").value;
		var test = '';

		test += ' <form id = "writeForm" align="center">';
		test += ' <input type="hidden" name="book_num" value="'+book_num+'">';
		test += ' <div id="bbsCreated">';
		test += ' <div class="bbsCreated_bottomLine">';
		test += ' <dl>';
		test += ' <dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>';
		test += ' <dd>';
		test += ' <input type="text" id="board_title" size="64" maxlength="100"  class="boxTF" style="border: 2px solid #5C84DC;"/>';

		test += ' </dd>';
		test += ' </dl>';
		test += ' </div>';
		test += ' <div id="bbsCreated_content">';
		test += ' <dl>';
		test += ' <dt>내&nbsp;&nbsp;&nbsp;&nbsp;용 </dt>';
		test += ' <dd>';
		test += ' <textarea id="board_content" cols="63" rows="10" class="boxTA"style="border: 2px solid #5C84DC;"></textarea>';
		test += ' </dd>';
		test += ' </dl>';
		test += ' </div>';
		test += ' <div id="bbsCreated_footer">';
		test += ' <dl>';
		test += ' <td>';
		test += ' <dd>';
		test += ' <div id="button">';
		test += ' <input type="button" class="btn-sm btn-primary" id="writeClick" style="margin-top:5px; margin-right:10px""  onclick="return asdf();" value="등록">';
		test += ' <input type="button" class="btn-sm btn-primary" id="cancle" onclick="return relist();" value="작성취소">';
		test += ' </div>';
		test += ' </dd>';
		test += ' </dl>';
		test += ' </table>';
		test += ' </div>';
		test += ' </form>';

		$('#writeForm').html(test);
		$('#listView').hide();

	}

	// 데이터 읽어온 곳에서 삭제를 눌렀을 경우 ajax처리로 삭제됨.
	function deletedB(boardnum) {
		var num = boardnum;
		var book_num = document.getElementById("book_num").value;
		$.ajax({
			url : 'deleteB',
			type : 'POST',
			data : {
				boardnum : num,
				book_num : book_num,
			},
			success : function() {
				alert('성공했습니다.');
				$('#listView').show();
				$('#readData').hide();
				loadList();
			},
			error : function() {
				alert('실패했습니다.');
			}

		});
	}

	//글읽기 목록에서 을 눌렀을 경우 리스트로 돌아감
	function relist() {
		$('#listView').show();
		$('#readData').hide();
		$('#writeForm').hide();

		loadList();
	}

	//리스트에서 게시글을 클릭하여 정보가 나오는 페이지 설정
	function readB(boardnum) {

		$('#readData').show();
		var read = '';
		var num = boardnum;
		$
				.ajax({
					url : 'readB',
					type : 'POST',
					dataType : 'JSON',
					data : {
						boardnum : num
					},

					//success : readData,
					success : function(e) {
						read += '<table align="center">';
						read += '  <tr>';
						read += ' <td>';
						read += '  <table width="100%" cellpadding="0" cellspacing="0" border="0" >';

						read += '    <tr style="background:url(images/table_mid.gif) repeat-x; text-align:"center";>';
						read += '     <td width="5"><img src="images/table_left.gif" width="5" height="30" /></td>';
						read += '   <td style="text-align:center"; "font-weight:bold">'
								+ e.board_title + '</td>';
						read += '     <td width="5"><img src="images/table_right.gif" width="5" height="30" /></td>';
						read += '    </tr>';
						read += '   </table>';
						read += '  <table width="413">';
						read += '   <tr>';
						read += '    <td width="0">&nbsp;</td>';
						read += '     <td align="center" width="76">글번호</td>';
						read += '      <td width="319">' + e.boardnum + '</td>';
						read += '      <td width="0">&nbsp;</td>';
						read += '    </tr>';

						read += ' <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>';
						read += '  <tr>';
						read += '    <td width="0">&nbsp;</td>';
						read += '    <td align="center" width="76">이름</td>';
						read += '   <td width="319">' + e.m_id + '</td>';

						read += '  <td width="0">&nbsp;</td>';
						read += '  </tr>';
						read += '   <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>';
						read += '  <tr>';
						read += '    <td width="0">&nbsp;</td>';
						read += '   <td align="center" width="76">작성일</td>';
						read += '   <td width="319">' + e.inputdate + '</td>';
						read += '    <td width="0">&nbsp;</td>';
						read += '   </tr>';

						read += '  <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>';
						read += '             <tr>';
						read += '   <td width="0">&nbsp;</td>';
						read += '               <td width="399" colspan="2" height="200">'
								+ e.board_content + '</td>';
						read += '              </tr>';
						read += '   <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>';
						read += '  <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>';
						read += '  <tr align="center">';
						read += '    <td width="0">&nbsp;</td>';
						read += '   <td colspan="2" width="399">';
						read += '<input type=button class="btn-sm btn-primary" style="margin-top:5px; margin-right:10px"value="목록"  id="write"  onclick="return relist();">';
						read += '<input type=button class="btn-sm btn-primary" style="margin-top:5px; margin-right:10px"  value="수정" onclick="return updateB('
								+ e.boardnum + ')">';
						read += '<input type=button class="btn-sm btn-primary" style="margin-top:5px" value="삭제" onclick=" return deletedB('
								+ e.boardnum + ')">';
						read += '     <td width="0">&nbsp;</td>';
						read += '   </tr>';
						read += '  </table>';
						read += ' </td>';
						read += ' </tr>';
						read += '</table>';

						$('#readData').html(read);

					},
					error : function(listB) {
						alert('에러: ' + JSON.stringify(listB));
					}

				});
		//$('#dataCol').hide();
		$('#listView').hide();
	}

	function updateB(boardnum) {
		var num = boardnum;
		var book_num = document.getElementById("book_num").value;
		var upda = '';
		//$('#updateForm').show();
		$
				.ajax({
					url : 'readB',
					type : 'POST',
					data : {
						boardnum : num,
					},
					success : function(e) {
						$('#readData').hide();
						upda += ' <form id = "updateForm" align="center">';
						upda += ' <input type="hidden" name="book_num" value="'+book_num+'">';
						upda += ' <div id="bbsCreated">';
						upda += ' <div class="bbsCreated_bottomLine">';
						upda += ' <dl>';
						upda += ' <dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>';
						upda += ' <dd>';
						upda += ' <input type="text" value="'+e.board_title+'" readonly="readonly" id="board_title"  size="64" maxlength="100"  class="boxTF" style="border: 2px solid #5C84DC;"/>';

						upda += ' </dd>';
						upda += ' </dl>';
						upda += ' </div>';

						upda += ' <div id="bbsCreated_content">';
						upda += ' <dl>';
						upda += ' <dt>내&nbsp;&nbsp;&nbsp;&nbsp;용 </dt>';
						upda += ' <dd>';
						upda += ' <textarea id="update_board_content" cols="63" rows="10" class="boxTA"style="border: 2px solid #5C84DC;">'
								+ e.board_content + '</textarea>';
						upda += ' </dd>';
						upda += ' </dl>';
						upda += ' </div>';
						upda += ' <div id="bbsCreated_footer">';
						upda += ' <dl>';
						upda += ' <td>';
						upda += ' <dd>';
						upda += ' <div id="button">';
						upda += ' <input type="button" class="btn-sm btn-primary" style="margin-top:5px; margin-right:10px"  id="writeClick" onclick="return updateCom('
								+ e.boardnum + ');" value="수정">';
						upda += ' <input type="button" class="btn-sm btn-primary" style="margin-top:5px; id="cancle" onclick="return relist();" value="작성취소">';
						upda += ' </div>';
						upda += ' </dd>';
						upda += ' </dl>';
						upda += ' </table>';
						upda += ' </div>';
						upda += ' </form>';

						$('#updateForm').html(upda);
						loadList();
					},

					error : function() {
						alert('실패');
					}

				});

	}

	function updateCom(boardnum) {
		var content = $('#update_board_content').val();
		var book_num = document.getElementById("book_num").value;
		$.ajax({
			url : 'updateB',
			type : 'POST',
			data : {
				book_num : book_num,
				boardnum : boardnum,
				content : content
			},
			success : function() {
				alert('성공했습니다.');
				$('#listView').show();
				$('#updateForm').hide();
				loadList();
			},
			error : function() {
				alert('실패');
			}

		});
	}

	function getSharedCard() {
		console.log("image");
		var booknums = document.getElementById("book_num").value;
		
		$.ajax({
			method : "post",
			url : "getRoomCard",
			data : {
				"book_num" : booknums
			},
			success : function(res) {
				console.log("SUCCESS");
				sharedCard(res);
			},
			error : function() {
				console.log("ERROR");
			}
		});
	}

	function sharedCard(res) {
		var book_num = document.getElementById("book_num").value;
		var book_name = document.getElementById("book_name").value;
		var div = document.getElementById("tabs-1-1");
		var htmlText = "";
		for (var i = 0; i < res.length; i++) {
			
			
			htmlText += "<a href='sharedCard?cardnum=" + res[i].cardNum
					+ "&book_num=" + book_num
					+ "&book_name="+ book_name
					+ "'><img src=downloadImage?card=" + res[i].imagePath
					+ " alt='' width='400' height='200' style='margin:30px; width: 300px; height: 150px; border: 1px outset black; border-radius: 5px;' /></a>"; 
			//+"<input type='button' class='btn btn-primary btn-sm' value='이름넣기'>";
		
			/* htmlText += "<div class='cell-xs-6 cell-sm-4 cell-md-4' style='margin-top:20px;'><div class='thumbnail-variant-2-wrap'><div class='thumbnail-variant-2-wrap'> <a href='sharedCard?cardnum="
				+ res[i].cardNum+"&book_num=" + book_num+"&book_name="+ book_name
				+ "'> <div class='thumbnail thumbnail-variant-2'> <!-- <figure class='thumbnail-image'> --> <img src='downloadImage?card="
				+ res[i].imagePath
				+ "' alt='' style='width: 300px; height: 150px; border: 1px outset black; border-radius: 5px;' />" 
				+ "<div class='thumbnail-caption' style='margin-top:10px;opacity:0.85;border-radius: 30px;'> <p class='text-header'>"
				+ res[i].company
				+ '&nbsp;'
				+ res[i].depart
				+ "</p> <div class='divider divider-md'></div><p class='text-caption'>"
				+ res[i].position
				+ '&nbsp;'
				+ res[i].name
				+ "</p></div></div></a></div></div></div>"; */
		
		}
		div.innerHTML = htmlText;
	}

	//탈퇴
	$("#withdrawalForm").on('show.bs.modal', function(event) {
		var button = $(event.relatedTarget)
		var modal = $(this)
		modal.find('.modal-body input').val(recipient)
	})
</script>
</head>
<body style="">
	<!-- 탈퇴 modal 시작 -->
   <div class="modal fade" id="withdrawalForm" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <form method="post" action="leaveRoom">
                  <button type="button" class="close" data-dismiss="modal"
                     aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
                  <h5 class="modal-title">탈퇴하시겠습니까?</h5>
                  <br>
                  <h6>
                     매니저가 탈퇴할 경우 공유 명함첩의 모든 정보가 삭제됩니다. <br>공유 명함첩 매니저:
                     ${book_master}
                  </h6>

                  <input type="hidden" value="${book_num}" id="book_num"
                     name="book_num"> <input type="hidden"
                     value="${book_master}" id="book_master" name="book_master">
                  <input type="button" class="btn btn-primary-outline btn-shadow"
                     data-dismiss="modal" value="취소"> <input type="submit"
                     class="btn btn-primary btn-shadow" id="writeMemo" value="확인">
               </form>
            </div>
         </div>
      </div>
   </div>
   <!-- 탈퇴 modal 끝 -->


	<div class="page">
		<%@include file="../modules/header.jsp"%>
		<main class="page-content">
		<section
			class="section-bottom-30 section-top-60 section-sm-bottom-40 section-sm-top-90">
			<div class="shell">
				<div class="range range-sm-center">
					<div class="cell-xs-12 text-center">
						<h3>${book_name} 공유명함첩</h3>
						<input type="hidden" value="${book_num}" id="book_num"
							name="book_num">
						<input type="hidden" value="${book_name}" id="book_name" name="book_name">	
					</div>
					<div class="cell-lg-25 offset-top-50">
						<div id="tabs-1"
							class="tabs-custom tabs-horizontal tabs-corporate">
							<ul class="nav nav-tabs">
								<li class="active"><a id="tab1" href="#tabs-1-1"
									data-toggle="tab">명함첩</a></li>
								<li><a id="tab2" href="#tabs-1-2" data-toggle="tab">게시판</a></li>
								<li><a id="tab3" href="#tabs-1-3" data-toggle="tab">초대하기</a></li>
								<li><a id="tab4" href="#tabs-1-4" data-toggle="tab">구성원</a></li>
								<li><a href="#tabs-1-5" data-toggle="tab">탈퇴</a></li>
							</ul>
							<div class="tab-content text-secondary">
								
								
								<div id="tabs-1-1" class="tab-pane fade in active" style="text-align: center;">
									<!-- <img src="" alt="" width="400" height="200" /> -->
								</div>
								


								<div id="tabs-1-2" class="tab-pane fade">
						
						<!-- 리스트 출력 -->
						<div class="range offset-top-40" id="slist" style="margin-top:-20px;margin-bottom: 50px;">
						
						</div>
						<!-- 리스트 출력 끝 -->
						
									<div id="listView">

										<table width="100%" cellpadding="0" cellspacing="0" border="0">
											<tr height="5">
												<td width="5"></td>

											</tr>
											<tr
												style="background: url('images/table_mid.gif') repeat-x; text-align: center;">
												<td width="7"><img src="images/table_left.gif"
													width="5" height="30" /></td>
												<td width="73">번호</td>
												<td width="379">제목</td>
												<td width="73">작성자</td>
												<td width="164">작성일</td>
												<td width="58">조회수</td>
												<td width="7"><img src="images/table_right.gif"
													width="5" height="30" /></td>
											</tr>
											<table width="100%" cellpadding="0" cellspacing="0"	border="0">
												<tr height="5">
													<td width="5"></td>
												</tr>
												<tr style="text-align: center;">
													<td><div id="dataCol"></div></td>
												<tr height="5">
													<td width="5"></td>
												</tr>

											</table>

											<table width="100%" cellpadding="0" cellspacing="0"
												border="0">
												<tr height="1" bgcolor="#5C84DC">
													<td colspan="6" width="752"></td>
												</tr>
											</table>

										</table>

										<table width="100%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td colspan="10" height="5"></td>
											</tr>
											<tr align="center">
												<!--   <td><button class="btn btn-primary-outline btn-shadow" id="write"
														onclick="check();">글쓰기</button></td> -->
												<td><input type="button" class="btn-sm btn-primary"
													id="write" onclick="check();" value="글쓰기"></td>
											</tr>


										</table>
									</div>

									<!-- 음...글정보 보는 리스트랑 글쓰기 페이지 보여질떄 쓰이는 div영역 -->
									<div id="writeForm"></div>
									<div id="readData"></div>
									<div id="updateForm"></div>
									<!-- ↑여기까지 -->
								</div>
								<div id="tabs-1-3" class="tab-pane fade">
									<form id="inviteForm" action="inviteList" method="get">
										<select name="searchTitle" id="searchTitle">
											<option value="m_id">아이디로 검색하기</option>
											<option value="m_name">이름으로 검색하기</option>
										</select> <input type="text" id="searchText" value="${searchText}">
										<input type="button" class="btn btn-info btn-xs" value="검색"
											id="searchInvite">
									</form>
									<div id="inviteListResult"></div>

								</div>
								<div id="tabs-1-4" class="tab-pane fade">
									<div id="memberList"></div>
								</div>
								<div id="tabs-1-5" class="tab-pane fade">
									<button type="button" class="withdrawalbutton"
										style="vertical-align: middle" data-toggle="modal"
										data-target="#withdrawalForm" data-whatever="@mdo"
										id="deleteRoom">
										<span>탈퇴하기</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</section>

		</main>
		</div>

		<%@include file="../modules/footer.jsp"%>
		<script src="js/core.min.js"></script>
		<script src="js/script.js"></script>
</body>
</html>