<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="../resources/mainResource/assets/img/pizza-slice.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>JMT 방장 모임 관리 페이지</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    

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

    <style>
        caption,th {
		text-align:center;
	}
	
	#getoutBtn:hover{
		background:yellowgreen;
		cursor:pointer;
	}
	
	.notiDelBtn:hover{
		cursor : pointer;
		color : red;
	}
	.profileImg{
		width:150px;
	}
    </style>
</head>
<body>
    <input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
    <input type="hidden" id="dojang_no" value="${sessionScope.dojang_no}"/>
    <!--사이드바 시작-->
    <div class="wrapper">
     <div class="sidebar" data-color="green">

        <!--

            Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
            Tip 2: you can also add an image using data-image tag

        -->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="/" class="simple-text">
                    JMT
                </a>
            </div>
            <ul class="nav">
                <!--방장 사진, 이름-->
                <li class="dojangParty">
                    <a class="leaderProfile" href="./mypage.go">
				<c:choose>
						<c:when test="${dto.photo_newFileName ne null}">
							 <img class="avatar border-gray" src="/photo/${dto.photo_newFileName}" class="profileImg" alt="..."/>
						</c:when>
						<c:otherwise>
							<img class="avatar border-gray" src ="resources/photo/profile.png" class="profileImg">
						</c:otherwise>
	              </c:choose>
                        <h4 class="title">${sessionScope.loginId}</h4>
                    </a>
                </li>
                <li>
                    <a href="dojangLeaderPage.go?dojang_no=${sessionScope.dojang_no}">
                        <i class="pe-7s-star"></i>
                        <p>방장 페이지</p>
                    </a>
                </li>
                <li class="active">
                    <a href="myGroupPostSettingD.go?dojang_no=${sessionScope.dojang_no}">
                        <i class="pe-7s-tools"></i>
                        <p>나의 모임 관리</p>
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
                    <a class="navbar-brand" href="dojangLeaderPage.go?dojang_no=${sessionScope.dojang_no}">방장 페이지</a>
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
                            <a href="/">
                                <p>Home</p>
                             </a>
                         </li>
                        <li>
                           <a href="./mypage.go">
                               <p>마이페이지</p>
                            </a>
                        </li>
                        <li>
                            <a href="logout.do">
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

                <!--게시글 양식 시작-->
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            
                            <div class="content" style="padding:30px;">

                                <div class="top-section">
                                	<div>
										<c:choose>
											<c:when test="${dto.photo_newFileName ne null}">
												 <a href="#" style="float:left; weight:50px;"><img src ="/photo/${dto.photo_newFileName}" class="profileImg"></a>
											</c:when>
						              </c:choose>
	                                    <div>
	                                    	<p class="title" style="margin-bottom:10px;">${dto.dojang_title}</p>
	                                    	<p class="post-count">작성글 : ${dto.post_count}</p><p class="comment-count">작성 댓글 : ${dto.comment_count}</p>
                                		</div>
                                	</div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
                <!--게시글 양식 끝-->

                <h4><a href="/myGroupPostSettingD.go?dojang_no=${dto.dojang_no}">게시글</a> <a href="javascript:location.reload()">회원</a></h4>

                <!--여기에 <div class="row">로 시작해서 내용을 넣어주세요 -->
                <div class="row">
                    <!--표 시작-->
                    <div class="col-md-12">
                        <div class="card">
                        	<input id="getoutBtn" type="button" value="추방하기" style="float:left; margin:15px 15px; border:none;" onclick="getOut()"/>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>회원 ID</th>
                                            <th>이름</th>
                                        </tr>
                                    </thead>
                                    <tbody id="list">
                                    	<c:if test = "${dojangMember.size() == 0}">
						                    <th colspan="3" style="text-align:center;">모임에 가입한 회원이 없습니다.</th>
						                </c:if>
                                        <c:forEach items="${dojangMember}" var="dojangMember">
                                        <tr>			
                                            <td><input type="radio" name="member_id" id="member_id" value="${dojangMember.member_id}"/></td>
                                            <td>${dojangMember.member_id}</td>
                                            <td>${dojangMember.member_name}</td>
                                        </tr>
                                        </c:forEach>
                                </table>

                            </div>
                        </div>
                    </div>
                   <!--표 끝-->
                </div>


                

               
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
<script>
function getOut(){
	var member_id = $('input[type="radio"]:checked').val();
	//var radioChk = opener.document.getElementsByName('member_id');
	
	
	if($('input[type="radio"]:checked').is(":checked") == false){
		alert("추방할 회원을 선택해 주세요.");
	} else {
		window.open("/memberGetOutD.go?member_id="+member_id,"new","width=500, height=250, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
		//openWin.document.getElementById("member_id").value = document.getElementById("member_id").value;
	}
}
</script>

    <!--   Core JS Files   -->
    <script src="../resources/etcResource/assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
	<script src="../resources/etcResource/assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Charts Plugin -->
	<script src="../resources/etcResource/assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="../resources/etcResource/assets/js/bootstrap-notify.js"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="../resources/etcResource/assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>


</html>
