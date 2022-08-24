<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="../resources/mainResource/assets/img/pizza-slice.png">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-pen.css" rel="stylesheet">

<!-- CSS here -->
<link rel="stylesheet" href="../resources/mainResource/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/mainResource/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="../resources/mainResource/assets/css/slicknav.css">
<link rel="stylesheet" href="../resources/mainResource/assets/css/flaticon.css">
<link rel="stylesheet" href="../resources/mainResource/assets/css/animate.min.css">
<link rel="stylesheet" href="../resources/mainResource/assets/css/magnific-popup.css">
<link rel="stylesheet" href="../resources/mainResource/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="../resources/mainResource/assets/css/themify-icons.css">
<link rel="stylesheet" href="../resources/mainResource/assets/css/slick.css">
<link rel="stylesheet" href="../resources/mainResource/assets/css/nice-select.css">
<link rel="stylesheet" href="../resources/mainResource/assets/css/style.css">

            
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

#comment_date{position:relative; width: 400px; bottom:20px; left:620px;}


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
 width: 250px;
}
#comment_option{
	position:relative;
	left:700px;
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
	margin-top:30px;
}

button{
	color:#fff;
	background:orange;
	border:none;
	padding:5px 10px;
}
button:focus{
		outline:0;
}
button:hover{
	background:#ff3d1c;
	cursor:pointer;
}

 .notiDelBtn:hover{
			cursor : pointer;
			color : red;
		}

</style>
<title>맛집 상세보기</title>
</head>
<body>

<!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="../resources/mainResource/assets/img/logo/logo.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <header>
        <!-- Header Start -->
       <div class="header-area header-transparent">
            <div class="main-header">
               <div class="header-bottom  header-sticky">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2 col-md-1">
                                <div class="logo">
                                  <a href="/"><img src="../resources/mainResource/assets/img/logo/logo.png" width="80px" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10 col-md-8">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">                                                                                                                                     
                                            <li><a href="/">Home</a></li>
                                            <li><a href="#">모임</a>
                                                <ul class="submenu">
                                                    <li><a href="lightList.go">번개</a></li>
                                                    <li><a href="dojang.go">도장깨기</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="restaurant">맛집</a></li>
                                            <li><a href="groupReviewList">후기</a></li>
											<c:choose>
		                                            	<c:when test="${loginId != null}">
			                                            		<!-- 알림 -->
				                                            	 <c:choose>
						                                        	<c:when test="${notiChk=='true'}"><!--안읽은 알림있을 때  -->
								                                            <li><a href="#"><img  id="notidrop" src="resources/photo/noti4.png"  style="width:30px; height:25px;"/></a>
								                                               	<ul class="submenu notidrop_menu" style="width : 300px; display : none;">
								                                               	</ul>
								                                            </li>
						                                            </c:when>
						                                        	<c:otherwise>
							                                            <li><a href="#"><img id="notidrop"  src="resources/photo/bnoti4.png"  style="width:30px; height:25px;"/></a>
							                                            	<ul class="submenu notidrop_menu" style="width : 300px; display : none;">
								                                             </ul>
							                                            </li>
						                                            </c:otherwise>
			                                        			</c:choose>
			                                            	<li id="logoutDo"><a href="logout.do">${sessionScope.loginId}님, 로그아웃</a></li>
			                                            	
			                                            		<c:if test="${member_status eq '일반회원'}">
					                                          	  <li class="add-list"><a href="/mypage.go"><i class="ti-user"></i>마이페이지</a></li>
					                                          	</c:if> 	
					                                      		<c:if test="${member_status eq '관리자'}">
					                                          	  <li class="add-list"><a href="/report/"><i class="ti-user"></i>관리자 페이지</a></li>
					                                          	</c:if>
		                                            	</c:when>
		                                            	<c:otherwise>
				                                            <li class="add-list"><a href="login.go"><i class="ti-user"></i>로그인</a></li>
		                                            	</c:otherwise>
		                                   </c:choose>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
       </div>
        <!-- Header End -->
    </header>
<main>
	
	<!-- Hero Start-->
        <div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center ">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center pt-50">
                            <h2>맛집 상세보기</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
	<div>
	</div>
	<div id="photo_div">
	<c:forEach items="${CommentPhoto}" var="p">
		<img src="/photo/${p.photo_newFileName}" height="250" width="200"/>
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
					<div style="display:block;">
		            	<span style="text-align:center; display:block; margin: 0 auto;">
							<button type="button" resID="${resDetail.restaurant_no}" memberID="${sessionScope.loginId}" onclick="resUp()">맛집 수정요청</button>
						</span>
					</div>
				</td>
	</table>
	</div>
	
	
		<!-- 지도^^ -->
		<div id="map" style="width:400px;height:300px;"></div>
		<div id="moin_list">
		 	<h3>번개 모임!!</h3>
		<ul>
		<c:forEach items="${lightninglist}" var="liList">
		 	<br/>
		 	<c:if test="${liList.lightning_status eq '모집중'}">
		 		<input type="hidden" name="idx" value="${liList.lightning_no}" />
	      		<li><a href="lightDetail.go?lightning_no=${liList.lightning_no}">${liList.lightning_title}</a></li>
	    	</c:if>
	     </c:forEach>
	     </ul>
		</div>
	</div>
	
	<div id="comment_label">
		<h3>리뷰</h3>
	<br/>
	</div>
	
	

	
	<form id="comment-writebox" action=reviewWrite.do method="post" enctype="multipart/form-data">
        
        		<input type="hidden" name="idx" value="${resDetail.restaurant_no}" />
        
           
                
                <div  class="comment-writebox-content">
                	<textarea cols="30" rows="5" id="comment" name="Comment_content" placeholder="리뷰를 남겨보세요~"></textarea>
                </div>
            <div id="option_align">
               <label  id="image_label" for="image_">    
 					<i style="font-size:20px"; class="fas fa-camera"></i></label> 
               <input style="display:none" id="image_"  type="file" name="photos" multiple="multiple"/>
           
	           <button  class="btn" type="submit" id="btn-write-comment" >리뷰작성</button>
	       </div>
	</form>
	
	
	
	
	
	<div id="comment_border" >
	 <c:forEach items="${resCommet}" var="comment" >
	
		<c:if test="${comment.comment_status eq '공개'}">
		 <div id="comment__">
			<input type="hidden" name="idx" value="${comment.comment_no}" />
			
			<div  id="comment_list">
				<div>${comment.member_id}</div>
				
				<div id="comment_date">${comment.comment_date}
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
				</div>
			</div>
			
			<div  id="comment_content">
			
				<div id="comment_writed">${comment.comment_content}</div>
				<div id="comment_pic">
					<c:forEach items="${CommentPhoto}" var="p">
					<c:if test="${comment.comment_no eq p.idx}">
					<img src="/photo/${p.photo_newFileName}" height="100" width="150"/>
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
</main>    

        
     
     <footer>
        <!-- Footer Start-->
        <div class="footer-area">
            <div class="container">
               <div class="footer-top footer-padding">
                    <div class="row justify-content-between">
                        <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6">
                            <div class="single-footer-caption mb-50">
                                <div class="single-footer-caption mb-30">
                                    <!-- logo -->
                                    <div class="footer-logo">
                                        <a href="jmtMain.html"><img src="../resources/mainResource/assets/img/logo/logo.png" width="100px" alt=""></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-2 col-md-4 col-sm-6">
                            <div class="single-footer-caption mb-50">
                                <div class="footer-tittle">
                                    <h4>Quick Link</h4>
                                    <ul>
                                       	<li><a href="/">Home</a></li>
                                        <li><a href="lightList.go">번개</a></li>
                                        <li><a href="dojang.go">도장깨기</a></li>
                                        <li><a href="restaurant">맛집</a></li>
                                        <li><a href="groupReviewList">후기</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                    </div>
               </div>
                <div class="footer-bottom">
                    <div class="row d-flex justify-content-between align-items-center">
                        <div class="col-xl-9 col-lg-8">
                            <div class="footer-copy-right">
                                <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                            </div>
                        </div>
                        
                    </div>
               </div>
            </div>
        </div>
        <!-- Footer End-->
    </footer>
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>
        
        
</body>


<!-- JS here -->
		<!-- All JS Custom Plugins Link Here here -->
        <script src="../resources/mainResource/assets/js/vendor/modernizr-3.5.0.min.js"></script>
		<!-- Jquery, Popper, Bootstrap -->
		<script src="../resources/mainResource/assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="../resources/mainResource/assets/js/popper.min.js"></script>
        <script src="../resources/mainResource/assets/js/bootstrap.min.js"></script>
	    <!-- Jquery Mobile Menu -->
        <script src="../resources/mainResource/assets/js/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="../resources/mainResource/assets/js/owl.carousel.min.js"></script>
        <script src="../resources/mainResource/assets/js/slick.min.js"></script>
		<!-- One Page, Animated-HeadLin -->
        <script src="../resources/mainResource/assets/js/wow.min.js"></script>
		<script src="../resources/mainResource/assets/js/animated.headline.js"></script>
        <script src="../resources/mainResource/assets/js/jquery.magnific-popup.js"></script>

		<!-- Nice-select, sticky -->
        <script src="../resources/mainResource/assets/js/jquery.nice-select.min.js"></script>
		<script src="../resources/mainResource/assets/js/jquery.sticky.js"></script>
        
        <!-- contact js -->
        <script src="../resources/mainResource/assets/js/contact.js"></script>
        <script src="../resources/mainResource/assets/js/jquery.form.js"></script>
        <script src="../resources/mainResource/assets/js/jquery.validate.min.js"></script>
        <script src="../resources/mainResource/assets/js/mail-script.js"></script>
        <script src="../resources/mainResource/assets/js/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="../resources/mainResource/assets/js/plugins.js"></script>
        <script src="../resources/mainResource/assets/js/main.js"></script>
        <script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script> 
    </body>
<%@ include file="../../../resources/inc/footer.jsp" %>


<script>

var restaurant_no = $('#restaurant_no').val();

console.log("식당번호 확인::",restaurant_no);
	
	/* var i = ${comment.comment_no}; */
	/* var comment_no = ${comment.comment_no}; */
	var ooo = onclick="report(${comment.comment_no})"
	
	function resUp(){
		window.open('restaurantUpdate.go?restaurant_no=${resDetail.restaurant_no}',"new","width=400, height=350, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
	}
	
	function report(rep){
		window.open('resReport.go?comment_no='+rep,"new","width=430, height=350, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
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
	};
	
	function back() {
	     history.go(-1);
	 };
	
	 //유효성 검사 제한이 되었을시 폼 전송X 
	 $("#btn-write-comment").on("click",function(){
          var comment_content = $("#comment").val();
          console.log(comment_content);
          var a = true;
          	if(comment_content == null || comment_content ==''){
            	alert("댓글을 입력해 주세요.");
            	$("#comment").focus();
            	return a = false;
          	}else if(comment_content.length>300){
              	alert("최대 300자까지 입력 가능합니다.");
                $("#comment").val(comment_content.substring(0, 300));
                return a = false;
          };
          return a;
       });
	 
	 
</script>


</html>























