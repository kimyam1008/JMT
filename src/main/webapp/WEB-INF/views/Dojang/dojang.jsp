<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html class="no-js" lang="zxx">
	<head>
		<meta charset="UTF-8">
		<title>JMT 도장 깨기 리스트 페이지</title>
		

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
	
	.titlea{
			color : #50bcdf;
	}
		
	.titlea:hover{
			color:black;
	}
	
</style>

<body>
  <!--알림 헤더
    <jsp:include page="../commons/header.jsp"/>-->
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
        <div class="hero-area3 hero-overly2 d-flex align-items-center">
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
										<input type="button" value="도장깨기 생성" class="btn list-btn mt-10" onclick="location.href='dojangReg.go'"/>
	                                </div>
	                            </div>
	                        </div>

		<div class="category-listing mb-50">
		                            <!-- single one -->
		                            <div class="single-listing">
		                                <!-- input -->
		                                <div class="input-form">
		                                    <input type="text" id="search" name="search" placeholder="모임명을 입력하세요"
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
                                       <option value="" selected>식사속도</option>
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
                                        <option value="" selected>직업</option>
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
                                 <button id="moimSearch" class="btn list-btn mt-20">검색</button>
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
                                    <div class="col-lg-12 ">
                                        <table style="margin:0 auto; text-align:center;">
                                            <thead id="lightningList">
                                                <tr class="table-caption">
                                                    	<th>음식 카테고리</th>
														<th>방장 ID</th>
														<th>모임 이름</th>
														<th>모임 생성일</th>
														<th>인원</th>
														<th>상태</th>
														<th>참여여부</th>
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
              
        
                    
<input type="hidden" id="loginId" value="${sessionScope.loginId}"/>



<br/>
		<!-- <input type="text" id="search" placeholder="모임명을 입력하세요"> -->



<script>

var currPage = 1;

listCall(currPage);


function listCall(page){
	
	var pagePerNum = 10;
	
	var search = $("#search").val();
	var foodname = $("#food_no option:selected").val();
	var eat_speed = $("#eat_speed option:selected").val();
	var job = $("#job option:selected").val();
	var gender = $("input:radio[name='gender']:checked").val();
	
	$.ajax({
		type:'get',
		url:'dojang.ajax',
		data:{
			cnt:pagePerNum,
			page:page,
			search:search,
			foodname:foodname,
			gender:gender,
			eat_speed:eat_speed,
			job:job
			
		},
		dataType:'JSON',
		success:function(data){
				console.log(data);
				drawList(data.dojangList);
				currPage = data.currPage;
				console.log("데이터",data.dojangList);
				
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

//moimSearch == search
//search == lightning_title

$('#moimSearch').on('click',function(){
	if($("#search").val() != ""){
		$("#food_no").val("");
		$("#eat_speed").val("");
		$("#job").val("");
		$("input:radio[name='gender']:checked").prop("checked",false);
		
		$("#pagination").twbsPagination('destroy');
		listCall(currPage);
	} else {
	 	alert("모임이름을 입력해주세요.");
	}
	
});


$('select').on('change', function () {
	$("#pagination").twbsPagination('destroy');
	listCall(currPage);
});


$("input[name='gender']").change(function(){
	listCall(currPage);
});


//도장깨기 검색

/*
function dojangSearch(page){
	
	var pagePerNum = 10;
	
	var search = $("#search").val();
	var foodname = $("#food_name option:selected").val();
	 var gender = $("input:radio[name='gender']:checked").val();
	 
		$.ajax({
			type:'get',
			url:'dojangSearch.ajax',
			data:{
				cnt:pagePerNum,
				page:page,
				search:search,
				foodname:foodname,
				gender:gender
			},
			dataType:'JSON',
			success:function(data){
					console.log(data);
					drawList(data.dojangList);
					currPage = data.currPage;
					console.log("데이터확인:::",data.dojangList)

					
					$("#pagination").twbsPagination({
						startPage: data.currPage, //시작 페이지
						totalPages: data.pages, //총 페이지
						visiblePages: 5, //한번에 보여줄 리스트 수
						onPageClick: function(e,page){
							console.log(page); //사용자가 클릭한 페이지
							currPage = page;
							dojangSearch(page);
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

*/



function drawList(list){
	var content = '';
	console.log("data::",list);
	var loginId = $("#loginId").val();
	console.log("로그인보자", loginId);
	
	if(list.length == 0){
		content += '<tr>';
		content += '<td colspan="7">'+"조회된 데이터가 없습니다."+'</td>';
		content += '</tr>';
	}
	list.forEach(function(item){
		var date = new Date(item.dojang_create);
		var create = date.toLocaleDateString("ko-KR");
		console.log("조회::",item.member_count);
		console.log("왜안됨?",item.leader_id,loginId);
		content += '<tr>';
		content += '<td>'+item.food_name+'</td>';
		content += '<td>'+item.leader_id+'</td>';
		content += item.test=="승인" || item.leader_id==loginId? '<td><a class="titlea" href="dojangHome.go?dojang_no='+item.dojang_no+'">'+item.dojang_title+'</td>' : '<td><a class="titlea" href="dojangDetail.do?dojang_no='+item.dojang_no+'">'+item.dojang_title+'</td>';
		content += '<td>'+create+'</td>';
		content += '<td>'+item.member_count+'/'+item.people_num+'</td>';
		content += '<td>'+item.dojang_status+'</td>';
		content += item.test=="승인" || item.leader_id==loginId? '<td>참여</td>' : '<td>미참여</td>' ; 
		content += '</tr>';
	});
	$('#list').empty();
	$('#list').append(content);
}



function darwName(food_no) {
	var content = '';
		content += '<option value="">음식 카테고리</option>';
		food_no.forEach(function(item){
		content += '<option value="'+item.food_no+'">'+item.food_name+'</option>';
	});
	$('#food_no').empty();
	$('#food_no').append(content);
	
}



function food_noCall() {
	
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

var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

</script>
 		<!--  페이징  -->
  	    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  	    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
	    <script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script>
	    


</html>