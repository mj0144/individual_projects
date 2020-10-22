<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../resources/npc.css" type="text/css"></link>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<meta charset="UTF-8">
<title>Npc Register</title>
</head>
<body id="back">
	<div align=center>
		<h2><header>npc 정보 등록</header></h2>
		<form name=form1 action="register" method="post" id="form1">
		<table class="type11">	
			<tr><th>NPC_name</th><td><input type="text" name="NPC_name" id="NPC_name" autofocus placeholder="공백없이 입력하세요">				
			<input type="button" class="nameCheck" value="중복확인">
			
				<div id="label" style="color: red"></div>
			</td>
			
			</tr>
			
			<tr><th>nomal</th><td><input type="text" name="nomal" ></td></tr>
			<tr><th>interest</th><td><input type="text" name="interest"></td></tr>
			<tr><th>friendship</th><td><input type="text" name="friendship"></td></tr>
			<tr><th>turst</th><td><input type="text" name="turst"></td></tr>
			<tr><th>NPC_region</th><td><input type="text" name="NPC_region"></td></tr>	
		</table>
					<input type="hidden" name="writer" value="${sessionScope.member.id}"></td></tr>
		
			
			<input type="button" name="register" id="register" value="등록"/><br>
			<a href="/npc/NpcList">되돌아가기</a><br><br>
			
		</form>
	</div>

<!-- npc_name 중복 확인 -->
<script class="type11"> 

	var namechk= false;


	$(".nameCheck").click(function(){
	 
		 var npc_name = $("#NPC_name").val();
		 
		 $.ajax({
		  url : "/npc/nameCheck",
		  type : "post",
		  data : {"npc_name":npc_name},
		  success : function(data) {
			  		
		   if(data >= 1) {  //중복됨
			   $('#label').text('등록되어 있는 npc입니다. 다시 입력해주세요');
			   $('#label').attr('style', 'color: red')
				namechk = false;	
		    	$("#NPC_name").empty();	    
		   } else {	//중복안됨
			   $('#label').text('등록가능한 npc입니다');
			   $('#label').attr('style', 'color: blue')
				namechk=true;
		   }
		  },
		  error : function(error){
				console.log("error : " + error);
			}
		 }); 
	});

	$('#register').click(function(){
		if(namechk===true && $('#NPC_name').val()!=''){
			$('#form1').submit();
		}else if($('#NPC_name').val()===''){
			$('#label').text('빈칸없이 입력해주세요');
			$('#label').attr('style', 'color: red')
		}
		else{
			$('#label').text('중복확인을 필요합니다');
			$('#label').attr('style', 'color: red')
		}
		
	})

	
</script>
	
	
	
	
</body>
</html>