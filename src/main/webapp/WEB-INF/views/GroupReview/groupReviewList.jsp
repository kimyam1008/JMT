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
			<input type="hidden" id="searchCate" value="idx"/>
			<input type="text" id="keyword" value="" placeholder="모임 이름을 입력해주세요"/>
			<button id="reviewSearch">검색</button>
		</fieldset>
	<button onclick="location.href='groupReviewRegister.go'">글쓰기</button>
	<div>
		<button name="idx" value="전체" onclick="groupSort()">전체</button>
		<button name="idx" value="1" onclick="groupSort()">번개</button>
		<button name="idx" value="3" onclick="groupSort()">도장깨기</button>
	</div>
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


function groupSort(){
	var idx = $("button[name='idx']").val();
	console.log(idx);
}

function groupSortLight(){
	var idx = $("button[name='idx']").val();
	console.log(idx);
}

function groupSortDojang(){
	var idx = $("button[name='idx']").val();
	console.log(idx);
}

/* var moimKind = $('.moimKind').text();
console.log(moimKind);

idxChange(currPage);

//번개, 도장 넣기
function idxChange(){
	if ($('.moimKind').text() == 1) {
		$('.moimKind').text() = "번개";
	} else {
		$('.moimKind').text() = "도장깨기";
	}
} */

/*
//분류 선택
$("input[name='idx']").on("click",function(){
	$("#pagination").twbsPagination('destroy');
	sortChangeCall(currPage);
});

function sortChangeCall(page){
	var pagePerNum = 5;
	var sortNum = $("input[name='idx']:clicked").val();
	$('#keyword').val('');
	console.log(sortNum);
	
	$.ajax({
		type:'get',
		url:'reviewSearch.ajax',
		data:{
			sortNum:sortNum,
			cnt:pagePerNum,
			page:page
			},
		dataType:'JSON',
		success:function(data){
			drawList(data.sortChange);
			currPage = data.currPage;
			
			$("#pagination").twbsPagination({
				startPage: data.currPage, //시작 페이지
				totalPages: data.pages, //총 페이지
				visiblePages: 5, //한번에 보여줄 페이지 수
				onPageClick: function(e,page){
					console.log(page); //사용자가 클릭한 페이지
					currPage = page;
					sortChangeCall(page);
				}
			});
		},
		error:function(e){
			console.log(e);
		}
	});
}
*/

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
	 
	 $.ajax({
		 type:'get',
		 url:'reviewSearch.ajax',
		 data:{
			 cnt : pagePerNum,
			 page : page,
			 //reviewSearch : reviewSearch,
			 searchCate : searchCate,
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
	
	/* if ($('.moimKind') == 1) {
		$('.moimKind').html() = "번개";
	}; */
	
	groupReviewList.forEach(function(item,groupReview_no){
		
		//console.log(item);
		content += '<tr>';
		content += '<td>'+item.groupReview_no+'</td>';
		content += '<td><a href="groupReviewDetail.do?groupReview_no='+item.groupReview_no+'">'+item.review_title+'</a></td>';
		content += '<td class="class_no">'+item.class_no+'</td>';
		content += '<td>'+item.idx+'</td>';
		content += '<td>'+item.review_date+'</td>';
		content += '</tr>';
	});
	
	
	$('#list').empty();
	$('#list').append(content);
}




</script>
</html>