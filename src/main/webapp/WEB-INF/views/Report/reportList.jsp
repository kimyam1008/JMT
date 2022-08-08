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
<script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script>


</head>
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
<h1>신고 리스트 입니다.</h1>

<table>
		<thead>
			<tr>
				<th><input type="checkbox"/></th>
				<th>분류</th>
				<th>신고자ID</th>
				<th>신고날짜</th>
				<th>피신고자ID</th>
				<th>처리상태</th>
				<th>처리날짜</th>
				<th>신고사유</th>
			</tr>
		</thead>
		<tbody id="list">
		
		</tbody>
		 <tr>
			<td colspan="8" id="paging">
				
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

$('#pagePerNum').on('change',function(){	
	console.log('currPage : '+currPage);
	
	//페이지당 보여줄 수 변경시 계산된 페이지 적용이 안된다.(플러그인의 문제)
	//페이지당 보여줄 수 변경시 기존 페이징 요소를 없애고 다시 만들어 준다.
	$("#pagination").twbsPagination('destroy');
	listCall(currPage);
	
}); 

 function listCall(page){
	 var pagePerNum=5;

	console.log("param page : "+page); 
	$.ajax({
		type:'GET',
		url:'report/list.ajax',
		data:{
			cnt:pagePerNum,
			page:page
		},
		dataType:'JSON',
		success:function(data){
			console.log("dd");
			console.log(data);
			drawList(data.list);
			//currPage = data.currPage;
			//불러오기가 성공되면 플러그인 을 이용해 페이징 처리
		 	$("#pagination").twbsPagination({
				startPage:data.currPage, //시작 페이지
				totalPages: data.pages, // 총 페이지(전체 개시물 수 / 한 페이지에 보여줄 게시물 수)
				visiblePages: 5, //한번에 보여줄 페이지 수 [1][2][3][4][5]
				onPageClick:function(e,page){
					//console.log(e);//클릭한 페이지와 관련된 이벤트 객체
					console.log(page);//사용자가 클릭한 페이지
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
	list.forEach(function(item){
		//console.log(item);
		content += '<tr>';
		content += '<td> <input type="checkbox"></td>';
		content += '<td>'+item.class_name+'</td>';
		content += '<td>'+item.reporter+'</td>';
		content += '<td>'+item.report_date+'</td>';
		content += '<td>'+item.reported+'</td>';
		content += '<td>'+item.report_proc_status+'</td>';
		content += '<td>'+item.report_proc_date+'</td>';
		content += '<td>'+item.report_reason+'</td>';
		content += '</tr>';
	});
	$('#list').empty();
	$('#list').append(content);
}
</script>
</html>