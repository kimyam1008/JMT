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

	#container {overflow:hidden;height:300px;position:relative;}
	#btnRoadview,  #btnMap {position:absolute;top:5px;left:5px;padding:7px 12px;font-size:14px;border: 1px solid #dbdbdb;background-color: #fff;border-radius: 2px;box-shadow: 0 1px 1px rgba(0,0,0,.04);z-index:1;cursor:pointer;}
	#btnRoadview:hover,  #btnMap:hover{background-color: #fcfcfc;border: 1px solid #c1c1c1;}
	#container.view_map #mapWrapper {z-index: 10;}
	#container.view_map #btnMap {display: none;}
	#container.view_roadview #mapWrapper {z-index: 0;}
	#container.view_roadview #btnRoadview {display: none;}

	<style type="text/css">
		li {list-style: none; float: left; padding: 6px;}
		 a:link { color: black; text-decoration: none;}
		 a:visited { color: black; text-decoration: none;}
		 a:hover { color: blue; text-decoration: underline;}
		 
		 th { text-align: center; }
		 table { text-align: center; }
		 h1 { padding: 40px}	
</style>
<title>Insert title here</title>
</head>
<body>
	<h3>${sessionScope.loginId}</h3>
	<h3>맛집 상세보기</h3>
	<c:forEach items="${CommentPhoto}" var="p">
	
		<img src="/photo/${p.photo_newFileName}" height="100"/>
	
	</c:forEach>
	 <%-- <c:forEach items="${photoList}" var="path">
      	<img src="/photo/${path.photo_newFileName}" height="100"/>
     </c:forEach> --%>
	<table>
		<thead>
	         <tr>
	         	<td>
				<input type="hidden" name="restaurant_no" value="${resDetail.restaurant_no}" />
				<input type="hidden" NO_X="restaurant_X" value="${resDetail.restaurant_X}" />
				<input type="hidden" NO_Y="restaurant_Y" value="${resDetail.restaurant_Y}" />
				</td>
	         	<th>식당이름</th>
	         	<td>${resDetail.restaurant_name}</td>
	         	<th>음식종류</th>
	         	<td>${resDetail.food_name}</td>	
				<th>지번주소</th>
				<td>${resDetail.restaurant_address}</td>
				<th>전화번호</th>
				<td>${resDetail.restaurant_call}</td>
				
				<td colspan="2">
					<button type="button" resID="${resDetail.restaurant_no}" memberID="${sessionScope.loginId}" onclick="resUp()">맛집 수정요청</button>
				</td>
	         </tr>
	   	</thead>
	   	<tbody>
	   			
		</tbody>
		
		
	</table>
	
	<!-- 지도^^ -->
	<div id="container" class="view_map">
	    <div id="mapWrapper" style="width:50%;height:300px;position:relative;">
	        <div id="map" style="width:100%;height:100%"></div> <!-- 지도를 표시할 div 입니다 -->
	        <!-- <input type="button" id="btnRoadview" onclick="toggleMap(false)" title="로드뷰 보기" value="로드뷰"> -->
	    </div>
	    <!-- 로드뷰 ^^ 와우 -->
	    <div id="rvWrapper" style="width:50%;height:300px;position:absolute;top:0;left:0;">
	        <div id="roadview" style="height:100%"></div> <!-- 로드뷰를 표시할 div 입니다 -->
	        <input type="button" id="btnMap" onclick="toggleMap(true)" title="지도 보기" value="지도">
	    </div>
	</div>
	
	<c:forEach items="${lightninglist}" var="liList">
	 	번개 모임!!
	 	<br/>
	 	<c:if test="${liList.lightning_status eq '모집중'}">
      		<td>${liList.lightning_title}</td>
    	</c:if>
     </c:forEach>
	
		<h3>리뷰</h3>
	<table>
		<thead>
			<tr>
				
				<td>
					<a href="./reviewWrite?restaurant_no=${resDetail.restaurant_no}">리뷰 쓰기</a>			
				</td>
			</tr>
		</thead>
	</table>
	<br/>
	 
     <table>
	 <c:forEach items="${resCommet}" var="comment" >
	 <tr>
		<c:if test="${comment.comment_status eq '공개'}">
			<td>
				<input type="hidden" name="idx" value="${comment.comment_no}" />
			</td>
			<td>${comment.member_id}</td>
			<td>${comment.comment_content}</td>
			<td>${comment.comment_date}</td>
			
			
			<%-- <c:forEach items="${CommentLike}" var="like">
				<c:choose>
					<c:when test="${like.member_id eq sessionScope.loginId}">
						
					</c:when>
					<c:when test="${like.member_id eq null}">
						
					</c:when>
				</c:choose>
			</c:forEach> --%>
			
			
			<c:choose>
				<c:when test="${comment.comment_no ne null}">
					<td>
						<button class="likeDelBtn" onclick="likeDel(this)"
						commentID="${comment.comment_no}" loginID="${sessionScope.loginId}">
						♥</button>
					</td>	
				</c:when>
				<c:otherwise>
					<td>
						<button class="likeBtn" onclick="like(this)"
						commentID="${comment.comment_no}" loginID="${sessionScope.loginId}">
						♡</button>
					</td>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${comment.comment_no ne null}">
					<td>
						<button class="likeBtn" onclick="like(this)"
						commentID="${comment.comment_no}" loginID="${sessionScope.loginId}">
						♡</button>
					</td>
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>
			
					
			 
			
			
			<td>
			<c:if test="${comment.member_id eq sessionScope.loginId}">
			<input type="hidden" name="ID" value="${comment.member_id}" />
			<button class="delBtn" onclick="commentDel(this)" commentID="${comment.comment_no}">삭제</button>
			<a href="./reviewUpdate?comment_no=${comment.comment_no}">수정</a>
			</c:if>
			</td>
			<td>
			${comment.likeNo}
			</td>
			
				<td>
					<button type="button" resID="${comment.comment_no}" memberID="${sessionScope.loginId}" onclick="report()">신고하기</button>
				</td>
			
			<td>
			<c:forEach items="${CommentPhoto}" var="p">
				<c:if test="${comment.comment_no eq p.idx}">
				<img src="/photo/${p.photo_newFileName}" height="100"/>
				</c:if>
			</c:forEach>
			</td> 
			 
		</c:if>	
		</tr>
     </c:forEach>
    </table>
    
   
    
    
    <%-- <!-- 페이지 번호 -->	
	<div>
		<ul>	
			<!-- 맨처음 버튼 -->
			<li>
				<a href="listPage${pageMaker.makeQuery(pageMaker.firstPage)}">맨처음</a>
			</li>
			
			
			<!-- 이전 버튼 -->
			<li>
				<a href="listPage${pageMaker.makeQuery(pageMaker.startPage-1)}">이전</a>
			</li>
			
			<!-- 페이지 번호 (시작 페이지 번호부터 끝 페이지 번호까지) -->
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			    <li>
				    <a href="listPage${pageMaker.makeQuery(idx)}">
				    	<!-- 시각 장애인을 위한 추가 -->
				      	<span>${idx}</span>
				    </a>
			    </li>
			</c:forEach>
			
			<!-- next 버튼 -->
			<li>
			    <a href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
			</li>
			
			<li>
				<a href="listPage${pageMaker.makeQuery(pageMaker.finalPage)}">맨끝</a>
			</li>
			
		</ul>
	</div> --%>
</body>

<script>


	function resUp(){
		window.open('restaurantUpdate.go?restaurant_no=${resDetail.restaurant_no}','','width=400, height=300');
	}
	
	function report(){
		window.open('resReport.go?comment_no=${comment.comment_no}','','width=400, height=300');
	}
	
	
	function commentDel(comment_no) { 
		  var commentID = $(comment_no).attr("commentID");
	      console.log(commentID);
	      
	         $.ajax({
	               type:'get',
	               url:'commentDel.ajax',
	               data:{
					 comment_no : commentID
	               },
	               dataType:'JSON',
	               success:function(data) {
	                  alert(data.msg);
	                  location.href="resDetail.do?restaurant_no="+commentID;
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
	                  alert(data.msg);
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
	                  alert(data.msg);
	               },
	               error:function(e) {
	                  console.log(e);
	               }
	            });
	      
	      
	} 
	
	
	//지도^^
	
	var x = ${resDetail.restaurant_X};
	var y = ${resDetail.restaurant_Y};
	
	
	var container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div 입니다
    mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div 입니다
    btnRoadview = document.getElementById('btnRoadview'), // 지도 위의 로드뷰 버튼, 클릭하면 지도는 감춰지고 로드뷰가 보입니다 
    btnMap = document.getElementById('btnMap'), // 로드뷰 위의 지도 버튼, 클릭하면 로드뷰는 감춰지고 지도가 보입니다 
    rvContainer = document.getElementById('roadview'), // 로드뷰를 표시할 div 입니다
    mapContainer = document.getElementById('map'); // 지도를 표시할 div 입니다

	// 지도와 로드뷰 위에 마커로 표시할 특정 장소의 좌표입니다 
	var placePosition = new kakao.maps.LatLng(x, y);
	
	// 지도 옵션입니다 
	var mapOption = {
	    center: placePosition, // 지도의 중심좌표 
	    level: 3 // 지도의 확대 레벨
	};
	
	// 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// 로드뷰 객체를 생성합니다 
	var roadview = new kakao.maps.Roadview(rvContainer);
	
	// 로드뷰의 위치를 특정 장소를 포함하는 파노라마 ID로 설정합니다
	// 로드뷰의 파노라마 ID는 Wizard를 사용하면 쉽게 얻을수 있습니다 
	roadview.setPanoId(1023434522, placePosition);
	
	// 특정 장소가 잘보이도록 로드뷰의 적절한 시점(ViewPoint)을 설정합니다 
	// Wizard를 사용하면 적절한 로드뷰 시점(ViewPoint)값을 쉽게 확인할 수 있습니다
	roadview.setViewpoint({
	    pan: 321,
	    tilt: 0,
	    zoom: 0
	});
	
	// 지도 중심을 표시할 마커를 생성하고 특정 장소 위에 표시합니다 
	var mapMarker = new kakao.maps.Marker({
	    position: placePosition,
	    map: map
	});
	
	// 로드뷰 초기화가 완료되면 
	kakao.maps.event.addListener(roadview, 'init', function() {
	
	    // 로드뷰에 특정 장소를 표시할 마커를 생성하고 로드뷰 위에 표시합니다 
	    var rvMarker = new kakao.maps.Marker({
	        position: placePosition,
	        map: roadview
	    });
	});
	
	// 지도와 로드뷰를 감싸고 있는 div의 class를 변경하여 지도를 숨기거나 보이게 하는 함수입니다 
	function toggleMap(active) {
	    if (active) {
	
	        // 지도가 보이도록 지도와 로드뷰를 감싸고 있는 div의 class를 변경합니다
	        container.className = "view_map"
	    } else {
	
	        // 지도가 숨겨지도록 지도와 로드뷰를 감싸고 있는 div의 class를 변경합니다
	        container.className = "view_roadview"   
	    }
	}
	
	
</script>


</html>























