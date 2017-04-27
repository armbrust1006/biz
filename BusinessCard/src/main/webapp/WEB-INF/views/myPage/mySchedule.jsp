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
<script src='js/jquery-3.1.1.min.js'></script>
<script src='js/jquery.min.js'></script>
<script src='js/moment.min.js'></script>
<script>
$(document).ready(function() {
	init();
	$('#add').on("click", add);
});	
	
	function init() {
		$.ajax({
			type : "get",
			url : "noteList",
			data : {'m_id' : "${sessionScope.m_id}"},
			success : output
		});
	};

 	
	function output(eventData){
	$('#calendar').fullCalendar({
			header : {
				left : 'prev, next today',
				center : 'title',
				right : 'month,basicWeek,basicDay'
			},
			defaultDate : '2017-04-28',
			navLinks : true, // can click day/week names to navigate views
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			events : eventData,
			eventClick: function(calEvent, jsEvent, view) {
				var title = calEvent.title;
				var strDate = moment(calEvent.start).format('YYYY-MM-DD');
		        $.ajax({
		        	type : "POST",
		        	url : "getCard",
		        	data : {'start' : strDate, 'title' : title},
		        	success : function(resp){
		        		openModel();
		        	}
		        });
		        // change the border color just for fun
		        $(this).css('background-color', '#1a75ff');
		    },
			dayClick: function(date, view) {
		        // change the day's background color just for fun
				$(this).css('background-color', '#c2f0f0');
				openModal();
			}
		});
	};
	
	function openModal(){
		$('#myModal').modal({
	    	backdrop : true,
	    	keyboard : true,
	    	show : true
		});
	}
	
	function add() {
		alert('작동점검');
		var sDate = document.getElementById('start').value;
		var eDate = document.getElementById('end').value;
		var message = document.getElementById('title').value;
		var addData = {
				"m_id" : "${sessionScope.m_id}",
				"start" : sDate,
				"end" : eDate,
				"title": message
		};	
		if (sDate.length==0 || eDate.length==0 || message.length==0) {
			alert('일정과 메세지를 입력하세요');
		}
		/* if (sDate < eDate) {
			alert('시작일은 반드시 종료일보다 앞선 날짜여야 합니다.');
			return false;
		} */
		alert("check");
		$.ajax({
			type : "post",
			url : "addNote",
			data : addData,
			success : function(resp) {
				if (resp == 0) {
					init();
					alert("일정을 등록 했습니다.");
					$("#start").val("");
					$("#end").val("");
					$("#title").val("");
				} else {
					alert("일정 등록 실패");
				}
			},
			error : function() {
				alert("error");
			}
		});
	}
</script>
</head>
<body style="">

	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content" style="margin-top: 10%">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">상세 정보 확인</h5>
				</div>
				<div class="modal-body">
 					<img src="downloadImage?card=${myCard.imagePath}" alt="" width="800" height="400" />
				</div>
				<div class="modal-footer">
					<div class="group-lg group-middle group-sm offset-top-30">
						<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
					</div>
				</div>
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
          		<div class="cell-sm-12 cell-md-9">
            		<div id="calendar"></div>
          		</div>
         
         		<!-- 입력 폼 -->
        	 	<div class="cell-sm-12 cell-md-3 offset-top-50 offset-md-top-20">
        	 	<!-- data-form-output="form-output-global" data-form-type="contact" -->
        	 	<div class="item">
        	 	</div>
        	 	<h5>새 일정 입력</h5>
            <form class="form-modern offset-top-30" > 
                <div class="cell-xs-4 offset-top-30 offset-xs-top-30 offset-sm-top-50">
               
				<div class="form-group">
					<span class="input-group-addon">
                    <input type="text" name="start" id="start" data-constraints="@Required" data-time-picker="date" class="form-control">
                    <label for="start" class="form-label">from</label>
					</span>
                  </div>
                  <div class="form-group">
                    <span class="input-group-addon">
                    <input type="text" name="end" id="end" data-constraints="@Required" data-time-picker="date" class="form-control">
                    <label for="end" class="form-label">to</label>
                    </span>
                  </div>
                 <!--  <div class="form-group">
                  <span class="input-group-addon">
                    <input id="feedback-time" type="text" name="time" data-constraints="@Required" data-time-picker="time" class="form-control">
                    <label for="feedback-time" class="form-label">Time Interval</label>
                  </span>
                  </div> -->
                 <div class="form-group">
	                <textarea name="title" id="title" data-constraints="@Required" class="form-control"></textarea>
    	            <label for="title" class="form-label">Message</label> 
                 </div>
                  <div class="form-group">
                  <input type="hidden" value="${sessionScope.m_id}" name="m_id"/>
                  <button id="add" class="btn btn-sm btn-primary btn-block">Send</button>
                  <button type="reset" class="btn btn-sm btn-silver-outline btn-block">Reset</button>
                  </div>
                </div>
                </div>
                <!-- type="submit" -->
            </form>
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
	<script src="js/fullcalendar.min.js"></script>
</body>
</html>