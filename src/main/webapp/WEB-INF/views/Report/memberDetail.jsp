<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
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
.modal{z-index:1050;}
	
/* 	table,th,td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px;
	} */

	.active{
		cursor: pointer;
		color:#943bea;
		font: bold;
		text-decoration: underline;
	}
	
	.deactivate{
	display:none;
	}
	
	
	
	#option_list{ text-align:center;  margin:20px 0px;  cursor: pointer;}
	#option_list span{font-size: 20px; margin:20px 20px;}
	textarea{
		resize:none;width:95%;height:150px;
	}
/* 	.pagination{
		background-color: pink;
	} */

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
	
/* 	
	#blindTable{display:none;} */
	ul{
	list-style:none; 
	}


.list-group{
	width:200px; float:left;
	display:inline-block;
}
#memberListSet{
	float:left;
	width:100%;
}
/* 
#blindTable{width:100%;  } 
#twobutton{
    display: flex;
  
}


</style>
<body>
<!-- 모달.  -->
<!-- 블랙리스트 처리  -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- 블랙 모달-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"> 블랙리스트 등록/ 해제</h4>
      </div>
      <div class="modal-body">
     	<table class="table table-bordered">
     		<tr>
     			<th>회원ID</th>
     			<td>${detail.member_id}</td>
     		</tr>
     		<tr>
     			<th>블랙리스트 처리</th>
     			<td>
     				<c:if test="${black.blacklist_status eq null}">
	     				<label>Y <input name="black" type="radio" value="블랙리스트"/> </label>       			
	     			</c:if>
	     			<c:if test="${black.blacklist_status eq '블랙리스트'}">
	     				<label>Y <input name="black" type="radio" value="블랙리스트" checked/> </label>       			
	     			</c:if>
	     				<c:if test="${black.blacklist_status eq '일반회원'}">
	     				<label>Y <input name="black" type="radio" value="블랙리스트" /> </label>       			
	     			</c:if>
	     			&nbsp;&nbsp;&nbsp;&nbsp;
	     			<c:if test="${black.blacklist_status eq null}">
	     				<label>N <input  name="black" type="radio" value="일반회원"/></label>  			
	     			</c:if>
	     			<c:if test="${black.blacklist_status eq '일반회원'}">
	     				<label>N  <input  name="black" type="radio" value="일반회원" checked/></label>  			
	     			</c:if>	<c:if test="${black.blacklist_status eq '블랙리스트'}">
	     				<label>N  <input  name="black" type="radio" value="일반회원" /></label>  			
	     			</c:if>
     			</td>   
     		</tr>
     		<tr>
     			<th>처리 사유</th>
     			<td><textarea name="blacklist_proc_reason"></textarea></td>
     		</tr>
     		<tr>
     			<th colspan="2">
     				<button class="btn btn-default" style="background-color: pink;" onclick="blickReg()" >완료</button>
     			</th>
     		</tr>
     	</table>
      </div>
      <div class="modal-footer">
        <button  type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<!-- 모달.  -->
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
                    <a class="navbar-brand" href="#">회원 관리 상세</a>
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
            <%--     <li class="dojangParty">
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


<input type="hidden" value="${loginId}"/>
<h3>회원 정보</h3>
<!-- 회원 상세 정보  -->
<table class="table table-bordered">
	<tr>
		<th>회원ID</th>
		<td>${detail.member_id}</td>
		<th>상태</th>
		<td>${detail.member_status}</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>${detail.profile_gender}</td>
		<th>생년월일</th>
		<td>${detail.member_birth}</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${detail.member_email}</td>
		<th>직업</th>
		<td>${detail.profile_job}</td>
	</tr>
</table>


<!-- 클릭 옵션 -->
<div id="option_list" >
	<span onclick="listCall(1)" data-value="블라인드" class="active">블라인드 내역</span>
	<span onclick="listCallBlack(1)" data-value="블랙리스트">블랙리스트 내역</span>
</div>

<div id="boxList">

<!-- <div class="list-group">
  <a href="#" class="list-group-item">신고목록 </a>
  <a href="#" class="list-group-item">블라인드 목록 </a>
  <a href="#" class="list-group-item">회원 관리 </a>
  <a href="#" class="list-group-item">등급 관리 </a>
  <a href="#" class="list-group-item">맛집 수정 </a>
</div> -->





<div id="memberListSet">


<!-- Button trigger modal -->
<div id="twobutton">
<button id="regButton" type="button" style="background-color: #943bea;  color:white;  border:none;" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">  블랙리스트 등록/ 해제</button>
<button type ="button" onclick="Back()"  style="background-color: #943bea;  color:white; border:none;" class="btn btn-info btn-lg" >목록</button>
</div>





<table id="blindTable" class="table table-bordered">
		<thead>
			<tr>
				<th>블라인드 게시물</th>
				<th>분류</th>
				<th>신고자ID</th>
				<th>피신고자 ID</th>
				<th>처리상태</th>
				<th>처리날짜</th>
			</tr>
		</thead>
		<tbody id="blindList">
		
		</tbody>
		 <tr>
			<td colspan="6" id="paging">
				
				<div class="container">
					<nav arial-label="Page navigation" style="text-align:center">
						<ul class="pagination" id="pagination1"></ul>
					</nav>
				</div>
			</td>
		</tr> 
		
	</table>
	
	
	
	<!--    블랙  -->
	<table id="blackTable" class="table table-bordered deactivate" >
		<thead>
			<tr>			
				<th>블랙 여부</th>
				<th>처리사유 사유</th>
				<th>관리자</th>
				<th>처리날짜</th>
			</tr>
		</thead>
		<tbody id="blackList">
		
		</tbody>
		 <tr>
			<td colspan="4" id="paging">
				
				<div class="container">
					<nav arial-label="Page navigation" style="text-align:center">
						<ul class="pagination" id="pagination2"></ul>
					</nav>
				</div>
			</td>
		</tr> 
	</table>
</div>

</div>

</body>
<script>
var loginId = $('input[type=hidden]').val();

var currPage = 1;
listCall(currPage);
listCallBlack(currPage);

function listCall(page){
	 var pagePerNum=5;
$.ajax({
	type:'get',
	dataType:'json', 
	data:{
		member_id:"${detail.member_id}"
			,cnt:pagePerNum
			,page:page
	},
	url:'/report/blindMemberList.ajax',
	success:function(data){
		console.log(data.blindList);
		drawList(data.blindList);
		
	 	$("#pagination1").twbsPagination({
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
	error:function(e){console.log(e);}
	
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
		
		
		
		//console.log(item);
		content += '<tr>';	
		content += '<td>'+mb_ligntning_title + mb_comment+mb_dojang_title +mb_dojang_post+ mb_group_review +'</td>';
		content += '<td>'+item.class_name +'</td>';
		content += '<td>'+item.reporter+'</td>';
		content += '<td>'+item.reported+'</td>';
		content += '<td>'+item.blind_status+'</td>';
		content += '<td>'+item.blind_proc_date+'</td>';
		content += '</tr>';
	});
	
	$('#blindList').empty();
	$('#blindList').append(content);
}



$('span').click(function(){
	  if($('span').hasClass("active")){
	    $('span').removeClass("active");
	    $(this).addClass("active"); 
	    
	  }else{
	    $(this).addClass("active");  
	  }
	});

 

$('span[data-value="블라인드"]').click(function(){
	
	
	 $('#blackTable').addClass("deactivate");  
	 $('#blindTable').removeClass("deactivate");  
	
	
	 	
});


 $('span[data-value="블랙리스트"]').click(function(){
	 $('#blackTable').removeClass("deactivate");  
	 $('#blindTable').addClass("deactivate");  
 	
});









function blickReg(){
	var member_id ="${detail.member_id}";
	var black = $('input[name=black]:checked').val();
	var reason = $('textarea[name=blacklist_proc_reason]').val();
	
	
	if("${black.blacklist_status}"==black)	{
		alert('이미 해당 상태입니다.'); 
		location.reload();
		return false; 
		
	}
			
	if("${black.blacklist_status}"!=black)	{

			$.ajax({
				type:'post',
				url:'/report/blackReg.ajax',
				dataType:'json',
				data:{
					loginId:loginId,
					member_id:member_id,
					black:black,
					reason:reason
				},
				success:function(data){
					console.log(data);
					if(data.result>0){
						alert(data.msg);
					}
					location.reload();
					
				}, 
				error:function(e){console.log(e);}
			
			});	
	}		
}

/* 블랙리스트 all  */
function listCallBlack(page){
	 var pagePerNum=5;
$.ajax({
	type:'get',
	dataType:'json', 
	data:{
		member_id:"${detail.member_id}"
			,cnt:pagePerNum
			,page:page
	},
	url:'/report/blackMemberList.ajax',
	success:function(data){
		console.log(data.blackMemberList);
		drawBlackList(data.blackMemberList);
		
	 	$("#pagination2").twbsPagination({
			startPage:data.currPage, //시작 페이지
			totalPages: data.pages, // 총 페이지(전체 개시물 수 / 한 페이지에 보여줄 게시물 수)
			visiblePages: 5, //한번에 보여줄 페이지 수 [1][2][3][4][5]
			onPageClick:function(e,page){
				//console.log(e);//클릭한 페이지와 관련된 이벤트 객체
				console.log(page);//사용자가 클릭한 페이지
				currPage = page;
				listCallBlack(page);
			}
		});
	},
	error:function(e){console.log(e);}
	
});

}


function drawBlackList(list){
	var content = '';
	list.forEach(function(item){		
		//console.log(item);
		content += '<tr>';	
		content += '<td>'+item.blacklist_status+'</td>';
		content += '<td>'+item.blacklist_proc_reason+'</td>';
		content += '<td>'+item.admin_id+'</td>';
		content += '<td>'+item.blacklist_proc_date+'</td>';
		content += '</tr>';
	});
	
	$('#blackList').empty();
	$('#blackList').append(content);
}

function Back(){ 
	location.href="/report/memberList.go";
	
}

</script>
</html>