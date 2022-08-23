<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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
	<style>
		.notiDelBtn:hover{
			cursor : pointer;
			color : red;
		}		
	</style>
   <body>
   <input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
  <%-- <input type="hidden" id="lightning_no" value="${lightDto.lightning_no}"/> --%>
  <%-- <input type="hidden" id="dojang_no" value="${dojangDto.dojang_no}"/> --%>
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
                            <form class="search-box">
                                <div class="input-form">
                                    <input id="keyword" name="keyword" type="text" placeholder="검색어를 입력하세요" value=""/>
                                </div>
                                <div class="select-form">
                                    <div class="select-itms">
                                        <select name="select" id="select1">
                                            <option value="맛집">맛집</option>
                                            <option value="번개">번개</option>
                                            <option value="도장깨기">도장깨기</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="search-form">
                                    <a onclick="goSearch()" id="main-search">Search</a>
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
               
               
               <c:choose>
               		<c:when test="${loginId != null and lightReco.size() !=0 and dojangReco.size() !=0}">
           			 <!-- 로그인 했을 때 모임 추천 -->
               			<!-- 번개 추천목록 -->
			              <c:forEach items="${lightReco}" var="lightReco" begin="0" end="2">
			                	<div class="col-lg-4 col-md-6 col-sm-6">
			                        <div class="single-location mb-30">
			                            <div class="location-img">
			                            	<%-- <c:choose> --%>
			                            		<c:if test="${lightReco.food_no eq 1}">
			                            			 <a href="lightDetail.go?lightning_no=${lightReco.lightning_no}"><img src="../resources/photo/food_no/1.jpg" alt=""></a>
			                            		</c:if>
			                            		<c:if test="${lightReco.food_no eq 2}">
			                            			 <a href="lightDetail.go?lightning_no=${lightReco.lightning_no}"><img src="../resources/photo/food_no/2.jpg" alt=""></a>
			                            		</c:if>
			                            		<c:if test="${lightReco.food_no eq 3}">
			                            			 <a href="lightDetail.go?lightning_no=${lightReco.lightning_no}"><img src="../resources/photo/food_no/3.jpg" alt=""></a>
			                            		</c:if>
			                            		<c:if test="${lightReco.food_no eq 4}">
			                            			 <a href="lightDetail.go?lightning_no=${lightReco.lightning_no}"><img src="../resources/photo/food_no/4.jpg" alt=""></a>
			                            		</c:if>
			                            		<c:if test="${lightReco.food_no eq 5}">
			                            			 <a href="lightDetail.go?lightning_no=${lightReco.lightning_no}"><img src="../resources/photo/food_no/5.jpg" alt=""></a>
			                            		</c:if>
			                            		<c:if test="${lightReco.food_no eq 6}">
			                            			 <a href="lightDetail.go?lightning_no=${lightReco.lightning_no}"><img src="../resources/photo/food_no/6.jpg" alt=""></a>
			                            		</c:if>
			                            	<%-- </c:choose> --%>
			                            </div>
			                            <div class="location-details">
			                                <p><a href="lightDetail.go?lightning_no=${lightReco.lightning_no}" style="color:white">${lightReco.lightning_title}</a></p>
			                                <a href="lightDetail.go?lightning_no=${lightReco.lightning_no}" class="location-btn"><i class="ti-bolt-alt"></i> 번개</a>
			                            </div>
			                        </div>
			                    </div>
			               </c:forEach>
			               <!-- 번개 추천목록 끝 -->
			                
			                <!-- 도장깨기 추천목록 -->
			                <c:forEach items="${dojangReco}" var="dojangReco" begin="0" end="2">
			                	<div class="col-lg-4 col-md-6 col-sm-6">
			                        <div class="single-location mb-30">
			                            <div class="location-img">
			                            	<%-- <c:choose> --%>
			                            		<c:if test="${dojangReco.food_no eq 1}">
			                            			 <a href="dojangDetail.do?dojang_no=${dojangReco.dojang_no}"><img src="../resources/photo/food_no/1.jpg" alt=""></a>
			                            		</c:if>
			                            		<c:if test="${dojangReco.food_no eq 2}">
			                            			 <a href="dojangDetail.do?dojang_no=${dojangReco.dojang_no}"><img src="../resources/photo/food_no/2.jpg" alt=""></a>
			                            		</c:if>
			                            		<c:if test="${dojangReco.food_no eq 3}">
			                            			 <a href="dojangDetail.do?dojang_no=${dojangReco.dojang_no}"><img src="../resources/photo/food_no/3.jpg" alt=""></a>
			                            		</c:if>
			                            		<c:if test="${dojangReco.food_no eq 4}">
			                            			 <a href="dojangDetail.do?dojang_no=${dojangReco.dojang_no}"><img src="../resources/photo/food_no/4.jpg" alt=""></a>
			                            		</c:if>
			                            		<c:if test="${dojangReco.food_no eq 5}">
			                            			 <a href="dojangDetail.do?dojang_no=${dojangReco.dojang_no}"><img src="../resources/photo/food_no/5.jpg" alt=""></a>
			                            		</c:if>
			                            		<c:if test="${dojangReco.food_no eq 6}">
			                            			 <a href="dojangDetail.do?dojang_no=${dojangReco.dojang_no}"><img src="../resources/photo/food_no/6.jpg" alt=""></a>
			                            		</c:if>
			                            	<%-- </c:choose> --%>
			                            </div>
			                            <div class="location-details">
			                                <p><a href="dojangDetail.do?dojang_no=${dojangReco.dojang_no}" style="color:white">${dojangReco.dojang_title}</a></p>
			                                <a href="dojangDetail.do?dojang_no=${dojangReco.dojang_no}" class="location-btn"><i class="ti-hummer"></i> 도장깨기</a>
			                            </div>
			                        </div>
			                    </div>
			               </c:forEach>
			               <!-- 도장깨기 목록 끝 -->
               		</c:when>
               		
               		<c:otherwise>
               		<!-- 로그인 안하거나 추천목록이 없을 때 -->
               			 <!-- 번개목록 -->
			              <c:forEach items="${lightDto}" var="lightDto" begin="0" end="2">
			                	<div class="col-lg-4 col-md-6 col-sm-6">
			                        <div class="single-location mb-30">
			                            <div class="location-img">
			                            	<%-- <c:choose> --%>
			                            		<c:if test="${lightDto.food_no eq 1}">
			                            			 <a href="lightDetail.go?lightning_no=${lightDto.lightning_no}"><img src="../resources/photo/food_no/1.jpg" alt=""></a>
			                            		</c:if>
			                            		<c:if test="${lightDto.food_no eq 2}">
			                            			 <a href="lightDetail.go?lightning_no=${lightDto.lightning_no}"><img src="../resources/photo/food_no/2.jpg" alt=""></a>
			                            		</c:if>
			                            		<c:if test="${lightDto.food_no eq 3}">
			                            			 <a href="lightDetail.go?lightning_no=${lightDto.lightning_no}"><img src="../resources/photo/food_no/3.jpg" alt=""></a>
			                            		</c:if>
			                            		<c:if test="${lightDto.food_no eq 4}">
			                            			 <a href="lightDetail.go?lightning_no=${lightDto.lightning_no}"><img src="../resources/photo/food_no/4.jpg" alt=""></a>
			                            		</c:if>
			                            		<c:if test="${lightDto.food_no eq 5}">
			                            			 <a href="lightDetail.go?lightning_no=${lightDto.lightning_no}"><img src="../resources/photo/food_no/5.jpg" alt=""></a>
			                            		</c:if>
			                            		<c:if test="${lightDto.food_no eq 6}">
			                            			 <a href="lightDetail.go?lightning_no=${lightDto.lightning_no}"><img src="../resources/photo/food_no/6.jpg" alt=""></a>
			                            		</c:if>
			                            	<%-- </c:choose> --%>
			                            </div>
			                            <div class="location-details">
			                                <p><a href="lightDetail.go?lightning_no=${lightDto.lightning_no}" style="color:white">${lightDto.lightning_title}</a></p>
			                                <a href="lightDetail.go?lightning_no=${lightDto.lightning_no}" class="location-btn"><i class="ti-bolt-alt"></i> 번개</a>
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
			                            			 <a href="dojangDetail.do?dojang_no=${dojangDto.dojang_no}"><img src="../resources/photo/food_no/1.jpg" alt=""></a>
			                            		</c:if>
			                            		<c:if test="${dojangDto.food_no eq 2}">
			                            			 <a href="dojangDetail.do?dojang_no=${dojangDto.dojang_no}"><img src="../resources/photo/food_no/2.jpg" alt=""></a>
			                            		</c:if>
			                            		<c:if test="${dojangDto.food_no eq 3}">
			                            			 <a href="dojangDetail.do?dojang_no=${dojangDto.dojang_no}"><img src="../resources/photo/food_no/3.jpg" alt=""></a>
			                            		</c:if>
			                            		<c:if test="${dojangDto.food_no eq 4}">
			                            			 <a href="dojangDetail.do?dojang_no=${dojangDto.dojang_no}"><img src="../resources/photo/food_no/4.jpg" alt=""></a>
			                            		</c:if>
			                            		<c:if test="${dojangDto.food_no eq 5}">
			                            			 <a href="dojangDetail.do?dojang_no=${dojangDto.dojang_no}"><img src="../resources/photo/food_no/5.jpg" alt=""></a>
			                            		</c:if>
			                            		<c:if test="${dojangDto.food_no eq 6}">
			                            			 <a href="dojangDetail.do?dojang_no=${dojangDto.dojang_no}"><img src="../resources/photo/food_no/6.jpg" alt=""></a>
			                            		</c:if>
			                            	<%-- </c:choose> --%>
			                            </div>
			                            <div class="location-details">
			                                <p><a href="dojangDetail.do?dojang_no=${dojangDto.dojang_no}" style="color:white">${dojangDto.dojang_title}</a></p>
			                                <a href="dojangDetail.do?dojang_no=${dojangDto.dojang_no}" class="location-btn"><i class="ti-hummer"></i> 도장깨기</a>
			                            </div>
			                        </div>
			                    </div>
			               <!-- 도장깨기 목록 끝 -->
			               </c:forEach>
               		</c:otherwise>
               </c:choose>
               
               
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
                
                <c:forEach items="${resDto}" var="resDto" begin="0" end="2">
                 <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                        <div class="single-team mb-30">
                            <div class="team-img">
                            	<c:choose>
                            		<c:when test="${resDto.photo_newFileName eq null}">
                            			<a href="resDetail.do?restaurant_no=${resDto.restaurant_no}"><img src="../resources/photo/food_no/restaurant.jpg" alt=""></a>
                            		</c:when>
                            		<c:otherwise>
                            			<a href="resDetail.do?restaurant_no=${resDto.restaurant_no}"><img src="/photo/${resDto.photo_newFileName}" alt=""></a>
                            		</c:otherwise>
                            	</c:choose>  
                            </div>
                            <div class="team-caption">
                                <span>용산구</span>
                                <h3><a href="resDetail.do?restaurant_no=${resDto.restaurant_no}" style="color: #fff;">${resDto.restaurant_name}</a></h3>
                                <p style="color: #f4e700;">${resDto.restaurant_address}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
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
                            
                           
                          <c:forEach items="${grDto}" var="grDto" begin="0" end="4">
	                            <div class="single-testimonial text-center">
	                                <div class="testimonial-caption ">
	                                    <div class="testimonial-top-cap">
	                                        <p><a href="groupReviewDetail.do?groupReview_no=${grDto.groupReview_no}">${grDto.review_title}</a></p>
	                                    </div>
	                                    <div class="testimonial-founder d-flex align-items-center justify-content-center mb-30">
	                                        <div class="founder-img">
	                                        	<c:choose>
	                                        		<c:when test="${grDto.photo_newFileName eq null}">
	                                        			 <img src="../resources/etcResource/assets/img/default-avatar.png" alt="" style="weight:82px; height:82px; border-radius:50%;">
	                                        		</c:when>
	                                        		<c:otherwise>
	                                        			<img src="/photo/${grDto.photo_newFileName}" alt="" style="weight:82px; height:82px; border-radius:50%;">
	                                        		</c:otherwise>
	                                        	</c:choose>                     
	                                        </div>
	                                        <div class="founder-text">
	                                            <span>${grDto.member_name}</span>
	                                            <c:choose>
	                                            	<c:when test="${grDto.lightning_title eq null}">
	                                            		<p>${grDto.dojang_title}</p>
	                                            	</c:when>
	                                            	<c:otherwise>
	                                            		<p>${grDto.lightning_title}</p>
	                                            	</c:otherwise>
	                                            </c:choose>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
                            </c:forEach>
                            
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
    
		var msg = "${msg}";
		if (msg != "") {
			alert(msg);
		}
    
    	//var loginId = ${loginId};
    	//console.log(loginId);
    	
    	console.log($('#loginId').val());
    	
    	
    	//크롤링
    	function goSearch(){
 			var keyword = $('#keyword').val();
    		
    		if(keyword != ''){
				console.log(keyword);
				console.log($('#select1 option:selected').val());
    			
   				if($('#select1 option:selected').val() == '맛집'){

   					$.ajax({
   						type:'get',
   						url:'searchRes.ajax',
   						data:{keyword:keyword},
   						dataType:'JSON',
   						success:function(data){
   							console.log(data);
   						},
   						error:function(e){
   							console.log(e);
   						}
   						
   					});
   					
    			} else if($('#select1 option:selected').val() == '번개') {
    				
    				$.ajax({
   						type:'get',
   						url:'searchLight.ajax',
   						data:{keyword:keyword},
   						dataType:'JSON',
   						success:function(data){
   							console.log(data);
   						},
   						error:function(e){
   							console.log(e);
   						}
   						
   					});
    				
    			} else {
    				
    				$.ajax({
   						type:'get',
   						url:'searchDojang.ajax',
   						data:{keyword:keyword},
   						dataType:'JSON',
   						success:function(data){
   							console.log(data);
   						},
   						error:function(e){
   							console.log(e);
   						}
   						
   					});
    				
    			}
   				
    			
    		} else {
    			alert("검색어를 입력해주세요.");
    			//lacation.reload();
    		}
    	}
    </script>
</html>