<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link rel="icon" type="image/png" href="../resources/mainResource/assets/img/pizza-slice.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<title>JMT 도장깨기방 : 게시글 수정</title>

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

textarea {
	width:350px; 
	height:250px; 
	  }

#dojangPost_subject {
  width:600px;
}

#editable{
		width: 90%;
		height: 400px;
		border: 1px solid gray;
		margin: 5px;
		overflow: auto;
		padding: 5px;
		text-align: left;
}

.btt {
	cursor:pointer;
}

/*버튼*/
 	.btnn{
 		margin : 3px;
 		padding : 5px;
 		border-radius : 5px;
 		border : 1px black;
 		background-color: #lightgrey;
 	}
 	
 	.btnn:hover{
 		background-color: #bebebe;
 	}
 	
 	.btnnn{
 		margin : 3px;
 		padding : 5px;
 		border-radius : 5px;
 		border : 1px black;
 		background-color: #lightgrey;
 		width:70px;
		height:35px;
 	}
 	
 	.btnnn:hover{
 		background-color: #bebebe;
 	}
 	
 	.notiDelBtn:hover{
		cursor : pointer;
		color : red;
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
        <!-- 컨텐츠 -->
        <div class="content">
        <div class="container-fluid">
        <div class="col-md-12">
        <div class="card">
		<div id="list" class="content table-responsive table-full-width">
		<h2>게시글 수정 </h2>
			<table>
				<tr>
					<th>게시판 유형</th>
					<td>
					<c:choose>
						<c:when test="${leader == loginId}">
							<select id="dojangPost_type" style="width:100px;height:30px;">
								<option value="공지게시판">공지게시판</option>
								<option value="일반게시판">일반게시판</option>
							</select>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="dojangPost_type" value="일반게시판"/>일반게시판
						</c:otherwise>
					</c:choose>
					</td>
					
				</tr>
				<tr>
					<th>제목</th>
					<td>
					<input type="hidden" id="dojangPost_no"  value=""/>
					<input type="text" id="dojangPost_subject" />
					</td>
				</tr>
				<tr class="hidden">
					<th>맛집 번호</th>
					<td><input type="text" id="restaurant_no"/></td>
				</tr>	
				<tr>
					<th>맛집 이름</th>
					<td>
					<input type="text" id="restaurant_name" readonly placeholder="검색버튼을 눌러주세요"/>
					<input type="button" class="btnn" value="맛집검색" onclick="restaurant_pop()"/>
					</td>
				</tr>
				<tr>
					<th>게시판 글쓰기</th>
					<td height=350 id="dojangPostContent">
					<!-- html 태그를 인식하기 위해 div 사용(type="text"나 textarea는 html을 그냥 글자취급) -->
						<div id="editable" contenteditable="true"></div>
								<!-- 하지만 div 는 서버에 값을 전송할 수가 없다. -->
								<!-- 결국엔 div의 내용을 input에 담아 서버에 전송할 예정 -->
						<input type="hidden" name="dojangPost_content" id="dojangPost_content"/>
					</td>
				</tr>
				<tr>
					<th>파일 업로드</th>
					<td>
					<input type="button" class="btnn" value="파일 업로드" onclick="dojangfileUp()"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="button" class="btnnn" value="저장" onclick="dojangPostUpdate()"/>
					<input type="button" class="btnnn" value="취소" onclick="location.href='dojangHome.go?dojang_no=${sessionScope.dojang_no}'"/>
					</td>
				</tr>
			</table>
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
 
  <input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
  <input type="hidden" id="dojang_no" value="${sessionScope.dojang_no}"/>

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

noHidden();
function noHidden(){
	$(".hidden").css("display", "none");
}


$.ajax({
	type:'get',
	url:'dojangHomeDetail.ajax',
	data:{
	},
	dataType:'JSON',
	success:function(data){
			$('#dojangPost_no').val(data.dojangHomeDetail.dojangPost_no);
			$('#dojangPost_subject').val(data.dojangHomeDetail.dojangPost_subject);
			$('#editable').html(data.dojangHomeDetail.dojangPost_content);
			$('#dojangPost_type').val(data.dojangHomeDetail.dojangPost_type);
			$('#restaurant_name').val(data.dojangHomeDetail.restaurant_name);
	},
	error:function(e){
		console.log(e);
	}
		
});	


memberCall()	

	
console.log($('#dojang_no').val());




function dojangPostUpdate(){
	
	var dojangPost_no = $('#dojangPost_no').val();
	var dojangPost_type = $('#dojangPost_type').val();
	var dojangPost_subject = $('#dojangPost_subject').val();
	var restaurant_no = $('#restaurant_no').val();
	var dojangPost_content = $('#editable').html();
	var member_id = $('#loginId').val();
	var dojang_no = $('#dojang_no').val();
	
	var formData = new FormData();
	
	formData.append("dojangPost_no", dojangPost_no);
	formData.append("dojangPost_type", dojangPost_type);
	formData.append("dojangPost_subject", dojangPost_subject);
	formData.append("dojangPost_content", dojangPost_content);
	formData.append("restaurant_no", restaurant_no);

	if (dojangPost_subject == "") {
		alert("제목을 입력해주세요");
	}else if(dojangPost_content == "") {
		alert("내용을 입력해주세요.");
	} else if ($('img').length > 3) {
		alert('이미지 업로드 제한 갯수 3개를 초과했습니다.');
	} else {
		$.ajax({
			type : 'post',
			url : 'dojangPostUpdate.ajax',
			data : formData,
			contentType : false,
			processData : false,
			dataType : 'JSON',
			success : function(data) {
				console.log(data);
				if (data.success) {
					location.href = 'dojangHome.go?dojang_no=' + dojang_no;
				} else {
					alert("등록 실패");
				}
			},
			error : function(e) {
				console.log(e);
			}

		});

	}

	}

	function memberCall() {

		var dojang_no = $('#dojang_no').val();

		$.ajax({
			type : 'get',
			url : 'dojangMember.ajax',
			data : {
				dojang_no : dojang_no,
			},
			dataType : 'JSON',
			success : function(data) {
				$('#leader').html(data.dojangHomeLeader);
				drawMember(data.dojangHomeMember);
			},
			error : function(e) {
				console.log(e);
			}

		});

	}

	function dojangfileUp() {
		window.open('gpFileUploadForm.go', '',
				'width=400, height=100,left=550 ,top=300');
	}

	function restaurant_pop() {
		window
				.open(
						"/gpRestaurantSearch.go",
						"new",
						"width=800, height=600, left=350 ,top=500, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
	}

	function drawMember(member) {
		var content = '';

		member.forEach(function(item) {
			content += '<li>' + item.member_id + '</li>';
		});
		$('#member').empty();
		$('#member').append(content);
	}

	//사진 삭제
	function del(elem) {
		console.log(elem);
		//id에서 삭제할 파일명을 추출
		var id = $(elem).attr("id");
		var fileName = id.substring(id.lastIndexOf("/") + 1);
		console.log(fileName);
		//해당 파일 삭제 요청
		$.ajax({
			url : 'gpFileDelete.ajax',
			type : 'get',
			data : {
				'fileName' : fileName
			},
			dataType : 'json',
			success : function(data) {
				console.log(data)
				//a 태그를 포함한 img 태그를 삭제
				$(elem).remove();
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
</script>
</html>