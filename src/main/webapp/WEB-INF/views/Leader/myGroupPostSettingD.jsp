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
</style>
</head>
<body>
	<h3>모임 관리</h3>
	<div>
		<a href="#"><img src ="/photo/${dto.photo_newFileName}" class="profileImg"></a>
		<p>일식먹자!(모임 이름) ${dto.lightning_title} ${dto.dojang_title}</p>
		<p>작성글 : ${dto.post_count}</p><p>작성 댓글 : ${dto.comment_count}</p>
	</div>
	<a href="#">회원</a> <a href="#">게시글</a>
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
</body>
<script>
var currPage = 1;

listCall(currPage);

//페이징
function listCall(page){
	var pagePerNum = 10;
	
	$.ajax({
		type:'get',
		url:'myGroupPostSettingD.ajax',
		data:{
			cnt : pagePerNum,
			page : page
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
		content += '<td><a href="groupReviewDetail.do?groupReview_no='+item.dojangPost_no+'">'+item.dojangPost_subject+'</a></td>';
		content += '<td>'+item.dojangPost_date+'</td>';
		content += '</tr>';
	});
	
	$('#list').empty();
	$('#list').append(content);
}

</script>
</html>