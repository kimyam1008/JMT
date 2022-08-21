<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>리뷰 수정 페이지</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
		<link rel="shortcut icon" type="image/x-icon" href="../resources/mainResource/assets/img/pizza-slice.png">
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
            
   <style>
   
   textarea{
		resize:none;
		width:100%;
		height:150px;
	}
   
   </style>
    
   </head>

   <body>
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="mainResource/assets/img/logo/logo.png" alt="">
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
                                  <a href="jmtMain.html"><img src="mainResource/assets/img/logo/logo.png" width="80px" alt=""></a>
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
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Hero End -->
        <!-- Categories Area Start -->
        <!--내용-->
        <!-- <div class="categories-area section-padding30">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        
                        <div class="section-tittle text-center mb-80">
                        </div>
                    </div>
                </div>
				 -->
                <!--표-->
                <div class="row">
                    <div class="col-lg-12">
                        <table style="margin:0 auto; text-align:center;">
                            <form action=reviewWrite.do method="post" enctype="multipart/form-data">
									<tr>
										<th>리뷰 작성</th>
									</tr>
									<tr>
										<td>
											<textarea name="Comment_content"></textarea>
											<input type="hidden" name="idx" value="${resDetail.restaurant_no}" />
										</td>
									    <br/>
									</tr>
									<tr>
										<td><input type="file" name="photos" multiple="multiple"/></td>
									</tr>
									<tr>
										<th colspan="2">
											<input type="submit" value="리뷰 작성"/>
											<input class="backBtn" type="button" value="돌아가기" onclick="back()"/>
										</th>
									</tr>
							</form>
                        </table>
                    </div>
                </div>
			</div>
        </div>
        <!-- Categories Area End -->
        <!--Pagination Start-->
        <!--페이징 자리인데 뭐 봐서..-->
        <!-- <div class="pagination-area pt-70 text-center">
            <div class="container" style="padding-bottom: 30px;">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="single-wrap d-flex justify-content-center">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-start">
                                    <li class="page-item active"><a class="page-link" href="#">01</a></li>
                                    <li class="page-item"><a class="page-link" href="#">02</a></li>
                                    <li class="page-item"><a class="page-link" href="#">03</a></li>
                                <li class="page-item"><a class="page-link" href="#"><span class="ti-angle-right"></span></a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <!--Pagination End  -->


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
                                        <a href="jmtMain.html"><img src="mainResource/assets/img/logo/logo.png" width="100px" alt=""></a>
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
        <script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script> 
    </body>

<script>


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