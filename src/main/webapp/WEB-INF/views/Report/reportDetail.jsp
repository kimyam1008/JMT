<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">



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

table{width:100%;}
	textarea{
		resize:none;width:95%;height:150px;
	}
	/*  .onlyread{
	 border:none;	
	 outline:none;
	 } */
	 
	 
	 #twobutton{
		 position: absolute;
  	left: 50%;
 	 transform: translateX(-50%);
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
                    <a class="navbar-brand" href="#">신고 상세 페이지</a>
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
              <%--   <li class="dojangParty">
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







	<form id="form_" action="reportUpdate.do" method="post">
		<input type="hidden" name="report_no" value="${detailDto.report_no}"/>
		<input type="hidden" name="idx" value="${detailDto.idx}"/>
		<input type="hidden" name="class_no" value="${detailDto.class_no}"/>
		<input type="hidden" name="reported" value="${detailDto.reported}"/>
	
		<table  class="table"> 
			<tr>
				<th>신고된 글/댓글</th>
				<td >
					<%-- <c:if test="${not empty reportPost.lightning_title}"><input name="reporter" class="onlyread" type="text" value='${reportPost.lightning_title}' readonly/></c:if>
					 <c:if test="${not empty reportPost.dojang_title}"><input name="reporter" class="onlyread" type="text" value='${reportPost.dojang_title}' readonly/></c:if>
					 <c:if test="${not empty reportPost.comment_content}"><input name="reporter" class="onlyread" type="text" value='${reportPost.comment_content}' readonly/></c:if>
					 <c:if test="${not empty reportPost.dojangPost_subject}"><input name="reporter" class="onlyread" type="text" value='${reportPost.dojangPost_subject}' readonly/></c:if>
					 <c:if test="${not empty reportPost.review_title}"><input name="reporter" class="onlyread" type="text" value='${reportPost.review_title}' readonly/></c:if> --%>
					 
					 <c:if test="${not empty reportPost.lightning_title}"><a href="/lightDetail.go?lightning_no=${detailDto.idx}"> ${reportPost.lightning_title}</a></c:if>
					 <c:if test="${not empty reportPost.dojang_title}"><a href="/dojangDetail.do?dojang_no=${detailDto.idx}"> ${reportPost.dojang_title}</a></c:if>
					 <c:if test="${not empty reportPost.comment_content}"> 
						 <c:if test="${detailDto.class_no eq 8 }"> <!-- idx가 restaurant_no로  reportPost.idx  -->
						 	<a href="/resDetail.do?restaurant_no=${reportPost.idx}"> ${reportPost.comment_content}</a>
						 </c:if>
						 <c:if test="${detailDto.class_no eq 7 }">
					 		<a href="/groupReviewDetail.do?groupReview_no=${reportPost.idx}"> ${reportPost.comment_content}</a>
						 </c:if>
					 	 <c:if test="${detailDto.class_no eq 5 }"> <!-- 도장깨기 댓글  -->
					 		<a href="/dojangHomeDetail.go?dojangPost_no=${reportPost.idx}"> ${reportPost.comment_content}</a>
						 </c:if>
					 	 <c:if test="${detailDto.class_no eq 2 }"> <!-- 번개 댓글 -->
					 		<a href="/lightDetail.go?lightning_no=${reportPost.idx}"> ${reportPost.comment_content}</a>
						 </c:if>
					 </c:if>
					 <c:if test="${not empty reportPost.dojangPost_subject}"><a href="/dojangHomeDetail.go?dojangPost_no=${detailDto.idx}"> ${reportPost.dojangPost_subject}</a></c:if>
					 <c:if test="${not empty reportPost.review_title}"><a href="/groupReviewDetail.do?groupReview_no=${detailDto.idx}"> ${reportPost.review_title}</a></c:if> 
					 
					 </td>

				<th>신고사유</th><td>${detailDto.report_reason}</td>
			</tr>
	
			<tr>
				<th>게시판</th><td>${detailDto.class_name}</td>
				<th>처리상태</th>
				<td>
					<select name="report_status">
<%-- 						<option selected  hidden value="${detailDto.report_proc_status}">${detailDto.report_proc_status}</option> --%>
						<c:if test="${not empty reportPost.lightning_status}"><option selected  hidden value="${reportPost.lightning_status}">${reportPost.lightning_status}</option> </c:if>
						<c:if test="${not empty reportPost.comment_status}"><option selected  hidden value="${reportPost.comment_status}">${reportPost.comment_status}</option> </c:if>
						<c:if test="${not empty reportPost.dojang_status}"><option selected  hidden value="${reportPost.dojang_status}">${reportPost.dojang_status}</option> </c:if>
						<c:if test="${not empty reportPost.dojangPost_status}"><option selected  hidden value="${reportPost.dojangPost_status}">${reportPost.dojangPost_status}</option> </c:if>
						<c:if test="${not empty reportPost.groupReview_status}"><option selected  hidden value="${reportPost.groupReview_status}">${reportPost.groupReview_status}</option> </c:if>
						
						
						<%-- <option selected  hidden value="${detailDto.report_proc_status}">${detailDto.report_proc_status}</option> --%>
						<option value="처리대기">처리대기</option>
						<option value="처리완료">처리완료</option>
						<option value="블라인드">블라인드</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>신고자 ID</th><td>${detailDto.reporter} </td>
				<th>피신고자 ID</th><td>${detailDto.reported}</td>
			</tr>
			<tr>
			<%-- 	<th>신고날짜</th><td>${detailDto.report_date}</td> --%>
				<th>신고날짜</th><td><fmt:formatDate pattern="yyyy년MM월dd일 HH시mm분" value="${detailDto.report_date}" /></td>
				<%-- <th>처리 날짜</th><td>${detailDto.report_proc_date}</td> --%>
				<th>처리 날짜</th><td><fmt:formatDate pattern="yyyy년MM월dd일 HH시mm분" value="${detailDto.report_proc_date}" /></td>
			</tr>
			<tr>
				<th>처리사유</th><td colspan="3"><textarea name="reason">${detailDto.result_reason}</textarea></td>
			</tr>
			<tr>
			<td colspan="4" id="twobutton">
				<button type="button"  class="btn btn-outline-secondary"  onclick="blind_submit()"> 등록 </button>
				<button class="btn btn-outline-secondary" type="button" onclick="returnList()" >목록</button>
			</td>
			</tr>	
		</table>
	</form> 
</body>
<script>
var msg="${msg}"; 
if(msg!= null && msg!=""){
	alert('처리상태 변경이 완료되었습니다.');
	location.reload();
}

function returnList(){ 
	location.href="/report/"; 
/* 	history.go(-1); */
}

function blind_submit(){
	
	if(report_status=='블라인드'){
		alert('블라인드 페이지에서 수정가능합니다.');
		return false;
	}
	
	var result_reason = $('textarea[name=reason]').val();
/* 	console.log(result_reason.length);
	console.log(result_reason.trim().length); */
	if (result_reason.trim().length > 250){
	    alert("최대 250자까지 입력 가능합니다.");
	  return false; 
	  } 
	
 	$('#form_').submit(); 
	
}
 
var report_status = $('select[name=report_status]').val();
if(report_status=='블라인드'){
	$('select[name=report_status]').attr("disabled","disabled");
}


</script>
</html>