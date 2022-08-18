<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>JMT - 모임 후기 수정</title>
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
            table,th,td {
                border:1px solid black;
                border-collapse:collapse;
            }
            th,td {
                padding:5px 10px;
            }

            table, input[type='text'] {
			width:100%;
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
                                  <a href="jmtMain.html"><img src="../resources/mainResource/assets/img/logo/logo.png" width="80px" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10 col-md-8">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">                                                                                                                                     
                                            <li><a href="jmtMain.html">Home</a></li>
                                            <li><a href="#">모임</a>
                                                <ul class="submenu">
                                                    <li><a href="lightList.go">번개</a></li>
                                                    <li><a href="dojang.go">도장깨기</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="resList.html">맛집</a></li>
                                            <li><a href="groupReviewList">후기</a></li>
                                            <li class="add-list"><a href="login.go"><i class="ti-user"></i>로그인</a></li>
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
                            <h2>모임 후기 수정</h2>
                        </div>
                    </div>
                </div>

             
                <!--표-->
                <div class="row">
                    <div class="col-lg-12">
                        <form action="groupReviewUpdate" method="POST">
                            <table style="margin:0 auto; text-align:center;">
                                <tr>
                                    <th>나의 모임</th>
                                    <td>
                                        <fieldset style="width:40%; float:left;">
                                        <legend>번개모임</legend>
                                        <c:forEach items="${lightGroupList}" var="lightGroupList">
                                                <input type="radio" name="idx" value="${lightGroupList.lightning_no}" <c:if test="${dto.lightning_no eq lightGroupList.lightning_no}">checked</c:if>/>
                                                ${lightGroupList.lightning_title} (${lightGroupList.class_name}) 
                                                <input type="hidden" name="class_no" value="${lightGroupList.class_no}"><br/>
                                        </c:forEach>
                                        </fieldset>
                                        <fieldset style="width:40%; float:left;">
                                            <legend>도장깨기</legend>
                                            <c:forEach items="${groupList}" var="groupList">
                                                    <input type="radio" name="idx" value="${groupList.dojang_no}" <c:if test="${dto.dojang_no eq groupList.dojang_no}">checked</c:if>/>
                                                    ${groupList.dojang_title} (${groupList.class_name}) 
                                                    <input type="hidden" name="class_no" value="${groupList.class_no}"><br/>
                                            </c:forEach>
                                        </fieldset>
                                    
                    
                                        <%-- <c:forEach items="${groupList}" var="groupList">
                                            <input type="radio" name="idx" value="${groupList.group_no}" <c:if test="${dto.group_no eq groupList.group_no}">checked</c:if>/>
                                                ${groupList.title} (${groupList.class_name}) 
                                            <input type="hidden" name="class_no" value="${groupList.class_no}"><br/>
                                        </c:forEach> --%>
                        
                                        <%-- <input type="text" id="title" style="width:30%" placeholder="검색버튼을 눌러주세요" readonly/>
                                        <!-- <p id="groupName"></p> -->
                                        ${joinGroup.title}
                                        <!-- <input type="button" value="검색" id="groupSearch"/> -->
                                        <input type="hidden" id="lightning_no" name="" value=""/>
                                        <input type="hidden" id="dojang_no" name="" value=""/>
                                        <input type="button" value="검색" onclick="groupSearchPop()"/>
                                        <!-- <input type="button" value="초기화" id="groupReset" onclick="groupReset()"/> --> --%>
                                    </td>
                                </tr>
                                <tr>
                                    <th>작성자</th>
                                    <td><input type="text" name="member_id" value="${sessionScope.loginId}" style="width:20%" readonly/></td>
                                </tr>
                                <tr>
                                    <th>글 제목</th>
                                    <td><input type="text" name="review_title" id="review_title" value="${dto.review_title}"/></td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td id="reviewContents">
                                        <!-- html 태그를 인식하기 위해 div 사용(type="text"나 textarea는 html을 그냥 글자취급) -->
                                        <div id="editable" contenteditable="true">${dto.review_content}</div>
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
                                        <button type="button" onclick="location.href='groupReviewDetail.do?groupReview_no=${dto.groupReview_no}'">취소</button>
                                        <button type="button" onclick="save()">저장</button>
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
//글 업로드
function save(){
	
	var review_title = $('#review_title').val();
	var review_content = $('#editable').text();
	
	if($('input[type="radio"]:checked').is(":checked") == false){
		alert("모임을 선택해 주세요");
	} else if(review_title == "") {
		alert("제목을 입력해주세요");
		review_title.focus();
	} /* else if(review_content == "") { //여기 아직 안됨...
		alert("내용을 입력해주세요.");
		//review_content.focus();
	} */ else if($('#content-image').length > 3) {
		alert('이미지 업로드 제한 갯수를 초과했습니다.');
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