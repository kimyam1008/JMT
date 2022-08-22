<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.twbsPagination.js"></script>

<c:set var="path" value="${pageContext.request.contextPath}"/>
 <link href="${path}/resources/etcResource/assets/css/animate.min.css" rel="stylesheet"/>
<link href="${path}/resources/etcResource/assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>
<link href="/http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
<link href="${path}/resources/etcResource/assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
<link rel="icon" type="image/png" href="${path}/resources/mainResource/assets/img/pizza-slice.png">





</head>
<style>
	.pagination>.active>a,
	.pagination>.active>a:focus, 
	.pagination>.active>a:hover,
 	.pagination>.active>span,
   .pagination>.active>span:focus, 
   .pagination>.active>span:hover{
		background-color: #943bea;
			border-color:#943bea;
			
		}
		
 .pagination>li>a{
	color:#943bea;
	}


	#sidebar{ 
	position:Relative; 
	top:100px;
	}
	body{
	width: 100%;	
	}
	#memberTable{
		width: 100%;		
	}
	

	.active{
		cursor: pointer;
		color:#943bea;
		font: bold;
		text-decoration: underline;
	}
	#option_list{ text-align:center;  margin:20px 0px;  cursor: pointer;}
	#option_list span{font-size: 20px; margin:20px 20px;}
	#search{
		text-align:center; 
	}
	#search{ 
	display:flex;
	 justify-content: center;
	}
	
	#searchbar{width:500px;}
</style>

<body>
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
                    <a class="navbar-brand" href="#">회원 관리 페이지</a>
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

<br>


<!-- 클릭 옵션 -->
<div id="option_list" >
	<span class="active"  onclick="listCall(1)">전체</span>
	<span onclick="listCall(1 ,'블랙리스트')" data-value="블랙리스트">블랙리스트</span>
	<span onclick="listCall(1 ,'탈퇴')" data-value="탈퇴">탈퇴</span>
</div>

<!-- 검색 옵션  -->
<div id="search"  class="input-group"  >
	<select name="memberSearch" class="custom-select-sm">
		<option value="memberID">회원ID</option>
		<option value="grade">등급</option>
	</select>
	<input  id="searchbar" class="form-control"type="text" name="keyword"  placeholder="검색어를 입력해 주세요">
	<button  class="btn btn-default" onclick="searchClick()">검색</button>
	
</div>

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
            <ul id="sidebar" class="nav">
                <!--유저 사진, 이름-->
            <%--     <li class="dojangParty">
                    <a class="leaderProfile">
                        <img class="avatar border-gray" src="${path}/resources/etcResource/assets/img/faces/face-0.jpg" alt="..."/>
                        <h4 class="title">${loginId}</h4>
                    </a>
                </li> --%>
                <li >
                    <a href="/report/">
                        <i class="pe-7s-comment"></i>
                        <p>신고 목록</p>
                    </a>
                </li>
                <li>
                    <a href="/report/blind.go"">
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
                    <a href="/grade.go"">
                        <i class="pe-7s-note"></i>
                        <p>등급 관리</p>
                    </a>
                </li>
                <li>
                   <a href="/resUpdateList.go">
                        <i class="pe-7s-pen"></i>
                        <p>맛집 수정</p>
                    </a>
                </li>
            </ul>
    	</div>
    </div>
    <!--사이드바 끝-->

	<table id="memberTable" class="table table-hover table-striped">
		<thead>
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>등급</th>
				<th>직업</th>
				<th>회원 상태</th>
			</tr>
		</thead>
		<tbody id="list">
		
		</tbody>
		 <tr>
			<td colspan="6" id="paging">
				
				<div class="container">
					<nav arial-label="Page navigation" style="text-align:center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</td>
		</tr> 
		
	</table>


</body>
<script>

var currPage = 1;

listCall(currPage);
$('span').click(  
		function(){$("#pagination").twbsPagination('destroy'); 
		console.log('부심');
});

 function listCall(page,list_option,memberSearch,keyword){
	 var pagePerNum=5;
	 var option1 = list_option;

	 console.log(memberSearch);
	 
	$.ajax({
		type:'GET',
		url:'/report/memberList.ajax',
		data:{
			
			memberSearch:memberSearch,
			keyword:keyword,
			
			list_option:list_option,
			cnt:pagePerNum,
			page:page
		},
		dataType:'JSON',
		success:function(data){
			
			console.log(data);
			console.log(data.list);
			currPage = data.currPage;
			drawList(data.list);
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

		//console.log(item);
		content += '<tr>';	
		content += '<td><a href="/report/memberDetail.go?member_id='+item.member_id+'">'+item.member_id+'</a></td>';
		content += '<td>'+item.member_name+'</td>';
		content += '<td>'+item.member_birth+'</td>';
		content += '<td>'+item.grade_name+'</td>';
		content += '<td>'+item.profile_job+'</td>';
		content += '<td>'+item.member_status+'</td>';
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
	
function searchClick(){
	var memberSearch =$('select[name=memberSearch]').val();
	var keyword = $('input[name=keyword').val();
	var option = $('.active').attr('data-value');
	
	listCall(1,option,memberSearch,keyword);
	$("#pagination").twbsPagination('destroy'); 
}
</script>
</html>