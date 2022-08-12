<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script>
<style>
table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
th, td {
  text-align: center;
}
</style>
</head>
<body>
<input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
<div>
	 ${sessionScope.loginId} 님 환영합니다, <a href="logout.do">로그아웃</a>
</div>
<br/>
<div  style="width:80px;">
<input type="button" value="도장깨기 생성" onclick="location.href='dojangReg.go'"/>
</div >
<br/>
	<div style="float: left;">
		<input type="text" id="search" placeholder="모임이름을 검색해주세요">
		<button id="moimSearch">검색</button>
		<br/>
		<select id="food_name"></select>
		<br/>
		<select id='eat_speed'>
		    <option value='' selected>식사속도</option>
		    <option value='빠름'>빠름</option>
		    <option value='보통'>보통</option>
		    <option value='느림'>느림</option>
		    <option value='상관없음'>상관없음</option>
		</select>
		<br/>
		<select id='job'>
		    <option value='' selected>직업</option>
		    <option value='직장인'>직장인</option>
		    <option value='취준생'>취준생</option>
		    <option value='학생'>학생</option>
			<option value='상관없음'>상관없음</option>
		</select>
		<br/>
			<input type="radio" name="gender" value="남자"/>남자
			<input type="radio" name="gender" value="여자"/>여자
			<input type="radio" name="gender" value="상관없음"/>상관없음
	</div>			
<table>
	<thead>
		<tr>
			<th>음식 카테고리</th>
			<th>방장 ID</th>
			<th>모임 이름</th>
			<th>모임 생성일</th>
			<th>인원</th>
			<th>상태</th>
			<th>참여여부</th>
		</tr>
	</thead>
	<tbody id="list">
	</tbody>
	<tr>
		<td colspan="7" id="paging">
			<!-- plugin 사용법 (twbsPagination)-->
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


function listCall(page){
	
	var pagePerNum = 10;
	
	var search = $("#search").val();
	var foodname = $("#food_name option:selected").val();
	var eat_speed = $("#eat_speed option:selected").val();
	var job = $("#job option:selected").val();
	var gender = $("input:radio[name='gender']:checked").val();
	
	$.ajax({
		type:'get',
		url:'dojang.ajax',
		data:{
			cnt:pagePerNum,
			page:page,
			search:search,
			foodname:foodname,
			gender:gender,
			eat_speed:eat_speed,
			job:job
			
		},
		dataType:'JSON',
		success:function(data){
				console.log(data);
				drawList(data.dojangList);
				currPage = data.currPage;
				console.log("데이터",data.dojangList);
				
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
	if($("#search").val() != ""){
		$("#food_name").val("");
		$("#eat_speed").val("");
		$("#job").val("");
		$("input:radio[name='gender']:checked").prop("checked",false);
		
		$("#pagination").twbsPagination('destroy');
		listCall(currPage);
	} else {
	 	alert("모임이름을 입력해주세요.");
	}
	
});


$('select').on('change', function () {
	$("#pagination").twbsPagination('destroy');
	listCall(currPage);
});


$("input[name='gender']").change(function(){
	listCall(currPage);
});


//도장깨기 검색

/*
function dojangSearch(page){
	
	var pagePerNum = 10;
	
	var search = $("#search").val();
	var foodname = $("#food_name option:selected").val();
	 var gender = $("input:radio[name='gender']:checked").val();
	 
		$.ajax({
			type:'get',
			url:'dojangSearch.ajax',
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
					drawList(data.dojangList);
					currPage = data.currPage;
					console.log("데이터확인:::",data.dojangList)

					
					$("#pagination").twbsPagination({
						startPage: data.currPage, //시작 페이지
						totalPages: data.pages, //총 페이지
						visiblePages: 5, //한번에 보여줄 리스트 수
						onPageClick: function(e,page){
							console.log(page); //사용자가 클릭한 페이지
							currPage = page;
							dojangSearch(page);
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

*/



function drawList(list){
	var content = '';
	console.log("data::",list);
	var loginId = $("#loginId").val();
	console.log("로그인보자", loginId);
	
	if(list.length == 0){
		content += '<tr>';
		content += '<td colspan="7">'+"조회된 데이터가 없습니다."+'</td>';
		content += '</tr>';
	}
	list.forEach(function(item){
		var date = new Date(item.dojang_create);
		var create = date.toLocaleDateString("ko-KR");
		console.log("조회::",item.member_count);
		console.log("왜안됨?",item.leader_id,loginId);
		content += '<tr>';
		content += '<td>'+item.food_name+'</td>';
		content += '<td>'+item.leader_id+'</td>';
		content += item.test=="승인" || item.leader_id==loginId? '<td><a href="dojangHome.go?dojang_no='+item.dojang_no+'">'+item.dojang_title+'</td>' : '<td><a href="dojangDetail.do?dojang_no='+item.dojang_no+'">'+item.dojang_title+'</td>';
		content += '<td>'+create+'</td>';
		content += '<td>'+item.member_count+'/'+item.people_num+'</td>';
		content += '<td>'+item.dojang_status+'</td>';
		content += item.test=="승인" || item.leader_id==loginId? '<td>참여</td>' : '<td>미참여</td>' ; 
		content += '</tr>';
	});
	$('#list').empty();
	$('#list').append(content);
}



function darwName(food_name) {
	var content = '';
		content += '<option value="">음식 카테고리</option>';
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
		url:'foodname.ajax',
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