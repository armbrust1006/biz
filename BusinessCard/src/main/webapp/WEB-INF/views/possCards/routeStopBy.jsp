<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>Waypoints in directions</title>
<style>
#right-panel {
   font-family: 'Roboto', 'sans-serif';
   line-height: 30px;
   padding-left: 10px;
}

#right-panel select, #right-panel input {
   font-size: 15px;
}

#right-panel select {
   width: 100%;
}

#right-panel i {
   font-size: 12px;
}

html, body {
   height: 100%;
   margin: 0;
   padding: 0;
}

#map {
   height: 100%;
   float: left;
   width: 70%;
   height: 100%;
}

#right-panel {
   margin: 20px;
   border-width: 2px;
   width: 20%;
   height: 400px;
   float: left;
   text-align: left;
   padding-top: 0;
}

#directions-panel {
   margin-top: 10px;
   background-color: #FFEE77;
   padding: 10px;
}
</style>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
   <div id="map"></div>
   <div id="right-panel">
      <div>
         <h6>[경유지 길찾기]</h6>
         <br> <b>출발지 :</b> <select id="start">
            <c:forEach var="stop" items="${stopBy}">
               <option value="${stop.address}">${stop.address}</option>
            </c:forEach>

         </select> <br> <b>경유지:</b> <br> (Ctrl+Click 로 경유지를 추가,
            삭제) <br> <select multiple id="waypoints">
            <c:forEach var="stop" items="${stopBy}">
               <option value="${stop.address}">${stop.name}${stop.address}</option>
            </c:forEach>



         </select> <br> <b>도착지: </b> <select id="end">
            <c:forEach var="stop" items="${stopBy}">
               <option value="${stop.address}">${stop.address}</option>
            </c:forEach>
         </select> <br> <input type="submit" id="submit">
      </div>
      <div id="directions-panel"></div>
   </div>

   <script>
      function initMap() {
         var directionsService = new google.maps.DirectionsService;
         var directionsDisplay = new google.maps.DirectionsRenderer;
         var map = new google.maps.Map(document.getElementById('map'), {
            zoom : 6,
            center : {
               lat : 41.85,
               lng : -87.65
            }
         });
         directionsDisplay.setMap(map);

         document.getElementById('submit').addEventListener(
               'click',
               function() {
                  calculateAndDisplayRoute(directionsService,
                        directionsDisplay);
               });
      }

      function calculateAndDisplayRoute(directionsService, directionsDisplay) {
         var waypts = [];
         var checkboxArray = document.getElementById('waypoints');
         for (var i = 0; i < checkboxArray.length; i++) {
            if (checkboxArray.options[i].selected) {
               waypts.push({
                  location : checkboxArray[i].value,
                  stopover : true
               });
            }
         }

         directionsService.route({
            origin : document.getElementById('start').value,
            destination : document.getElementById('end').value,
            waypoints : waypts,
            optimizeWaypoints : true,
            travelMode : 'DRIVING'
         }, function(response, status) {
            if (status === 'OK') {
               directionsDisplay.setDirections(response);
               var route = response.routes[0];
               var summaryPanel = document
                     .getElementById('directions-panel');
               summaryPanel.innerHTML = '';
               // For each route, display summary information.
               for (var i = 0; i < route.legs.length; i++) {
                  var routeSegment = i + 1;
                  summaryPanel.innerHTML += '<b>Route Segment: '
                        + routeSegment + '</b><br>';
                  summaryPanel.innerHTML += route.legs[i].start_address
                        + ' to ';
                  summaryPanel.innerHTML += route.legs[i].end_address
                        + '<br>';
                  summaryPanel.innerHTML += route.legs[i].distance.text
                        + '<br><br>';
               }
            } else {
               window.alert('Directions request failed due to ' + status);
            }
         });
      }
   </script>
   <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwT77mHP1Yu98_PplRBCkXycOfTAGZLTI&callback=initMap">
      
   </script>

</body>
</html>