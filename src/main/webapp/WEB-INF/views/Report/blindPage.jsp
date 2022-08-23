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
	
	#search{
		text-align:center; 
		top:100px;
	}
	#search{ 
	display:flex;
	 justify-content: center;
	}
	
	#searchbar{width:500px;}	
	
	#blindTable{
	top:100px;
	position:relative;
	}
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
                    <a class="navbar-brand" href="#">블라인드 목록 페이지</a>
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
         <%--        <li class="dojangParty">
                    <a class="leaderProfile">
                        <img class="avatar border-gray" src="${path}/resources/etcResource/assets/img/faces/face-0.jpg" alt="..."/>
                        <h4 class="title">${loginId}</h4>
                    </a>
                </li> --%>
                <li>
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
<div id="search"  class="input-group"  >
<select name="status_option" class="custom-select-sm">
	<option selected>전체</option>
	<option value="blind">블라인드</option>
	<option value="end">해제</option>
</select>
<select name="search_option" class="custom-select-sm">
	<option value="post_title">글제목</option>
	<option value="reporterID">신고자ID</option>
	<option value="reportedID">피신고자ID</option>
</select>
<input  id="searchbar" class="form-control" name="keyword" type="text" placeholder="검색어를 입력해 주세요"/>
<button class="btn btn-default" type="button" onclick="search_go()">검색</button>
</div>

<table id="blindTable" class="table table-hover table-striped">
	<thead>
		<tr>
			<td>블라인드 번호</td>
			<td>글제목</td>
			<td>신고자</td>
			<td>피신고자</td>
			<td>처리상태</td>
			<td>처리날짜</td>
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
listCall(currPage)

 function search_go(){ 

	 var status_option=$('select[name=status_option]').val();
	 var search_option=$('select[name=search_option]').val();
	 var keyword=$('input[name=keyword]').val();

	 console.log("상태"+status_option);
	 console.log("검색"+search_option);
	 console.log("키워드"+keyword);
	 listCall(1,status_option ,search_option , keyword);
	 $("#pagination").twbsPagination('destroy'); 
}
 
 

function listCall(page,status_option ,search_option , keyword){
	 var pagePerNum=5;
	$.ajax({
		type:'get',
		url:'/report/blindList.ajax', 
		dateType:'json', 
		data:{
			cnt:pagePerNum,
			page:page,
			
			status_option:status_option,
			search_option:search_option,
			keyword:keyword
		}, 
		success:function(data){
			console.log(data.blindList); 
			drawList(data.blindList);
			
		 	$("#pagination").twbsPagination({
				startPage:data.currPage, //시작 페이지
				totalPages: data.pages, // 총 페이지(전체 개시물 수 / 한 페이지에 보여줄 게시물 수)
				visiblePages: 5, //한번에 보여줄 페이지 수 [1][2][3][4][5]
				onPageClick:function(e,page){
					if(currPage!=page){
					//console.log(e);//클릭한 페이지와 관련된 이벤트 객체
					console.log(page);//사용자가 클릭한 페이지
					currPage = page;
					 listCall(currPage,status_option ,search_option , keyword);
				}
				}
			}); 
		},
		error:function(e){console.log(e);}
		
		
	});	
	
}



function drawList(list){ 
	var content =''; 
	list.forEach(function(list){
		var mb_ligntning_title = list.mb_ligntning_title;
		var mb_comment = list.mb_comment;
		var mb_dojang_title  =list.mb_dojang_title; 
		var mb_dojang_post = list.mb_dojang_post; 
		var mb_group_review = list.mb_group_review;
		if(mb_ligntning_title== null){
			mb_ligntning_title= ''; 
		} 
		if(mb_comment == null){
			mb_comment= ''; 
		}
		if(mb_dojang_title == null){
			mb_dojang_title= ''; 
		} 
		if(mb_dojang_post == null){
			mb_dojang_post= ''; 
		} 
		if(mb_group_review == null){
			mb_group_review= ''; 
		} 
		content += '<tr>';
		content += '<td>'+list.blind_no+'</td>';
		content += '<td><a href=/report/blindDetail.go?report_no='+list.report_no+'&class_no='+list.class_no+'&idx='+list.idx+'>'+mb_ligntning_title + mb_comment +mb_dojang_title +mb_dojang_post+ mb_group_review +'</a></td>';
		content += '<td>'+list.reporter+'</td>';
		content += '<td>'+list.reported+'</td>';
		content += '<td>'+list.report_proc_status+'</td>';
		content += '<td>'+list.report_proc_date+'</td>';
		content += '</tr>';
	});
	$('#list').empty();
	$('#list').append(content);
}






</script>
</html>