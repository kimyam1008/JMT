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
	table , th, td{ 
		border: 1px solid black; 
		border-collapse: collapse;
		padding:5px; 
	}
	
	table{width:500px; }
	
	

</style>
<body>


<table>
	<thead>
		<tr>
			<td>게시글 번호</td>
			<td>글제목</td>
			<td>신고자</td>
			<td>피신고자</td>
			<td>처리상태</td>
			<td>처리날짜</td>
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
listCall(currPage)


function listCall(currPage){
	
	$.ajax({
		type:'get',
		url:'/report/blindList.ajax', 
		dateType:'json', 
		data:{}, 
		success:function(data){
			console.log(data.blindList); 
			drawList(data.blindList);
			
		},
		error:function(e){console.log(e);}
		
		
	});	
	
}

function drawList(list){ 
	var content =''; 
	list.forEach(function(list){
		var mb_ligntning_title = list.mb_ligntning_title;
		var mb_comment = list.mb_comment;
		var mb_dojang_title  =list.mb_dojang_title; 
		var mb_dojang_post = list.mb_dojang_post; 
		var mb_group_review = list.mb_group_review;
		if(mb_ligntning_title== null){
			mb_ligntning_title= ''; 
		} 
		if(mb_comment == null){
			mb_comment= ''; 
		}
		if(mb_dojang_title == null){
			mb_dojang_title= ''; 
		} 
		if(mb_dojang_post == null){
			mb_dojang_post= ''; 
		} 
		if(mb_group_review == null){
			mb_group_review= ''; 
		} 
		content += '<tr>';
		content += '<td>'+list.report_no+'</td>';
		content += '<td>'+mb_ligntning_title + mb_comment+mb_dojang_title+mb_dojang_post+ mb_group_review + '</td>';
		content += '<td>'+list.reporter+'</td>';
		content += '<td>'+list.reported+'</td>';
		content += '<td>'+list.report_proc_status+'</td>';
		content += '<td>'+list.report_proc_date+'</td>';
		content += '</tr>';
	});
	$('#list').empty();
	$('#list').append(content);
}






</script>
</html>