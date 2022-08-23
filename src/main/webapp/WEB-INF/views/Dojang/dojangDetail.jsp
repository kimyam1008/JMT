<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
  <meta charset="utf-8">
        <title>JMT 도장깨긴 상세보기 페이지</title>
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
            <link rel="stylesheet" href="../resources/mainResource/assets/css/animate.min.css">
            <link rel="stylesheet" href="../resources/mainResource/assets/css/magnific-popup.css">
            <link rel="stylesheet" href="../resources/mainResource/assets/css/fontawesome-all.min.css">
            <link rel="stylesheet" href="../resources/mainResource/assets/css/themify-icons.css">
            <link rel="stylesheet" href="../resources/mainResource/assets/css/slick.css">
            <link rel="stylesheet" href="../resources/mainResource/assets/css/nice-select.css">
            <link rel="stylesheet" href="../resources/mainResource/assets/css/style.css">
            
		
<style>
 table{
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
			
</style>
</head>

<body>
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
        <div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center ">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center pt-50">
                            <h2>도장깨기</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Hero End -->
        <!-- Categories Area Start -->
        <!--내용-->
      <div class="listing-area pt-120 pb-120"> 
            <div class="container">
                <!--표-->
                <div class="row">
                    <div class="col-lg-12">
                    <a href="#" onclick="report(); return false;" class="detailtest">신고</a>
                            <table>
								<tr>
									<th>모임 이름</th>
									<td>${dojangDetail.dojang_title}</td>
									<th>방장 ID</th>
									<td>${dojangDetail.leader_id}</td>
								</tr>
								<tr>
									<th>모집 인원</th>
									<td>${dojangDetail.member_count}/${dojangDetail.people_num}</td>
									<th>식사 속도</th>
									<td>${dojangDetail.eat_speed}</td>
									
								</tr>
								<tr>
									<th>모임 생성 날짜</th>
									<td>${dojangDetail.dojang_create}</td>
									<th>음식 카테고리</th>
									<td>${dojangDetail.food_name}</td>
								</tr>
									<tr>
									<th>성별</th>
									<td>${dojangDetail.gender}</td>
									<th>직업</th>
									<td>${dojangDetail.job}</td>
								</tr>
								<tr>
									<td colspan="4">
									<h5>소개글</h5>	
									${dojangDetail.dojang_content}</td>
								</tr>
								<tr>
									<td colspan="4">
										<h5>모임후기</h5>
										<ul>
										<c:if test = "${dojangGreview.size() ==0}">
											등록된 글이 없습니다.
										</c:if>
											<c:forEach items="${dojangGreview}" var="djg">
												<p>${djg.member_id}<span style="padding-right: 5px"></span>
												: <span style="padding-right: 5px"></span>
												<a href="groupReviewDetail.do?groupReview_no=${djg.groupReview_no}">${djg.review_title}</a>
											</c:forEach>
										</ul>
									</td>
								</tr>
								</table>
                           	<div style="text-align: center; height: 20px;">
                           					<input type="button" name='Apply' class="btn list-btn mt-10 col-md-2" value="신청"/>
											<input type="button" value="목록" class="btn list-btn mt-10 col-md-2" onclick="location.href='dojang.go'"/>
                             </div>     
                    </div>
                </div>
            </div>
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


<div>
	 <input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
</div>
<br/>

<input type="hidden" id="status" value="${applyStatus.status}"/>
<input type="hidden" id="profile_eat_speed" value="${profileStatus.eat_speed}"/>
<input type="hidden" id="profile_gender" value="${profileStatus.profile_gender}"/>
<input type="hidden" id="profile_job" value="${profileStatus.profile_job}"/>
<input type="hidden" id="eat_speed" value="${dojangDetail.eat_speed}"/>
<input type="hidden" id="gender" value="${dojangDetail.gender}"/>
<input type="hidden" id="job" value="${dojangDetail.job}"/>

	
</body>
<script>


console.log($("#eat_speed").val());
console.log($("#profile_eat_speed").val());


//상태에 따른 가입신청 관리
$("input:button[name='Apply']").on('click',function(){
	
	console.log($("#loginId").val());
	
	if($("#loginId").val()== ""){
		alert("로그인후 이용가능합니다.");
	}else if($("#status").val() == '대기'){
		alert("이미 신청이 완료됐습니다.");
	}else if($("#status").val() == '강퇴'){
		alert("강퇴 당한 방입니다.");
	}else if($("#status").val() == '탈퇴'){
		alert("이미 탈퇴한 방입니다.");
	}else{
		
		//프로필 상태 기반
		if($("#gender").val() !="상관없음" && $("#gender").val() != $("#profile_gender").val()){
			alert("성별 조건이 맞지않습니다.");
		}else{
			dojangApply_pop();
		}
		
	}
	
	
	
});


var msg = "${msg}";
if(msg != ""){
	alert(msg);
}



console.log($("#status").val());

//가입신청 팝업
function dojangApply_pop(){
	window.open("/dojangApply.go?dojang_no="+${dojangDetail.dojang_no},"new","width=400, height=200, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}

//신고하기 팝업
function report(){
	window.open("/dojangReport.go?dojang_no="+${dojangDetail.dojang_no},"new","width=600, height=400, left=450 ,top=200, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}

</script>

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
</html>