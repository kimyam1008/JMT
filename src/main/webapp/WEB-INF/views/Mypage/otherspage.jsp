<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="../resources/mainResource/assets/img/pizza-slice.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>JMT 마이페이지</title>

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
                <a href="jmtMain.html" class="simple-text">
                    JMT
                </a>
            </div>
            <ul class="nav">
                <li class="active">
                    <a href="#">
                        <i class="pe-7s-user"></i>
                        <p>마이페이지</p>
                    </a>
                </li>
                <li>
                    <a href="./myBoardList.go">
                        <i class="pe-7s-note2"></i>
                        <p>나의 활동</p>
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
                        <!-- <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-globe"></i>
                                    <b class="caret hidden-lg hidden-md"></b>
									<p class="hidden-lg hidden-md">
										5 Notifications
										<b class="caret"></b>
									</p>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="#">Notification 1</a></li>
                                <li><a href="#">Notification 2</a></li>
                                <li><a href="#">Notification 3</a></li>
                                <li><a href="#">Notification 4</a></li>
                                <li><a href="#">Another notification</a></li>
                              </ul>
                        </li> -->
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
                           <a href="#">
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
                <div class="row">
                    <!--표 시작-->
                    <div class="col-md-12">
                        <form action="./follow.do" method="post">
                        <div class="card">
                        <div class="content table-responsive table-full-width" style="height:170px">
                                <div class="table table-hover table-striped">
                           <div class="left" style="float: left; margin:20px;">
                           			<input type="hidden" name="member_id" value="${list.member_id}">
									<input type="hidden" name="profile_no" value="${list.profile_no}">
                               		<img src="/photo/${photo.photo_newFileName}" width="150" height="100"/>
                               	</div>
                               	<div class="middle" style="float: left; margin:20px;">
                               		${list.member_id }님의 마이페이지<br/>
                               		등급 : ${list.grade_name }
									팔로워 : <a href="./otherFollowerList.go?profile_no=${list.profile_no}" onclick="window.open(this.href, '_blank', 'width=400, height=450, left=500, top=200'); return false;">${follower }</a>
									팔로잉 : <a href="./otherFollowingList.go?profile_no=${list.profile_no}" onclick="window.open(this.href, '_blank', 'width=400, height=450, left=500, top=200'); return false;">${following }</a>
                               	</div>
                               	<div class="right" style="float: left; margin:20px;">
                               		성별 : ${list.profile_gender }<br/>
									직업 : ${list.profile_job }<br/>
									선호 음식 : ${list.food_name }<br/>
									식사 속도 : ${list.eat_speed }<br/>
									블라인드 수 : ${blind }<br/>
									<input id="follow" type="submit" name="follow" value="${follow }"/>
                               	</div>
                                </div>
                            </div>
                        </div>
                        </form>
                    </div>
                   <!--표 끝-->
                </div>


                <!--게시글 양식 시작-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="content" style="height:350px">
                                    <div class="typo-line" style="float:left;">
                                    <h5><p class="category">${list.member_id}의 게시글</p>
                                    	<c:forEach items="${myboard }" var="list">
											<ul>
												<li>${list.review_title }</li>
											</ul>
										</c:forEach>
                                    </h5>
                                    <h5><p class="category">${list.member_id}의 쓴 댓글의 게시글</p>
                                    <c:forEach items="${mycomment}" var="board">
										<ul>
											<li>${board.lightning_title}</li>
										</ul>
									</c:forEach>
                                    </h5>
                                </div>
                                <div class="typo-line" style="float:left; margin:30px;" >
                                    <h5><p class="category">모임</p>
                                    	<ul>
											<li>생성한 방 - 번개</li>
											<c:forEach items="${lightRoom}" var="lightRoom">
												<a href="#">${lightRoom.lightning_title }</a>
											</c:forEach>
											
											<li>생성한 방 - 도장</li>
											<c:forEach items="${dojangRoom}" var="dojangRoom">
												<a href="#">${dojangRoom.dojang_title }</a>
											</c:forEach>
										</ul>
                                    </h5>
                                </div>
                                <div class="fol">
									<h3>팔로워만 볼 수 있습니다.</h3>
								</div>
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
		
		var follow = "${follow}";
		if(follow == "팔로우"){
			$(".typo-line").hide();
			$(".fol").show();
		} else if (follow == "팔로잉") {
			$(".typo-line").show();
			$(".fol").hide();
		}
	
	</script>

</html>
