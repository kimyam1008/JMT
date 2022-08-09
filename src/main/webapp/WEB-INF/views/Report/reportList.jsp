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
<select name="report_status">
	<option selected >전체</option>
	<option value="wait">처리대기</option>
	<option value="end">처리완료</option>
	<option value="blind">블라인드</option>
</select>
<select name="report_sort">
	<option value= "allList">전체</option>
	<option value= "post">게시글</option>
	<option value= "sort">분류</option>
	<option value= "reporter">신고자</option>
	<option value= "title">제목</option>
</select>
<input type="text" name="keyword" placeholder="검색어를 입력해 주세요"/>
<button type="button" onclick="searchClick()">검색</button>
<button type="button" onclick="blind()">블라인드</button>
<table>
		<thead>
			<tr>
				<th><input type="checkbox" id="all"/></th>
				<th>신고글</th>
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
			<td colspan="9" id="paging">
				
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
			console.log(data.list);
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
		content += '<td> <input type="checkbox" value='+item.report_no+'></td>';	
		content += '<td>'+'<a href=report/detail?report_no='+item.report_no+'&class_no='+item.class_no+'&idx='+item.idx+'>'+item.report_title+'<a/></td>'; 
		/* content += '<td>'+'<a href=report/detail?report_no='+item.report_no+'>'+item.report_title+'<a/></td>'; */
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


/* 검색 */
function searchClick(page){
/* 검색 */
 
/* $('#searchBtn').on('click',function(){ */
	
	 var pagePerNum=5;
	//var page= null;
	if( page==null){
		page=1;
	} 
	
	
	
	$("#pagination").twbsPagination('destroy');
		
	let report_status =$('select[name=report_status]').val();
	let report_sort = $('select[name=report_sort]').val();
	let keyword = $('input[name=keyword]').val();

	if(keyword.trim()==""){
		alert('검색어를 입력해 주세요'); 
	}

	$.ajax({
		type:'get',
		url:'report/list.ajax',
		async: false,
		data:{
			cnt:pagePerNum,
			page:page,
			report_status:report_status,
			report_sort:report_sort,
			keyword:keyword		
		},
		dataType:'json',
		success:function(data){
			console.log("검색결과"+data.list);
			drawList(data.list);
			//	subSearch(); 
				//currPage = data.currPage;
				//불러오기가 성공되면 플러그인 을 이용해 페이징 처리
				$("#pagination").twbsPagination({
					initiateStartPageClick: false,
					startPage:data.currPage, //시작 페이지
					totalPages: data.pages, // 총 페이지(전체 개시물 수 / 한 페이지에 보여줄 게시물 수)
					visiblePages: 5, //한번에 보여줄 페이지 수 [1][2][3][4][5]
					//href:'cliSearch.ajax?cnt='+pagePerNum+'&page='+currPage+'&searchType='+searchType+'&keyword='+keyword;
					/* onPageClick:function(){
						  //href:'?page={{number}}&searchcol='+$('#search_select').val()+'&searchval='+$('#searchval').val()
						//href:'?cnt='+pagePerNum+'&page='+currPage+'&searchType='+searchType+'&keyword='+keyword;
						 $('.page-link').on('click',function(){
								console.log('s');
								location.href='cliSearch.ajax?cnt='+pagePerNum+'&page='+currPage+'&searchType='+searchType+'&keyword='+keyword;
							
						 })
						
					} ,
					  */
					
					
			 		onPageClick:function(e,page){
						//console.log(e);//클릭한 페이지와 관련된 이벤트 객체
						console.log("정보"+page);//사용자가 클릭한 페이지
						//currPage = page;
					
						searchClick(page);
						 
					}   
				});			
		},
		error:function(e){
			console.log(e);
		}	
	});
}





/* 블라인드 */
function blind(){ 
	var blindPost= [] ;

	$('#list input[type="checkbox"]:checked').each(function(idx,item){
		blindPost.push($(this).val());		
	}); 
	
	

 	$.ajax({
		url:'report/blind.ajax',
		type:'post',
		dataType:'json',
		data:{blindPost:blindPost},
		success:function(data){console.log(data);
		console.log('블라인드 성공');
		listCall(currPage); 
		alert(" 블라인드 처리를 했습니다.");
		},
		
		error: function(e){console.log(e);}
	
	}); 
	
	
	
}





/* 체크박스 */


$('#all').click(function(){
	//console.log($('input[type="checkbox"]'))
	var $chk = $('input[type="checkbox"]'); // 체크박스를 모두 가져옴 
	console.log($chk);
	//console.log($(this).is(":checked"));
	if($(this).is(":checked")){ // 현재 일어난 이벤트 (this)가 checked 상태이면 true 
		$chk.prop("checked",true); //prop과 attr의 차이 
	}else{		// prop는 동적인 요소의 속성 -> 애초에 html로  있던 요소가 아니라 나중에 js를 통해 그려진 요소
		$chk.prop("checked",false); // attr 정정 요소의 속성-> 애초에 html로 있었던 요소 
	}
});





</script>
</html>