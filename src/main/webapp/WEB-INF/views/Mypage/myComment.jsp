<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script>

<style>
	div, th, td {border: 1px solid black;}
	.top {height:150px;}
</style>
</head>
<body>
	<h3>나의활동 : 댓글단 글</h3>
	<div class="top">
			<img src="/photo/${dto.photo_newFileName}" width="150" height="100"/>
			${dto.member_id }님 반갑습니다. <br/>
			등급 : ${dto.grade_name } <br/>
			작성글 : ${dto.boardCount}개
			작성 댓글 : ${dto.commentCount}개
	</div>
	<a href="./myBoardList.go">게시글</a>
	<a href="#">댓글단 글</a>
	<a href="./myMoim.go">모임</a>
	<table>
        <thead>
            <tr>
                <th>댓글번호</th>          
                <th>카테고리</th>           
                <th>제목</th>           
                <th>작성일</th>       
            </tr>
        </thead>
        <tbody id=list>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>코</td>
					<td>맨</td>
					<td><a href="#">트</a></td>
					<td>테스트</td>
				</tr>
			</c:forEach>
		</tbody>
    </table>
</body>
<script>

	

</script>
</html>