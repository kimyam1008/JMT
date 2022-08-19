<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c6e8effc4f59a314f7673e566c1b6f1"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
	.rest table,tr,th{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px;
		text-align: center;
	}
	
	.nonono{
	display:none;}

.btn {cursor:pointer;}

</style>
<title>Insert title here</title>
</head>
<body>
	<div>
	<h3>${sessionScope.loginId}</h3>
	<h3>맛집 상세보기</h3>
	</div>
	<div>
	<c:forEach items="${CommentPhoto}" var="p">
		<img src="/photo/${p.photo_newFileName}" height="250"/>
	</c:forEach>
	</div>
	</br>
	 <%-- <c:forEach items="${photoList}" var="path">
      	<img src="/photo/${path.photo_newFileName}" height="100"/>
     </c:forEach> --%>
    <div style="float: left; margin-right:40px;">
	<table class="rest" width="500" height="300">
	         <tr>
	         	<th colspan="2" id="restaurant_name">
	         		${resDetail.restaurant_name}
	         		<input type="hidden" id="restaurant_no" value="${resDetail.restaurant_no}" />
					<input type="hidden" NO_X="restaurant_X" value="${resDetail.restaurant_X}" />
					<input type="hidden" NO_Y="restaurant_Y" value="${resDetail.restaurant_Y}" />
	         	</th>
	         	</tr>
	         	<tr>
	         	<th>음식종류</th>
	         	<td>${resDetail.food_name}</td>	
	         	</tr>
	         	<tr>
				<th>지번주소</th>
				<td>${resDetail.restaurant_address}</td>
				</tr>
				<tr>
				<th>전화번호</th>
				<td>${resDetail.restaurant_call}</td>
				<tr>
				<td colspan="2">
					<button type="button" resID="${resDetail.restaurant_no}" memberID="${sessionScope.loginId}" onclick="resUp()">맛집 수정요청</button>
				</td>
	</table>
	</div>
	<!-- 지도^^ -->
	<div id="map" style="width:400px;height:300px;"></div>
	<div>
	<ul>
	<c:forEach items="${lightninglist}" var="liList">
	 	<h3>번개 모임!!</h3>
	 	<br/>
	 	<c:if test="${liList.lightning_status eq '모집중'}">
      		<li>${liList.lightning_title}</li>
    	</c:if>
     </c:forEach>
     </ul>
	</div>
	<h3>리뷰</h3>
	<div>
		 <a href="./reviewWrite?restaurant_no=${resDetail.restaurant_no}">[리뷰 쓰기]</a>            
	<br/>
	</div>
	<div>
	 <c:forEach items="${resCommet}" var="comment" >
	 <table>
		<c:if test="${comment.comment_status eq '공개'}">
			<input type="hidden" name="idx" value="${comment.comment_no}" />
			<tr>
				<td width="50;">${comment.member_id}</td>
				<td  width="300;"></td>
				<td colspan="2">${comment.comment_date}</td>
			</tr>
			
			<tr height="150;">
			<td></td>
			<td>${comment.comment_content} </br>
			<c:forEach items="${CommentPhoto}" var="p">
				<c:if test="${comment.comment_no eq p.idx}">
				<img src="/photo/${p.photo_newFileName}" height="100"/>
				</c:if>
			</c:forEach>
			</td>
			
			<td width="100;">
			<c:choose>
		 		<c:when test="${comment.member_id eq sessionScope.loginId}">
					<input type="hidden" name="ID" value="${comment.member_id}" />
					<button class="delBtn" onclick="commentDel(this)" commentID="${comment.comment_no}">삭제</button>
					<a href="./reviewUpdate?comment_no=${comment.comment_no}">수정</a>
				</c:when>
				<c:otherwise>
					<input type="hidden" value="${comment.comment_no}">
					<button type="button" resID="${comment.comment_no}"
						memberID="${sessionScope.loginId}" onclick="report(${comment.comment_no})">신고하기</button>
				</c:otherwise>
			</c:choose>
				</br>
				
				<c:choose>
		 		<c:when test="${comment.likeMember == null or sessionScope.loginId == null}">
					<img src="/photo/heart.png" height="13" style="cursor: pointer;" onclick="like(this)" commentID="${comment.comment_no}" loginID="${sessionScope.loginId}"/>	
					${comment.likeNo}
				</c:when>
				<c:otherwise>
					<img src="/photo/fullheart.png" height="13" style="cursor: pointer;" onclick="likeDel(this)" commentID="${comment.comment_no}" loginID="${sessionScope.loginId}"/>	
					${comment.likeNo}
				</c:otherwise>
			</c:choose>
				</td>

			</tr>
		</c:if>	
		</table>
     </c:forEach>
    </div>
</body>

<script>

var restaurant_no = $('#restaurant_no').val();

console.log("식당번호 확인::",restaurant_no);
	
	/* var i = ${comment.comment_no}; */
	/* var comment_no = ${comment.comment_no}; */
	var ooo = onclick="report(${comment.comment_no})"
	
	function resUp(){
		window.open('restaurantUpdate.go?restaurant_no=${resDetail.restaurant_no}','','width=400, height=300');
	}
	
	function report(rep){
		window.open('resReport.go?comment_no='+rep,'','width=400, height=300');
	}
	
	
	function commentDel(comment_no) { 
		  var commentID = $(comment_no).attr("commentID");
	      console.log(commentID);
	      
	  	var dojang_no = $('#dojang_no').val();
	      
	      
	      
	         $.ajax({
	               type:'get',
	               url:'commentDel.ajax',
	               data:{
					 comment_no : commentID
	               },
	               dataType:'JSON',
	               success:function(data) {
	                  alert("삭제완료");
	                  location.href="resDetail.do?restaurant_no="+restaurant_no;
	               },
	               error:function(e) {
	                  console.log(e);
	     
	                  //location.reload(true);
	               }
	            });
	      
	      
	}
	
	function like(comment_no) { 
	      var commentID = $(comment_no).attr("commentID");
	      /* var loginID = $(comment_no).attr("loginID"); */
	      console.log(commentID);
	      
	         $.ajax({
	               type:'get',
	               url:'like.ajax',
	               data:{
					 comment_no : commentID,
					 /* loginID : loginID */
	               },
	               dataType:'JSON',
	               success:function(data) {
	                  console.log(data.likes);
	                  location.href="resDetail.do?restaurant_no="+restaurant_no;
	               },
	               error:function(e) {
	                  console.log(e);
	               }
	            });
	      
	      
	} 
	
	function likeDel(comment_no) { 
		
		
	      var commentID = $(comment_no).attr("commentID");
	      /* var loginID = $(comment_no).attr("loginID"); */
	      console.log(commentID);
	      
	         $.ajax({
	               type:'get',
	               url:'likeDel.ajax',
	               data:{
					 comment_no : commentID,
					 /* loginID : loginID */
	               },
	               dataType:'JSON',
	               success:function(data) {
	                  alert(data.likeDel);
	                  location.href="resDetail.do?restaurant_no="+restaurant_no;
	               },
	               error:function(e) {
	                  console.log(e);
	               }
	            });
	      
	      
	} 
	


	
	
	
	
	
	//지도^^
	
	var x = ${resDetail.restaurant_X};
	var y = ${resDetail.restaurant_Y};
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(x, y), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성

	//지도를 클릭한 위치에 표출할 마커
	var marker = new kakao.maps.Marker({ 
	// 지도 중심좌표에 마커를 생성
	position: map.getCenter() 
	}); 
	//지도에 마커를 표시합니다
	marker.setMap(map);

	var iwContent = '<div style="padding:5px;">여기 어때요?<br><a href="https://map.kakao.com/link/to/맛집,'+x+','+y+'" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	iwPosition = new kakao.maps.LatLng(x, y); //인포윈도우 표시 위치

	//인포윈도우를 생성
	var infowindow = new kakao.maps.InfoWindow({
	position : iwPosition, 
	content : iwContent 
	});

	infowindow.open(map, marker);
	
	
</script>


</html>























