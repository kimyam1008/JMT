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
	body{
	width: 100%;
	}
	#memberTable{
		width: 100%;		
	}
	
	table,th,td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px;
	}
	
	.active{
		color:pink;
		font: bold;
		text-decoration: underline;
	}
	#option_list{ text-align:center;  margin:20px 0px;}
	#option_list span{font-size: 20px; margin:20px 20px;}
	#search{
		text-align:center; 
	}

</style>
<title>Insert title here</title>
</head>
<body>
        <h3>맛집 수정요청 목록</h3>
       
	<div id="option_list" >
		<span class="active" onclick="listCall(1)">전체</span>
		<span onclick="listCall(1 ,'처리대기')">처리대기</span>
		<span onclick="listCall(1 ,'처리완료')">처리완료</span>
	</div>

   <table>
      <thead>
      <tr>
      	<td></td>
      	<td>
      		회원 아이디
      	</td>
      	<td>
      		식당이름
      	</td>
      	<td>
      		신청날짜
      	</td>
      	<td>
      		사유
      	</td>
      	<td>
      		처리여부
      	</td>
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
	$('span').click(  
			function(){$("#pagination").twbsPagination('destroy'); 
			console.log('부심');
	});

	 function listCall(page,list_option){
		 var pagePerNum=5;
		 var option1 = list_option;

			
		$.ajax({
			type:'GET',
			url:'resUpdateList.ajax',
			data:{
				list_option:list_option,
				cnt:pagePerNum,
				page:page
			},
			dataType:'JSON',
			success:function(data){
				
				console.log(data);
				console.log(data.resUpdateList);
				currPage = data.currPage;
				drawList(data.resUpdateList);
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
			
			content += '<tr>';
			content += '<td>'+item.restuarantUpdate_no+'</td>';
			content += '<td>'+item.member_id+'</td>';
			content += '<td><a href=/resAdminUpdate.go?restaurant_no='+item.restaurant_no+'&restuarantUpdate_no='+item.restuarantUpdate_no+'>'+item.restaurant_name +'</a>' +'</td>';
			content += '<td>'+item.restaurantUpdate_date+'</td>';
			content += '<td>'+item.restaurantUpdate_reason+'</td>';
			content += '<td>'+item.restaurantUpdate_proc_status+'</td>';
			
			content += '</tr>';
		});
		$('#list').empty();
		$('#list').append(content);
	}
	 
	$('span').click(function(){
	  if($('span').hasClass("active")){
	    $('span').removeClass("active");
	    $(this).addClass("active"); 
	    
	  }else{
	    $(this).addClass("active");  
	  }
	});
	


</script>


</html>