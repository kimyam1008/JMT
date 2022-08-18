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
	
	$('#notix').on("click",function(){
		$("#notix").attr("src","resources/photo/noti.png");
		$('#notiList').toggle();
		
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
		var content = "";
		if(list.length>0){					
			list.forEach(function(item,idx){
				//console.log(item);
				var date = new Date(item.noti_date);

				content += '<tr>';
				content += '<td>'+item.info+' '+item.noti_content+'<span class="notiDelBtn">X</span>';
				content += '<br/>';
				content += date.toLocaleDateString("ko-KR")+'</td>';
				content += '</tr>';
			});
		//데이터가 없을 경우	
		}else{
			content += '<tr>';
			content += '<td>도착한 알림이 없습니다.</td>';
			content += '</tr>';
		}
		
		$('#notiContent').empty();
		$('#notiContent').append(content); 
	}
	
	</script>
	
   
     