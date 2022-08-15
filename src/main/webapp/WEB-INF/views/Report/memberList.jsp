<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.twbsPagination.js"></script>
</head>
<style>
<style>
	table{
		width: 100%;		
	}
	
	table,th,td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px;
	}
</style>
<body>

<div>
	<h3 onclick="listCall(1)">전체</h3>
	<h3 onclick="listCall(1 ,'블랙')">블랙리스트</h3>
	<h3>탈퇴</h3>
</div>

	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>회원 상태</th>
				<th>등급</th>
				<th>직업</th>
			</tr>
		</thead>
		<tbody id="list">
		
		</tbody>
		 <tr>
			<td colspan="6" id="paging">
				
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


 function listCall(page,list_option){
	 var pagePerNum=5;
	 $("#pagination").twbsPagination('destroy');
		
	$.ajax({
		type:'GET',
		url:'/report/memberList.ajax',
		data:{
			list_option:list_option,
			cnt:pagePerNum,
			page:page
		},
		dataType:'JSON',
		success:function(data){
			
			console.log(data);
			console.log(data.list);
			currPage = data.currPage;
			drawList(data.list);
			//currPage = data.currPage;
			//불러오기가 성공되면 플러그인 을 이용해 페이징 처리
		 	$("#pagination").twbsPagination({
				startPage:data.currPage, //시작 페이지
				totalPages: data.pages, // 총 페이지(전체 개시물 수 / 한 페이지에 보여줄 게시물 수)
				visiblePages: 5, //한번에 보여줄 페이지 수 [1][2][3][4][5]
				onPageClick:function(e,page){
					if(currPage!=page){
						//console.log(e);//클릭한 페이지와 관련된 이벤트 객체
						console.log(page);//사용자가 클릭한 페이지
						currPage = page;
						listCall(page,list_option);	
						
					}
					
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
	list.forEach(function(item){

		//console.log(item);
		content += '<tr>';	
		content += '<td>'+item.member_id+'</td>';
		content += '<td>'+item.member_name+'</td>';
		content += '<td>'+item.member_birth+'</td>';
		content += '<td>'+item.member_status+'</td>';
		content += '<td>'+item.grade_name+'</td>';
		content += '<td>'+item.profile_job+'</td>';
		content += '</tr>';
	});
	
	$('#list').empty();
	$('#list').append(content);
}

</script>
</html>