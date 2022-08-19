<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>JMT </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
		<link rel="shortcut icon" type="image/x-icon" href="../resources/mainResource/assets/img/pizza-slice.png">
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-pen.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
   </head>

   <body>
   <input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
    <!-- 로고 시작 -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="../resources/mainResource/assets/img/logo/logo.png" width="80" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- 로고 끝 -->
    <header>
        <!-- 헤더 시작 -->
       <div class="header-area header-transparent">
            <div class="main-header">
               <div class="header-bottom  header-sticky">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2 col-md-1">
                                <div class="logo">
                                  <a href="/"><img src="../resources/mainResource/assets/img/logo/logo.png" width="80" alt=""></a>
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
	                                            	<li id="logoutDo"><a href="logout.do">로그아웃</a></li>
	                                            	<li class="add-list"><a href="./mypage.go"><i class="ti-user"></i>마이페이지</a></li>
                                            	</c:when>
                                            	<c:otherwise>
		                                            <li class="add-list"><a href="login.go"><i class="ti-user"></i>로그인</a></li>
                                            	</c:otherwise>
                                            </c:choose>
                                            <!-- <li id="mypageGo"><a href="./mypage.go">마이페이지</a></li> -->
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
        <!-- 헤더 끝 -->
    </header>
    <main>

        <!--검색창 큰거-->
        <div class="slider-area hero-overly">
            <div class="single-slider hero-overly  slider-height d-flex align-items-center">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-8 col-lg-9">
                            <!-- Hero Caption -->
                            <div class="hero__caption">
                                <span>Eat Together</span>
                                <h1>세상에서 가장 맛있는 만남, JMT</h1>
                            </div>
                            <!--Hero form -->
                            <form action="#" class="search-box">
                                <div class="input-form">
                                    <input type="text" placeholder="검색어를 입력하세요">
                                </div>
                                <div class="select-form">
                                    <div class="select-itms">
                                        <select name="select" id="select1">
                                            <option value="">맛집</option>
                                            <option value="">번개</option>
                                            <option value="">도장깨기</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="search-form">
                                    <a href="#">Search</a>
                                </div>	
                            </form>	
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!--검색창 큰거 끝-->

        <!--모임 추천 리스트-->
        <div class="popular-location section-padding30">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Section Tittle -->
                        <div class="section-tittle text-center mb-80">
                            <span>Editor's Pick</span>
                            <h2>이런 모임은 어떠세요?</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
               
               <!-- 번개목록 -->
              <c:forEach items="${lightDto}" var="lightDto" begin="0" end="2">
                	<div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                            	<%-- <c:choose> --%>
                            		<c:if test="${lightDto.food_no eq 1}">
                            			 <a href=""><img src="../resources/photo/food_no/1.jpg" alt=""></a>
                            		</c:if>
                            		<c:if test="${lightDto.food_no eq 2}">
                            			 <a href=""><img src="../resources/photo/food_no/2.jpg" alt=""></a>
                            		</c:if>
                            		<c:if test="${lightDto.food_no eq 3}">
                            			 <a href=""><img src="../resources/photo/food_no/3.jpg" alt=""></a>
                            		</c:if>
                            		<c:if test="${lightDto.food_no eq 4}">
                            			 <a href=""><img src="../resources/photo/food_no/4.jpg" alt=""></a>
                            		</c:if>
                            		<c:if test="${lightDto.food_no eq 5}">
                            			 <a href=""><img src="../resources/photo/food_no/5.jpg" alt=""></a>
                            		</c:if>
                            		<c:if test="${lightDto.food_no eq 6}">
                            			 <a href=""><img src="../resources/photo/food_no/6.jpg" alt=""></a>
                            		</c:if>
                            	<%-- </c:choose> --%>
                               <!--  <img src="../resources/mainResource/assets/img/gallery/hamburger.jpg" alt=""> -->
                            </div>
                            <div class="location-details">
                                <p>${lightDto.lightning_title}</p>
                                <a href="#" class="location-btn"><i class="ti-bolt-alt"></i> 번개</a>
                            </div>
                        </div>
                    </div>
               </c:forEach>
               <!-- 번개목록 끝 -->
                
                <!-- 도장깨기 목록 -->
                <c:forEach items="${dojangDto}" var="dojangDto" begin="0" end="2">
                	<div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                            	<%-- <c:choose> --%>
                            		<c:if test="${dojangDto.food_no eq 1}">
                            			 <a href=""><img src="../resources/photo/food_no/1.jpg" alt=""></a>
                            		</c:if>
                            		<c:if test="${dojangDto.food_no eq 2}">
                            			 <a href=""><img src="../resources/photo/food_no/2.jpg" alt=""></a>
                            		</c:if>
                            		<c:if test="${dojangDto.food_no eq 3}">
                            			 <a href=""><img src="../resources/photo/food_no/3.jpg" alt=""></a>
                            		</c:if>
                            		<c:if test="${dojangDto.food_no eq 4}">
                            			 <a href=""><img src="../resources/photo/food_no/4.jpg" alt=""></a>
                            		</c:if>
                            		<c:if test="${dojangDto.food_no eq 5}">
                            			 <a href=""><img src="../resources/photo/food_no/5.jpg" alt=""></a>
                            		</c:if>
                            		<c:if test="${dojangDto.food_no eq 6}">
                            			 <a href=""><img src="../resources/photo/food_no/6.jpg" alt=""></a>
                            		</c:if>
                            	<%-- </c:choose> --%>
                               <!--  <img src="../resources/mainResource/assets/img/gallery/hamburger.jpg" alt=""> -->
                            </div>
                            <div class="location-details">
                                <p>${dojangDto.dojang_title}</p>
                                <a href="#" class="location-btn"><i class="ti-hummer"></i> 도장깨기</a>
                            </div>
                        </div>
                    </div>
               </c:forEach>
               <!-- 도장깨기 목록 끝 -->
                
                    <!-- <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="../resources/mainResource/assets/img/gallery/hamburger.jpg" alt="">
                            </div>
                            <div class="location-details">
                                <p>햄버거 먹을 사람 급구</p>
                                <a href="#" class="location-btn"><i class="ti-bolt-alt"></i> 번개</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="../resources/mainResource/assets/img/gallery/brunch.jpg" alt="">
                            </div>
                            <div class="location-details">
                                <p>브런치먹자</p>
                                <a href="#" class="location-btn"><i class="ti-bolt-alt"></i> 번개</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="../resources/mainResource/assets/img/gallery/salad.jpg" alt="">
                            </div>
                            <div class="location-details">
                                <p>풀만 먹는 사람들</p>
                                <a href="#" class="location-btn"><i class="ti-hummer"></i> 도장깨기</a>
                            </div>
                        </div>
                    </div> -->
                    
                    <!-- <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="../resources/mainResource/assets/img/gallery/pizza.jpg" alt="">
                            </div>
                            <div class="location-details">
                                <p>파파존스 먹을래?</p>
                                <a href="#" class="location-btn"><i class="ti-bolt-alt"></i> 번개</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="../resources/mainResource/assets/img/gallery/bread.jpg" alt="">
                            </div>
                            <div class="location-details">
                                <p>따따베 좋아하는 사람 다 모여!!</p>
                                <a href="#" class="location-btn"><i class="ti-hummer"></i> 도장깨기</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="../resources/mainResource/assets/img/gallery/toast.jpg" alt="">
                            </div>
                            <div class="location-details">
                                <p>토스트 한달먹기</p>
                                <a href="#" class="location-btn"><i class="ti-hummer"></i> 도장깨기</a>
                            </div>
                        </div>
                    </div> -->
                </div>
                <!-- More Btn -->
                <!--더보기 버튼-->
                <div class="row justify-content-center">
                    <div class="room-btn pt-20">
                        <a href="lightList.go" class="btn view-btn1">더 많은 모임 찾기</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- 모임 추천 리스트 끝 -->

        <!--맛집 소개-->
        <div class="home-blog-area section-padding30" style="background-image: url(../resources/mainResource/assets/img/gallery/section_bg04.jpg);">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Section Tittle -->
                        <div class="section-tittle text-center mb-70">
                            <span>Best Restaurant</span>
                            <h2 style="color: white;">맛집 추천</h2>
                        </div> 
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                        <div class="single-team mb-30">
                            <div class="team-img">
                                <img src="../resources/mainResource/assets/img/gallery/home_blog1.png" alt="">
                            </div>
                            <div class="team-caption">
                                <span>금천구</span>
                                <h3><a href="blog.html" style="color: #fff;">윤셰프</a></h3>
                                <p style="color: #f4e700;">October 6, 2020 by Steve</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                        <div class="single-team mb-30">
                            <div class="team-img">
                                <img src="../resources/mainResource/assets/img/gallery/home_blog2.png" alt="">
                            </div>
                            <div class="team-caption">
                                <span>금천구</span>
                                <h3><a href="blog.html" style="color: #fff;">김가네</a></h3>
                                <p style="color: #f4e700;">October 6, 2020by Steve</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                        <div class="single-team mb-30">
                            <div class="team-img">
                                <img src="../resources/mainResource/assets/img/gallery/home_blog3.png" alt="">
                            </div>
                            <div class="team-caption">
                                <span>금천구</span>
                                <h3><a href="blog.html" style="color: #fff;">국수나무</a></h3>
                                <p style="color: #f4e700;">October 6, 2020 by Steve</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 맛집 소개 끝 -->

      
        <!--모임 후기-->
        <div class="testimonial-area testimonial-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Section Tittle -->
                        <div class="section-tittle text-center mb-80">
                            <span>Group Review</span>
                            <h2>모임 후기</h2>
                        </div> 
                    </div>
                </div>
                <div class="row align-items-center">
                    <div class="col-lg-11 col-md-11">
                        <div class="h1-testimonial-active">
                            <!-- Single Testimonial -->
                            <div class="single-testimonial text-center">
                                <!-- Testimonial Content -->
                                <div class="testimonial-caption ">
                                    <div class="testimonial-top-cap">
                                        <p>헤어질 결심 본 사람이 아무도 없었어요</p>
                                    </div>
                                    <!-- founder -->
                                    <div class="testimonial-founder d-flex align-items-center justify-content-center mb-30">
                                        <div class="founder-img">
                                            <img src="../resources/mainResource/assets/img/testmonial/Homepage_testi.png" alt="">
                                        </div>
                                        <div class="founder-text">
                                            <span>이준호</span>
                                            <p>밥먹을 결심</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Testimonial -->
                            <div class="single-testimonial text-center">
                                <!-- Testimonial Content -->
                                <div class="testimonial-caption ">
                                    <div class="testimonial-top-cap">
                                        <p>채식인데도 맛있게 잘 먹었어요</p>
                                    </div>
                                    <!-- founder -->
                                    <div class="testimonial-founder d-flex align-items-center justify-content-center mb-30">
                                        <div class="founder-img">
                                            <img src="../resources/mainResource/assets/img/testmonial/Homepage_testi.png" alt="">
                                        </div>
                                        <div class="founder-text">
                                            <span>김준호</span>
                                            <p>풀만 먹는 사람들</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 모임후기 끝 -->
        
       
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
        
    </body>
    
    <script>
    	//var loginId = ${loginId};
    	//console.log(loginId);
    	
    	console.log($('#loginId').val());
    </script>
</html>