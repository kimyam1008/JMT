<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
         
	</body>
	<script>
	/*
	
 		var notiChk = ${notiChk};
	if(notiChk){
		$("#notix").attr("src","resources/photo/noti4.png");
	}
 		
	*/
 		
	function notiChk(){
			$("#notix").attr("src","resources/photo/noti.png");
			//location.href='/notiList.do';
			$(".ballon").toggle();
		}
	
	</script>