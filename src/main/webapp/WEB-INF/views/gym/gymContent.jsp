<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체육관 상세정보</title>
</head>
<body>
	
	
	<h1>체육관 상세정보</h1>

	 프로필사진 &emsp; <img src="../gym/${content.gPhotoPath }" alt="photo" width="200" height="200">
	 <br>
	 체육관명 &emsp; ${content.mName }
	 <br>
	 아이디 &emsp; ${content.mId }
	 <br>
	 주소 &emsp; ${content.gAddress }
	 <br>
	 전화번호 &emsp; ${content.gNumber }
	 <br>
	 스포츠종목 &emsp; ${content.mSports }
	 <br>
	 대여료 &emsp; ${content.gRentalPrice }
	 <br>
	 대여횟수 &emsp; ${content.gRentalNum }
	 <br>
	 체육관 소개 &emsp; ${content.mIntro }
	 <br>
	 
	
 	<c:forEach items="${gymphoto}" var="gymphoto" varStatus="vs">
	<img src="../gym/${gymphoto.gfPhotoPath }" alt="gymphoto${vs.count }" width="200" height="200">
	<br>
	</c:forEach>
	
	<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cfd92acb47a553a65cd744cd1958b634&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${content.gAddress }', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">체육관 위치</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
	
</body>
</html>