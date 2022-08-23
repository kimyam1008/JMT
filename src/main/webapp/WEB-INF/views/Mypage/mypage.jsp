<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="../resources/mainResource/assets/img/pizza-slice.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>JMT 마이페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="../resources/etcResource/assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="../resources/etcResource/assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link href="../resources/etcResource/assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="../resources/etcResource/assets/css/pe-icon-7-stroke.css" rel="stylesheet" />

</head>
<style>
	.notiDelBtn:hover{
		cursor : pointer;
		color : red;
	}
	
	.profileImg{
		width:170px;
	}
	
	li, li a {
		text-align:left;
		padding:5px;
	}

</style>
<body>
    <!--사이드바 시작-->
    <div class="wrapper">
     <div class="sidebar" data-color="azure">

        <!--

            Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
            Tip 2: you can also add an image using data-image tag

        -->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="./" class="simple-text">
                    JMT
                </a>
            </div>
            <ul class="nav">
                <li class="active">
                    <a href="./mypage.go">
                        <i class="pe-7s-user"></i>
                        <p>마이페이지</p>
                    </a>
                </li>
            </ul>
    	</div>
    </div>
    <!--사이드바 끝-->

    <!--상단바 시작-->
    <div class="main-panel">
        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="./mypage.go">마이페이지</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <!-- <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-dashboard"></i>
								<p class="hidden-lg hidden-md">Dashboard</p>
                            </a>
                        </li> -->
                        <!--누르면 알림창같은거 조그맣게 뜸-->
                        <li class="dropdown">
	                       <c:if test="${notiChk=='true'}">
								<a  class="dropdown-toggle" data-toggle="dropdown" style="color:Red" >
			        			 	<i class="fa fa-bell"></i> 
			        			 	 <b class="caret hidden-lg hidden-md"></b>
									<b class="caret"></b>
								</a>
							</c:if>	
							<c:if test="${notiChk=='false'}">
								<a  class="dropdown-toggle" data-toggle="dropdown" >
							         <i class="fa fa-bell"></i> 
							          <b class="caret hidden-lg hidden-md"></b>
									<b class="caret"></b>
								</a>
							</c:if>	
                              <ul class="dropdown-menu" style="width: 400px;">
                              </ul>
                        </li> 
                        <!-- <li>
                           <a href="">
                                <i class="fa fa-search"></i>
								<p class="hidden-lg hidden-md">Search</p>
                            </a>
                        </li> -->
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="./">
                                <p>Home</p>
                             </a>
                         </li>
                        <li>
                           <a href="./mypage.go">
                               <p>마이페이지</p>
                            </a>
                        </li>
                        <li>
                            <a href="./logout.do">
                                <p>Log out</p>
                            </a>
                        </li>
						<li class="separator hidden-lg"></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--상단바 끝-->

        <!--컨텐츠영역 시작-->
        <div class="content">
            <div class="container-fluid">
                <!--여기에 <div class="row">로 시작해서 내용을 넣어주세요 -->
                
                <!--게시글 양식 시작-->
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            
                            <div class="content" style="padding:30px;">

                                <div class="top-section">
                                	<div>
	                                    <a href="#" style="float:left; weight:50px;">
	                                    <c:choose>
	                                    <c:when test="${photo.photo_newFileName ne null}">
	                                    	<img src ="/photo/${photo.photo_newFileName}" class="profileImg">
	                                    </c:when>
	                                    <c:otherwise><img src ="resources/photo/profile.png" class="profileImg"></c:otherwise>
	                                    </c:choose>
	                                    </a>
	                                    <div class="info" style="font-size:16px;">
	                                    	<p style="margin-bottom:10px;">${list.member_id }님 반갑습니다.</p>
	                                    	<p>등급 : ${list.grade_name }</p>
	                                    	<p>팔로워 : <a href="./followerList.go" onclick="window.open(this.href, '_blank', 'width=400, height=450, left=500, top=200'); return false;">${follower }</a></p>
	                                    	<p>팔로잉 : <a href="./followingList.go" onclick="window.open(this.href, '_blank', 'width=400, height=450, left=500, top=200'); return false;">${following }</a></p>
                                		</div>
                                		
                                	</div>
                                </div>

                            </div>
                        </div>
                    </div>


					<div class="col-md-6">
                        <div class="card">
                            
                            <div class="content" style="padding:30px;">

                                <div class="top-section">
                                	<div style="font-size:16px;">
									성별 : ${list.profile_gender }<br/>
									직업 : ${list.profile_job }<br/>
									선호 음식 : ${list.food_name }<br/>
									식사 속도 : ${list.eat_speed }<br/>
									블라인드 수 : ${blind }<br/>
                                	</div>
                                </div>
                                <div style="margin-top:15px; font-size:16px">
									<a href='./profileUpdate.go'>개인정보 수정</a>
                                </div>

                            </div>
                        </div>
                    </div>
                    
                    
                </div>
                <!--게시글 양식 끝-->
                
                


                <!--게시글 양식 시작-->
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="content">
                                  
                                    <h5 style="margin:40px; margin-left:50px; margin-right:100px"><p>내가 쓴 게시글</p>
                                    	<c:forEach items="${myboard }" var="myboard">
											<ul>
												<li>
												<c:choose>
												<c:when test="${myboard.class_no =='1' || myboard.class_no =='3'}">
												<a href="/groupReviewDetail.do?groupReview_no=${myboard.groupReview_no}">
												${myboard.review_title}</a>
												</c:when>
												<c:when test="${myboard.class_no =='4'}">
												<a href="/dojangHomeDetail.go?dojangPost_no=${myboard.groupReview_no}">
												${myboard.review_title}</a>
												</c:when>
												</c:choose>
												</li>
											</ul>
										</c:forEach>
                                    </h5>
                                    <h5 style="margin:40px; margin-left:50px; margin-right:100px"><p>내가 쓴 댓글의 게시글</p>
                                    <c:forEach items="${mycomment}" var="board">
										<ul>
											<li>
											<c:choose>
												<c:when test="${board.class_no =='2'}">
												<a href="/lightDetail.go?lightning_no=${board.idx}">
												${board.lightning_title}</a>
												</c:when>
												<c:when test="${board.class_no =='5'}">
												<a href="/dojangHomeDetail.go?dojangPost_no=${board.idx}">
												${board.lightning_title}</a>
												</c:when>
												<c:when test="${board.class_no =='8'}">
												<a href="/resDetail.do?restaurant_no=${board.idx}">
												${board.lightning_title}</a>
												</c:when>
											</c:choose>
											</li>
										</ul>
									</c:forEach>
                                    </h5>
                            </div>
                        </div>
                    </div>

					
					<div class="col-md-6">
                        <div class="card">
                            
                            <div class="content">

                                <!-- <div class="">
                                	<div class="typo-line" style="float:left; margin:30px;"> -->
                                    <h5><p style="font-size:20px;">내 모임</p>
                                    	<ul>
											<li>번개모임</li>
											<c:forEach items="${myLightning}" var="myLightning">
												<ul>
													<li><a href="/lightDetail.go?lightning_no=${myLightning.idx}">${myLightning.lightning_title }</a></li>
												</ul>
											</c:forEach><br/>
											
											<li>도장깨기</li>
											<c:forEach items="${myDojang}" var="myDojang">
												<ul>
													<li><a href="/dojangHome.go?dojang_no=${myDojang.idx}">${myDojang.dojang_title }</a></li>
												</ul>
											</c:forEach><br/>
											
											<li>내가 생성한 방 - 번개</li>
											<c:forEach items="${myLightningRoom}" var="myLightningRoom">
												<ul>
													<li><a href="/lightningLeaderPage.go?lightning_no=${myLightningRoom.lightning_no}">${myLightningRoom.lightning_title }</a></li>
												</ul>
											</c:forEach><br/>
											
											<li>내가 생성한 방 - 도장</li>
											<c:forEach items="${myDojangRoom}" var="myDojangRoom">
												<ul>
													<li><a href="/dojangLeaderPage.go?dojang_no=${myDojangRoom.dojang_no}">${myDojangRoom.dojang_title }</a></li>
												</ul>
											</c:forEach><br/>
										</ul>
                                    </h5>
                                <!-- </div>
                                </div> -->

                            </div>
                        </div>
                    </div>
					

                </div>
                <!--게시글 양식 끝-->

               
            </div>
        </div>
        <!--컨텐츠영역 끝-->

        <!--푸터-->
        <footer class="footer">
            <div class="container-fluid">
                <p class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script> <a href="http://www.creative-tim.com">Creative Tim</a>, made with love for a better web
                </p>
            </div>
        </footer>

    </div>
</div>


</body>

	<%@ include file="../../../resources/inc/footer2.jsp" %>
    <!--   Core JS Files   -->
    <script src="../resources/etcResource/assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
	<script src="../resources/etcResource/assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Charts Plugin -->
	<script src="../resources/etcResource/assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="../resources/etcResource/assets/js/bootstrap-notify.js"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="../resources/etcResource/assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>
	
	<script>
		var msg = "${msg}";
		if (msg != "") {
			alert(msg);
		}
		
		
	
</script>

</html>
