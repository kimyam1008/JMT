<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<link rel="icon" type="image/png" href="../resources/mainResource/assets/img/pizza-slice.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<title>JMT 도장깨기방 : 게시글 상세</title>

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
    

<style>
#test {
  list-style-type: none;
  padding: 10px;
  margin: 0px;
  width: 190px;
  background: #edacb1;
  height: 100%;
  overflow: auto;
  position: fixed;
  top: 70px;
}

li a {
  text-decoration: none;
  padding: 10px;
  display: block;
  color: #000;
  font-weight: bold;
}

li a:hover {
  background: #333;
  color: #fff;
}

.detailtest{
text-align:right;
}

table {
			  border-collapse: separate;
			  border-spacing: 1px;
			  text-align: left;
			  line-height: 1.5;
			  border-top: 1px solid #ccc;
			  width : 1000px;
			  margin-left:auto; 
    		  margin-right:auto;
			}
			table th {
			  width: 150px;
			  padding: 10px;
			  font-weight: bold;
			  vertical-align: top;
			  border-bottom: 1px solid #ccc;
			}
			table td {
			  width: 350px;
			  padding: 10px;
			  vertical-align: top;
			  border-bottom: 1px solid #ccc;
			}
table,th,td {
				border : 1px solid #ccc;
		        border-left: none;
		        border-right: none;
				border-collapse : collapse;
			}
		    th {
			background-color: #f9f9f9;
		    text-align: center;
			}
		
			th,td { 
				padding : 5px 10px;
			}						
	
#test2{
		width: 170px;
       height: 170px;
       border: 1px solid black;
       overflow:scroll;
      padding:10px; 
      background-color: #cd5c5c;
}

#review{
	display: flex;
	justify-content: center;
}

td a {
	display:block; 
	line-height:350px; 
	text-decoration:none;
	cursor:pointer;
	color: black; 
}

#review2{
	display: flex;
	justify-content: center;
}

/*댓글 작성 폼 */
	 .comment-form {
	  display: flex;
	  flex-direction: column;
	  width : 1000px;
	  height : 100px;
	  margin : 10px 0px;
	  margin-left:auto; 
    margin-right:auto;
	}
	.comment-form textarea {
	  resize: none;
	  border: 1px solid #dbdbdb;
	  padding: 15px 20px;
	  outline: none;
	}
	.comment-form .submit {
	  border: 1px solid #8f8f8f;
	  background-color: #8f8f8f;
	  color: #fff;
	  padding: 5px;
	  cursor: pointer;
	}
 	
 	
 	/*댓글 리스트 */
 	/* 레이아웃 - 댓글 */
	.comments {
	  border: 0.5px solid #dbdbdb;
	  border-left: none;
	  border-right: none;
	  width : 1000px;
	  margin-left:auto; 
     margin-right:auto;
	}
	.comments .comment {
	  border-bottom: 1px solid #dbdbdb;
	  padding: 15px;
	}
	.comments .comment:last-child {
	  border-bottom: none;
	}

	/* 상단 메뉴 */
	.top {
	  display: flex;
	  flex-direction: row;
	  align-items: center;
	}
	.top .member_id {
	  font-weight: bold;
	  font-size : 13px;
	  padding-left : 5px;
	}
	
	.top .grade_name{
		font-size : 12px;
		padding : 5px;
	}
	
	.content {
		padding : 5px;
	}
	
	/*등급색상*/
	.top .utility {
	  display: flex;
	  flex-direction: row;
	  margin-left: auto;
	}

	p {
		font-size : 13px;
	}
	
	/* 하단 메뉴 */
	.bottom {
	  display: flex;
	  flex-direction: row;
	  align-items: center;
	  list-style: none;
	  padding: 0;
	  margin: 0;
	  text-transform: uppercase;
	  letter-spacing: -0.5px;
	  font-weight: bold;
	  font-size: 14px;
	}
	.bottom .divider {
	  width: 1px;
	  height: 15px;
	  background-color: #dbdbdb;
	  margin: 0 20px;
	}
	.bottom .menu {
	  margin: 0;
	  padding: 0;
	  color: #bebebe;
	  font-size: 13px;
	}
	.bottom .menu.report:hover {
		color : #333;
		cursor : pointer;
	}
 	
 	/*수정*/
 	#updtextarea{
 		width : 380px;
 		height : 40px;
 		resize : none;
 	}
 	
 	
 	/*버튼*/
 	.btn{
 		margin : 3px;
 		padding : 5px;
 		border-radius : 5px;
 		border : 1px black;
 		background-color: #lightgrey;
 	}
 	
 	.btn:hover{
 		background-color: #bebebe;
 	}
 	
 	/*프로필 사진*/
 	.img{
 		width : 35px;
 		height : 35px;
 		margin : 0 7 5 0px;
 		border-radius : 70%;
 		overflow : hidden;
 	}
 	
 	.profileImg {
 		width : 100%;
 		height : 100%;
 		object-fit : cover;
 	} 	

	.notiDelBtn:hover{
		cursor : pointer;
		color : red;
	}

	.cmtid{
		color : black;
	}
	
	.cmtid:hover{
		color : black;
	}
</style>
</head>
<body>
<!--사이드바-->
    <div class="wrapper">
     <div class="sidebar" data-color="orange">

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
                <!--도장격파원-->
                <li class="dojangParty">
                    <a class="dojangPartyList" href="#">
                        <i class="pe-7s-hammer"></i>
                        <p>도장격파원</p>
                    </a>
                     <a><p>${leader} 방장</p></a>
                    <c:forEach items="${dojangHomeMember}" var="dojangHomeMember">
                    <a><p>${dojangHomeMember.member_id}</p></a>
                    </c:forEach>
                </li>
                <li>
                    <a href="dojangHome.go?dojang_no=${sessionScope.dojang_no}">
                        <i class="pe-7s-news-paper"></i>
                        <p>전체 게시판</p>
                    </a>
                </li>
                <li>
                    <a href="dojangHomeL.go?dojang_no=${sessionScope.dojang_no}">
                        <i class="pe-7s-speaker"></i>
                        <p>공지 게시판</p>
                    </a>
                </li>
                <li>
                    <a href="dojangHomeM.go?dojang_no=${sessionScope.dojang_no}">
                        <i class="pe-7s-note2"></i>
                        <p>일반 게시판</p>
                    </a>
                 </li>
                  <li>
                    <a href="dojangPostReg.go">
                        <i class="pe-7s-star"></i>
                        <p>글쓰기</p>
                    </a>
                </li>
                </li>
                  <li>
                    <a href="groupReviewList">
                        <i class="pe-7s-star"></i>
                        <p>모임후기 작성</p>
                    </a>
                </li>
                <c:if test="${leader == loginId}">
                <li>
                    <a href="dojangLeaderPage.go?dojang_no=${sessionScope.dojang_no}">
                        <i class="pe-7s-star"></i>
                        <p>방장 페이지</p>
                    </a>
                </li>
                </c:if>
                <c:if test="${member == loginId}">
                <li>
                    <a href="#" onclick="memberStatus(); return false;">
                        <i class="pe-7s-hammer"></i>
                        <p>도장깨기 회원 탈퇴</p>
                    </a>
                </li>
                </c:if>
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
                    <a class="navbar-brand" href="#">${dojangTitle}</a>
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
                           <a href="./mypage.go">
                               <p>${sessionScope.loginId} 님의 마이페이지</p>
                            </a>
                        </li>
                        <li>
                            <a href="/">
                                <p>Home</p>
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

 <input type="hidden" id="dojangPost_no" value="${sessionScope.dojangPost_no}"/>
  <input type="hidden" id="dojang_no" value="${sessionScope.dojang_no}"/>
 
						 <!-- 컨텐츠 -->
						 <div class="content">
				        <div class="container-fluid">
				        <div class="col-md-12">
				        <div class="card">
						<div id="list" class="content table-responsive table-full-width">
						<h2>게시글 상세</h2>
						<table>
							<tr id="dojangPost_no_tr">
								<th>글번호</th>
								<td id="dojangPost_no"></td>
							</tr>
							<tr>
								<th>제목</th>
								<td colspan="2" id="dojangPost_subject"></td>
								<td id="dojangPost_type"></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td id="member_id"></td>
								<th>작성일</th>
								<td id="dojangPost_date"></td>
							</tr>
							<tr>
								<td height=350 colspan="4" id="dojangPost_content"></td>
							</tr>
							<tr>
								<th colspan="2">
								<c:choose>
									<c:when test="${list.leader_id == loginId and list.dojangPost_type == '공지게시판'}">
										이번 모임장소는?
									</c:when>
									<c:otherwise>
										추천 맛집은?
									</c:otherwise>
								</c:choose>
								</th>
								<c:choose>
									<c:when test="${list.restaurant_name == null or list.restaurant_name == '검색버튼을 눌러주세요'}">
										<td colspan="2">등록된 맛집이 없습니다.</td>
									</c:when>
									<c:otherwise>
										<td colspan="2" id="restaurant_name"></td>
									</c:otherwise>
								</c:choose>
							<tr>
							<th>
							<c:choose>
								<c:when test="${list.member_id ==loginId}">
									 <a href="#" onclick="dojangPostUpdate(); return false;" class="detailtest">수정</a>
									 <a href="#" onclick="dojangPostDel(); return false;" class="detailtest">삭제</a>
								</c:when>
								<c:otherwise>
								 	<a href="#" onclick="dojangPostReport(); return false;" class="detailtest">신고</a>
								</c:otherwise>
							</c:choose>
							</th>
							<td></td>
							<td></td>
							<td></td>
							</tr>
						</table>
						<!-- 댓글 -->
						<div class="comment-form">
						  		<textarea  id="cmtInput" placeholder="댓글을 작성하세요 (최대 300자)"></textarea>
						  		<button type="button" class="submit" id="cmtWrite">댓글 쓰기</button>
							</div>
							<div id="cmtList">
							</div>
						
						</div>
						</div>
						</div>
					    </div>
					    </div>
						 
						 
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
<%@ include file="../../../resources/inc/footer2.jsp" %>
<script>

/*상세보기 들어왔을 때 댓글리스트 보여주기 */
var dojangPost_no =  $('#dojangPost_no').val();
var class_no = 5;
cmtList(class_no,dojangPost_no);

var msg = "${msg}";
	if (msg != ""){
		alert(msg);
	}
	
	var status = "${dto.status}";
	var leader_id="${dto.leader_id}";
	var loginId = "${loginId}";
	//사용자 프로필
	var eat_speed = "${profileInfo.eat_speed}";
	var profile_gender = "${dto.profile_gender}";
	var profile_job = "${profileInfo.profile_job}";


console.log($('#dojangPost_no').val());

$('#dojangPost_no_tr').attr('style', "display:none;");


	
	$.ajax({
		type:'get',
		url:'dojangHomeDetail.ajax',
		data:{
		},
		dataType:'JSON',
		success:function(data){
				$('#leader').html(data.dojangHomeLeader);
				drawMember(data.dojangHomeMember);
				$('#dojangPost_no').html(data.dojangHomeDetail.dojangPost_no);
				$('#dojangPost_subject').html(data.dojangHomeDetail.dojangPost_subject);
				$('#dojangPost_type').html(data.dojangHomeDetail.dojangPost_type);
				$('#member_id').html(data.dojangHomeDetail.member_id);
				$('#restaurant_name').html(data.dojangHomeDetail.restaurant_name);
				var date = new Date(data.dojangHomeDetail.dojangPost_date);
				
				$('#dojangPost_date').html(date.toLocaleDateString("ko-KR"));
				$('#dojangPost_content').html(data.dojangHomeDetail.dojangPost_content);
		},
		error:function(e){
			console.log(e);
		}
			
	});	
	



function drawMember(member){
	var content = '';

	member.forEach(function(item){
		content += '<li>'+item.member_id+'</li>';
	});
	$('#member').empty();
	$('#member').append(content);
}

function dojangPostUpdate(){
	var dojangPost_no = $('#dojangPost_no').val();
	location.href='dojangPostUpdate.go?dojangPost_no='+dojangPost_no;
}


//신고하기 팝업
function dojangPostReport(){
	var dojangPost_no = $('#dojangPost_no').val();
	window.open("/dojangPostReport.go?dojangPost_no="+dojangPost_no,"new","width=600, height=400, left=450 ,top=200, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}

//삭제(숨김처리)
function dojangPostDel(){
	
	var dojangPost_no = $('#dojangPost_no').val();
	var dojang_no = $('#dojang_no').val();
	
		if (!confirm("정말로 삭제하시겠습니까?")) {
			alert("삭제가 취소되었습니다.");
			window.location.reload();
		} else {
			$.ajax({
				type:'get',
				url:'dojangHomeDetail..ajax',
				data:{
					dojangPost_no:dojangPost_no
				},
				dataType:'JSON',
				success:function(data){
					console.log(data);
					if(data.success){
						console.log(data.success)
						alert("삭제가 완료됐습니다.")
						location.href='/dojangHome.go?dojang_no='+dojang_no;
					}else{
						alert("삭제 실패");
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		
		}
	
}


//회원탈퇴
function memberStatus(){
	
	var loginId = $('#loginId').val();
	var dojang_no = $('#dojang_no').val();
	
		if (!confirm("정말로 탈퇴 하시겠습니까?")) {
			alert("탈퇴가 취소됐습니다.");
			window.location.reload();
		} else {
			$.ajax({
				type:'get',
				url:'dojangHome..ajax',
				data:{
					dojang_no:dojang_no,
					loginId:loginId
				},
				dataType:'JSON',
				success:function(data){
					console.log(data);
					if(data.Mstatus){
						console.log(data.Mstatus)
						alert("탈퇴가 완료됐습니다.")
						location.href='/dojang.go';
					}else{
						alert("탈퇴 실패");
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		
		}
	
}


/*********댓글*********/ 

//로그인 아이디 위에 변수 설정 되어있음 loginId 
//var lightning_no , var class_no 위에 변수 설정 


//댓글 작성 시
$("#cmtWrite").on("click",function(){
console.log(loginId, dojangPost_no);
  var comment_content = $("#cmtInput").val();
  if(comment_content == null ||comment_content ==''){
    alert("댓글을 입력해 주세요.");
    $("#cmtInput").focus();
  }else if(comment_content.length>300){
	  alert("최대 300자까지 입력 가능합니다.");
	    $("#cmtInput").val(comment_content.substring(0, 300));
  }else{
    var cmtData = {'idx':dojangPost_no,'member_id':loginId,'comment_content':comment_content,'class_no':class_no};
    
	$.ajax({
		type:"post",
		url:"comment/cmtWrite",
		data:JSON.stringify(cmtData),
		contentType:"application/json; charset=utf-8",
		success : function(data){
			if(data.writeSuccess){
				cmtList(class_no,dojangPost_no);
				$("#cmtInput").val("");
			}
		},
		error : function(e){
			console.log(e);
		}
	});
  
  }
});

//06_TeamProject 참고 
//댓글 리스트 가져오기 
function cmtList(class_no,idx){
	var url ='comment'+ "/" + 'cmtList'+"/" +class_no+"/" +idx;
	
	$.ajax({
		url:url,
		type:'get',
		dataType:'json',
		success : function(data){
			console.log(data);
			drawCmt(data.cmtList);
			
		},
		error : function(e){
			console.log(e);
		}
	});
}


function drawCmt(list){
	console.log(list);
	var content = "";
	//데이터가 있는 경우
	if(list.length>0){					
		list.forEach(function(item,idx){
			var date = new Date(item.comment_date);	
			console.log(item);
			//댓글 작성 시 엔터누르면 댓글 줄바꿈 되며, 수정버튼 오류 처리 
			var str = item.comment_content;
			str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		
			content += '<div class ="comments c'+item.comment_no+'">';
			content += '<div class ="comment">';
			content += '<div class ="content">';
			content += '<header class="top">';
			content += '<div class ="img">';
			 if (item.photo_newFileName!= null){
     			content += '<img src ="/photo/'+item.photo_newFileName+'" class="profileImg">';
     			}else{ //프로필 등록을 안했을 시
     				content += '<img src ="resources/photo/profile.png" class="profileImg">';
     			}
     			content += '</div>';
			
			 if(loginId == item.member_id){ //본인 댓글은 마이페이지로/타아이디는 otherspage로 
             	content += '<div class="member_id"><a class="cmtid" href="mypage.go" class="idatag">'+item.member_id+'</a></div>';
             }else{
             content += '<div class="member_id"><a class="cmtid" href="othersPage.go?profile_no='+item.profile_no+'" class="idatag">'+item.member_id+'</a></div>';
             }
			//content += '<div class="member_id"><a href="othersPage.go?profile_no='+item.profile_no+'">'+item.member_id+'</a></div>';
			//content += '<div class="grade_name g'+item.grade_no+'">'+item.grade_name+'</div>';
			content += '<div class="grade_name" style="color :'+item.grade_color+'">'+item.grade_name+'</div>';
			content += '<div class="utility">';
			
			if(loginId == item.member_id){ //본인 댓글만 수정,삭제 보이게 
				content += '<button class="btn" id="updBtn'+item.comment_no+'" onclick="updBtn('+item.comment_no+   ","     +  "\'" +  str   +"\'"  + ')">수정</button>';
				content += '<button class="btn" id="delBtn'+item.comment_no+'" onclick="cmtDel('+item.comment_no+')">삭제</button>';
			}
			
			content += '</div>';
			content += '</header>';
			content += '<p id="p'+item.comment_no+'">'+str+'</p>';
			content += '<ul class="bottom">';
			content += '<li class="menu comment_date">'+date.toLocaleString("ko-KR")+'</li>';
			
			if(loginId != item.member_id){ //본인 댓글은 '신고하기' 안보이게
				content += '<li class="divider"></li>';
				content += '<li class="menu report" onclick="lightCmtReport_pop('+item.comment_no+')">신고하기</li>';
			}
			
			content += '</ul>';
			content += '</div>';
			content += '</div>';
			content += '</div>';
				
		});	
	}else{
		content += '<div class ="comment">';
		content = "작성된 댓글이 없습니다.";
		content += '</div>';
	}
	$('#cmtList').empty();
	$('#cmtList').append(content); 	
}	


//삭제 
function cmtDel(cno){
	
	$.ajax({
		url:"comment/cmtDel",
		type:'post',
		data : {
			'comment_no' : cno
		},
		dataType:'json',
		success : function(data){
			console.log(data.delSuccess);
			if(data.delSuccess){
				cmtList(class_no,dojangPost_no);
			}
		},
		error : function(e){
			console.log(e);
		}
	});
}




//수정버튼 눌렀을 때 
function updBtn(cno,content){
	//console.log("수정하고싶다");
	console.log(cno,content);
	var updcontent = content.split('<br/>').join("\r\n");
	//수정 버튼 누른 댓글의 태그 변경 
	$('#p'+cno).replaceWith('<textarea id="updtextarea">'+updcontent+'</textarea>');
	$('#updBtn'+cno).attr('onclick','updCmt('+cno+')');
	
	
	//글자 수 500자 제한
	$('#updtextarea').keyup(function(){
		  var content = $(this).val();
		  if (content.length > 500){
		    alert("최대 500자까지 입력 가능합니다.");
		    $(this).val(content.substring(0, 500));
		  }
	});
}



//수정하기 요청 
function updCmt(cno){
	console.log("수정하기!!!!!" + cno);
	var updcontent = $("#updtextarea").val();
	console.log("바뀐 내용" + updcontent);
	
	$.ajax({
		url:"comment/cmtUpd",
		type:'post',
		data : {
			'comment_no' : cno,
			'comment_content' : updcontent
		},
		dataType:'json',
		success : function(data){
			console.log(data);
			if(data.updSuccess){
				cmtList(class_no,dojangPost_no);
			}
		},
		error : function(e){
			console.log(e);
		}
	});
}



//댓글 신고 팝업
function lightCmtReport_pop(cno){
	window.open("/dojangCmtReport.go?comment_no="+cno,"new","width=400, height=350, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}







</script>

</html>