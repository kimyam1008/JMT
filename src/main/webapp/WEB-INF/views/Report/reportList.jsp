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
	top:60px;
	}
	
	#search{ 
	display:flex;
	 justify-content: center;
	 text-align:center; 
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
                    <a class="navbar-brand" href="#">신고 목록 페이지</a>
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
               <%--  <li class="dojangParty">
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






<br>


<div id="search"  class="input-group" >
	<select name="report_status" class="custom-select-sm">
		<option selected >전체</option>
		<option value="wait">처리대기</option>
		<option value="end">처리완료</option>
		<option value="blind">블라인드</option>
	</select>
	<select name="report_sort" class="custom-select-sm">
		<option value= "idx">IDX</option>
		<option value= "sort">분류</option>
		<option value= "reporter">신고자</option>
	</select>
	<input type="text" name="keyword" placeholder="검색어를 입력해 주세요"  id="searchbar" class="form-control"/>
	<button type="button" onclick="searchClick()">검색</button>
<!-- 	<button class="btn btn-default" type="button" onclick="blind()">블라인드</button> -->

</div>
<table class="table table-hover table-striped">
		<thead>
			<tr>
				<!-- <th><input type="checkbox" id="all"/></th> -->
				<th>분류</th>
				<th>IDX</th>
				<th>신고사유</th>
				<th>신고자ID</th>
				<th>피신고자ID</th>
				<th>처리상태</th>
				<th>신고날짜</th>
				<th>처리날짜</th>
			</tr>
		</thead>
		<tbody id="list">
		
		</tbody>
		 <tr>
			<td colspan="8" id="paging">
				
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

/* $('#pagePerNum').on('change',function(){	
	console.log('currPage : '+currPage);
	
	//페이지당 보여줄 수 변경시 계산된 페이지 적용이 안된다.(플러그인의 문제)
	//페이지당 보여줄 수 변경시 기존 페이징 요소를 없애고 다시 만들어 준다.
	$("#pagination").twbsPagination('destroy');
	listCall(currPage);
	
});  */

 function listCall(page){
	 var pagePerNum=5;

	console.log("param page : "+page); 
	$.ajax({
		type:'GET',
		url:'/report/list.ajax',
		data:{
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
					//console.log(e);//클릭한 페이지와 관련된 이벤트 객체
					console.log(page);//사용자가 클릭한 페이지
					currPage = page;
					listCall(page);
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
		
		var mb_ligntning_title = item.mb_ligntning_title;
		var mb_comment = item.mb_comment;
		var mb_dojang_title  =item.mb_dojang_title; 
		var mb_dojang_post = item.mb_dojang_post; 
		var mb_group_review = item.mb_group_review;
		var report_proc_date= item.report_proc_date;
		
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
		
		if(report_proc_date == null){
			report_proc_date='처리 전';
		}
		
		//console.log(item);
		content += '<tr>';
		/* content += '<td> <input type="checkbox" value='+item.report_no+'></td>';	 */
		/* content += '<td>'+'<a href=/report/detail.go?report_no='+item.report_no+'&class_no='+item.class_no+'&idx='+item.idx+'>'+mb_ligntning_title + mb_comment+mb_dojang_title+mb_dojang_post+ mb_group_review + '<a/></td>';  */
		/* content += '<td>'+'<a href=report/detail?report_no='+item.report_no+'>'+item.report_title+'<a/></td>'; */
		content += '<td>'+item.class_name+'</td>';
		content += '<td><a href=/report/detail.go?report_no='+item.report_no+'&class_no='+item.class_no+'&idx='+item.idx+'>' +item.idx +'</a>' +'</td>';
		content += '<td>'+item.report_reason+'</td>'; 
		content += '<td>'+item.reporter+'</td>';
		content += '<td>'+item.reported+'</td>';
		content += '<td>'+item.report_proc_status+'</td>';
		content += '<td>'+item.report_date+'</td>';
		content += '<td>'+report_proc_date+'</td>';
		
		content += '</tr>';
	});
	$('#list').empty();
	$('#list').append(content);
}


/* 검색 */
function searchClick(page){
/* 검색 */
/* $('#searchBtn').on('click',function(){ */
	
	 var pagePerNum=5;
	//var page= null;
	if( page==null){
		page=1;
	} 
	
	
	
	$("#pagination").twbsPagination('destroy');
		
	let report_status =$('select[name=report_status]').val();
	let report_sort = $('select[name=report_sort]').val();
	let keyword = $('input[name=keyword]').val();
	 console.log("키워드 길이:"+keyword.trim().length);
	
	 if(keyword.trim().length==""){
		alert('검색어를 입력해 주세요'); 
		listCall(1);
	}
	 
	 else if (keyword.trim().length!=""){
		  
		 
			$.ajax({
				type:'get',
				url:'/report/list.ajax',
				async: false,
				data:{
					cnt:pagePerNum,
					page:page,
					report_status:report_status,
					report_sort:report_sort,
					keyword:keyword		
				},
				dataType:'json',
				success:function(data){
					console.log("검색결과"+data.list);
					drawList(data.list);
					//	subSearch(); 
						//currPage = data.currPage;
						//불러오기가 성공되면 플러그인 을 이용해 페이징 처리
						$("#pagination").twbsPagination({
							initiateStartPageClick: false,
							startPage:data.currPage, //시작 페이지
							totalPages: data.pages, // 총 페이지(전체 개시물 수 / 한 페이지에 보여줄 게시물 수)
							visiblePages: 5, //한번에 보여줄 페이지 수 [1][2][3][4][5]
							//href:'cliSearch.ajax?cnt='+pagePerNum+'&page='+currPage+'&searchType='+searchType+'&keyword='+keyword;
							/* onPageClick:function(){
								  //href:'?page={{number}}&searchcol='+$('#search_select').val()+'&searchval='+$('#searchval').val()
								//href:'?cnt='+pagePerNum+'&page='+currPage+'&searchType='+searchType+'&keyword='+keyword;
								 $('.page-link').on('click',function(){
										console.log('s');
										location.href='cliSearch.ajax?cnt='+pagePerNum+'&page='+currPage+'&searchType='+searchType+'&keyword='+keyword;
									
								 })
								
							} ,
							  */
							
							
					 		onPageClick:function(e,page){
								//console.log(e);//클릭한 페이지와 관련된 이벤트 객체
								console.log("정보"+page);//사용자가 클릭한 페이지
								//currPage = page;
							
								searchClick(page);
								 
							}   
						});			
				},
				error:function(e){
					console.log(e);
				}	
			});
		 
		 
		 
		 
		 
	 }


}





/* 블라인드 */
function blind(){ 
	var blindPost= [] ;

	$('#list input[type="checkbox"]:checked').each(function(idx,item){
		blindPost.push($(this).val());		
	}); 
	
	

 	$.ajax({
		url:'/report/blind.ajax',
		type:'post',
		dataType:'json',
		data:{blindPost:blindPost},
		success:function(data){console.log(data);
		console.log('블라인드 성공');
		listCall(currPage); 
		alert(" 블라인드 처리를 했습니다.");
		},
		
		error: function(e){console.log(e);}
	
	}); 
	
	
	
}





/* 체크박스 */


$('#all').click(function(){
	//console.log($('input[type="checkbox"]'))
	var $chk = $('input[type="checkbox"]'); // 체크박스를 모두 가져옴 
	console.log($chk);
	//console.log($(this).is(":checked"));
	if($(this).is(":checked")){ // 현재 일어난 이벤트 (this)가 checked 상태이면 true 
		$chk.prop("checked",true); //prop과 attr의 차이 
	}else{		// prop는 동적인 요소의 속성 -> 애초에 html로  있던 요소가 아니라 나중에 js를 통해 그려진 요소
		$chk.prop("checked",false); // attr 정정 요소의 속성-> 애초에 html로 있었던 요소 
	}
});





</script>
</html>