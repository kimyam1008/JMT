<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
         
	</body>
	
	<script>
	/*onclick="notiChk()
	
 		var notiChk = ${notiChk};
	if(notiChk){
		$("#notix").attr("src","resources/photo/noti4.png");
	}
 		
	function notiChk(){
			$("#notix").attr("src","resources/photo/noti.png");
			//location.href='/notiList.do';
			$('.notiList').toggle();
			//$(".ballon").toggle();
		}
	
 		
	*/
	$('.dropdown-toggle').on("click",function(){
		
		
		$.ajax({
			type: 'get',
			url : 'notiList.ajax',
			data : {},
			dataType : 'json',
			success : function(data){
				console.log(data);
				console.log(data.notiList);
				drawNotiList(data.notiList);
			},
			error : function(e){
				console.log(e);
			}
			
		});
	});
	
	function drawNotiList(list){
		console.log(list);
		console.log(list.length);
		var content = "";
		if(list.length>0){					
			list.forEach(function(item,idx){
				//console.log(item);
				var date = new Date(item.noti_date);

				content += '<li>'+ '<'+item.info + '> ' + item.noti_content;
				content += '<span class="notiDelBtn">X</span><br/>';
				content += date.toLocaleDateString("ko-KR");
				content += '<hr>';
				content += '</li>';
			});
		//데이터가 없을 경우	
		}else{
			content += '<li>도착한 알림이 없습니다.</li>';
		}
		
		$('.dropdown-menu').empty();
		$('.dropdown-menu').append(content); 
	}
	
	</script>
	
   
     