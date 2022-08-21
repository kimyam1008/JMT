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
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>


<c:set var="path" value="${pageContext.request.contextPath}"/>
 <link href="${path}/resources/etcResource/assets/css/animate.min.css" rel="stylesheet"/>
<link href="${path}/resources/etcResource/assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>
<link href="/http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
<link href="${path}/resources/etcResource/assets/css/pe-icon-7-stroke.css" rel="stylesheet" />

<style>
#content_List{
	display: flex;
	justify-content: center;
}
#map{
	margin:0px;
}
#moin_list{
	border: 1px solid rgb(235,236,239);
	background-color:#f9f9fa;
	width:400px;
	height:300px;

}
ul{ list-style:none;}

/* 	.rest table,tr,th{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px;
		text-align: center;
	}
 */
#comment_label{
	text-align:center;
	margint-bottom:20px;
}
#comment__{
	 border-radius: 8px;
	border: 1px solid rgb(235,236,239);
	background-color: #f9f9fa;
}

#comment_date{position:relative;  top:5px; left:600px;}


#comment_content{
	text-align:left;
	
}

#comment_writed{
	padding:10px;
	position: relative;
	left: 10px;
	

}
#comment_pic{
	padding-top:20px;
	justify-content:left;
	display:flex;
	position: relative;
	left: 20px;
}
#comment_border{
	border: 1px solid rgb(235,236,239);
	width:800px;
	height:600px;
	position:relarive; 
	left:500px;
	margin:auto;
	  overflow-x: hidden;
    overflow-y: auto;
	
}
#comment_list{

}
#comment_option{
	position:relative;
	left:720px;
	bottom:5px;
}




#btn-write-comment{ 
    color : #009f47;
    background-color: #e0f8eb;
    position: relative;
   	right:6px;
}


#comment-writebox {
    background-color: white;
    border : 1px solid #e5e5e5;
    border-radius: 5px;
    width:800px;
    margin:auto;
}

textarea {
    display: block;
    width: 100%;
    min-height: 17px;
    padding: 0 20px;
    border: 0;
    outline: 0;
    font-size: 13px;
    resize: none;
    box-sizing: border-box;
    background: transparent;
    overflow-wrap: break-word;
    overflow-x: hidden;
    overflow-y: auto;
}

#comment-writebox-bottom {
    padding : 3px 10px 10px 10px;
    min-height : 35px;
}

.btn {
    font-size:10pt;
    color : black;
    background-color: #eff0f2;
    border:none;
    text-decoration: none;
	position:relative;
	bottom:10px;
    border-radius: 5px;
    float : right;
}

#option_align{
	display:flex;
	justify-content: right;
}
#image_label{
	position:relative;
	right:10px;
	cursor: pointer;
}
#photo_div{
     position:relative;
	left:280px;
}
</style>
<title>Insert title here</title>
</head>
<body>
<input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
	<div>
	<h3>${sessionScope.loginId}</h3>
	<h3>맛집 상세보기</h3>
	</div>
	<div id="photo_div">
	<c:forEach items="${CommentPhoto}" var="p">
		<img src="/photo/${p.photo_newFileName}" height="250"/>
	</c:forEach>
	</div>
	</br>
	 <%-- <c:forEach items="${photoList}" var="path">
      	<img src="/photo/${path.photo_newFileName}" height="100"/>
     </c:forEach> --%>
  <div id="content_List">
  
    <div style="float: left; margin-right:40px;">
	<table class="table table-hover table-striped" class="rest" width="500" height="300">
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
		<div id="moin_list">
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
	</div>
	
	<div id="comment_label">
		<h3>리뷰</h3>
		 <a href="./reviewWrite?restaurant_no=${resDetail.restaurant_no}">[리뷰 쓰기]</a>            
	<br/>
	</div>
	
	

	
	<form id="comment-writebox" action=reviewWrite.do method="post" enctype="multipart/form-data">
        
        		<input type="hidden" name="idx" value="${resDetail.restaurant_no}" />
        
           
                
                <div  class="comment-writebox-content">
                	<textarea  cols="30" rows="5" name="Comment_content" placeholder="리뷰를 남겨보세요~"></textarea>
                </div>
            <div id="option_align">
               <label  id="image_label" for="image_">    
 					<i style="font-size:20px"; class="fas fa-camera"></i></label> 
               <input style="display:none" id="image_"  type="file" name="photos" multiple="multiple"/>
           
	           <button  class="btn" id="btn-write-comment" type="submit" >리뷰작성</button>
	       </div>
	</form>
	
	
	
	
	
	<div id="comment_border" >
	 <c:forEach items="${resCommet}" var="comment" >
	
		<c:if test="${comment.comment_status eq '공개'}">
		 <div id="comment__">
			<input type="hidden" name="idx" value="${comment.comment_no}" />
			
			<div  id="comment_list">
				<span>${comment.member_id}</span>
				
				<span id="comment_date">${comment.comment_date}
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
				</span>
			</div>
			
			<div  id="comment_content">
			
				<div id="comment_writed">${comment.comment_content}</div>
				<div id="comment_pic">
					<c:forEach items="${CommentPhoto}" var="p">
					<c:if test="${comment.comment_no eq p.idx}">
					<img src="/photo/${p.photo_newFileName}" height="100"/>
					</c:if>
					</c:forEach>
				</div>
			</div>
			
			<div id="comment_option">
					<c:choose>
				 		<c:when test="${comment.member_id eq sessionScope.loginId}">
							<input type="hidden" name="ID" value="${comment.member_id}" />
							<a href="#"class="delBtn" onclick="commentDel(this)" commentID="${comment.comment_no}">삭제</a>
							<a href="./reviewUpdate?comment_no=${comment.comment_no}">수정</a>
						</c:when>
						<c:otherwise>
							<input type="hidden" value="${comment.comment_no}">
							<a href="#" resID="${comment.comment_no}"
								memberID="${sessionScope.loginId}" onclick="report(${comment.comment_no})">신고하기</a>
						</c:otherwise>
					</c:choose>
				</div>

		</div>
		</c:if>	
		
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
		window.open('restaurantUpdate.go?restaurant_no=${resDetail.restaurant_no}',"new","width=400, height=200, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
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
	      console.log(commentID);
			
	      
	      var loginId = $("#loginId").val();
	      console.log(loginId);
	      
	      if(loginId == ""){
	    	  alert("로그인 후 이용 가능합니다.");
	      }else{
	      
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
	
	
	
	
	/*  */
	
	
		function fileUpload(){
		$("form").submit();
	}
	
	var path = "${path}";
	
	if(path != ""){
		var content = '<a href="#" id="${path}" onclick="del(this)">';
		content += '<img src="'+path+'" height="150"/>';
		content += '</a>';
		opener.document.getElementById("editable").innerHTML += content;		
		self.close();
	}


	
	
	
	function back() {
	     history.go(-1);
	 }
</script>


</html>























