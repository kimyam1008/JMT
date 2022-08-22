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
	.fontC{
	font-size:17;
	}
	
	button{
		font-family: 'GmarketSansMedium';
		color:#fff;
		background:orange;
		border:none;
		padding:5px 10px;
	}
	button:focus{
		outline:0;
	}
	button:hover{
		background:#ff3d1c;
		cursor:pointer;
	}
	th{
		text-align:center;
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
                    <div class="col-md-10" style="margin-top:15px">
                        <div class="card">
                            <div class="content table-responsive table-full-width">
       						 <form action="profileRegister.do" method="post" enctype="multipart/form-data">
                                <table class="table table-hover table-striped">
                                    <caption style="margin-right:20px; text-align:center; font-size:20px;">프로필 생성</caption>
                                    <tr>
                                        <th>프로필 사진</th>
                                        <td>
	                                        <div class="left" style="margin:20px;">
			                               		<input type="file" name="photos" multiple="multiple" style="margin:auto 0"/>
		                               		</div>
		                               	</td>
		                            </tr>
		                            <tr>
                                        <th>성별</th>
                                        <td>
                                        	<input type="radio" name="gender" value="남자"/>남자
                                        	<input type="radio" name="gender" value="여자"/>여자
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>직업</th>
                                        <td>
                                        	<input type="radio" name="job" value="학생"/>학생
                                        	<input type="radio" name="job" value="취준생"/>취준생
                                        	<input type="radio" name="job" value="직장인"/>직장인
                                        </td>
                                     </tr>
                                     <tr>
                                        <th>식사속도</th>
                                        <td>
                                        	<input type="radio" name="speed" value="느림"/>느림
                                        	<input type="radio" name="speed" value="보통"/>보통
                                        	<input type="radio" name="speed" value="빠름"/>빠름
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <th>선호음식</th>
                                        <td>
                                        	<select name="food_no">
											<option value="">선택</option>
							                	<c:forEach items="${foodList}" var="foodList">
							                		<option value="${foodList.food_no}">${foodList.food_name}</option>
							                	</c:forEach>
							           		</select>
                                        </td>
                                        
                                    </tr>
                                   
                                    <tr>
                                        <th colspan="2">
                                        	<div style="display:block;">
	                        					<span style="text-align:center; display:block; margin: 0 auto;">
	                                        		<button>등록하기</button> 
													<button type="button" onclick="cancel()">취소</button>
												</span>
											</div>
                                        </th>
                                    </tr>
                                </table>
							  </form>
                            </div>
                        </div>
                    </div>
                   <!--표 끝-->
                </div>
                
                
                
                
                
                <%-- <div class="row">
                    <!--표 시작-->
                    <div class="col-md-12">
                        <div class="card">
                        <div class="content table-responsive table-full-width" style="height:600px">
                                <form action="profileRegister.do" method="post" enctype="multipart/form-data">
								<h3>프로필 생성</h3>
								<div class="fontC">
										프로필 사진 : <input type="file" name="photos" multiple="multiple"/><br/><br/>
										성별 : <input type="radio" name="gender" value="남자"/>남자  <input type="radio" name="gender" value="여자"/>여자<br/><br/>
										직업 : <input type="radio" name="job" value="학생"/>학생  <input type="radio" name="job" value="취준생"/>취준생  <input type="radio" name="job" value="직장인"/>직장인<br/><br/>
										식사속도 : <input type="radio" name="speed" value="느림"/>느림  <input type="radio" name="speed" value="보통"/>보통  <input type="radio" name="speed" value="빠름"/>빠름<br/><br/>
										선호음식 : 
											<select name="food_no">
											<option value="">선택</option>
							                	<c:forEach items="${foodList}" var="foodList">
							                		<option value="${foodList.food_no}">${foodList.food_name}</option>
							                	</c:forEach>
							           		</select><br/>
								</div><br/>
								<button>등록하기</button> 
								<button type="button" onclick="cancel()">취소</button>
							</form>
                                
                         </div>
                     </div>
                 </div>
             </div> --%>
            <!--표 끝-->
            
            
         </div>


                <!--게시글 양식 시작-->
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
<!-- </div> -->


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
	
		function cancel(){
			alert("프로필을 등록하지 않으면 이용에 제한 될 수 있습니다.")
			location.href='./';
		}
	
		var msg = "${msg}";
		if (msg != "") {
			alert(msg);
		}
	
</script>

</html>
