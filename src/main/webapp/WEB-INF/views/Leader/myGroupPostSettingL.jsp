<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 모임 관리 - 게시글</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script>
<style>
	table,th,td {
		border:1px solid black;
		border-collapse:collapse;
	}
	th,td {
		padding:5px 10px;
	}
	.profileImg{
		width:150px;
		border-radius:50%;
	}
	.top-section{
		border:1px solid black;
		margin-bottom:20px;
	}
	.title, .post-count, .comment-count{
		/*float:left;*/
	}
	
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
	
	#centered {
	  margin-left: 260px;
	}
</style>
</head>
<body>
	<input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
 	${sessionScope.loginId} 님 환영합니다, <a href="logout.do">로그아웃</a>
	<h3>모임 관리</h3>
	<input type="hidden" id="lightning_no" value="${sessionScope.lightning_no}"/>
	<div id="test">
		<ul>
			<li><a href="lightningLeaderPage.go?lightning_no=${sessionScope.lightning_no}">방장 페이지</a></li>
			<li><a href="myGroupPostSettingL.go?lightning_no=${sessionScope.lightning_no}">나의 모임 관리</a></li>
		</ul>
	</div>
	<div id="centered">
		<div class="top-section">
			<a href="#"><img src ="/photo/${dto.photo_newFileName}" class="profileImg"></a>
			<p class="title">${dto.lightning_title}</p>
			<p class="post-count">작성글 : ${dto.post_count}</p><p class="comment-count">작성 댓글 : ${dto.comment_count}</p>
		</div>
		<a href="javascript:location.reload()">댓글</a> <a href="/myGroupMemberSettingL.go?lightning_no=${dto.lightning_no}">회원</a>
		<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody id="list">
			
			</tbody>
				<tr>
					<td colspan="7" id="paging">
						<!-- twbspagination 플러그인 -->
						<div class="container">
							<nav arial-label="Page navigation" style="text-align:center">
								<ul class="pagination" id="pagination"></ul>
							</nav>
						</div>
					</td>
				</tr>
		</table>
	</div>
</body>
<script>
var currPage = 1;

listCall(currPage);

console.log($('#lightning_no').val());

//페이징
function listCall(page){
	var pagePerNum = 10;
	var lightning_no = $('#lightning_no').val();
	
	$.ajax({
		type:'get',
		url:'myGroupPostSettingL.ajax',
		data:{
			cnt : pagePerNum,
			page : page,
			lightning_no : lightning_no
		},
		dataType:'JSON',
		success:function(data){
			drawList(data.myGroupPostSettingL);
			currPage=data.currPage;
			console.log(currPage);
			
			//플러그인 사용 페이징
			$("#pagination").twbsPagination({
				startPage:data.currPage,//시작페이지
				totalPages:data.pages,//총 페이지(전체게시물 / 한 페이지에 보여줄 게시물 수)
				visiblePages:5,//한번에 보여줄 페이지 수
				onPageClick:function(e,page){
					console.log(page);
					currPage=page;
					listCall(page);
				}
			});
		},
		error:function(e){
			console.log(e);
		}
	});
}


//리스트 그리기
function drawList(myGroupPostSettingL){
	
	var content ="";
	
	myGroupPostSettingL.forEach(function(item,comment_no){
		
		content += '<tr>';
		content += '<td>'+item.idx+'</td>';
		content += '<td><a href="lightDetail.go?lightning_no='+item.idx+'">'+item.comment_content+'</a></td>';
		content += '<td>'+item.comment_date+'</td>';
		content += '</tr>';
	});
	
	$('#list').empty();
	$('#list').append(content);
}

</script>
</html>