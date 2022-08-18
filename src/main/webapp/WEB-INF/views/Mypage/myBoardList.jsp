<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	div, th, td {border: 1px solid black;}
	.top {height:150px;}
</style>
</head>
<body>
	<h3>나의활동 : 게시글</h3>
	<div class="top">
			<img src="/photo/${dto.photo_newFileName}" width="150" height="100"/>
			${dto.member_id }님 반갑습니다. <br/>
			등급 : ${dto.grade_name } <br/>
			작성글 : ${dto.boardCount}개
			작성 댓글 : ${dto.commentCount}개
	</div>
	<a href="#">게시글</a>
	<a href="#">댓글단 글</a>
	<a href="#">모임</a>
	<table>
        <thead>
            <tr>
                <th>글번호</th>          
                <th>카테고리</th>           
                <th>제목</th>           
                <th>작성일</th>       
            </tr>
        </thead>
        <tbody id=list>
			
		</tbody>
    </table>
</body>
<script>

	var currPage=1;
	
	listCall(currPage);
		
	$('#pagePerNum').on('change', function(){
		console.log("currPage : " + currPage);
		//페이지당 보여줄 수를 변경시 계산된 페이지 적용이 안된다. (플러그인의 문제)
		//페이지당 보여줄 수를 변경시 기존 페이징 요소를 없애고 다시 만들어 준다.
		$("#pagination").twbsPagination('destroy');
		// 검색어가 들어갔을 때와 아닐때를 구분
			listCall(currPage);
	});
	
	function listCall(page){	
	
	var pagePerNum = $('#pagePerNum').val();
	console.log("param page : "+page);
	$.ajax({
		type:'GET',
		url:'myBoardList.ajax',
		data:{
			cnt : pagePerNum,
			page : page
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			drawList(data.list);
			currPage = data.currPage;
			
			//불러오기가 성공되면 플러그인을 이용해 페이징 처리
			$("#pagination").twbsPagination({
				startPage:data.currPage, //시작 페이지
				totalPages:data.pages, //총 페이지(전체 게시물 수 / 한 페이지에 보여줄 게시물 수)
				visiblePages:5, //한 번에 보여줄 페이지 수 [1][2][3][4][5]
				onPageClick:function(e,page){
					//console.log(e); //클릭한 페이지와 관련된 이벤트 객체
					console.log(page); //사용자가 클릭한 페이지
					currPage = page;
					
					listCall(page);
				}
			});
		},
		error:function(e){
			console.log(e);
		}
	});
}
	
	function drawList(list){
	var content = '';
	list.forEach(function(dto){
		console.log(dto);
			content += '<tr>';
			content += '<td>'+dto.mb_id+'</a></td>';
			content += '<td>'+dto.admin_start+'</td>';
			content += '<td><a href="blackDetail.do?black_id='+dto.black_id+'">'+dto.black_start+'</td>';
			content += '<td>'+dto.admin_end+'</td>';
			content += '</tr>';				
			
	});
	$('#list').empty();
	$('#list').append(content);
	
	
	
	
	
	
	
	

</script>
</html>