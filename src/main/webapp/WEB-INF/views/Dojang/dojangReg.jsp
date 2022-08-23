<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
<meta charset="utf-8">
        <title>JMT 모임 생성 페이지</title>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="../resources/mainResource/assets/img/pizza-slice.png">
		<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-pen.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- CSS here -->
            <link rel="stylesheet" href="../resources/mainResource/assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="../resources/mainResource/assets/css/owl.carousel.min.css">
            <link rel="stylesheet" href="../resources/mainResource/assets/css/slicknav.css">
            <link rel="stylesheet" href="../resources/mainResource/assets/css/flaticon.css">
            <link rel="stylesheet" href="../resources/mainResource/assets/css/price_rangs.css">
            <link rel="stylesheet" href="../resources/mainResource/assets/css/animate.min.css">
            <link rel="stylesheet" href="../resources/mainResource/assets/css/magnific-popup.css">
            <link rel="stylesheet" href="../resources/mainResource/assets/css/fontawesome-all.min.css">
            <link rel="stylesheet" href="../resources/mainResource/assets/css/themify-icons.css">
            <link rel="stylesheet" href="../resources/mainResource/assets/css/slick.css">
            <link rel="stylesheet" href="../resources/mainResource/assets/css/nice-select.css">
            <link rel="stylesheet" href="../resources/mainResource/assets/css/style.css">
</head>
<style>
table {
				width : 100%;
			}
		
			table,th,td {
				border : 1px solid #ccc;
		        border-left: none;
		        border-right: none;
				border-collapse : collapse;
			}
		    th {
			background-color: #f9f9f9;
		    text-align: center;
			}
		
			th,td { 
				padding : 5px 10px;
			}
			
			
			textarea{
				width:100%;
				height : 90px;
				resize : none;
			}
		
</style>

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
    <!-- Preloader Start -->
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
                                            <c:if test="${loginId != null}">
                                        <c:choose>
                                        	<c:when test="${notiChk=='true'}"><!--안읽은 알림있을 때  -->
		                                            <li><a href="#"><img  id="notidrop" src="resources/photo/noti4.png"  style="width:30px; height:25px;"/></a>
		                                               	<ul class="submenu notidrop_menu" style="width : 300px;  display : none;">
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
                                        </c:if>
                                              <c:choose>
                                            	<c:when test="${loginId != null}">
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
        <div class="hero-area3 hero-overly2 d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center pt-50">
                            <h2>도장깨기 생성</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Hero End -->
        <!-- listing Area Start -->
        <div class="listing-area pt-120 pb-120">
            <div class="container">
                <div class="row">
                    <!-- Left content -->
                   
                        <!-- Job Category Listing End -->
              
                    <!-- Right content -->
                    <div class="col-xl-12 col-lg-12 col-md-12">
                        <!-- listing Details Stat-->
                        <!--리스트 시작-->
                       
                        <div class="listing-details-area">
                            <div class="container">
                                <div class="row">
                                    <!--넣을 내용 입력-->
                                    <div class="col-md-12">
                                        <table>
										<tr>
											<th>모임 이름</th>
											<td><input type="text" id="dojang_title"/></td>
											<th>음식 카테고리</th>
											<td>
											 <select id="food_no" name="food_no">
                                       		 	<option value="">음식카테고리</option>
		                                            <c:forEach items="${foodList}" var="foodList">
		                                                <option value="${foodList.food_no}">${foodList.food_name}</option>
		                                            </c:forEach>
                                    		</select>
											</td>
										</tr>
										<tr>
											<th>인원수</th>
											<td>
												<input type="range" id="points" min="0" max="30" step="1" value="0" oninput="document.getElementById('people_num').innerHTML=this.value;">
										        <span id="people_num"></span>명
											</td>
											<th>식사 속도</th>
											<td>
											<select id='eat_speed'>
											    <option value='' selected>식사속도</option>
											    <option value='빠름'>빠름</option>
											    <option value='보통'>보통</option>
											    <option value='느림'>느림</option>
											    <option value='상관없음'>상관없음</option>
											</select>
											</td>
										</tr>
										<tr>
											<th>성별</th>
											<td>
												<input type="radio" name="gender" value="남자"/>남자
												<input type="radio" name="gender" value="여자"/>여자
												<input type="radio" name="gender" value="상관없음"/>상관없음
											</td>
											<th>직업</th>
											<td>
												<select id='job'>
											    <option value='' selected>직업</option>
											    <option value='직장인'>직장인</option>
											    <option value='취준생'>취준생</option>
											    <option value='학생'>학생</option>
												<option value='상관없음'>상관없음</option>
											</select>
											</td>
										</tr>
										<tr>
											<th>소개글</th>
											<td colspan="3">
											<textarea id="dojang_content" placeholder="내용을 입력해주세요"></textarea>
											</td>
										</tr>
										</table>
                                        <div  style="text-align: center;">
												<button type="button" class="btn list-btn mt-10 col-md-2" onclick="dojangReg()">저장</button>
												<input type="button" class="btn list-btn mt-10 col-md-2" value="취소" onclick="location.href='dojang.go'"/>
 										</div>   
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <!-- listing Details End -->
                        <!--Pagination Start  -->
                        <!--페이징 자리인데 뭐 봐서..-->
                       
                        <!--Pagination End  -->
                    </div>
                </div>
            </div>
        </div>
        <!-- listing-area Area End -->

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
                                        <a href="/"><img src="../resources/mainResource/assets/img/logo/logo.png" width="100px" alt=""></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-2 col-md-4 col-sm-6">
                            <div class="single-footer-caption mb-50">
                                <div class="footer-tittle">
                                    <h4>Quick Link</h4>
                                    <ul>
                                        <li><a href="jmtMain.html">Home</a></li>
                                        <li><a href="lightningList.html">번개</a></li>
                                        <li><a href="dojangList.html">도장깨기</a></li>
                                        <li><a href="resList.html">맛집</a></li>
                                        <li><a href="moimReviewList.html">후기</a></li>
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
    
<h3>도장깨기 생성</h3>
<input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
	
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
        <script src="../resources/mainResource/assets/js/price-range.js"></script>
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
        


<script>


function dojangReg() {
	
	var dojang_title = $('#dojang_title').val();
	var food_name = $('#food_no option:selected').val();
	var points = $('#points').val();
	var eat_speed = $('#eat_speed option:selected').val();
	var gender = $('input[name="gender"]:checked').val();
	var job = $('#job option:selected').val();
	var dojang_content = $('#dojang_content').val();
	var loginId = $('#loginId').val();
	
	//유효성 체크
	if(food_name == ""){
		alert("음식 카테고리를 선택해주세요");
		
	}else if(dojang_content ==""){
		alert("소개글을 작성해주세요");
		dojang_content.focus();
		
	}else if(dojang_title == ""){
		alert("제목을 입력해주세요.");
		dojang_title.focus();
		
	}else if(eat_speed == ""){
		alert("식사속도를 선택해주세요.");
		
	}else if(gender == null){
		alert("성별을 선택해주세요.");
		
	}else if(job == ""){
		alert("직업을 입력해주세요.");
		
	}else if(points == 0){
		alert("인원을 선택해주세요.");
	
	}else{
		

		$.ajax({
			type:'get',
			url:'dojangReg.ajax',
			data:{
				dojang_title:dojang_title,
				food_name:food_name,
				points:points,
				eat_speed:eat_speed,
				gender:gender,
				job:job,
				dojang_content:dojang_content,
				loginId:loginId
			},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				if(data.dojangReg){
					console.log(data.dojangReg)
					location.href='dojang.go';
				}else{
					alert("등록 실패");
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	}
}



console.log($('#loginId').val());



</script>
</html>