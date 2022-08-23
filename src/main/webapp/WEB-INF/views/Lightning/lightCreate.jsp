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
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-pen.css" rel="stylesheet">
		
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
			
			#restaurant_name {
				display : inline-block;
			}
			
			textarea[name="lightning_content"]{
				width:100%;
				height : 90px;
				resize : none;
			}
		
		    .searchBtn {
		        border-radius: 5px;
		        color: black;
		    }
		    
		    .notiDelBtn:hover{
				cursor : pointer;
				color : red;
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
                                                    <li><a href="/lightList.go">번개</a></li>
                                                    <li><a href="/dojang.go">도장깨기</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="/restaurant">맛집</a></li>
                                            <li><a href="/groupReviewList">후기</a></li>
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
        <div class="hero-area3 hero-overly2 d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center pt-50">
                            <h2>번개모임 생성</h2>
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
                                        <form action="lightCreate.do" method="post" onsubmit="return chkCreate()">
                                            <table>
                                                <tr>
                                                    <th>모임 이름</th>
                                                    <Td colspan="3"><input type="text" name="lightning_title"/></Td>
                                                </tr>
                                                <tr>
                                                    <th>맛집 이름</th>
                                                    <td>
                                                        <input type="hidden" name="restaurant_no" id="restaurant_no" />
                                                        <p id="restaurant_name">맛집을 검색해 주세요.</p>
                                                        <button type="button" class="searchBtn" onclick="restaurantSearch_pop()">검색</button>
                                                    </td>
                                                    <th>모임 날짜</th>
                                                    <td><input type="date" name ="lightning_date" ></td>
                                                </tr>
                                                <tr>
                                                    <th>음식 카테고리<input type="hidden" name="food_no" id="food_no" /></th>
                                                    <td><p id="food_name"></p></td>
                                                    <th>인원 수</th>
                                                    <td> 
                                                        2~6 :  <input type="range" name="member_num" min="2" max="6" value="2" step="1"/>
                                                        <span id="msg"></span>명
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>식사 속도</th>
                                                    <td>
                                                        <select name="eat_speed">
                                                            <option value="">식사속도</option>
                                                            <option value="느림">느림</option>
                                                            <option value="보통">보통</option>
                                                            <option value="빠름">빠름</option>
                                                            <option value="상관없음">상관없음</option>
                                                        </select>
                                                    </td>
                                                    <th>성별</th>
                                                    <td>
                                                        <select name="gender">
                                                            <option value="">성별</option>
                                                            <option value="남자">남자</option>
                                                            <option value="여자">여자</option>
                                                            <option value="상관없음">상관없음</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>직업</th>
                                                    <td>
                                                        <select name="job">
                                                            <option value="">직업</option>
                                                            <option value="직장인">직장인</option>
                                                            <option value="취준생">취준생</option>
                                                            <option value="학생">학생</option>
                                                            <option value="상관없음">상관없음</option>
                                                        </select>
                                                    </td>
                                                    <th>방상태</th>
                                                    <td>
                                                            <select>
                                                                <option value="모집중">모집중</option>
                                                                <option value="모집마감" disabled>모집마감</option>
                                                            </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>소개글</th>
                                                    <td colspan="3">
                                                        <textarea name="lightning_content"></textarea>
                                                    </td>
                                                </tr>
                                            </table>
                                            <div  style="text-align: center;">
                                                <button type="submit" class="btn list-btn mt-10 col-md-2" >생성</button>
                                                <button type="button" class="btn list-btn mt-10 col-md-2" onclick="location.href='/lightList.go'">취소</button>
                                            </div>   
                                        </form>
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
</body>
<%@ include file="../../../resources/inc/footer.jsp" %>
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
	var i = $('input[type="range"]').val();
	$("#msg").html(i);
	
	$('input[type="range"]').on("change input", function(){ //input 이벤트 : 끌고있을 때 
	var i = $(this).val(); 
	$("#msg").html(i); 
	});

	//모임날짜 오늘 날짜부터 나오게 
	var today = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString();
	var today_Date = today.slice(0, 10);
	$('input[name="lightning_date"]').attr("min", today_Date);
	var max_Date = new Date(new Date().getTime()+new Date("60")); // 7일 더하여 setting
	console.log(max_Date);
	$('input[name="lightning_date"]').attr("max", max_Date);
	
	//생성 버튼 눌렀을 시 유효성 검사
	function chkCreate(){
		if($('input[name="lightning_title"]').val()==""){
			alert("모임 이름을 입력해 주세요");
			return false;
		}else if($('#restaurant_no').val() == ""){
			alert("맛집을 검색해 주세요");
			return false;
		}else if($('input[name="lightning_date"]').val() == ""){
			alert("모임 날짜를 지정해 주세요");
			return false;
		}else if($('select[name="eat_speed"]').val() == ""){
			alert("식사 속도를 선택해 주세요");
			return false;
		}else if($('select[name="gender"]').val() == ""){
			alert("성별을 선택해 주세요");
			return false;
		}else if($('select[name="job"]').val() == ""){
			alert("직업을 선택해 주세요");
			return false;
		}else if($('textarea[name="lightning_content"]').val() == ""){
			alert("모임 소개글을 입력해 주세요");
			return false;
		}	
	}
	
	//소개글 글자 수 제한
	$('textarea').keyup(function(){
		var content = $(this).val();
			if (content.length > 300){
				alert("최대 300자까지 입력 가능합니다.");
				$(this).val(content.substring(0, 300));
			}
	});
	
	$('input[name="lightning_title"]').keyup(function(){
		var content = $(this).val();
			if (content.length > 30){
				$(this).val(content.substring(0, 30));
			}
	});
	
	function restaurantSearch_pop(){
		window.open("/lightResSearch.go","new","width=600, height=400, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
	}
	
	
	
</script>
</html>