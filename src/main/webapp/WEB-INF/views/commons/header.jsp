<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <div class="collapse navbar-collapse">
	<ul class="nav navbar-nav navbar-left">
		<li class="dropdown">
		<c:if test="${notiChk}">
			<a  class="dropdown-toggle" data-toggle="dropdown" style="color:Red" >
		         <i class="fa fa-globe"></i> 
			</a>
		</c:if>	
		<c:if test="${!notiChk}">
			<a  class="dropdown-toggle" data-toggle="dropdown" >
		         <i class="fa fa-globe"></i> 
			</a>
		</c:if>	
			<ul class="dropdown-menu">
			</ul>
		</li> 
	 </ul>
	
	
</div> 

 