<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>

<body>
	<input type="text" id="search" placeholder="맛집 검색해주세요">
	<button id="moimSearch">검색</button>
	<br/>
	<select id="food_name"></select>
	<br/>
		
        
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


/* 수정 후 */

var currPage = 1;

listCall(currPage);


function listCall(page){
	
	var pagePerNum = 10;	
	
	$.ajax({
		type:'get',
		url:'resList.ajax',
		data:{
			cnt:pagePerNum,
			page:page
		},
		dataType:'JSON',
		success:function(data){
				console.log(data);
				drawList(data.resList);
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


$('#moimSearch').on('click',function(){
	
	$("#pagination").twbsPagination('destroy');
	resSearch(currPage);
	
});


$('#food_name').on('change', function () {
	
	if($("#food_name option:selected").val() == 'all'){
		$("#pagination").twbsPagination('destroy');
		listCall(currPage);
	}else{
	$("#pagination").twbsPagination('destroy');
	resSearch(currPage);
	}
});


$("input[name='gender']").change(function(){
	resSearch(currPage);
});


//맛집 검색

function resSearch(page){
	
	var pagePerNum = 10;
	
	var search = $("#search").val();
	var foodname = $("#food_name option:selected").val();
	 var gender = $("input:radio[name='gender']:checked").val();
	 
		$.ajax({
			type:'get',
			url:'resSearch.ajax',
			data:{
				cnt:pagePerNum,
				page:page,
				search:search,
				foodname:foodname,
				gender:gender
			},
			dataType:'JSON',
			success:function(data){
					console.log(data);
					drawList(data.resList);
					currPage = data.currPage;
					console.log("데이터확인:::",data.resList)

					
					$("#pagination").twbsPagination({
						startPage: data.currPage, //시작 페이지
						totalPages: data.pages, //총 페이지
						visiblePages: 5, //한번에 보여줄 리스트 수
						onPageClick: function(e,page){
							console.log(page); //사용자가 클릭한 페이지
							currPage = page;
							resSearch(page);
						}
					});
			},
			error:function(e){
				console.log(e);
	    		if(e.statusText == 'error'){
					alert("조회된 데이터가 없습니다.");
					listCall(currPage);
					$('#search').val('');
				}
			}
				
		});
		
	
	
}



function drawList(list){
	var content = '';
	list.forEach(function(item,restaurant_no){
		
		content += '<tr>';
		content += '<td><img src="/image/'+item.photo_newFileName+'" height="100"/></td>';
		content += '<td class="resDetailTitle"><a href="resDetail.do?restaurant_no='+item.restaurant_no+'">'+item.restaurant_name+'</a></td>';
		content += '<td>'+item.food_name+'</td>';
		content += '<td>'+item.restaurant_address+'</td>';
		content += '</tr>';
	});
	$('#list').empty();
	$('#list').append(content);
}



function darwName(food_name) {
	var content = '';
		content += '<option value="all">음식 카테고리</option>';
		food_name.forEach(function(item){
		content += '<option value="'+item.food_no+'">'+item.food_name+'</option>';
	});
	$('#food_name').empty();
	$('#food_name').append(content);
	
}


food_nameCall();

function food_nameCall() {
	
	$.ajax({
		type:'get',
		url:'foodname.do',
		data : {},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			darwName(data.foodname);
		},
		error:function(e){
			console.log(e);
		}
		
	});

}

</script>

</html>