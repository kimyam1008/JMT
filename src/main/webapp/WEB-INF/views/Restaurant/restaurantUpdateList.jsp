<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script>
<style>

table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	th,td {
		padding: 5px 10px;
	}
	
	table {
		width: 80%;
	}

</style>
<title>Insert title here</title>
</head>
<body>
        <h3>맛집 수정요청 목록</h3>
   <table>
      <thead>
      <tr>
      </tr>      
      </thead>
      <tbody id="list">
      </tbody>
   </table>
	<tr>
      <td colspan="6" id="paging">
         <!-- plugin 사용법 (twbsPagination)-->
         <div class="container">
            <nav arial-label="Page navigation" style="text-align:center">
               <ul class="pagination" id="pagination"></ul>
            </nav>
            </div>
      </td>
   </tr>

</body>
	
<script>

var currPage = 1;

listCall(currPage);


function listCall(page){
	
	var pagePerNum = 10;	
	
	$.ajax({
		type:'get',
		url:'resUpdateList.ajax',
		data:{
			cnt:pagePerNum,
			page:page
		},
		dataType:'JSON',
		success:function(data){
				console.log(data);
				drawList(data.resUpdateList);
				currPage = data.currPage;
				console.log(currPage);
				
				$("#pagination").twbsPagination({
					startPage: data.currPage, //시작 페이지
					totalPages: data.pages, //총 페이지
					visiblePages: 5, //한번에 보여줄 리스트 수
					onPageClick: function(e,page){
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
		list.forEach(function(item){
			
			content += '<tr>';
			content += '<td>'+item.restuarantUpdate_no+'</td>';
			content += '<td>'+item.restaurantUpdate_reason+'</td>';
			content += '<td><a href=/resAdminUpdate.go?restaurant_no='+item.restaurant_no+'&restuarantUpdate_no='+item.restuarantUpdate_no+'>'+item.restaurant_name +'</a>' +'</td>';
			content += '<td>'+item.member_id+'</td>';
			content += '<td>'+item.restaurantUpdate_proc_status+'</td>';
			content += '<td>'+item.restaurantUpdate_date+'</td>';
			content += '</tr>';
		});
		$('#list').empty();
		$('#list').append(content);
	}

</script>


</html>