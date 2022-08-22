<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="icon" type="image/png" href="../resources/mainResource/assets/img/pizza-slice.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

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
		
	.card .content {
    padding: 15px 15px 10p 15px;
    margin: auto;
    height: 200px;
		width: 800px;
	}
	textarea{
		resize:none;
		width:100%;
		height:150px;
	}
	
			

</style>
<title>맛집 수정</title>
</head>
<body>

	<div class="wrapper">
     <div class="sidebar" data-color="purple">

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
                <!--유저 사진, 이름-->
                <li class="dojangParty">
                </li>
                <li>
                    <a href="/report/">
                        <i class="pe-7s-comment"></i>
                        <p>신고 목록</p>
                    </a>
                </li>
                <li>
                    <a href="/report/blind.go">
                        <i class="pe-7s-config"></i>
                        <p>블라인드</p>
                    </a>
                </li>
                <li>
                    <a href="/report/memberList.go">
                        <i class="pe-7s-users"></i>
                        <p>회원 관리</p>
                    </a>
                </li>
                <li>
                    <a href="grade.go">
                        <i class="pe-7s-note"></i>
                        <p>등급 관리</p>
                    </a>
                </li>
                <li class="active">
                    <a href="resUpdateList.go">
                        <i class="pe-7s-pen"></i>
                        <p>맛집 수정</p>
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
                    <a class="navbar-brand" href="#">맛집 수정요청 목록</a>
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
                            <a href="/">
                                <p>Home</p>
                             </a>
                         </li>
                           <li>
                              <a href="#">
                                <p>${loginId}</p>
                            </a>
                         </li>
                        <li>
                            <a href="#">
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
        <div class="">
            <div class="">
                <!--여기에 <div class="row">로 시작해서 내용을 넣어주세요 -->
                <div class="row">
                    <!--표 시작-->
                    <div class="col-md-12">
                        <div class="card">
                            <!-- <table style="margin:0 auto; text-align:center;">
                                <tr>
                                    <td>섹션1</td>
                                    <td>섹션2</td>
                                </tr>
                                <tr>
                                    <td>섹션3</td>
                                    <td>섹션4</td>
                                </tr>
                                <tr>
                                    <td>섹션4</td>
                                    <td>섹션5</td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td>섹션1</td>
                                    <td>섹션2</td>
                                </tr>
                                <tr>
                                    <td>섹션3</td>
                                    <td>섹션4</td>
                                </tr>
                                <tr>
                                    <td>섹션4</td>
                                    <td>섹션5</td>
                                </tr>
                            </table> -->
                            <div id="res1" class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                       
                                    </thead>
                                     <tbody >
                                     		<form action="Reporthandling.do" method="post">
												<tr>
													<td>
														식당이름
													</td>
													<td>
														<input type="hidden" name="restaurant_no" value="${resUpdateNo.restaurant_no}" />
														<input type="hidden" name="restuarantUpdate_no" value="${resUpdateNo.restuarantUpdate_no}" />
														${resUpdateNo.restaurant_name}
													</td>
													<td>
														처리 여부
													</td>
													<td>
														<select name="restaurantUpdate_proc_status">
															<option value="처리대기" ${resUpdateNo.restaurantUpdate_proc_status == '처리대기' ? 'selected="selected" ' : '' } >처리대기</option>
															<option value="처리완료" ${resUpdateNo.restaurantUpdate_proc_status == '처리완료' ? 'selected="selected" ' : '' } >처리완료</option>
														</select>
													</td>
												</tr>
												
												<tr>
													<td colspan="1">
														사유
													</td>
													<th colspan="3">
														${resUpdateNo.restaurantUpdate_reason}
													</th>
												</tr>
												<tr>
													<td>
														회원 ID
													</td>
													<th>
														${resUpdateNo.member_id}
													</th>
													<td>
														신청 날짜
													</td>
													<th>
														${resUpdateNo.restaurantUpdate_date}
													</th>
												</tr>
												<tr>
													<td colspan="4">
														<span>
															<input type="submit" value="등록">
														</span>
													</td>
												</tr>
												<br/>
											</form>
      								</tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                   <!--표 끝-->
                </div>
                
                <!--컨텐츠영역 시작-->
        <div class="">
            <div class="">
                <!--여기에 <div class="row">로 시작해서 내용을 넣어주세요 -->
                <div class="row">
                    <!--표 시작-->
                    <div class="col-md-12">
                        <div class="card">
                
                 <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                       
                                    </thead>
                                     <tbody>
                                   		<form action="resAdminUpdate.do" method="post">
											<tr>
												<td colspan="1">
													식당이름
												</td>
												<td colspan="3">
													<input type="hidden" name="restaurant_no" value="${resUpdateNo.restaurant_no}" />
													<input type="hidden" name="restuarantUpdate_no" value="${resUpdateNo.restuarantUpdate_no}" />
													<textarea name="restaurant_name">${requestNO.restaurant_name}</textarea>
												</td>
											</tr>
											
											<tr>
												<td colspan="1">
													주소
												</td>
												<td colspan="3">
													<textarea name="restaurant_address">${requestNO.restaurant_address}</textarea>
												</td>
											</tr>
											
											<tr>
												<td>
													영업정보
												</td>
												<td>
													<textarea name="restaurant_info">${requestNO.restaurant_info}</textarea>
												</td>
												<td>
													전화번호
												</td>
												<td>
													<textarea name="restaurant_call">${requestNO.restaurant_call}</textarea>
												</td>
											</tr>
											
											<tr>
												<td>
													X좌표(위도)
												</td>
												<th>
													${requestNO.restaurant_X}
												</th>
												<td>
													Y좌표(경도)
												</td>
												<th>
													${requestNO.restaurant_Y}
												</th>
											</tr>
											
											<tr>
												<td colspan="2">
													음식 카테고리
												</td>
												<td colspan="2">
													${requestNO.food_name}
												</td>
												
											</tr>
											<tr>
												<td colspan="4">
													<span>			
														<input type="submit" value="등록">  
														<button type="button" onclick="back()">목록</button>
													</span>
												</td>
											</tr>
										</form>
      								</tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                   <!--표 끝-->
                </div>
                
	<%-- <form action="Reporthandling.do" method="post">
	<table>
		<tr>
			<td>
				식당이름
			</td>
			<td>
				<input type="hidden" name="restaurant_no" value="${resUpdateNo.restaurant_no}" />
				<input type="hidden" name="restuarantUpdate_no" value="${resUpdateNo.restuarantUpdate_no}" />
				${resUpdateNo.restaurant_name}
			</td>
			<td>
				처리 여부
			</td>
			<td>
				<select name="restaurantUpdate_proc_status">
					<option value="처리대기" ${resUpdateNo.restaurantUpdate_proc_status == '처리대기' ? 'selected="selected" ' : '' } >처리대기</option>
					<option value="처리완료" ${resUpdateNo.restaurantUpdate_proc_status == '처리완료' ? 'selected="selected" ' : '' } >처리완료</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td colspan="1">
				사유
			</td>
			<th colspan="3">
				${resUpdateNo.restaurantUpdate_reason}
			</th>
		</tr>
		<tr>
			<td>
				회원 ID
			</td>
			<th>
				${resUpdateNo.member_id}
			</th>
			<td>
				신청 날짜
			</td>
			<th>
				${resUpdateNo.restaurantUpdate_date}
			</th>
		</tr>
		<tr>
			<td colspan="4">
				<span>
					<input type="submit" value="등록">
				</span>
			</td>
		</tr>
	</table>
	<br/>
	</form>
	
	<form action="resAdminUpdate.do" method="post">
	<table>
		<tr>
			<td colspan="1">
				식당이름
			</td>
			<td colspan="3">
				<input type="hidden" name="restaurant_no" value="${resUpdateNo.restaurant_no}" />
				<input type="hidden" name="restuarantUpdate_no" value="${resUpdateNo.restuarantUpdate_no}" />
				<textarea name="restaurant_name">${requestNO.restaurant_name}</textarea>
			</td>
		</tr>
		
		<tr>
			<td colspan="1">
				주소
			</td>
			<td colspan="3">
				<textarea name="restaurant_address">${requestNO.restaurant_address}</textarea>
			</td>
		</tr>
		
		<tr>
			<td>
				영업정보
			</td>
			<td>
				<textarea name="restaurant_info">${requestNO.restaurant_info}</textarea>
			</td>
			<td>
				전화번호
			</td>
			<td>
				<textarea name="restaurant_call">${requestNO.restaurant_call}</textarea>
			</td>
		</tr>
		
		<tr>
			<td>
				X좌표(위도)
			</td>
			<th>
				${requestNO.restaurant_X}
			</th>
			<td>
				Y좌표(경도)
			</td>
			<th>
				${requestNO.restaurant_Y}
			</th>
		</tr>
		
		<tr>
			<td colspan="2">
				음식 카테고리
			</td>
			<td colspan="2">
				
			</td>
			
		</tr>
		<tr>
			<td colspan="4">
				<span>			
					<input type="submit" value="등록">  
					<button type="button" onclick="back()">목록</button>
				</span>
			</td>
		</tr>
	</table>
	</form> --%>



</body>
<script>


	var msg = "${msg}";
		if(msg != ""){
		alert(msg);
	}
		
	function back(){ 
		location.href="/resUpdateList.go"; 
	
	}

</script>
</html>