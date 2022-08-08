<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>모임 후기 리스트</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/JS/groupReview/jquery.twbsPagination.js"></script>
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
	<h3>모임 후기 리스트</h3>
	<!-- <form action="reviewSearch.do" method="get"> -->
		<fieldset>
			<input type="text" id="keyword" value="" placeholder="모임 이름을 입력해주세요"/>
			<button id="reviewSearch">검색</button>
		</fieldset>
	<!-- </form> -->
	<button onclick="location.href='moimReviewRegister.go'">글쓰기</button>
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>글 제목</th>
				<th>모임 종류</th>
				<th>모임 이름</th>
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

function listCall(page){
	
	var pagePerNum = 10;
	//console.log("param page : " + page);
	
	$.ajax({
		type:'get',
		url:'groupReviewList.ajax',
		data:{
			cnt : pagePerNum,
			page : page
		},
		dataType:'JSON',
		success:function(data){
			//console.log(data);
			drawList(data.groupReviewList);
			currPage=data.currPage;
			
			//플러그인 사용 페이징
			$("#pagination").twbsPagination({
				startPage:data.currPage, //시작페이지
				totalPages:data.pages, //총 페이지(전체게시물 / 한 페이지에 보여줄 게시물 수)
				visiblePages: 5, // 한번에 보여줄 페이지 수
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

//검색
$('#reviewSearch').on('click',function(){
	$("#pagination").twbsPagination('destroy');
	reviewSearch(currPage);
});


function reviewSearch(page){
	
	var pagePerNum = 10;
	 
	 var keyword = $("#keyword").val();
	 console.log(keyword);
	 
	 $.ajax({
		 type:'get',
		 url:'reviewSearch.ajax',
		 data:{
			 cnt : pagePerNum,
			 page : page,
			 reviewSearch : reviewSearch,
			 keyword : keyword
		 },
		dataType:'json',
		success:function(data){
			console.log(data);
			drawList(data.groupReviewList);
			currPage = data.currPage;
			
			//플러그인 사용 페이징
			$("#pagination").twbsPagination({
				startPage:data.currPage, //시작페이지
				totalPages:data.pages, //총 페이지(전체게시물 / 한 페이지에 보여줄 게시물 수)
				visiblePages: 5, // 한번에 보여줄 페이지 수
				onPageClick:function(e,page){
					console.log(page);
					currPage=page;
					reviewSearch(page);
				}
			});
		},
		error:function(e){
			console.log(e);
		}
	 });

	}
	
	
//리스트 그리기
function drawList(groupReviewList){
	
	var content="";
	
	groupReviewList.forEach(function(item){
		
		//console.log(item);
		content += '<tr>';
		content += '<td>'+item.groupReview_no+'</td>';
		content += '<td><a href="groupReviewDetail.do?groupReview_no='+item.groupReview_no+'">'+item.review_title+'</a></td>';
		content += '<td>'+item.class_no+'</td>';
		content += '<td>'+item.idx+'</td>';
		content += '<td>'+item.review_date+'</td>';
		content += '</tr>';
	});
	
	$('#list').empty();
	$('#list').append(content);
}




</script>
</html>