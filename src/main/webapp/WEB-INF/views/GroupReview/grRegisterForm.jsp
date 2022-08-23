<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>JMT - 모임 후기 작성</title>
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

            table, input[type='text'] {
         width:100%;
         border:none;
          }
            button {
             color:#fff;
            background:orange;
            border:none;
          }
          button:focus{
            outline:0;
         }
         button:hover{
            background:#ff3d1c;
            cursor:pointer;
         }
                
            textarea {
                width: 100%;
                height: 150px;
                resize: none;
            }
            
            #editable{
                width: 99%;
                height: 500px;
                border: 1px solid gray;
                margin: 5px;
                overflow: auto;
                padding: 5px;
                text-align: left;
            }
            
            #content-image{
                cursor: pointer;
            }
            
            #content-image:hover {
                opacity: 0.5;
            }
            
            .notiDelBtn:hover{
            cursor : pointer;
            color : red;
         }
         
         .menu input[type="checkbox"]{cursor:pointer;}
		 .hide{display:none;}
		 
		 .menu2 input[type="checkbox"]{cursor:pointer;}
		 .hide2{display:none;}
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
                                            <li><a href="resList.html">맛집</a></li>
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
                            <h2>모임 후기 작성</h2>
                        </div>
                    </div>
                </div>

                <!--표-->
                <div class="row">
                    <div class="col-lg-12">
                        <form action="groupReviewRegister" method="POST">
                            <table style="margin:0 auto; text-align:center;">
                                <tr>
                                    <th>나의 모임</th>
                                    <td>
                                    <div class="menu" style="width:40%; float:left;">
                                        <input type="checkbox" style="margin: 5px" name="class_no" onclick="checkOnlyOne(this)" value="1"/>번개모임
                                        <!-- <div id="groupChoose1"> -->
                                        <div class="hide">
	                                        <c:forEach items="${lightGroupList}" var="lightGroupList">
	                                            <input type="radio" name="idx" style="margin: 5px;" value="${lightGroupList.lightning_no}"/>${lightGroupList.lightning_title}<br/>
	                                        </c:forEach>
                                        </div>
                                       <!--  </div> -->
                                    </div>
                                    <div class="menu2" style="width:40%; float:left;">
                                        <input type="checkbox" style="margin: 5px" name="class_no" onclick="checkOnlyOne(this)" value="3"/>도장깨기
                                        <!-- <div id="groupChoose2"> -->
                                        <div class="hide2">
                                        <c:forEach items="${groupList}" var="groupList">
                                            <input type="radio" name="idx" style="margin: 5px;" value="${groupList.dojang_no}"/>${groupList.dojang_title}<br/>
                                        </c:forEach>
                                        </div>
                                        <!-- </div> -->
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>작성자</th>
                                    <td><input type="text" name="member_id" value="${sessionScope.loginId}" style="width:20%" readonly/></td>
                                </tr>
                                <tr>
                                    <th>글 제목</th>
                                    <td><input type="text" name="review_title" id="review_title"/></td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td id="reviewContents">
                                        <!-- html 태그를 인식하기 위해 div 사용(type="text"나 textarea는 html을 그냥 글자취급) -->
                                        <div id="editable" contenteditable="true"></div>
                                        <!-- 하지만 div 는 서버에 값을 전송할 수가 없다. -->
                                        <!-- 결국엔 div의 내용을 input에 담아 서버에 전송할 예정 -->
                                        <input type="hidden" name="review_content" id="review_content"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input type="button" value="파일 업로드" onclick="fileUp()"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2">
                                        <button type="button" onclick="location.href='groupReviewList.go'">취소</button>
                                        <button type="button" onclick="save()">글쓰기</button>
                                    </th>
                                </tr>
                                
                            </table>
                        </form>
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

        
    </body>
 <%@ include file="../../../resources/inc/footer.jsp" %>
<script>
//$('#groupChoose1').hide();
//$('#groupChoose2').hide();


//체크박스 하나만 체크
function checkOnlyOne(element) {
  
  const checkboxes = document.getElementsByName("class_no");
  
  checkboxes.forEach((cb) => {
    cb.checked = false;
  })
  
  element.checked = true;
}


/***모임 관련 토글***/
//html dom 이 다 로딩된 후 실행된다.
$(document).ready(function(){
	// memu 클래스 바로 하위에 있는 input 태그를 클릭했을때
	$(".menu>input").click(function(){
		// 현재 클릭한 태그가 input 이기 때문에
		// input 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
		$(this).next("div").toggleClass("hide");
		//$(".menu2>input").next("ul").toggle(".hide2");
	});
});


$(document).ready(function(){
	$(".menu2>input").click(function(){
		$(this).next("div").toggleClass("hide2");
		//$(".menu>input").next("ul").toggle("hide");
	});
});


/* 
$('.menu ul li').bind('click', function() {
	// 현재 선택된 ul을 가져옴
	var $ul = $(this).closest('ul');
	// 현재 선택된 ul 인덱스 외의 모든 ul의 하위 li 메뉴는 숨김처리
	$('.menu ul:not(:eq(' + $ul.index() + ')) li').hide();
	// 현재 선택된 ul 인덱스의 하위 .span_m 메뉴는 보여주게 처리
	$('.menu ul:eq(' + $ul.index() + ') li').show();
});
 */


//글 업로드
function save(){
   
   var review_title = $('#review_title').val();
   //var review_content = $('#review_content').val($('#editable').html());
   var review_content = $('#editable').html(); 
   
   if($('input[type="checkbox"]:checked').is(":checked") == false){
      alert("모임 분류를 선택해 주세요");
   } else if($('input[type="radio"]:checked').is(":checked") == false) {
      alert("모임을 선택해 주세요");
   } else if(review_title == "") {
      alert("제목을 입력해주세요");
      //review_title.focus();
   }  else if(review_content == "") {
      alert("내용을 입력해주세요.");
      //review_content.focus();
   } else if($('.imageUp').length > 3) {
      alert('이미지 업로드 제한 갯수를 초과했습니다.');
   } else if($('#content-image').length == 0) {
      $('#review_content').val($('#editable').html());
      $('form').submit();
   } else {
      $('#review_content a').removeAttr('onclick');
      //id가 content인 태그의 자식태그 a 태그에서 onclick 속성 삭제
      
      $('#review_content').val($('#editable').html());
      //content 안에 editable 넣음
      
      $('form').submit();
   }
   
}

//파일업로드 팝업
function fileUp(){
   window.open('grFileUploadForm.go','','width=400, height=100');
}

//사진 삭제
function del(elem){
   console.log(elem);
   //id에서 삭제할 파일명을 추출
   var id = $(elem).attr("id");
   var fileName = id.substring(id.lastIndexOf("/")+1);
   console.log(fileName);
   //해당 파일 삭제 요청
   $.ajax({
      url:'grFileDelete.ajax',
      type:'get',
      data:{'fileName':fileName},
      dataType:'json',
      success:function(data){
         console.log(data)
         //a 태그를 포함한 img 태그를 삭제
         $(elem).remove();
      },
      error:function(e){
         console.log(e);
      }
   });
}
</script>
</html>