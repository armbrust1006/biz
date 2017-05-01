<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" class="wide wow-animation">
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
<link rel="stylesheet" href="css/fullcalendar.css">
<style>
#calendarBody {
	margin: 40px 10px;
	padding: 40px;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
	background-color: #ffffff;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>
<script src='js/jquery-1.8.3.js'></script>
<script src='js/jquery.min.js'></script>
<script src='js/moment.min.js'></script>
<script src="js/script.js"></script>
<script>
	var myList = new Array();
	var yourList = new Array();
	$(document).ready(function() {
		init();
		makeAnApp();
		$('#noteDel').on('click', delmyMemo);
		$('#yourNoteDel').on('click', delyourMemo);
	}); //ready 끝	

	var endlist = new Array();
	var tempYear;
	var tempMonth;
	var tempDay;
	var temp;
	function init() {
		console.log("initiating");
		$.ajax({
					type : "get",
					url : "noteList",
					data : {
						"m_id" : "${sessionScope.m_id}"
					},
					success : function(data) {
						list = data.list;
						if (data == null) {
							showCal();
						}
						if (data != null) {
							for (var i = 0; i < data.length; i++) {
								var chk = data[i].chk;
								if (chk == "1") {
									if (data[i].endDate != null) {
										tempYear = data[i].endDate.substr(0, 4);
										tempMonth = data[i].endDate
												.substr(5, 2);
										tempDay = parseInt(data[i].endDate
												.substr(8, 2)) + 1;
										temp = tempYear + '-' + tempMonth + '-'
												+ tempDay;
									}
									var mine = {
										notenum : data[i].notenum,
										id : "${sessionScope.m_id}",
										cardnum : data[i].cardnum,
										title : data[i].title,
										start : data[i].startDate,
										end : temp,
										inputDate : data[i].inputdate,
										editable : true,
										color : '#0066ff',
										textColor : 'white'
									};
									myList.push(mine);
								}
								;
								if (chk == "0") {
									if (data[i].endDate != null) {
										tempYear = data[i].endDate.substr(0, 4);
										tempMonth = data[i].endDate
												.substr(5, 2);
										tempDay = parseInt(data[i].endDate
												.substr(8, 2)) + 1;
										if (tempDay < 10) {
											tempDay = 0 + String(tempDay);
										}
										temp = tempYear + '-' + tempMonth + '-'
												+ tempDay;
									}
									var yours = {
										notenum : data[i].notenum,											
										id : data[i].m_id,
										cardnum : data[i].cardnum,
										start : data[i].startDate,
										end : temp,
										inputDate : data[i].inputDate,
										title : data[i].title,
										content : data[i].content,
										editable : true,
										color : '#ff5050',
										textColor : 'white'
									};
									yourList.push(yours);
								}
								; //if==0 끝
							}//for문 끝
							showCal();
						}//if문 list 확인하는 끝
					}, //success 끝
					error : function() {
						alert("일정 목록을 불러오지 못했습니다.");
					}
				}); // 리스트 담는 ajax 끝

	};

	/**
	 * 전체 리스트용 달력
	 */
	function showCal() {
		console.log("show cal started");
		$('#calendar').fullCalendar({
			header : {
				left : 'prev, next today',
				center : 'title',
				right : 'month,basicWeek,basicDay'
			},
			dayClick : function(date, view) {
				// change the day's background color just for fun
				/* $(this).css('background-color', '#c2f0f0'); */
				$('#startDate').val('');
				$('#endDate').val('');
				$('#title').val('');
				$('#startDate').val(date.format());
				addModal();
				return;
			},
			defaultDate : temp,
			navLinks : true, // can click day/week names to navigate views
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			eventSources : [ myList, yourList ],
			eventClick : function(calEvent, jsEvent, view) {
				var day = calEvent.start;
				alert(day);
				var chk = calEvent.cardnum;
				var line="";
				if (chk != 0) {
					$.ajax({
						type : "POST",
						url : "getCard",
						data : {
							"cardnum" : chk
						},
						success : function(resp) {
							if (resp!=0) {
								$('#yourInputDate').val(calEvent.inputDate);
								$('#yourStartDate').val(calEvent.start);
								$('#yourEndDate').val(calEvent.end);
								line += "<img src='downloadImage?card="+resp.imagePath+"' alt='' width='800' height='400' />";
								line += "<span><label>내용</label></sapn><textarea name='yourContent' id='yourContent' data-constraints='@Required' class='form-control'";
								line += "placeholder='Message' style='border:1px'>"+calEvent.content+"</textarea>";
								line += "<input type='hidden' value='"+calEvent.notenum+"' id='delyourN' />";
								$('#inputLines').html(line);
								yourModal();
								
							} else {
								alert("먼가 이상해");
							}
						}
					});
				} else if(chk==0) {
					$('#inputDate').val(calEvent.inputDate);
					$('#startDate').val(calEvent.start);
					$('#endDate').val(calEvent.end);
					$('#resultTitle').val(calEvent.title);
					line += "<span><label>내용</label></sapn><textarea name='myContent' id='myContent' data-constraints='@Required' class='form-control'";
					line += "placeholder='Message' style='border:1px'>"+calEvent.content+"</textarea>";
					line += "<input type='hidden' value='"+calEvent.notenum+"' id='delmyN' />";
					$('#innerHidden').html(line);
					myModal();
				}

			},
			eventDrop : function(event, delta, revertFunc) {

				alert(event.title + " was dropped on " + event.start.format());
				if (!confirm("Are you sure about this change?")) {
					revertFunc();
				}

			}
		});

		console.log("show cal ended");
	};//showCal 끝

	
	
	/**
	 * 새 일정 입력 메서드
	 */
	function makeAnApp() {
		$('#confirm').on('click', function() {
			alert("hi");
			var sDate = document.getElementById('startDate').value;
			var eDate = document.getElementById('endDate').value;
			var title = document.getElementById('title').value;
			var content = document.getElementById('content').value;
			var addData = {
				"m_id" : "${sessionScope.m_id}",
				"startDate" : sDate,
				"endDate" : eDate,
				"title" : title,
				"content" : content,
				"chk" : "1"
			};
			if (sDate.length == 0 || eDate.length == 0 || title.length == 0) {
				alert('일정과 제목을 확인하세요');
				return false;
			}

			$.ajax({
				type : "post",
				url : "addNote",
				data : addData,
				success : function(resp) {
					if (resp == 1) {
						/* init(); */
						location.reload();
					} else {
						alert("일정 등록 실패");
						return '0';
					}
				},
				error : function() {
					alert("error");
				}
			});
		});//confirm 버튼 on click 끝

	}//function 끝

	function delmyMemo() {
		var chk = document.getElementById('delmyN').value;
		alert(chk);
		$.ajax({
				type : 'POST',
				url : 'delCardNote',
				data : {
					"notenum" : chk,
				},
				success : function(resp) {
					if (resp == 1) {
						location.reload();
					} else {
						alert('컨트롤러 다녀옴!');
					}
				}
			});
	};
	
	function delyourMemo() {
		var chk = document.getElementById('delyourN').value;
		alert(chk);
		$.ajax({
				type : 'POST',
				url : 'delCardNote',
				data : {
					"notenum" : chk
				},
				success : function(resp) {
					if (resp == 1) {
						location.reload();
					} else {
						alert('컨트롤러 다녀옴!');
					}
				}
			});
	};

	function addModal() {
		$('#addSchedule').modal({
			backdrop : true,
			keyboard : true,
			show : true
		});
	};

	function myModal() {
		$('#myModal').modal({
			backdrop : true,
			keyboard : true,
			show : true
		});
	};

	function yourModal() {
		$('#yourModal').modal({
			backdrop : true,
			keyboard : true,
			show : true
		});
	};
</script>
</head>
<body style="">

	<!-- 일정 입력 모달 시작 -->
	<div class="modal fade bs-example-modal-sm" id="addSchedule"
		tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">새 일정 입력</h5>
				</div>
				<form>
					<div class="modal-body">
						<div class="cell-xs-4">
							<div class="form-group">
								<label>일정 시작 일</label> <input type="date" id="startDate">
							</div>
							<div class="form-group">
								<label>일정 종료 일</label> <input type="date" id="endDate">
							</div>
							<div class="form-group" style="margin: 20px; text-align: left">
								<label>제목</label> <input type="text" name="title" id="title" style="width: 100px" />
								<textarea name="content" id="content" data-constraints="@Required" class="form-control"
									placeholder="Message"></textarea>
							</div>
						</div>
						<!-- cell 끝 -->
					</div>
					<!-- modal-body 끝 -->
					<div class="modal-footer">
						<div class="group-lg group-middle group-sm offset-top-30">
							<button type="button" class="btn btn-primary btn-sm"
								data-dismiss="modal" id="confirm">확인</button>
							<button type="button" class="btn btn-default btn-sm"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 일정 입력 모달 끝 -->

	<!-- 내 입력 메모 -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content" style="margin-top: 10%">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">일정 확인</h5>
				</div>
				<form class="form-modern offset-top-30">
					<div class="modal-body">
						<div
							class="cell-xs-4 offset-top-30 offset-xs-top-30 offset-sm-top-50">
							<div class="form-group">
								<label>작성일</label> <input type="text" id="inputDate" />
							</div>
							<div class="form-group">
								<label>일정 시작일</label> <input type="text" id="startDate" />
								<label>일정 종료일</label> <input type="text" id="endDate" />
							</div>
							<div class="form-group">
								<label>제목</label> <input type="text" id="resultTitle" />
								<div id="innerHidden"></div>
							</div>
						</div>
						<!-- div cell 끝 -->
					</div>
					<!-- modal-body 끝 -->

					<div class="modal-footer">
						<div class="group-lg group-middle group-sm offset-top-30">
							<button type="button" class="btn btn-primary btn-sm"
								id="noteModify">내용수정</button>
							<button type="button" class="btn btn-default btn-sm" id="noteDel">일정삭제</button>
						</div>
					</div>
				</form>
			</div>
			<!-- modal-content -->
		</div>
		<!-- modal-dialog -->
	</div>
	<!-- modal -->
	
	<!-- 타인명함 입력 메모 -->
	<div class="modal fade" id="yourModal">
		<div class="modal-dialog">
			<div class="modal-content" style="margin-top: 10%">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">일정 확인</h5>
				</div>
				<form class="form-modern offset-top-30">
					<div class="modal-body">
						<div class="cell-xs-4 offset-top-30 offset-xs-top-30 offset-sm-top-50">
							<div class="form-group">
								<label>작성일</label> <input type="text" id="yourInputDate"/>
							</div>
							<div class="form-group">
								<label>일정 시작일</label> <input type="text" id="yourStartDate"/>
								<label>일정 종료일</label> <input type="text" id="yourEndDate"/>
							</div>
						<div id="inputLines">
							<!-- 여기 서버 불러온 내용 입력 -->
						</div>
						</div>
						<!-- div cell 끝 -->
					</div>
					<!-- modal-body 끝 -->

					<div class="modal-footer">
						<div class="group-lg group-middle group-sm offset-top-30">
							<button type="button" class="btn btn-primary btn-sm"
								id="noteModify">내용수정</button>
							<button type="button" class="btn btn-default btn-sm" id="yourNoteDel">일정삭제</button>
						</div>
					</div>
				</form>
			</div>
			<!-- modal-content -->
		</div>
		<!-- modal-dialog -->
	</div>
	<!-- modal -->

	<div class="page">
		<%@include file="../modules/header.jsp"%>
		<main class="page-content">
		<section class="section-50 section-sm-top-75 section-lg-top-70">
			<div class="shell">
				<div class="range range-sm-center">

					<!-- 달력 -->
					<div class="cell-sm-12 cell-md-12 cell-lg-12">
						<div id="calendar"></div>
					</div>
				</div>
			</div>
		</section>
		</main>
		<%@include file="../modules/footer.jsp"%>
	</div>
	<%@include file="../modules/form-output-global.jsp"%>
	<script src="js/core.min.js"></script>
	<script src="js/fullcalendar.min.js"></script>
</body>
</html>