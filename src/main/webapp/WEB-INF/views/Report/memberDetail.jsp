<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
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
	table{
		width: 400px;		
	}
	
/* 	table,th,td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px;
	} */

	.active{
		color:pink;
		font: bold;
		text-decoration: underline;
	}
	#option_list{ text-align:center;  margin:20px 0px;}
	#option_list span{font-size: 20px; margin:20px 20px;}
	textarea{
		resize:none;width:95%;height:150px;
	}
/* 	.pagination{
		background-color: pink;
	} */

	.pagination>.active>a,
	.pagination>.active>a:focus, 
	.pagination>.active>a:hover,
 	.pagination>.active>span,
   .pagination>.active>span:focus, 
   .pagination>.active>span:hover{
background-color: pink;
	border-color:pink;
	
}
 .pagination>li>a{
	color:pink;
	}
</style>
<body>
<h3>회원관리 상세</h3>


<!-- 회원 상세 정보  -->
<table class="table table-bordered">
	<tr>
		<th>회원ID</th>
		<td>${detail.member_id}</td>
		<th>상태</th>
		<td>${detail.member_status}</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>${detail.profile_gender}</td>
		<th>생년월일</th>
		<td>${detail.member_birth}</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${detail.member_email}</td>
		<th>직업</th>
		<td>${detail.profile_job}</td>
	</tr>
</table>


<!-- 클릭 옵션 -->
<div id="option_list" >
	<span onclick="listCall(1 ,'블랙')" data-value="블랙" class="active">블라인드 내역</span>
	<span onclick="listCall(1 ,'탈퇴')" data-value="탈퇴">블랙리스트 내역</span>
</div>

<!-- Button trigger modal -->

<button type="button" style="background-color: pink; border:none;" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">  블라인드 등록/ 해제</button>


<!-- 블랙리스트 처리  -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- 블랙 모달-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"> 블라인드 등록/ 해제</h4>
      </div>
      <div class="modal-body">
     	<table class="table table-bordered">
     		<tr>
     			<th>회원ID</th>
     			<td>${detail.member_id}</td>
     		</tr>
     		<tr>
     			<th>블랙리스트 처리</th>
     			<td></td>
     		</tr>
     		<tr>
     			<th>처리 사유</th>
     			<td><textarea></textarea></td>
     		</tr>
     		<tr>
     			<th colspan="2">
     				<button class="btn btn-default" style="background-color: pink;" >완료</button>
     			</th>
     		</tr>
     	</table>
      </div>
      <div class="modal-footer">
        <button  type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<table id="blindTable" class="table table-bordered">
		<thead>
			<tr>
				<th>블라인드 게시물</th>
				<th>분류</th>
				<th>신고자ID</th>
				<th>피신고자 ID</th>
				<th>처리상태</th>
				<th>처리날짜</th>
			</tr>
		</thead>
		<tbody id="blindList">
		
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
	<!--    블랙  -->
	<table id="blackTable" class="table table-bordered">
		<thead>
			<tr>
				<th>블랙리스트 사유</th>
				<th>관리자</th>
				<th>처리날짜</th>
			</tr>
		</thead>
		<tbody id="list">
		
		</tbody>
		 <tr>
			<td colspan="3" id="paging">
				
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
	 var pagePerNum=5;
$.ajax({
	type:'get',
	dataType:'json', 
	data:{
		member_id:"${detail.member_id}"
			,cnt:pagePerNum
			,page:page
	},
	url:'/report/blindMemberList.ajax',
	success:function(data){
		console.log(data.blindList);
		drawList(data.blindList);
		
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
	error:function(e){console.log(e);}
	
});


}

function drawList(list){
	var content = '';
	list.forEach(function(item){
		var mb_ligntning_title = item.mb_ligntning_title;
		var mb_comment = item.mb_comment;
		var mb_dojang_title  =item.mb_dojang_title; 
		var mb_dojang_post = item.mb_dojang_post; 
		var mb_group_review = item.mb_group_review;
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
		
		
		
		//console.log(item);
		content += '<tr>';	
		content += '<td>'+mb_ligntning_title + mb_comment+mb_dojang_title +mb_dojang_post+ mb_group_review +'</td>';
		content += '<td>'+item.class_name +'</td>';
		content += '<td>'+item.reporter+'</td>';
		content += '<td>'+item.reported+'</td>';
		content += '<td>'+item.blind_status+'</td>';
		content += '<td>'+item.blind_proc_date+'</td>';
		content += '</tr>';
	});
	
	$('#blindList').empty();
	$('#blindList').append(content);
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