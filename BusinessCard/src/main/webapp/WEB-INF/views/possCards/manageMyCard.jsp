<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<style type="text/css">
#container{
			width:100%;*zoom:1;text-align:center;
			} 
#container:after {
				content:" "; 
				display:block; 
				clear:both;
				} 
#left{
		float:left;
		width:100px;
		} 
#right{
		float:right;
		width:100px;
		} 
#center{
		margin:0 auto;
		width:100px;
		display:inline-block;
} 
     #map { height: 400px; width:400px; }
</style> 
<script src="js/jquery-3.1.1.min.js"></script>
<script>
 $('#exampleModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  // Extract info from data-* attributes
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  modal.find('.modal-body input').val(recipient)
}) 
</script>
</head>
<body style="">
<div class="page">
<%@include file="../modules/header.jsp" %>
	<!-- <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">New message</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="message-text" class="control-label">Message:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send message</button>
      </div>
    </div>
  </div>
</div> -->
              
<main class="page-content">
     <section class="section-50 section-sm-75 section-lg-bottom-120">
      <div class="shell">
        <div class="range range-lg-center">
        </div>
       <div class="cell-lg-12">
            <div class="product product-single">
             <div class="product-main">
              
                <div class="product-slider">
                  <div data-items="1" data-stage-padding="0" data-loop="true" data-margin="30" data-mouse-drag="true" data-dots="true" data-animation-in="fadeIn" data-animation-out="fadeOut" class="owl-carousel owl-carousel-bottom owl-style-minimal">
                    <div class="item"><img src="images/cards/1.png" alt="" width="800" height="400"/> </div>
                    <div class="item"><img src="images/cards/2.png" alt="" width="800" height="400"/> </div>
                    <div class="item"><img src="images/cards/3.png" alt="" width="800" height="400"/> </div>
                  </div>
                	<div> 
              		<!--지도시작  -->
                	<div id="map" style="width:410px;height:300px;"></div>
                	<script type="text/javascript" src="https://apis.daum.net/maps/maps3.js?apikey=c7916e21c55de32442914f1125961a85&libraries=services"></script>
					<script>
					
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = {
					        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };  
					
					// 지도를 생성합니다    
					var map = new daum.maps.Map(mapContainer, mapOption); 
					
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new daum.maps.services.Geocoder();
					
					// 주소로 좌표를 검색합니다
					geocoder.addr2coord("명일동", function(status, result) {
					
					    // 정상적으로 검색이 완료됐으면 
					     if (status === daum.maps.services.Status.OK) {
					
					        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
					
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new daum.maps.Marker({
					            map: map,
					            position: coords
					        });
					
					        // 인포윈도우로 장소에 대한 설명을 표시합니다
					        var infowindow = new daum.maps.InfoWindow({
					            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
					        });
					        infowindow.open(map, marker);
					
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
					    } 
					});
					</script>
                	<!--지도끝  -->
					<div>
					</div>
                		<!-- 메모시작 -->
                		<script>
							function insertMemo(){
								alert("ddmd");
							}
						</script>
                			<!--스크롤 div  -->
                			<div id="scrollMemo" style="overflow: auto;">
                				<!--메모목록 -->
                				<div id="memoList">

                				</div>
                			</div>
                		<!-- 메모끝 -->
                	</div>
               <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">메모입력</button>
               
               
               <!--오른쪽 시작 -->
                </div>
                <div class="product-body">
                  <p class="product-brand"></p>
                  <h4 class="product-header">${sessionScope.m_id}</h4>
                  <div class="product-rating">
                    <span class="text-light"></span> </div>
                  <div id="accordionOne" role="tablist" aria-multiselectable="true" class="panel-group panel-group-custom panel-group-light product-accordion">
                    <div class="panel panel-custom panel-light">
                      <div id="accordionOneHeading2" role="tab" class="panel-heading">
                        <div class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordionOne" href="#accordionOneCollapse2" aria-controls="accordionOneCollapse2" class="collapsed">
                        	<span class="icon icon-md icon-primary fa-tablet"></span></span>&nbsp;휴대전화<br>
                        	${detailCard.mobile }
                          <div class="panel-arrow"></div>
                          </a> </div>
                      </div>
                      <div id="accordionOneCollapse2" role="tabpanel" aria-labelledby="accordionOneHeading2" class="panel-collapse collapse">
                        <div class="panel-body">
                        	휴대전화수정
                        </div>
                      </div>
                    </div>
                  <div class="panel panel-custom panel-light">
                      <div id="accordionOneHeading3" role="tab" class="panel-heading">
                        <div class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordionOne" href="#accordionOneCollapse3" aria-controls="accordionOneCollapse3" class="collapsed">
                          	<span class="icon icon-md icon-primary fa-envelope-o"></span>&nbsp;&nbsp;&nbsp;이메일<br>
                          	${detailCard.email }
                          <div class="panel-arrow"></div>
                          </a> </div>
                      </div>
                      <div id="accordionOneCollapse3" role="tabpanel" aria-labelledby="accordionOneHeading3" class="panel-collapse collapse">
                        <div class="panel-body">
                          <p>이메일수정</p>
                        </div>
                      </div>
                    </div>
                  
                  <div class="panel panel-custom panel-light">
                      <div id="accordionOneHeading4" role="tab" class="panel-heading">
                        <div class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordionOne" href="#accordionOneCollapse4" aria-controls="accordionOneCollapse4" class="collapsed">
                          	<span class="icon icon-md icon-primary fa-phone"></span>&nbsp;전화<br>
                          	${detailCard.telphone }
                          <div class="panel-arrow"></div>
                          </a> </div>
                      </div>
                      <div id="accordionOneCollapse4" role="tabpanel" aria-labelledby="accordionOneHeading4" class="panel-collapse collapse">
                        <div class="panel-body">
                          <p>전화수정</p>
                        </div>
                      </div>
                    </div>
                  <div class="panel panel-custom panel-light">
                      <div id="accordionOneHeading5" role="tab" class="panel-heading">
                        <div class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordionOne" href="#accordionOneCollapse5" aria-controls="accordionOneCollapse5" class="collapsed">
                          	<span class="icon icon-md icon-primary fa-fax"></span>&nbsp;&nbsp;fax<br>
                          	${detailCard.fax }
                          <div class="panel-arrow"></div>
                          </a> </div>
                      </div>
                      <div id="accordionOneCollapse5" role="tabpanel" aria-labelledby="accordionOneHeading5" class="panel-collapse collapse">
                        <div class="panel-body">
                          <p>fax수정</p>
                        </div>
                      </div>
                    </div>
                  <div class="panel panel-custom panel-light">
                      <div id="accordionOneHeading6" role="tab" class="panel-heading">
                        <div class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordionOne" href="#accordionOneCollapse6" aria-controls="accordionOneCollapse6" class="collapsed">
                          	<span class="icon icon-md icon-primary fa-map-marker"></span>&nbsp;주소<br>
                          	서울시 강남구 삼성동
                          	<input type="hidden" id="address" value="서울시 강남구 삼성동">
                          	<script>
                          	</script>
                          <div class="panel-arrow"></div>
                          </a> </div>
                      </div>
                      <div id="accordionOneCollapse6" role="tabpanel" aria-labelledby="accordionOneHeading6" class="panel-collapse collapse">
                        <div class="panel-body">
                         
                          <p>주소수정</p>
                        </div>
                      </div>
                    </div>
                  <div class="panel panel-custom panel-light">
                      <div id="accordionOneHeading7" role="tab" class="panel-heading">
                        <div class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordionOne" href="#accordionOneCollapse7" aria-controls="accordionOneCollapse7" class="collapsed">
                          	<span class="icon icon-md icon-primary fa-pencil-square-o"></span>&nbsp;메모<br>
                          	응?
                          <div class="panel-arrow"></div>
                          </a> </div>
                      </div>
                      <div id="accordionOneCollapse7" role="tabpanel" aria-labelledby="accordionOneHeading7" class="panel-collapse collapse">
                        <div class="panel-body">
                          <p>이메일수정</p>
                        </div>
                      </div>
                    </div>
                  <div class="panel panel-custom panel-light">
                      <div id="accordionOneHeading8" role="tab" class="panel-heading">
                        <div class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordionOne" href="#accordionOneCollapse8" aria-controls="accordionOneCollapse8" class="collapsed">
                          	<span class="icon icon-md icon-primary fa-users"></span>&nbsp;그룹<br>
                          	그릅이 있냐 없냐
                          <div class="panel-arrow"></div>
                          </a> </div>
                      </div>
                      <div id="accordionOneCollapse8" role="tabpanel" aria-labelledby="accordionOneHeading8" class="panel-collapse collapse">
                        <div class="panel-body">
                          <p>그룹수정</p>
                        </div>
                      </div>
                    </div>
                  <div class="panel panel-custom panel-light">
                      <div id="accordionOneHeading9" role="tab" class="panel-heading">
                        <div class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordionOne" href="#accordionOneCollapse9" aria-controls="accordionOneCollapse9" class="collapsed">
                          	<span class="icon icon-md icon-primary fa-calendar-o"></span>&nbsp;등록일<br>
                          	${detailCard.inputdate }
                          <div class="panel-arrow"></div>
                          </a> </div>
    		                  </div>
	        	             </div>
                  		</div>
                	</div>
          	    </div> 
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