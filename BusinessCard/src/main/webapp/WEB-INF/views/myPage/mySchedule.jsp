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
});	
	
	function init() {
		$.ajax({
			type : "get",
			url : "noteList",
			data : {'m_id' : "${sessionScope.m_id}"},
			success : noteResult
		});
	};

	function noteResult(resp) {
		var eventData=[];
		var result =JSON.stringify(resp);
		alert(result);
		for (var i=0; i<result.length; i++){
			var note = resp[i].note.val();
			alert(note);
			/* var strDate = moment(resp[i].startdate).format('YYYY-MM-DD');
			var edDate = moment(resp[i].enddate).format('YYYY-MM-DD'); */
			alert(strDate);
			eventData.push({
					title : note,
					start : strDate,
					end : edDate
			});
/* 		alert(JSON.stringify(eventData[i])); */
			$('#calendar').fullCalendar({
				header : {
					left : 'prev,next today',
					center : 'title',
					right : 'month,basicWeek,basicDay'
				},
				defaultDate : '2017-04-14',
				navLinks : true, // can click day/week names to navigate views
				editable : true,
				eventLimit : true, // allow "more" link when too many events
				events : eventData
			});
		}
	};
	
	/* function output(eventData){
		alert(eventData);
		var note = resp.title.toString();
		var start = resp.strDate.toString();
		var end = resp.edDate.toString();
	$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,basicWeek,basicDay'
			},
			defaultDate : '2017-04-14',
			navLinks : true, // can click day/week names to navigate views
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			events : eventData
			
		});
	}; */
</script>
</head>
<body style="">
<div class="page">
<%@include file="../modules/header.jsp"%>
	<main class="page-content">
		<section class="section-60 section-sm-75 section-lg-8">
			<div class="shell">
				<div class="range">
					<!-- 왼쪽 영역 -->
					<div class="cell-md-8 cell-lg-8">
						<!-- <div class="offset-top-20 offset-sm-top-40">
        		<div id = "calendarBody" class="cell-xs-9"> -->
						<div id="calendar"></div>
						<!--  	 	</div>
        	</div> -->
					</div>
				</div>
			</div>
		</section>

		<section class="section-66 section-sm-90 section-lg-4">
			<div class="shell">
				<!-- 오른쪽 영역 -->
				<div class="cell-md-4 cell-lg-4 offset-top-50 offset-md-top-0">
					<div class="inset-md-left-15 inset-md-right-10">
						<div class="range">
							<!-- <div class="cell-sm-6 cell-md-6"> -->

							<!-- 실제 폼 영역 -->
							<h4>새 일정 입력</h4>
							<form data-form-output="form-output-global" data-form-type="contact" class="form-modern">
								<input type="hidden" name="m_id" id="m_id" value="${sessionScope.m_id}">
								<div class="range range-7">
									<div class="cell-sm-3 offset-top-30">
										<div class="form-group">
											<input id="startDate" type="text" name="startDate"
												data-constraints="@Required" data-time-picker="date"
												class="form-control"> <label for="startDate"
												class="form-label">StartDate</label>
										</div>
									</div>
									<div class="cell-sm-3 offset-top-30">
										<div class="form-group">
											<input id="endDate" type="text" name="endDate"
												data-constraints="@Required" data-time-picker="date"
												class="form-control"> <label for="endDate"
												class="form-label">EndDate</label>
										</div>
									</div>
									<div class="cell-xs-6 offset-top-30">
										<div class="form-group">
											<div class="textarea-lined-wrap">
												<textarea id="note" name="note"
													data-constraints="@Required" class="form-control"></textarea>
												<label for="note" class="form-label">Message</label>
											</div>
										</div>
									</div>
									<div
										class="cell-xs-3 offset-top-30 offset-xs-top-30 offset-sm-top-50">
										<input type="button" class="btn btn-primary btn-block"
											id="Save" value="Save" />
									</div>
									<div
										class="cell-xs-3 offset-top-22 offset-xs-top-30 offset-sm-top-50">
										<button type="reset" class="btn btn-silver-outline btn-block">Reset</button>
									</div>
								</div>
							</form>
							<!-- 폼 영역 끝 -->
							<!-- </div> -->
						</div>
					</div>
				</div>
				<!-- 오른쪽 영역 끝 -->
			</div>
		</section>




		<section class="section-66 section-sm-90 bg-gray-light">
			<div class="shell">
				<h3>Your Career Starts Here</h3>
				<p style="max-width: 440px;">
					Can't find the job you want? Send your resume to <a
						class="__cf_email__" href=""
						data-cfemail="93fafdf5fcd3f7f6fefcfffafdf8bdfce1f4">philip@gmail.com</a>,
					and we'll contact you when a new position opens.
				</p>
				<div class="range">
					<div class="cell-sm-6">
						<a href="#" class="block-vacation">
							<h5>Senior Software Developer</h5>
							<div class="block-meta">
								<ul class="list-objects-inline">
									<li><span
										class="icon icon-xs-smaller icon-primary material-icons-location_on"></span><span>London</span></li>
									<li><span
										class="icon icon-xs-smaller icon-primary material-icons-av_timer"></span><span>Full
											Time</span></li>
									<li><span
										class="icon icon-xs-smaller icon-primary mdi mdi-calendar"></span>
										<time datetime="2016-01-01">6 hours ago</time></li>
								</ul>
							</div>
						</a>
					</div>
					<div class="cell-sm-6 offset-top-30 offset-sm-top-0">
						<a href="#" class="block-vacation">
							<h5>Digital Content Designer</h5>
							<div class="block-meta">
								<ul class="list-objects-inline">
									<li><span
										class="icon icon-xs-smaller icon-primary material-icons-location_on"></span><span>Athlanta</span></li>
									<li><span
										class="icon icon-xs-smaller icon-primary material-icons-av_timer"></span><span>Freelance</span></li>
									<li><span
										class="icon icon-xs-smaller icon-primary mdi mdi-calendar"></span>
										<time datetime="2016-01-01">3 day ago</time></li>
								</ul>
							</div>
						</a>
					</div>
					<div class="cell-sm-6 offset-top-30">
						<a href="#" class="block-vacation">
							<h5>Lead Product Designer</h5>
							<div class="block-meta">
								<ul class="list-objects-inline">
									<li><span
										class="icon icon-xs-smaller icon-primary material-icons-location_on"></span><span>Oakland</span></li>
									<li><span
										class="icon icon-xs-smaller icon-primary material-icons-av_timer"></span><span>Full
											Time</span></li>
									<li><span
										class="icon icon-xs-smaller icon-primary mdi mdi-calendar"></span>
										<time datetime="2016-01-01">4 days ago</time></li>
								</ul>
							</div>
						</a>
					</div>
					<div class="cell-sm-6 offset-top-30">
						<a href="#" class="block-vacation">
							<h5>Motion Designer</h5>
							<div class="block-meta">
								<ul class="list-objects-inline">
									<li><span
										class="icon icon-xs-smaller icon-primary material-icons-location_on"></span><span>New
											York</span></li>
									<li><span
										class="icon icon-xs-smaller icon-primary material-icons-av_timer"></span><span>Full
											Time</span></li>
									<li><span
										class="icon icon-xs-smaller icon-primary mdi mdi-calendar"></span>
										<time datetime="2016-01-01">week ago</time></li>
								</ul>
							</div>
						</a>
					</div>
					<div class="cell-sm-6 offset-top-30">
						<a href="#" class="block-vacation">
							<h5>Jr. Graphic Designer</h5>
							<div class="block-meta">
								<ul class="list-objects-inline">
									<li><span
										class="icon icon-xs-smaller icon-primary material-icons-location_on"></span><span>Bristol</span></li>
									<li><span
										class="icon icon-xs-smaller icon-primary material-icons-av_timer"></span><span>Freelance</span></li>
									<li><span
										class="icon icon-xs-smaller icon-primary mdi mdi-calendar"></span>
										<time datetime="2016-01-01">month ago</time></li>
								</ul>
							</div>
						</a>
					</div>
					<div class="cell-sm-6 offset-top-30">
						<a href="#" class="block-vacation">
							<h5>Marketing Coordinator</h5>
							<div class="block-meta">
								<ul class="list-objects-inline">
									<li><span
										class="icon icon-xs-smaller icon-primary material-icons-location_on"></span><span>Tampa</span></li>
									<li><span
										class="icon icon-xs-smaller icon-primary material-icons-av_timer"></span><span>Full
											Time</span></li>
									<li><span
										class="icon icon-xs-smaller icon-primary mdi mdi-calendar"></span>
										<time datetime="2016-01-01">May 12, 2016</time></li>
								</ul>
							</div>
						</a>
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