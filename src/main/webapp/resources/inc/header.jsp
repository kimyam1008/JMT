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
	table,th,td {
		border : 1px solid black;
		border-collapse : collapse;
		width : 600px;
	}

	th,td { 
		padding : 5px 10px;
	}
	
	 #loginMenu {
    	float: left;
    	width: 90%;
    	margin : 0 60px;
	}

	 #loginMenu  {
   		 text-align: right;
	}
	 #loginMenu > span {
	    font-size:11px;
	    color:#c8c8c8;
	}
	
	img {
		width : 20px;
		height : 20px;
	}

	
	#searchBar{
		float : left;
		height : 200px;
	}

	
</style>
</head>
<body>
<div id="loginMenu">
	<c:if test="${sessionScope.loginId != null}">
		<strong>${sessionScope.loginId}</strong> 님 <a href="#">마이페이지</a> <span>|</span><img id="notix" src="resources/photo/noti.png"  onclick="notiChk()" alt="noti" /> <span>|</span> <a href="logout.do">로그아웃</a>
	</c:if>
</div>
				
           
				