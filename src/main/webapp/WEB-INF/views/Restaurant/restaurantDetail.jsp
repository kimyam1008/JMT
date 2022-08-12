<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
	<style type="text/css">
		li {list-style: none; float: left; padding: 6px;}
		 a:link { color: black; text-decoration: none;}
		 a:visited { color: black; text-decoration: none;}
		 a:hover { color: blue; text-decoration: underline;}
		 
		 th { text-align: center; }
		 table { text-align: center; }
		 h1 { padding: 40px}	
</style>
<title>Insert title here</title>
</head>
<body>
	<h3>${sessionScope.loginId}</h3>
	<h3>맛집 상세보기</h3>
	 <c:forEach items="${photoList}" var="path">
      	<img src="/image/${path.photo_newFileName}" height="400"/>
     </c:forEach>
	<table>
		<thead>
	         <tr>
	         	<td>
				<input type="hidden" name="restaurant_no" value="${resDetail.restaurant_no}" />
				
				</td>
	         	<th>식당이름</th>
	         	<td>${resDetail.restaurant_name}</td>
	         	<th>음식종류</th>
	         	<td>${resDetail.food_name}</td>	
				<th>지번주소</th>
				<td>${resDetail.restaurant_address}</td>
				<th>전화번호</th>
				<td>${resDetail.restaurant_call}</td>
				<td colspan="2">
					<button type="button" resID="${resDetail.restaurant_no}" memberID="${sessionScope.loginId}" onclick="resUp()">맛집 수정요청</button>
				</td>
	         </tr>
	   	</thead>
	   	<tbody>
	   			
		</tbody>
		
		
	</table>
	
	<c:forEach items="${lightninglist}" var="liList">
	 	번개 모임!!
	 	<br/>
      	<td>${liList.lightning_title}</td>
      	<br/>
      	<br/>
     </c:forEach>
	
		<h3>리뷰</h3>
	<table>
		<thead>
			<tr>
				<td>
					좋아요 순
				</td>
				<td>
					|
				</td>
				<td>
					최신순
				</td>
				<td>
					<a href="./reviewWrite?restaurant_no=${resDetail.restaurant_no}">리뷰 쓰기</a>			
				</td>
			</tr>
		</thead>
	</table>
	<br/>
	 
     <table>
	 <c:forEach items="${resCommet}" var="comment" >
		<c:if test="${comment.comment_status eq '공개'}">
			<td>
				<input type="hidden" name="idx" value="${comment.comment_no}" />
			</td>
			<td>${comment.member_id}</td>
			<td>${comment.comment_content}</td>
			<td>${comment.comment_date}</td>
			
	
			<button class="likeBtn" onclick="like(this)"
			commentID="${comment.comment_no}" loginID="${sessionScope.loginId}">
			♡</button>
		
			<button class="likeDelBtn" onclick="likeDel(this)"
			commentID="${comment.comment_no}" loginID="${sessionScope.loginId}">
			♥</button>
	
			
			<%-- 좋아요 취소 삭제... 조건.. 
			<c:choose>
				<c:when test="${comment.member_id eq sessionScope.loginId}">
					<button class="likeBtn" onclick="like(this)"
					commentID="${comment.comment_no}" loginID="${sessionScope.loginId}">
					♥</button>
				</c:when>
				<c:when test="${sessionScope.loginId}">
					<button class="likeDelBtn" onclick="like(this)"
					commentID="${comment.comment_no}" loginID="${sessionScope.loginId}">
					♡</button>
				</c:when>
			</c:choose> --%>
			
			
			<%-- 포토도 해야함..
			<c:forEach items="${photoList}" var="p">
				<c:if test="${comment.comment_no eq comment.comment_no}">
				<td>
					<input type="hidden" name="idx" value="${comment.comment_no}" />
				</td>
				<img src="/image/${p.photo_newFileName}" height="400"/>
				</c:if>
			</c:forEach> --%>
			 
			<c:if test="${comment.member_id eq sessionScope.loginId}">
			<button class="delBtn" onclick="commentDel(this)" commentID="${comment.comment_no}">삭제</button>
			<a href="./reviewUpdate?comment_no=${comment.comment_no}">수정</a>
			</c:if>
			${comment.likeNo}
		</c:if>	
		
     </c:forEach>
    </table>
    
    <!-- 페이지 번호 -->	
	<div>
		<ul>	
			<!-- 맨처음 버튼 -->
			<li>
				<a href="listPage${pageMaker.makeQuery(pageMaker.firstPage)}">맨처음</a>
			</li>
			
			
			<!-- 이전 버튼 -->
			<li>
				<a href="listPage${pageMaker.makeQuery(pageMaker.startPage-1)}">이전</a>
			</li>
			
			<!-- 페이지 번호 (시작 페이지 번호부터 끝 페이지 번호까지) -->
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			    <li>
				    <a href="listPage${pageMaker.makeQuery(idx)}">
				    	<!-- 시각 장애인을 위한 추가 -->
				      	<span>${idx}</span>
				    </a>
			    </li>
			</c:forEach>
			
			<!-- next 버튼 -->
			<li>
			    <a href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
			</li>
			
			<li>
				<a href="listPage${pageMaker.makeQuery(pageMaker.finalPage)}">맨끝</a>
			</li>
			
		</ul>
	</div>
</body>

<script>


	function resUp(){
		window.open('restaurantUpdate.go?restaurant_no=${resDetail.restaurant_no}','','width=400, height=300');
	}
	
	
	function commentDel(comment_no) { 
		  var commentID = $(comment_no).attr("commentID");
	      console.log(commentID);
	      
	         $.ajax({
	               type:'get',
	               url:'commentDel.ajax',
	               data:{
					 comment_no : commentID
	               },
	               dataType:'JSON',
	               success:function(data) {
	                  alert(data.msg);
	                  location.href="resDetail.do?restaurant_no="+commentID;
	               },
	               error:function(e) {
	                  console.log(e);
	     
	                  //location.reload(true);
	               }
	            });
	      
	      
	}
	
	function like(comment_no) { 
	      var commentID = $(comment_no).attr("commentID");
	      /* var loginID = $(comment_no).attr("loginID"); */
	      console.log(commentID);
	      
	         $.ajax({
	               type:'get',
	               url:'like.ajax',
	               data:{
					 comment_no : commentID,
					 /* loginID : loginID */
	               },
	               dataType:'JSON',
	               success:function(data) {
	                  alert(data.msg);
	               },
	               error:function(e) {
	                  console.log(e);
	               }
	            });
	      
	      
	} 
	
	function likeDel(comment_no) { 
	      var commentID = $(comment_no).attr("commentID");
	      /* var loginID = $(comment_no).attr("loginID"); */
	      console.log(commentID);
	      
	         $.ajax({
	               type:'get',
	               url:'likeDel.ajax',
	               data:{
					 comment_no : commentID,
					 /* loginID : loginID */
	               },
	               dataType:'JSON',
	               success:function(data) {
	                  alert(data.msg);
	               },
	               error:function(e) {
	                  console.log(e);
	               }
	            });
	      
	      
	} 
	
	
	
	
	
</script>


</html>























