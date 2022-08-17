<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="loginMenu">
	<c:choose>
		<c:when test="${sessionScope.loginId != null && !notiChk}">
			<strong>${sessionScope.loginId}</strong> 님 <a href="#">마이페이지</a> <span>|</span><img id="notix" src="resources/photo/noti.png"  onclick="notiChk()" alt="noti" /> <span>|</span> <a href="logout.do">로그아웃</a>
		</c:when>
		<c:when test="${sessionScope.loginId != null && notiChk}">
			<strong>${sessionScope.loginId}</strong> 님 <a href="#">마이페이지</a> <span>|</span><img id="notix" src="resources/photo/noti4.png"  onclick="notiChk()" alt="noti" /> <span>|</span> <a href="logout.do">로그아웃</a>
		</c:when>
		<c:otherwise>
			<a href="/login.go">로그인</a>
		</c:otherwise>
	</c:choose>
</div>
 <!-- 	<table>
	<c:if test="${sessionScope.loginId != null}">
		<strong>${sessionScope.loginId}</strong> 님 <a href="#">마이페이지</a> <span>|</span><img id="notix" src="resources/photo/noti.png"  onclick="notiChk()" alt="noti" /> <span>|</span> <a href="logout.do">로그아웃</a>
	</c:if>
	<c:if test="${notiChk == true}">
		<strong>${sessionScope.loginId}</strong> 님 <a href="#">마이페이지</a> <span>|</span><img id="notix" src="resources/photo/noti4.png"  onclick="notiChk()" alt="noti" /> <span>|</span> <a href="logout.do">로그아웃</a>
	</c:if>
<div class="ballon"></div>
         <c:forEach items="${notiList}" var="list">
                <tr>
                    <td>${list.noti_content}</td>
                    <td>${list.noti_date}</td>
                </tr>
         </c:forEach>
       </table> -->