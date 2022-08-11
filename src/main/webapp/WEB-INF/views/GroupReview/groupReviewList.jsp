<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>모임 후기 리스트</title>
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
	<h3>모임 후기 리스트</h3>
		<fieldset>
			<!-- <input type="hidden" id="searchCate" value="idx"/> -->
			<select id="searchCate">
				<option value="lightning">번개모임</option>
				<option value="dojang">도장깨기</option>
			</select>
			<input type="text" id="keyword" value="" placeholder="모임 이름을 입력해주세요"/>
			<button id="reviewSearch">검색</button>
		</fieldset>
	<button onclick="location.href='grRegisterForm.go'">글쓰기</button><br/>
<!-- 	<button name="groupAll" value="전체" onclick="location.href='groupReviewList.go'">전체</button>
	<input type="radio" name="groupSort" id="groupSort" value="번개모임"/>번개모임
	<input type="radio" name="groupSort" id="groupSort" value="도장깨기"/>도장깨기 -->

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

reviewSearch(currPage);

console.log($("#searchCate option:selected").val());
//console.log($("#groupTitle").text());


//라디오 값 변경
/* $("input[name='groupSort']").on("change",function(){
	$("#pagination").twbsPagination('destroy');
	reviewSearch(currPage);
	//console.log($("input[name='groupSort']:checked").val());
}); */

//리스트 호출
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
			console.log(currPage);
			
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
	 
	var searchCate = $("#searchCate").val();
	console.log(searchCate);
	var keyword = $("#keyword").val();
	console.log(keyword);
	//var groupSort = $("input[name='groupSort']:checked").val();
	//console.log(groupSort);
	 
	 $.ajax({
		 type:'get',
		 url:'reviewSearch.ajax',
		 data:{
			 cnt : pagePerNum,
			 page : page,
			 //reviewSearch : reviewSearch,
			 searchCate : searchCate,
			 keyword : keyword,
			//groupSort : groupSort
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
	
	groupReviewList.forEach(function(item,groupReview_no){
		
		if ($("#searchCate option:selected").val() == "lightning") {
			
			//console.log(item);
			content += '<tr>';
			content += '<td>'+item.groupReview_no+'</td>';
			content += '<td><a href="groupReviewDetail.do?groupReview_no='+item.groupReview_no+'">'+item.review_title+'</a></td>';
			content += '<td>'+item.class_name+'</td>';
			content += '<td id="groupTitle">'+item.lightning_title+'</td>';	
			content += '<td>'+item.review_date+'</td>';
			content += '</tr>';
			
		} else {
			
			//console.log(item);
			content += '<tr>';
			content += '<td>'+item.groupReview_no+'</td>';
			content += '<td><a href="groupReviewDetail.do?groupReview_no='+item.groupReview_no+'">'+item.review_title+'</a></td>';
			content += '<td>'+item.class_name+'</td>';
			content += '<td>'+item.dojang_title+'</td>';
			content += '<td>'+item.review_date+'</td>';
			content += '</tr>';

		}
	});
	
	
	$('#list').empty();
	$('#list').append(content);
}




</script>
</html>