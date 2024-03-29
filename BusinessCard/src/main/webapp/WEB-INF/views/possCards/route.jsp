<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>Displaying text directions with <code>setPanel()</code></title>
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */

#map {
   height: 100%;
}
/* Optional: Makes the sample page fill the window. */
html, body {
   height: 100%;
   margin: 0;
   padding: 0;
}

#floating-panel {
   position: absolute;
   top: 10px;
   left: 25%;
   z-index: 5;
   background-color: #fff;
   padding: 5px;
   border: 1px solid #999;
   text-align: center;
   font-family: 'Roboto', 'sans-serif';
   line-height: 30px;
   padding-left: 10px;
}

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

#right-panel {
   height: 80%;
   float: right;
   width: 390px;
   overflow: auto;
}

#map {
   margin-right: 400px;
}

#floating-panel {
   background: #fff;
   padding: 5px;
   font-size: 14px;
   font-family: Arial;
   border: 1px solid #ccc;
   box-shadow: 0 2px 2px rgba(33, 33, 33, 0.4);
   display: none;
}

@media print {
   #map {
      height: 100%;
      margin: 0;
   }
   #right-panel {
      float: none;
      width: auto;
   }
}
</style>
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css"
   href="css/css.css?family=Montserrat:400,700%7CLato:300,300italic,400,400italic,700,900%7CPlayfair+Display:700italic,900">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
   <%@include file="../modules/header.jsp"%>
      <div id="floating-panel">
         <strong>출발지:</strong> <input type="text" id="start" value="${start}"
            readonly="readonly"> <br> <strong>도착지:</strong> <input
            type="text" id="end" value="${end}" readonly="readonly">
      </div>
      <div id="right-panel"></div>
      <div id="mapout" style="position: relative;width=50%;height:100%;"><div id="map"></div></div>
   <script>
      function initMap() {
         var directionsDisplay = new google.maps.DirectionsRenderer;
         var directionsService = new google.maps.DirectionsService;
         var map = new google.maps.Map(document.getElementById('map'), {
            zoom : 7,
            center : {
               lat : 41.85,
               lng : -87.65
            }
         });
         directionsDisplay.setMap(map);
         directionsDisplay.setPanel(document.getElementById('right-panel'));

         var control = document.getElementById('floating-panel');
         control.style.display = 'block';
         map.controls[google.maps.ControlPosition.TOP_LEFT].push(control);

         calculateAndDisplayRoute(directionsService, directionsDisplay);
      }

      function calculateAndDisplayRoute(directionsService, directionsDisplay) {
         var start = document.getElementById('start').value;
         var end = document.getElementById('end').value;
         directionsService.route({
            origin : start,
            destination : end,
            travelMode : 'DRIVING'
         }, function(response, status) {
            if (status === 'OK') {
               directionsDisplay.setDirections(response);
            } else {
               window.alert('Directions request failed due to ' + status);
            }
         });
      }
   </script>
   <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwT77mHP1Yu98_PplRBCkXycOfTAGZLTI&callback=initMap">
      
   </script>
   <%@include file="../modules/footer.jsp"%>
   <%@include file="../modules/form-output-global.jsp"%>
   <script src="js/core.min.js"></script>
   <script src="js/script.js"></script>
</body>
</html>