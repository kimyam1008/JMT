<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="../resources/mainResource/assets/img/pizza-slice.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<title>JMT 도장깨기방 : 일반 게시판</title>

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
                <li  class="active">
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
        <br/>
        <div style="left: 200px;">
        </div>
        <div>
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
                            <div class="content table-responsive table-full-width" >
                            <h2>일반 게시판</h2>
                            <div id="list">
                            </div>
                            </div>
                        </div>
                    </div>
                   <!--표 끝-->
                </div>


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
</div>


<input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
<input type="hidden" id="dojang_no" value="${sessionScope.dojang_no}"/>
<input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
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
var page = 1;
var maxPage = undefined;

listCall(page);

// 무한스크롤
$(window).scroll(function() {
	let percent = Math.floor(($(window).scrollTop() / ($(document).height() - $(window).height())) * 100);
	
	if(percent == 100) {
		if(page < maxPage)
			listCall(++page);
	}
});

function listCall(page){
	
	var pagePerNum = 5;
	var dojang_no = $('#dojang_no').val();
	
	$.ajax({
		type:'get',
		url:'dojangHomeM.ajax',
		data:{
			dojang_no:dojang_no,
			cnt:pagePerNum,
			page:page
		},
		dataType:'JSON',
		success:function(data){
				maxPage = data.pages;
				drawList(data.dojangHomeM);
				console.log("데이터",data.dojangHomeM);
				$('#leader').html(data.dojangHomeLeader);
				drawMember(data.dojangHomeMember);
		},
		error:function(e){
			console.log(e);
		}
			
	});	
	

}



function drawMember(member){
	var content = '';

	member.forEach(function(item){
		content += '<li>'+item.member_id+'</li>';
	});
	$('#member').empty();
	$('#member').append(content);
}




function drawList(list){
	var content = '';
	
	var loginId = $("#loginId").val();
	
	
	if(list.length == 0){
		content += '<div>'+"등록된 게시글이 없습니다."+'</div>';
	} else {
		list.forEach(function(item){
			var date = new Date(item.dojangPost_date);
			var create = date.toLocaleDateString("ko-KR");
	
			content += '<br/>';
			content += '<table>';
			content += '<tr>';
			content += '<th>'+"제목"+'</th>';
			content += '<td colspan="2">'+item.dojangPost_subject+'</td>';
			content += '<td>'+item.dojangPost_type+'</td>';
			content += '</tr>';
			content += '<tr>';
			content += '<th>'+"작성자"+'</th>';
			content += '<td>'+item.member_id+'</td>';
			content += '<th>'+"작성일"+'</th>';
			content += '<td>'+create+'</td>';
			content += '</tr>';
			content += '<tr>';
			content += '<td  height=350 colspan="4"><a href="dojangHomeDetail.go?dojangPost_no='+item.dojangPost_no+'">'+item.dojangPost_content+'</td>';
			content += '</tr>';
			content += item.leader_id ==loginId && item.dojangPost_type == "공지게시판"?'<th colspan="2">'+"이번 모임장소는?"+'</th>' : '<th colspan="2">'+item.member_id+"님의 추천맛집은?"+'</th>';
			content += item.restaurant_name==null || item.restaurant_name=="검색버튼을 눌러주세요"? '<td colspan="2">'+"등록된 맛집이 없습니다."+'</td>': '<td colspan="2">'+item.restaurant_name+'</td>';
			content += '</table>';
		});
	}
	$('#list').append(content);
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



</script>
</html>