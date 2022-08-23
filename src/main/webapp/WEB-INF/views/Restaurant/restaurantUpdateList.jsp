<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 수정요청 목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

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
    <script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script>
<style>
	/* body{
	width: 100%;
	}
	#memberTable{
		width: 100%;		
	}
	
	table,th,td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px;
	} */
	
	.active {
		color: #943bea;
		font: bold;
		text-decoration: underline;
	}
	
	.pagination>li>a {
		color: #943bea;
	}
	
	
	#option_list {
		text-align:center;
		margin:20px 0px;
		}
	#option_list span{
		font-size: 20px;
		margin:20px 20px;
	}
	
	#search {
		text-align:center; 
	}
	
	
	th {
    text-align: center;
	}

</style>
<title>Insert title here</title>
</head>
<body>
        
     <!--사이드바 시작-->
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
                    <a class="navbar-brand" href="#">맛집 수정</a>
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
                           <a href="/logout.do">
                                <p>Log out</p>
                            </a>
                        </li>
						<li class="separator hidden-lg"></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--상단바 끝-->   
        
         <div id="option_list" >
		<span class="active" onclick="listCall(1)">전체</span>
		<span onclick="listCall(1 ,'처리대기')">처리대기</span>
		<span onclick="listCall(1 ,'처리완료')">처리완료</span>
		</div>
        
        <!--컨텐츠영역 시작-->
        <div class="content">
            <div class="container-fluid">
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
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                    <tr>
                                        <th>신고 번호</th>
                                    	<th>회원 아이디</th>
                                    	<th>식당이름</th>
                                    	<th>신청날짜</th>
                                    	<th>사유</th>
                                    	<th>처리여부</th>
                                    </tr>
                                    </thead>
                                     <tbody id="list">
      								</tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                   <!--표 끝-->
                </div>
       
        
       
	

   <!-- <table>
      <thead>
      <tr>
      	<td></td>
      	<td>
      		회원 아이디
      	</td>
      	<td>
      		식당이름
      	</td>
      	<td>
      		신청날짜
      	</td>
      	<td>
      		사유
      	</td>
      	<td>
      		처리여부
      	</td>
      </tr>      
      </thead>
      <tbody id="list">
      </tbody>
   </table> -->
	<tr>
      <td colspan="6" id="paging">
         <!-- plugin 사용법 (twbsPagination)-->
         <div class="container">
            <nav arial-label="Page navigation" style="text-align:center">
               <ul class="pagination" id="pagination"></ul>
            </nav>
            </div>
      </td>
   </tr>

</body>
	
<script>
	
	var currPage = 1;

	listCall(currPage);
	$('span').click(  
			function(){$("#pagination").twbsPagination('destroy'); 
			console.log('^^');
	});

	 function listCall(page,list_option){
		 var pagePerNum=5;
		 var option1 = list_option;

			
		$.ajax({
			type:'GET',
			url:'resUpdateList.ajax',
			data:{
				list_option:list_option,
				cnt:pagePerNum,
				page:page
			},
			dataType:'JSON',
			success:function(data){
				
				console.log(data);
				console.log(data.resUpdateList);
				currPage = data.currPage;
				drawList(data.resUpdateList);
				//currPage = data.currPage;
				//불러오기가 성공되면 플러그인 을 이용해 페이징 처리
			 	$("#pagination").twbsPagination({
					startPage:data.currPage, //시작 페이지
					totalPages: data.pages, // 총 페이지(전체 개시물 수 / 한 페이지에 보여줄 게시물 수)
					visiblePages: 5, //한번에 보여줄 페이지 수 [1][2][3][4][5]
					onPageClick:function(e,page){
						if(currPage!=page){
							//console.log(e);//클릭한 페이지와 관련된 이벤트 객체
							console.log(page);//사용자가 클릭한 페이지
							currPage = page;
							listCall(page,list_option);	
							
						}
						
					}
				}); 
				
			},
			error:function(e){
				console.log(e);
			}
		});	
		
	}
	 
	 
	function drawList(list){
		var content = '';
		list.forEach(function(item){
			
			content += '<tr>';
			content += '<td>'+item.restuarantUpdate_no+'</td>';
			content += '<td>'+item.member_id+'</td>';
			content += '<td><a href=/resAdminUpdate.go?restaurant_no='+item.restaurant_no+'&restuarantUpdate_no='+item.restuarantUpdate_no+'>'+item.restaurant_name +'</a>' +'</td>';
			content += '<td>'+item.restaurantUpdate_date+'</td>';
			content += '<td>'+item.restaurantUpdate_reason+'</td>';
			content += '<td>'+item.restaurantUpdate_proc_status+'</td>';
			
			content += '</tr>';
		});
		$('#list').empty();
		$('#list').append(content);
	}
	 
	$('span').click(function(){
	  if($('span').hasClass("active")){
	    $('span').removeClass("active");
	    $(this).addClass("active"); 
	    
	  }else{
	    $(this).addClass("active");  
	  }
	});
	


</script>


</html>