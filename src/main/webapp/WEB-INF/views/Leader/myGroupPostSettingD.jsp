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
	<input type="hidden" id="dojang_no" value="${sessionScope.dojang_no}"/>
	<div id="test">
		<ul>
			<li><a href="dojangLeaderPage.go?dojang_no=${sessionScope.dojang_no}">방장 페이지</a></li>
			<li><a href="myGroupPostSettingD.go?dojang_no=${sessionScope.dojang_no}">나의 모임 관리</a></li>
		</ul>
	</div>
	<div id="centered">
		<div class="top-section">
			<a href="#"><img src ="/photo/${dto.photo_newFileName}" class="profileImg"></a>
			<p>${dto.dojang_title}</p>
			<p>작성글 : ${dto.post_count}</p><p>작성 댓글 : ${dto.comment_count}</p>
		</div>
		<a href="javascript:location.reload()">게시글</a> <a href="/myGroupMemberSettingD.go?dojang_no=${dto.dojang_no}">회원</a>
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

console.log($('#dojang_no').val());

//페이징
function listCall(page){
	var pagePerNum = 10;
	var dojang_no = $('#dojang_no').val();
	
	$.ajax({
		type:'get',
		url:'myGroupPostSettingD.ajax',
		data:{
			cnt : pagePerNum,
			page : page,
			dojang_no : dojang_no
		},
		dataType:'JSON',
		success:function(data){
			drawList(data.myGroupPostSettingD);
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
function drawList(myGroupPostSettingD){
	
	var content ="";
	
	myGroupPostSettingD.forEach(function(item,dojangPost_no){
		
		content += '<tr>';
		content += '<td>'+item.dojangPost_no+'</td>';
		content += '<td><a href="dojangDetail.do?dojangPost_no='+item.dojangPost_no+'">'+item.dojangPost_subject+'</a></td>';
		content += '<td>'+item.dojangPost_date+'</td>';
		content += '</tr>';
	});
	
	$('#list').empty();
	$('#list').append(content);
}

</script>
</html>