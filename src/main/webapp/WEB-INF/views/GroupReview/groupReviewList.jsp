<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>JMT - 모임 후기 리스트</title>
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
        <style>
            /* table,th,td {
                border:1px solid black;
                border-collapse:collapse;
            }
            th,td {
                padding:5px 10px;
            } */
             .table-caption th {
				text-align:center;
			}
			/* body {
				font-size:17px;
			} */
			
			table {
			  border-collapse: separate;
			  border-spacing: 1px;
			  text-align: left;
			  line-height: 1.5;
			  border-top: 1px solid #ccc;
			  margin : 20px 10px;
			}
			table th {
			  width: 150px;
			  padding: 10px;
			  font-weight: bold;
			  vertical-align: top;
			  border-bottom: 1px solid #ccc;
			}
			table td {
			  width: 350px;
			  padding: 10px;
			  vertical-align: top;
			  border-bottom: 1px solid #ccc;
			}
			input {
				width:350px;
				height:38px;
				margin:10px 10px;
				border:none;
				background:#f2f2f2;
				border-radius:3px;
				outline:none;
			}
			input:focus::placeholder {
				color:transparent;
			}
			input::placeholer{
				color:#222;
				transition: color 0.3s ease;
			}
			/*검색, 글쓰기 버튼*/
			#reviewSearch{
				color:#fff;
				background:orange;
				border:none;
			}
			#writeBtn {
				border:none;
				border-radius:20px;
				background:orange;
				padding:5px 13px;
				color:#fff;
			}
			#reviewSearch:focus,#writeBtn:focus{
				outline:0;
			}
			#reviewSearch:hover,#writeBtn:hover{
				background:#ff3d1c;
				cursor:pointer;
			}
			
			.notiDelBtn:hover{
				cursor : pointer;
				color : red;
			}
        </style>
    </head>

   <body>
   <input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
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
                            <h2>후기</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Hero End -->
        <!-- Categories Area Start -->
        <!--내용-->
        <div class="categories-area section-padding30">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Section Tittle -->
                        <div class="section-tittle text-center mb-80">
                            <span>Group Review</span>
                            <h2>후기 목록</h2>
                        </div>
                    </div>
                </div>

                <!--검색창-->
                <div class="row">
                    <div class="col-lg-6" style="margin:auto; margin-bottom:30px;">
                        <div>
                            <!-- <input type="hidden" id="searchCate" value="idx"/> -->
                            <select id="searchCate">
                                <option value="lightning">번개모임</option>
                                <option value="dojang">도장깨기</option>
                            </select>
                            <input type="text" id="keyword" value="" placeholder="모임 이름을 입력해주세요"/>
                            <button id="reviewSearch" style="margin:5px; padding:6px 10px;">검색</button>
                        </div>
                    </div>
                </div>
                <c:if test="${loginId != null}">
	                <button id="writeBtn" onclick="location.href='grRegisterForm.go'" style="margin:15px 5px 10px 5px">글쓰기</button><br/>
                </c:if>
                <!--표-->
                <div class="row">
                    <div class="col-lg-12">
                        <table style="margin:0 auto; text-align:center;">
                            <thead>
                                <tr class="table-caption">
                                    <th>글번호</th>
                                    <th>글 제목</th>
                                    <th>모임 종류</th>
                                    <th>모임 이름</th>
                                    <th>작성일</th>
                                </tr>
                            </thead>
                            <tbody id="list">
                    
                            </tbody>
                                <tr>
                                    <td colspan="7" id="paging">
                                        <!-- twbspagination 플러그인 -->
                                        <div class="container">
                                            <nav arial-label="Page navigation" style="text-align:center">
                                                <ul class="pagination" id="pagination"></ul>
                                            </nav>
                                        </div>
                                    </td>
                                </tr>
                        </table>
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

        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
        <script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script>
        
    </body>
<%@ include file="../../../resources/inc/footer.jsp" %>
<script>
var currPage = 1;

reviewSearch(currPage);

console.log($("#searchCate option:selected").val());
//console.log($("#groupTitle").text());


//라디오 값 변경
/* $("input[name='groupSort']").on("change",function(){
	$("#pagination").twbsPagination('destroy');
	reviewSearch(currPage);
	//console.log($("input[name='groupSort']:checked").val());
}); */

//리스트 호출
function listCall(page){
	
	var pagePerNum = 10;
	//console.log("param page : " + page);
	
	
	$.ajax({
		type:'get',
		url:'groupReviewList.ajax',
		data:{
			cnt : pagePerNum,
			page : page
		},
		dataType:'JSON',
		success:function(data){
			//console.log(data);
			drawList(data.groupReviewList);
			currPage=data.currPage;
			console.log(currPage);
			
			//플러그인 사용 페이징
			$("#pagination").twbsPagination({
				startPage:data.currPage, //시작페이지
				totalPages:data.pages, //총 페이지(전체게시물 / 한 페이지에 보여줄 게시물 수)
				visiblePages: 5, // 한번에 보여줄 페이지 수
				onPageClick:function(e,page){
					console.log(page);
					currPage=page;
					listCall(page);
				}
			});
			
		},
		error:function(e){
			console.log(e);
		}
	});
	
	
}

//검색
$('#reviewSearch').on('click',function(){
	$("#pagination").twbsPagination('destroy');
	reviewSearch(currPage);
});


function reviewSearch(page){
	
	var pagePerNum = 10;
	 
	var searchCate = $("#searchCate").val();
	console.log(searchCate);
	var keyword = $("#keyword").val();
	console.log(keyword);
	//var groupSort = $("input[name='groupSort']:checked").val();
	//console.log(groupSort);
	 
	 $.ajax({
		 type:'get',
		 url:'reviewSearch.ajax',
		 data:{
			 cnt : pagePerNum,
			 page : page,
			 //reviewSearch : reviewSearch,
			 searchCate : searchCate,
			 keyword : keyword,
			//groupSort : groupSort
		 },
		dataType:'json',
		success:function(data){
			console.log(data);
			drawList(data.groupReviewList);
			currPage = data.currPage;
			
			//플러그인 사용 페이징
			$("#pagination").twbsPagination({
				startPage:data.currPage, //시작페이지
				totalPages:data.pages, //총 페이지(전체게시물 / 한 페이지에 보여줄 게시물 수)
				visiblePages: 5, // 한번에 보여줄 페이지 수
				onPageClick:function(e,page){
					console.log(page);
					currPage=page;
					reviewSearch(page);
				}
			});
		},
		error:function(e){
			console.log(e);
		}
	 });

	}
	
	
//리스트 그리기
function drawList(groupReviewList){
	
	var content="";
	
	groupReviewList.forEach(function(item,groupReview_no){
		
		if ($("#searchCate option:selected").val() == "lightning") {
			
			//console.log(item);
			content += '<tr>';
			content += '<td>'+item.groupReview_no+'</td>';
			content += '<td><a href="groupReviewDetail.do?groupReview_no='+item.groupReview_no+'">'+item.review_title+'</a></td>';
			content += '<td>'+item.class_name+'</td>';
			content += '<td id="groupTitle">'+item.lightning_title+'</td>';	
			content += '<td>'+item.review_date+'</td>';
			content += '</tr>';
			
		} else {
			
			//console.log(item);
			content += '<tr>';
			content += '<td>'+item.groupReview_no+'</td>';
			content += '<td><a href="groupReviewDetail.do?groupReview_no='+item.groupReview_no+'">'+item.review_title+'</a></td>';
			content += '<td>'+item.class_name+'</td>';
			content += '<td>'+item.dojang_title+'</td>';
			content += '<td>'+item.review_date+'</td>';
			content += '</tr>';

		}
	});
	
	
	$('#list').empty();
	$('#list').append(content);
}




</script>
</html>