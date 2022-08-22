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
<style type="text/css">
	th{
		text-align:center;
	}

</style>
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
                <div class="row">
                    <!--표 시작-->
                    <div class="col-md-9" style="margin-top:15px">
                        <div class="card">
                            <div class="content table-responsive table-full-width">
       						 <form action="profileUpdate.do" method="post" enctype="multipart/form-data">
                                <table class="table table-hover table-striped">
                                    <caption style="margin-right:20px; text-align:right; font-size:20px;"><a href="./memberDrop.go" onclick="window.open(this.href, '_blank', 'width=400, height=200, left=500, top=300'); return false;">회원탈퇴</a></caption>
                                    <tr>
                                        <th>프로필 사진</th>
                                        <td>
	                                        <div class="left" style="float: left; margin:20px;">
			                               		<img src="/photo/${photo.photo_newFileName}" width="150" height="100"/><br/>
			                               		<input type="file" name="photos" multiple="multiple"/>
		                               		</div>
		                               	</td>
                                        <th>이름</th>
                                        <td><input type=text name="name" value="${list.member_name}"/></td>
                                    </tr>
                                    <tr>
                                        <th>아이디</th>
                                        <td>${list.member_id }</td>
                                        <th>비밀번호</th>
                                        <td><a href="./passUpdate.go" onclick="window.open(this.href, '_blank', 'width=470, height=260, left=500, top=300'); return false;">비밀번호 변경</a></td>
                                    </tr>
                                    <tr><th colspan=4 style="color:blue">프로필</th></tr>
                                    <tr>
                                        <th>성별</th>
                                        <td>${list.profile_gender }</td>
                                        <th>직업</th>
                                        <td>
                                        	<input id="student" type="radio" name="job" value="학생"/>학생  <input id="freshman" type="radio" name="job" value="취준생"/>취준생  <input id="worker" type="radio" name="job" value="직장인"/>직장인
                                        </td>
                                    </tr>
                                    <tr>
                                    	<th>식사 속도</th>
                                    	<td>
                                    		<input id="slow" type="radio" name="speed" value="느림"/>느림
                                    		<input id="nomal" type="radio" name="speed" value="보통"/>보통
                                    		<input id="fast" type="radio" name="speed" value="빠름"/>빠름
                                    	</td>
                                    	<th>선호 음식</th>
                                    	<td>
                                    		<select id="food" name="food_no">
												<option value="">선택</option>
							                	<c:forEach items="${foodList}" var="foodList">
							                		<option value="${foodList.food_no}" ${foodList.food_name == list.food_name ? 'selected="selected"' : ''}>${foodList.food_name}</option>
							                	</c:forEach>
							           		</select>
                                    	</td>
                                    </tr>
                                    <tr>
                                        <th colspan="4">
                                        	<input class="update" type="submit" value="수정">
                                        </th>
                                    </tr>
                                </table>
							  </form>
                            </div>
                        </div>
                    </div>
                   <!--표 끝-->
                </div>
                


                   
                   
                </div>


<%--                 <!--게시글 양식 시작-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="content" style="height:350px">
                                    <p>프로필</p>
									성별 : ${list.profile_gender } <br/>
									직업 : <input id="student" type="radio" name="job" value="학생"/>학생  <input id="freshman" type="radio" name="job" value="취준생"/>취준생  <input id="worker" type="radio" name="job" value="직장인"/>직장인<br/>
									식사속도 : <input id="slow" type="radio" name="speed" value="느림"/>느림  <input id="nomal" type="radio" name="speed" value="보통"/>보통  <input id="fast" type="radio" name="speed" value="빠름"/>빠름<br/>
									선호음식 : 
										<select id="food" name="food_no">
										<option value="">선택</option>
						                	<c:forEach items="${foodList}" var="foodList">
						                		<option value="${foodList.food_no}" ${foodList.food_name == list.food_name ? 'selected="selected"' : ''}>${foodList.food_name}</option>
						                	</c:forEach>
						           		</select>
					            	<br/>
									<a href="./memberDrop.go" onclick="window.open(this.href, '_blank', 'width=400, height=200, left=500, top=300'); return false;">회원탈퇴</a>
                            </div>
                        </div>
                    </div>
					<input class="update" type="submit" value="수정">
                </div>
                <!--게시글 양식 끝--> --%>

               
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
	var job = '${list.profile_job}';
	var speed = '${list.eat_speed}';
	console.log(job);
	console.log(speed);
	
	if ( job == '학생'){
		$("#student").prop("checked", true);
	} else if(job == '취준생') {
		$("#freshman").prop("checked", true);
	} else if(job == '직장인') {
		$("#worker").prop("checked", true);
	}
	
	if(speed == '느림') {
		$("#slow").prop("checked", true);
	} else if(speed == '보통') {
		$("#nomal").prop("checked", true);
	}else if(speed == '빠름') {
		$("#fast").prop("checked", true);
	}
	
	//비밀번호 변경 팝업
	function passUpdate(){
		window.open("/passUpdate.go","new","width=400, height=100, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
	}
	
</script>

</html>
