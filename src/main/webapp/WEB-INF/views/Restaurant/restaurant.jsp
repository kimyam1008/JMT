<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>맛집 리스트</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
		<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-pen.css" rel="stylesheet">
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
   
   	table {
		border-collapse: separate;
		border-spacing: 1px;
		text-align: left;
		line-height: 1.5;
		border-top: 1px solid #ccc;
		width : 1000px;
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
	
   #paging {
   		margin: 0;
		position: absolute;
		top: 100%;
		left: 30%;
		/* -ms-transform: translate(-50%, -50%); */
		/* transform: translate(-50%, -50%); */
   }
   
   .notiDelBtn:hover{
		cursor : pointer;
		color : red;
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
                            <h2>맛집</h2>
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
                            <span>Restaurant</span>
                            <h2 style="font-family: 'NanumPen',sans-serif;">맛집 목록</h2>
                        </div>
                    </div>
                </div>
				
                <!--검색창-->
                <div class="row">
                    <div class="col-lg-12">
                        <div style="margin:0 auto; text-align:center; padding-bottom: 15px;">
                        	<input type="text" id="search" placeholder="식당 이름을 입력해주세요" size=80 maxlength=100/>
                        	<!-- <input type="text" id="search" placeholder="맛집 검색해주세요"> -->
							<button id="moimSearch">검색</button>
							<select id="food_name" name="food_name">
								<option value="">음식카테고리</option>
								<c:forEach items="${foodList}" var="foodname">
                             		<option value="${foodname.food_no}">${foodname.food_name}</option>
								</c:forEach>
								<!-- <option value="">음식 카테고리</option>
								<option value="한식">한식</option>
								<option value="중식">중식</option>
								<option value="일식">일식</option>
								<option value="양식">양식</option>
								<option value="기타외국음식">기타외국음식</option>
								<option value="디저트/카페">디저트/카페</option> -->
							</select>
							
                        </div>
                    </div>
                </div>

                <!--표-->
                <div class="row">
                    <div class="col-lg-12">
                        <table style="margin:0 auto; text-align:center;">
                            <thead id="resList">
                            <tr class="table-caption">
                               
                            </tr>
                        </thead>
                        <tbody id="list">
      					</tbody>
                            <tr>
                                <td colspan="8" id="paging">
                                    <!-- plugin 사용법  -->
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


/* 수정 후 */



var currPage = 1;

listCall(currPage);


function listCall(page){
	
	var pagePerNum = 10;	
	
	$.ajax({
		type:'get',
		url:'resList.ajax',
		data:{
			cnt:pagePerNum,
			page:page
		},
		dataType:'JSON',
		success:function(data){
				console.log(data);
				drawList(data.resList);
				currPage = data.currPage;
				console.log(currPage);
				
				$("#pagination").twbsPagination({
					startPage: data.currPage, //시작 페이지
					totalPages: data.pages, //총 페이지
					visiblePages: 5, //한번에 보여줄 리스트 수
					onPageClick: function(e,page){
						console.log(page); //사용자가 클릭한 페이지
						currPage = page;
						listCall(page);
					}
				});
		},
		error:function(e){
			console.log(e);
		}
			
	});
	
}


$('#moimSearch').on('click',function(){
	$("#food_name option:eq(0)").prop("selected", true);
	$("#pagination").twbsPagination('destroy');
	resSearch(currPage);
	
});


$('#food_name').on('change', function () {
	$("#pagination").twbsPagination('destroy');
	$('#moimSearch').val("");
	resSearch(currPage);
	
});


$("input[name='gender']").change(function(){
	resSearch(currPage);
});


//맛집 검색

function resSearch(page){
	
	var pagePerNum = 10;
	
	var search = $("#search").val();
	var foodname = $("#food_name option:selected").val();
	/* var gender = $("input:radio[name='gender']:checked").val(); */
	 
		$.ajax({
			type:'get',
			url:'resSearch.ajax',
			data:{
				cnt:pagePerNum,
				page:page,
				search:search,
				foodname:foodname,
				/* gender:gender */
			},
			dataType:'JSON',
			success:function(data){
					console.log(data);
					drawList(data.resList);
					currPage = data.currPage;
					console.log("데이터확인:::",data.resList)					
					$("#pagination").twbsPagination({
						startPage: data.currPage, //시작 페이지
						totalPages: data.pages, //총 페이지
						visiblePages: 5, //한번에 보여줄 리스트 수
						onPageClick: function(e,page){
							console.log(page); //사용자가 클릭한 페이지
							currPage = page;
							resSearch(page);
						}
					});
			},
			error:function(e){
				console.log(e);
	    		if(e.statusText == 'error'){
					alert("조회된 데이터가 없습니다.");
					listCall(currPage);
					$('#search').val('');
				}
			}
				
		});
		
	
	
}



function drawList(list){
	var content = '';
	if(list.length == 0){
		content += '<tr>';
		content += '<td colspan="4">'+"조회된 데이터가 없습니다."+'</td>';
		content += '</tr>';
	}
	
	list.forEach(function(item,restaurant_no){
		
		content += '<tr>';
		if(item.photo_newFileName != null){
		content += item.comment_status =="공개" || item.comment_status =="해제"?'<td><img src="/photo/'+item.photo_newFileName+'" height="100" width="150"/></td>' : '<td><img src="/photo/test.png" height="100"/></td>';
		}else{//댓글리뷰사진 없을경우
		content += '<td><img src="/photo/test.png" height="100"/></td>';
		}

		content += '<td class="resDetailTitle"><a href="resDetail.do?restaurant_no='+item.restaurant_no+'">'+item.restaurant_name+'</a></td>';
		content += '<td>'+item.food_name+'</td>';
		content += '<td>'+item.restaurant_address+'</td>';
		content += '</tr>';
	});
	$('#list').empty();
	$('#list').append(content);
}



function darwName(food_name) {
	var content = '';
		content += '<option value="">음식 카테고리</option>';
		food_name.forEach(function(item){
		content += '<option value="'+item.food_no+'">'+item.food_name+'</option>';
	});
	$('#food_name').empty();
	$('#food_name').append(content);
	
}


food_nameCall();

function food_nameCall() {
	
	$.ajax({
		type:'get',
		url:'foodname.ajax',
		data : {},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			darwName(data.foodname);
		},
		error:function(e){
			console.log(e);
		}
		
	});

}

</script>

</html>