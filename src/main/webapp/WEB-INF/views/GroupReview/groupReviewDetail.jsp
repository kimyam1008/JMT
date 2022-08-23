<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>JMT - 모임 후기 상세보기</title>
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
		
		input[type='button']{
			color:#fff;
			background:orange;
			border:none;
		}
		input[type='button']:focus{
			outline:0;
		}
		input[type='button']:hover{
			background:#ff3d1c;
			cursor:pointer;
		}
       /*댓글 작성 폼 */
       .comment-form {
       display: flex;
       flex-direction: column;
       width : 515px;
       height : 80px;
       margin : 10px 0px;
       }
       .comment-form textarea {
       resize: none;
       border: 1px solid #dbdbdb;
       padding: 15px 20px;
       outline: none;
       }
       .comment-form .submit {
       border: 1px solid #8f8f8f;
       background-color: #8f8f8f;
       color: #fff;
       padding: 5px;
       margin-bottom:15px;
       cursor: pointer;
       }
       
       
       
       /*댓글 리스트 */
       /* 레이아웃 - 댓글 */
       .comments {
       border: 0.5px solid #dbdbdb;
       border-left: none;
       border-right: none;
       width : 510px;
       }
       .comments .comment {
       border-bottom: 1px solid #dbdbdb;
       padding: 15px;
       }
       .comments .comment:last-child {
       border-bottom: none;
       }

       /* 상단 메뉴 */
       .top {
       display: flex;
       flex-direction: row;
       align-items: center;
       }
       .top .member_id {
       font-weight: bold;
       font-size : 13px;
       padding-left : 5px;
       }
       
       .top .grade_name{
           font-size : 15px;
           padding : 5px;
       }
       
       .content {
           padding : 5px;
       }
       
       .top .utility {
       display: flex;
       flex-direction: row;
       margin-left: auto;
       }

       p {
           font-size : 15px;
       }
       
       /* 하단 메뉴 */
       .bottom {
       display: flex;
       flex-direction: row;
       align-items: center;
       list-style: none;
       padding: 0;
       margin: 0;
       text-transform: uppercase;
       letter-spacing: -0.5px;
       font-weight: bold;
       font-size: 15px;
       }
       .bottom .divider {
       width: 1px;
       height: 15px;
       background-color: #dbdbdb;
       margin: 0 20px;
       }
       .bottom .menu {
       margin: 0;
       padding: 0;
       color: #bebebe;
       font-size: 15px;
       }
       .bottom .menu.report:hover {
           color : #333;
           cursor : pointer;
       }
       
       /*수정*/
       #updtextarea{
           width : 380px;
           height : 40px;
           resize : none;
       }
       
       
       /*버튼*/
       .btn1{
           margin : 3px;
           padding : 5px;
           border-radius : 5px;
           border : 1px black;
           background-color: #lightgrey;
       }
       
       .btn1:hover{
           background-color: #bebebe;
       }
       
       /*프로필 사진*/
       .img{
           width : 35px;
           height : 35px;
           margin : 0 7 5 0px;
           border-radius : 70%;
           overflow : hidden;
       }
       
       .profileImg {
           width : 100%;
           height : 100%;
           object-fit : cover;
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
                <!-- <div class="row">
                    <div class="col-lg-12">
                        <fieldset>
                            <select id="searchCate">
                                <option value="lightning">번개모임</option>
                                <option value="dojang">도장깨기</option>
                            </select>
                            <input type="text" id="keyword" value="" placeholder="모임 이름을 입력해주세요"/>
                            <button id="reviewSearch">검색</button>
                        </fieldset>
                    </div>
                </div>
                <button onclick="location.href='grRegisterForm.go'">글쓰기</button><br/> -->
                <!--표-->
                <input type="hidden" id="groupReview_no" value="${dto.groupReview_no}"/>
                <input type="hidden" id="groupReview_status" value="${dto.groupReview_status}"/>
                <input type="hidden" id="member_id" value="${dto.member_id}"/>
                <input type="hidden" id="login_id" value="${dto.login_id}"/>
                <input type="hidden" id="lightning_title" value="${dto.lightning_title}"/>
                <input type="hidden" id="dojang_title" value="${dto.dojang_title}"/>
                <input type="hidden" id="lightning_no" value="${dto.lightning_no}"/>
                <input type="hidden" id="dojang_no" value="${dto.dojang_no}"/>
                <input type="hidden" id="class_no" value="${dto.class_no}"/>
                <input type="hidden" id="dojang_class_no" value="${dto.dojang_class_no}"/>
                <div class="row">
                    <div class="col-lg-12">
                        <table style="margin:0 auto;">
                            <tr>
                                <th>글 제목</th>
                                <td colspan="3" id="">${dto.review_title}</td>
                            </tr>
                            <tr>
                                <th>작성자</th>
                                <td>${dto.member_id}</td>
                                <th>작성일</th>
                                <td>${dto.review_date}</td>
                            </tr>
                            <tr>
                                <th>모임 이름</th>
                                <td>${dto.lightning_title}${dto.dojang_title}</td>
                                <th>모임 종류</th>
                                <td>${dto.class_name}</td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    ${dto.review_content}
                                        <c:if test="${loginId != null}">
	                                        <button onclick="groupReviewDel()" style="float:right; border:none;">삭제</button>
	                                        <button onclick="grReviewReport_pop()" style="float:right; margin-right:5px; border:none;">신고하기</button>
                                        </c:if>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="4">
                                	<div style="display:block;">
                                	<span style="text-align:center; display:block; margin: 0 auto;">
                                    	<input type="button" value="수정" onclick="groupReviewUpdateForm()"/>
                                    	<input type="button" value="목록" onclick="location.href='groupReviewList.go'"/>
                                	</span>
                                	</div>
                                </th>
                            </tr>
                        </table>
                        
                        
                  
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6" style="margin:0 auto;">
                    	<div class="comment-box" style="width:50%; display:inline-block; margin:0 auto;">
	                        <div class="comment-form">
	                            <textarea  id="cmtInput" placeholder="댓글을 작성하세요."></textarea>
	                            <button type="button" class="submit" id="cmtWrite">댓글 쓰기</button>
		                    </div>
		                    <br/>
		                    <div id="cmtList">
		                    </div>
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
//상세보기 눌렀을 때 댓글리스트 보여주기 
var groupReview_no =  ${dto.groupReview_no};
var class_no = 7;
cmtList(class_no,groupReview_no);

var login_id = "${dto.login_id}"; //업데이트폼 이동, 삭제 처리할 때 쓸거 

var loginId = "${loginId}"; //댓글에서 쓸거

//신고창 팝업
function grReviewReport_pop(){
	window.open("/grReviewReport.go?groupReview_no="+${dto.groupReview_no},"new","width=400, height=350, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");	
}

//업데이트폼 이동
function groupReviewUpdateForm(){
	var member_id = $("#member_id").val();
	
	if (member_id == login_id) {
		//location.href="/groupReviewUpdate.go";
		location.href="/groupReviewUpdate.go?groupReview_no="+${dto.groupReview_no};
	} else if(member_id != login_id) {
		alert("작성자만 수정할 수 있습니다.");
	} else {
		alert("작성자만 수정할 수 있습니다.");
	}
}


//삭제(숨김처리)
function groupReviewDel(){
	var member_id = $("#member_id").val();
	
	if (member_id == login_id) {
		if (!confirm("정말로 삭제하시겠습니까?")) {
			alert("삭제가 취소되었습니다.");
			window.location.reload();
		} else {
			location.href="/groupReviewDelete.do?groupReview_no=${dto.groupReview_no}";
			alert("삭제되었습니다.");
		}
	} else {
		alert("작성자만 수정할 수 있습니다.");
	}
}


/*********댓글***********/ 
//로그인 아이디 위에 변수 설정 되어있음 loginId 
//var lightning_no =  ${dto.lightning_no};
//작성 시 
$("#cmtWrite").on("click",function(){
console.log(loginId, groupReview_no);
  var comment_content = $("#cmtInput").val();
  if(loginId != ""){
	  if(comment_content == null ||comment_content ==''){
	    alert("댓글을 입력해 주세요.");
	    $("#cmtInput").focus();
		}else if(comment_content.length>300){
		  alert("최대 300자까지 입력 가능합니다.");
		    $("#cmtInput").val(comment_content.substring(0, 300));
		}else{
	  var cmtData = {'idx':groupReview_no,'member_id':loginId,'comment_content':comment_content,'class_no':class_no};
	    
		$.ajax({
			type:"post",
			url:"comment/cmtWrite",
			data:JSON.stringify(cmtData),
			contentType:"application/json; charset=utf-8",
			success : function(data){
				if(data.writeSuccess){
					cmtList(class_no,groupReview_no);
					$("#cmtInput").val("");
				}
			},
			error : function(e){
				console.log(e);
			}
		});
	  }
  }else{
	  alert("로그인이 필요한 서비스 입니다.");
	  $("#cmtInput").val("");
  }
});

//06_TeamProject 참고 
//댓글 리스트 가져오기 
function cmtList(class_no,idx){
	var url ='comment'+ "/" + 'cmtList'+"/" +class_no+"/"+idx;
	
	$.ajax({
		url:url,
		type:'get',
		dataType:'json',
		success : function(data){
			console.log(data);
			drawCmt(data.cmtList);
			
		},
		error : function(e){
			console.log(e);
		}
	});
}


function drawCmt(list){
	console.log(list);
	var content = "";
	//데이터가 있는 경우
	if(list.length>0){					
		list.forEach(function(item,idx){
			var date = new Date(item.comment_date);	
			console.log(item);
			//댓글 작성 시 엔터누르면 댓글 줄바꿈 되며, 수정버튼 오류 처리 
			var str = item.comment_content;
			str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		
			content += '<div class ="comments c'+item.comment_no+'">';
			content += '<div class ="comment">';
			content += '<div class ="content">';
			content += '<header class="top">';
			content += '<div class ="img">';
			 if (item.photo_newFileName!= null){
     			content += '<img src ="/photo/'+item.photo_newFileName+'" class="profileImg">';
     			}else{ //프로필 등록을 안했을 시
     				content += '<img src ="resources/photo/profile.png" class="profileImg">';
     			}
     			content += '</div>';
	
			
			if(loginId == item.member_id){ //본인 댓글은 마이페이지로/타아이디는 otherspage로 
            	content += '<div class="member_id"><a href="mypage.go" class="idatag">'+item.member_id+'</a></div>';
            }else{
            content += '<div class="member_id"><a href="othersPage.go?profile_no='+item.profile_no+'" class="idatag">'+item.member_id+'</a></div>';
            }
			//content += '<div class="member_id"><a href="othersPage.go?profile_no='+item.profile_no+'">'+item.member_id+'</a></div>';
			//content += '<div class="grade_name g'+item.grade_no+'">'+item.grade_name+'</div>';
			content += '<div class="grade_name" style="color :'+item.grade_color+'">'+item.grade_name+'</div>';
			content += '<div class="utility">';
			
			if(loginId == item.member_id){ //본인 댓글만 수정,삭제 보이게 
			content += '<button class="btn1" id="updBtn'+item.comment_no+'" onclick="updBtn('+item.comment_no+   ","     +  "\'" +  str   +"\'"  + ')">수정</button>';
			content += '<button class="btn1" id="delBtn'+item.comment_no+'" onclick="cmtDel('+item.comment_no+')">삭제</button>';
			}
			
			content += '</div>';
			content += '</header>';
			content += '<p id="p'+item.comment_no+'">'+str+'</p>';
			content += '<ul class="bottom">';
			content += '<li class="menu comment_date">'+date.toLocaleDateString("ko-KR")+'</li>';
			
			if(loginId != item.member_id){ //본인 댓글은 '신고하기' 안보이게
			content += '<li class="divider"></li>';
			content += '<li class="menu report" onclick="lightCmtReport_pop('+item.comment_no+')">신고하기</li>';
			}
			
			content += '</ul>';
			content += '</div>';
			content += '</div>';
			content += '</div>';
				
		});	
	}else{
		content += '<div class ="comment">';
		content = "작성된 댓글이 없습니다.";
		content += '</div>';
	}
	$('#cmtList').empty();
	$('#cmtList').append(content); 	
}	


//삭제 
function cmtDel(cno){
	
	$.ajax({
		url:"comment/cmtDel",
		type:'post',
		data : {
			'comment_no' : cno
		},
		dataType:'json',
		success : function(data){
			console.log(data.delSuccess);
			if(data.delSuccess){
				cmtList(class_no,groupReview_no);
			}
		},
		error : function(e){
			console.log(e);
		}
	});
}




//수정버튼 눌렀을 때 
function updBtn(cno,content){
	//console.log("수정하고싶다");
	console.log(cno,content);
	var updcontent = content.split('<br/>').join("\r\n");
	//수정 버튼 누른 댓글의 태그 변경 
	$('#p'+cno).replaceWith('<textarea id="updtextarea">'+updcontent+'</textarea>');
	$('#updBtn'+cno).attr('onclick','updCmt('+cno+')');
	
	
	//글자 수 500자 제한
	$('#updtextarea').keyup(function(){
		  var content = $(this).val();
		  if (content.length > 500){
		    alert("최대 500자까지 입력 가능합니다.");
		    $(this).val(content.substring(0, 500));
		  }
	});
}



//수정하기 요청 
function updCmt(cno){
	console.log("수정하기!!!!!" + cno);
	var updcontent = $("#updtextarea").val();
	console.log("바뀐 내용" + updcontent);
	
	$.ajax({
		url:"comment/cmtUpd",
		type:'post',
		data : {
			'comment_no' : cno,
			'comment_content' : updcontent
		},
		dataType:'json',
		success : function(data){
			console.log(data);
			if(data.updSuccess){
				cmtList(class_no,groupReview_no);
			}
		},
		error : function(e){
			console.log(e);
		}
	});
}



//댓글 신고 팝업
function lightCmtReport_pop(cno){
	window.open("/grCmtReport.go?comment_no="+cno,"new","width=400, height=350, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}
</script>
</html>