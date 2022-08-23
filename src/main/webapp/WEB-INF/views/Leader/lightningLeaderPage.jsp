<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="../resources/mainResource/assets/img/pizza-slice.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>JMT 번개모임 방장페이지</title>

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
	<style type="text/css">
		table th {
			text-align:center;
		}
		
		input[type='button']{
			font-family: 'GmarketSansMedium';
			color:black;
			background:#D6F5D8;
			border:solid #B9F2B4 1px;
			padding:5px 10px;
		}
		input[type='button']:focus{
			outline:0;
		}
		input[type='button']:hover{
			background:yellowgreen;
			cursor:pointer;
		}
		
		.notiDelBtn:hover{
			cursor : pointer;
			color : red;
		}
	</style>
</head>
<body>
    <input type="hidden" name="class_no" value="${lightDto.class_no}"/>
	<input type="hidden" name="lightning_no" value="${lightDto.lightning_no}"/>
    <input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
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
						<c:when test="${lightDto.photo_newFileName ne null}">
							 <img class="avatar border-gray" src="/photo/${lightDto.photo_newFileName}" alt="..."/>
						</c:when>
						<c:otherwise>
							<img class="avatar border-gray" src ="resources/photo/profile.png" class="profileImg">
						</c:otherwise>
	              </c:choose>
                        <h4 class="title">${sessionScope.loginId}</h4>
                    </a>
                </li>
                <li class="active">
                    <a href="lightningLeaderPage.go?lightning_no=${lightDto.lightning_no}">
                        <i class="pe-7s-star"></i>
                        <p>방장 페이지</p>
                    </a>
                </li>
                <li>
                    <a href="myGroupPostSettingL.go?lightning_no=${lightDto.lightning_no}">
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
                    <a class="navbar-brand" href="lightningLeaderPage.go?lightning_no=${lightDto.lightning_no}">방장 페이지</a>
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
                                <li><a href="#">Notification 1</a></li>
                                <li><a href="#">Notification 2</a></li>
                                <li><a href="#">Notification 3</a></li>
                                <li><a href="#">Notification 4</a></li>
                                <li><a href="#">Another notification</a></li>
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
                <!--여기에 <div class="row">로 시작해서 내용을 넣어주세요 -->
                <div class="row">
                    <!--표 시작-->
                    <div class="col-md-12">
                        <div class="card">
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <caption style="maragin:0 auto; text-align:center; font-size:20px;">${lightDto.lightning_title}</caption>
                                    <tr>
                                        <th>방장</th>
                                        <td>${lightDto.leaderName}</td>
                                        <th>모집상태</th>
                                        <td>${lightDto.lightning_status}</td>
                                    </tr>
                                    <tr>
                                        <th>정원</th>
                                        <td>${lightDto.member_count} / ${lightDto.member_num}</td>
                                        <th>성별</th>
                                        <td>${lightDto.gender}</td>
                                    </tr>
                                    <tr>
                                        <th>음식 카테고리</th>
                                        <td>${lightDto.food_name}</td>
                                        <th>식사속도</th>
                                        <td>${lightDto.eat_speed}</td>
                                    </tr>
                                    <tr>
                                        <th>개설일</th>
                                        <td>${lightDto.lightning_create}</td>
                                        <th>직업</th>
                                        <td>${lightDto.job}</td>
                                    </tr>
                                    <tr>
                                        <th colspan="4">
                                            <input type="button" value="수정" onclick="lightEdit()"/>
                                            <input type="button" value="삭제" onclick="groupDelete()"/>
                                        </th>
                                    </tr>
                                </table>

                            </div>
                        </div>
                    </div>
                   <!--표 끝-->
                </div>
                
                <h4><a href="/myGroupPostSettingL.go?lightning_no=${lightDto.lightning_no}">나의 모임 관리</a></h4>

                <!--게시글 양식 시작-->
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                        	<div class="content">
                            <h3>최근 게시글</h3>
                            <a style="text-decoration:none; float:right; font-size:16px;" href="/myGroupPostSettingL.go?lightning_no=${lightDto.lightning_no}">더보기</a><br/>
	                            <ul>
	                                <c:if test = "${lightRecentPost.size() == 0}">
	                                    <p style="text-align:center;">등록된 글이 없습니다.</p>
	                                </c:if>
	                                <c:forEach items="${lightRecentPost}" var="lightRecentPost" begin="0" end="4">			
	                                    <li style="text-align:left; font-size:17px;">${lightRecentPost.lightning_title}</li>
	                                </c:forEach>
	                            </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="card">
                        	<div class="content">
	                            <h3>가입 대기 회원</h3>
	                            <a style="text-decoration:none; float:right; font-size:16px;" onclick="lightJoinWait()">회원보기</a><br/>
	                            <!-- <input type="button" value="회원보기" onclick="lightJoinWait()"/> -->
	                            <ul>
	                            	<c:if test = "${lightJoinWait.size() == 0}">
	                                     <p style="text-align:center;">가입 신청한 회원이 없습니다.</p>
	                                </c:if>
	                                <c:forEach items="${lightJoinWait}" var="lightJoinWait">
	                                    <li style="text-align:left; font-size:17px;">${lightJoinWait.member_id}</li>
	                                </c:forEach>
	                            </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!--게시글 양식 끝-->

                 <!--게시글 양식 시작-->
                 <%-- <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                        	<div class="content">
	                            <h3>가입 대기 회원</h3><a style="text-decoration:none" onclick="lightJoinWait()">회원보기</a>
	                            <!-- <input type="button" value="회원보기" onclick="lightJoinWait()"/> -->
	                            <ul>
	                                <c:forEach items="${lightJoinWait}" var="lightJoinWait">
	                                    <li>${lightJoinWait.member_id}</li>
	                                </c:forEach>
	                            </ul>
                            </div>
                        </div>
                    </div>
                </div> --%>
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
<script>
function lightEdit(){
	window.open("/lightEdit.go?lightning_no="+${lightDto.lightning_no},"new","width=500, height=500, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}

//모임 삭제
function groupDelete(){
	var member_count = ${lightDto.member_count};
	var result = confirm("정말로 모임을 삭제하시겠습니까? 한 번 삭제하면 되돌릴 수 없습니다.");
	
	if(result == true){
		/* if(member_count > 1) {
			alert("모임의 모든 회원을 추방한 뒤 모임을 삭제하세요.");
		} else { */
			location.href="/leaderLightDelete.do?lightning_no="+${lightDto.lightning_no};
		/* } */
		
	}
}

//가입 대기 회원 팝업
function lightJoinWait(){
	window.open("/lightJoinWait.go?lightning_no="+${lightDto.lightning_no},"new","width=500, height=500, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
	//window.open("/joinWait.go?grouop_no="+${dojangDetail.group_no},"new","width=600, height=300, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
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
