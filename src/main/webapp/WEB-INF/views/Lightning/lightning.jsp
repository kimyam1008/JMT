<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <!DOCTYPE HTML>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <title>JMT 번개 모임 리스트 페이지</title>
  		 <meta http-equiv="x-ua-compatible" content="ie=edge">
         <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="../resources/mainResource/assets/img/pizza-slice.png">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-pen.css" rel="stylesheet">
		
        <!-- 페이징 -->
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		
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
   
	 .table-caption th {
				text-align:center;
	}
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
			  background-color: #f9f9f9;
		}
		
		table td {
			  width: 350px;
			  padding: 10px;
			  vertical-align: top;
			  border-bottom: 1px solid #ccc;
			 font-size: 15px;
		}
			
		a {
			font-size: 15px;
		}	
		
		
		.titlea{
			color : #50bcdf;
		}
		
		.titlea:hover{
			color:black;
		}
			
	.notiDelBtn:hover{
		cursor : pointer;
		color : red;
	}
	
	.fa,.fab,.fad,.fal,.far,.fas{
	font-weight: 900 !important;
	}
	
	.createBtn{
		border-radius: 30px;
		background-color : #ff3d1c;
		color : white;
		border: none;
		padding : 20px 30px;
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
                                <!-- Main-menu  <img src="resources/photo/bnoti4.png"  style="width:30px; height:25px;"/>-->
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
                            <h2>번개모임</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Hero End -->
        <!-- listing Area Start 리스트 여기여기 -->
   		<!-- listing Area Start -->
        <div class="listing-area pt-120 pb-120">
            <div class="container">
                <div class="row">
                    <!-- Left content -->
                    <div class="col-xl-3 col-lg-3 col-md-3">
                        <div class="row">
                            <div class="col-12">
                                    <div class="small-section-tittle2 mb-45">
                                    <button onclick="location.href='/lightCreate.go'" class="btn list-btn mt-10"><i class="fa fa-solid fa-bolt"></i> 번개모임 생성</button>
                                </div>
                            </div>
                        </div>
 
 		<div class="category-listing mb-50">
                            <!-- single one -->
                            <div class="single-listing">
                            <h4 class="searchName">번개를 찾아보세요</h4>
                                <!-- input -->
                                <div class="input-form">
                                    <input type="text" id="lightning_title"  name="lightning_title" placeholder="모임명을 입력하세요"
		                                onKeypress="javascript:if(event.keyCode==13) {enterkey()}"/>
                                </div>
                                <!-- Select job items start -->
                                <div class="select-job-items1">
                                    <select id="food_no" name="food_no">
                                        <option value="">음식카테고리</option>
                                            <c:forEach items="${foodList}" var="foodList">
                                                <option value="${foodList.food_no}">${foodList.food_name}</option>
                                            </c:forEach>
                                    </select>
                                </div>
                                <!--  Select job items End-->
                                <!-- Select job items start -->
                                <div class="select-job-items2">
                                    <select id="eat_speed">
                                        <option value="">식사속도</option>
                                        <option value="느림">느림</option>
                                        <option value="보통">보통</option>
                                        <option value="빠름">빠름</option>
                                        <option value="상관없음">상관없음</option>
                                    </select>
                                </div>
                                <!--  Select job items End-->
                                 <!-- Select job items start -->
                                 <div class="select-job-items2">
                                    <select id="job">
                                        <option value="">직업</option>
                                        <option value="직장인">직장인</option>
                                        <option value="취준생">취준생</option>
                                        <option value="학생">학생</option>
                                        <option value="상관없음">상관없음</option>
                                    </select>
                                </div>

                                             <!--  Select job items End-->
                                <!-- select-Categories start -->
                               
                                <!-- select-Categories End -->
                                <!-- Select job items start -->
                                <input type="radio" name ="gender" id="gender" value="남자"/>남자
		                        <input type="radio" name ="gender" id="gender" value="여자"/>여자
		                        <input type="radio" name ="gender" id="gender" value="상관없음"/>상관없음
                                <!--  Select job items End-->
                            </div>

                            <div class="single-listing">
                                 <button id="search" class="btn list-btn mt-10">검색</button>
                            </div>
                        </div>
                        <!-- Job Category Listing End -->
                    </div>
 
                    <!-- Right content -->
                    <div class="col-xl-9 col-lg-9 col-md-9">
                        <!-- listing Details Stat-->
                        <!--리스트 시작-->
                       
                        <div class="listing-details-area">
                            <div class="container">
                                <div class="row">
                                    <!--넣을 내용 입력-->
                                    <div class="col-lg-12">
                                        <table style="margin:0 auto; text-align:center; font-size: 11px;">
                                            <thead id="lightningList">
                                                <tr class="table-caption">
                                                    <th>맛집 이름</th>
                                                    <th>음식 카테고리</th>
                                                    <th>방장 ID</th>
                                                    <th>모임 이름</th>
                                                    <th>모임 날짜</th>
                                                    <th>인원</th>
                                                    <th>상태</th>
                                                    <th>참여여부</th>
                                                </tr>
                                            </thead>
                                            <tbody id="list">
                                            </tbody>
                                    
                                                <tr>
                                                    <td colspan="8" id="paging">
                                                        <!-- plugin 사용법    -->
                                                        <div class="container">
                                                            <nav arial-label="Page navigation" >
                                                                <ul class="pagination" id="pagination" style="margin: 10px 30px 10px 310px;"></ul>
                                                            </nav>
                                                        </div>
                                                    </td>
                                                </tr>
                                        </table>    
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- listing Details End -->
                        <!--Pagination Start  -->
                        <!--페이징 자리인데 뭐 봐서..
                        
                            <div class="pagination-area pt-70 text-center">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-xl-12">
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
                            </div>
                            Pagination End  -->
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
</body>
	<%@ include file="../../../resources/inc/footer.jsp" %>	
    <!-- footer   file="../../../resources/inc/footer.jsp"		-->
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
		<!-- One Page, Animated-HeadLin    <script src="../resources/mainResource/assets/js/price-range.js"></script> -->
        <script src="../resources/mainResource/assets/js/wow.min.js"></script>
		<script src="../resources/mainResource/assets/js/animated.headline.js"></script>
        <script src="../resources/mainResource/assets/js/jquery.magnific-popup.js"></script>

		<!-- Nice-select, sticky -->
        <script src="../resources/mainResource/assets/js/jquery.nice-select.min.js"></script>
		<script src="../resources/mainResource/assets/js/jquery.sticky.js"></script>
        
        <!-- contact js -->
        <!-- <script src="../resources/mainResource/assets/js/contact.js"></script> -->
        <script src="../resources/mainResource/assets/js/jquery.form.js"></script>
        <script src="../resources/mainResource/assets/js/jquery.validate.min.js"></script>
        <script src="../resources/mainResource/assets/js/mail-script.js"></script>
        <script src="../resources/mainResource/assets/js/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="../resources/mainResource/assets/js/plugins.js"></script>
        <script src="../resources/mainResource/assets/js/main.js"></script>
       
    <script>
    var loginId = "${loginId}";
	var currpage = 1;
	listCall(currpage);

	//검색버튼 클릭시
	$("#search").on("click",function(){
		if($("#lightning_title").val() != ""){ //유효성검사
			// 검색 시 기존 옵션 값 날리기위해
			console.log($("#food_no").val());
			console.log($("select[name='food_no']").val());
			$("#food_no").val("");
			$("select[name='food_no']").val("");
			$("#eat_speed").val("");
			$("#job").val("");
			$("#gender:checked").prop("checked",false);
			
			$("#pagination").twbsPagination('destroy');
			listCall(currpage);
		} else {
		 	alert("검색어를 입력해주세요.");
		}
	});
	
	//검색값 입력 후 enter누를 시 
	function enterkey(){
		if($("#lightning_title").val() != ""){
			// 검색 시 기존 옵션 값 날리기위해
			$("#food_no").val("");
			$("#eat_speed").val("");
			$("#job").val("");
			$("#gender:checked").prop("checked",false);
			
			$("#pagination").twbsPagination('destroy');
			listCall(currpage);
		} else {
		 	alert("검색어를 입력해주세요.");
		}
	}

	/*셀렉트박스 값이 변경될 때 
	$(function() {

		  $('select').on('change', function(e){
		    console.log(this.value,
		                this.options[this.selectedIndex].value,
		                $(this).find("option:selected").val(),);
		  });
		  
		});
	*/
	
	$("select").on("change", function(){ 
		//console.log("왜?");
		$("#pagination").twbsPagination('destroy');
		listCall(currpage);
	});

	
	
	//radio 값이 변경될 때
	$("input[name='gender']:radio").on("change",function(){
		$("#pagination").twbsPagination('destroy');
		listCall(currpage);
	});


	function listCall(page){
		
		var lightning_title = $("#lightning_title").val();
		var food_no = $("#food_no").val();
		var eat_speed = $("#eat_speed").val();
		var job = $("#job").val();
		var gender = $("#gender:checked").val(); // ->아무것도 체크안됐을때 undefined /다른건 공백
		
		/*
		console.log(food_no);
		console.log(eat_speed);
		console.log(job);
		console.log(gender);
		*/
		
		$.ajax({
			type: 'get',
			url : 'lightList.ajax',
			data : {
				'lightning_title' : lightning_title,
				'food_no' : food_no,
				'eat_speed' : eat_speed,
				'job' : job,
				'gender' : gender,
				'page' : page
			},
			dataType : 'json',
			success : function(data){
				//console.log(data);
				drawList(data.list);
				//console.log(data.pages);
				
				
				currPage = data.currPage;
				//리스트불러오기가 성공되며 플러그인을 이용해 페이징 처리 //{} 옵션 추가
				if(data.list.length>0){
					 $("#pagination").twbsPagination({
						 startPage:1, //시작페이지
						 totalPages : data.pages, //총페이지(전체 게시물 수/한 페이지에 보여줄 게시물 수) 300게시물/10개씩 보여줄거야 - 30 페이지 
						visiblePages : 5, //한번에 보여줄 페이지 수 [1][2][3][4][5]
						 onPageClick:function(e,page){
							 //console.log(e); //클릭한 페이지와 관련된 이벤트 객체
							 //console.log(page); //사용자가 클릭한 페이지 
							 currPage = page;
							 listCall(page);
						 }
					 });
				}else{ //데이터 없을 때 페이징 어떻게 보여질건지 
					$("#pagination").twbsPagination({
						 startPage:1,
						 totalPages : 1, 
						visiblePages : 1
					 });
				}
			},
			error : function(e){
				console.log(e);
			}
			
		});
	}

	
		
	function drawList(list){
		//console.log(list);
		var content ='';
		//데이터가 있는 경우
		if(list.length>0){					
			list.forEach(function(item,idx){
				//console.log(item);
				var date = new Date(item.lightning_date);

				content += '<tr>';
				content += '<td>'+item.restaurant_name+'</td>';
				content += '<td>'+item.food_name+'</td>';
				content += '<td>'+item.leader_id+'</td>';
				content += item.lightning_status == "모집중"? '<td><a class="titlea" href="lightDetail.go?lightning_no='+item.lightning_no+'">'+item.lightning_title+'</a></td>' : '<td>'+item.lightning_title+'</td>';
				content += '<td>'+date.toLocaleDateString("ko-KR")+'</td>';
				content += '<td>'+item.member_count +' / '+ item.member_num+'</td>';
				content += '<td>'+item.lightning_status+'</td>';
				content += item.participate=="승인"? '<td>참여</td>' : item.leader_id == loginId? '<td>참여</td>' :  '<td>미참여</td>'; 
				content += '</tr>';
			});
		//데이터가 없을 경우	
		}else{
			content += '<tr>';
			content += '<td colspan="8" style="text-align: center">찾으시는 데이터가 없습니다.</td>';
			content += '</tr>';
		}
		
		$('#list').empty();
		$('#list').append(content); 
	}
	
	//번개모임 생성시 유효성 체크 
	var profileChk = ${profileChk};
	function lightCreateChk(){
		if(profileChk){
			//console.log(profileChk);
			location.href='/lightCreate.go';
		}else{
			console.log(profileChk);
			alert("프로필 생성 후 이용 가능합니다.");
		}
	}
    </script>
        <!--  페이징  -->
  	    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  	    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
	    <script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script>
	    


</html>