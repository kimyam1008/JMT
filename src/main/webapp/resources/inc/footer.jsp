<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
         
	</body>
	
	<script>
	function listCall(){
		
		$.ajax({
			type: 'get',
			url : 'notiList.ajax',
			data : {},
			dataType : 'json',
			success : function(data){
				//console.log(data);
				//console.log(data.notiList);
				drawNotiList(data.notiList);
			},
			error : function(e){
				console.log(e);
			}
			
		});
	}
	
	
	$('#notidrop').on("click",function(){
		$('#notidrop').attr("src","resources/photo/bnoti4.png");
		//$('.notidrop_menu').empty();
		$('.notidrop_menu').css("display","block"); 
		
		$.ajax({
			type: 'get',
			url : 'notiList.ajax',
			data : {},
			dataType : 'json',
			success : function(data){
				//console.log(data);
				//console.log(data.notiList);
				drawNotiList(data.notiList);
			},
			error : function(e){
				console.log(e);
			}
			
		});
		
	});
	
	
	function drawNotiList(list){
		//console.log(list);
		//console.log(list.length);
		var content = "";
		if(list.length>0){					
			list.forEach(function(item,idx){
				//console.log(item);
				var date = new Date(item.noti_date);
				
				
				content += '<li>'+ '['+item.info + '] ' + item.noti_content;
				content += '<span class="notiDelBtn" onclick="notiDelBtn('+item.noti_no+')">X</span><br/>';
				content += date.toLocaleDateString("ko-KR");
				content += '<hr>';
				content += '</li>';
				
			});
		//데이터가 없을 경우	
		}else{
			content += '<li>도착한 알림이 없습니다.</li>';
		}
		
		$('.notidrop_menu').empty();
		$('.notidrop_menu').append(content); 
	}
	
	
	function notiDelBtn(noti_no){
		
		$.ajax({
			type: 'get',
			url : 'notiDel.ajax',
			data : {
				'noti_no' : noti_no
			},
			dataType : 'json',
			success : function(data){
				console.log(data);
				console.log(data.notiDelSuccess);
				if(data.notiDelSuccess){
					$('.notidrop_menu').empty();
					listCall();
				}
			},
			error : function(e){
				console.log(e);
			}
			
		});
		
	}	
	</script>
	
   
     