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
		<form name=form1 action="register" method="post">
		<table class="type11">	
			<tr><th>NPC_name</th><td><input type="text" name="NPC_name" id="NPC_name"autofocus placeholder="공백없이 입력하세요"></td></tr>
			<tr><th>nomal</th><td><input type="text" name="nomal" ></td></tr>
			<tr><th>interest</th><td><input type="text" name="interest"></td></tr>
			<tr><th>friendship</th><td><input type="text" name="friendship"></td></tr>
			<tr><th>turst</th><td><input type="text" name="turst"></td></tr>
			<tr><th>NPC_region</th><td><input type="text" name="NPC_region" placeholder="공백없이 입력하세요"></td></tr>	
			<input type="hidden" name="writer" value="${sessionScope.member.id}"></td></tr>
			아이디 : ${sessionScope.member.id}
			<%-- <input type="hidden" name="post_count" value="${sessionScope.member.post_count}"> --%>
		</table>
		<dl>
			<button type="button" class="nameCheck">NPC 이름 중복 확인</button>
			<button type="submit" name="submit" id="submit" disabled="disabled">등록완료</button>
			</dl>
			<c:url/><a href="http://localhost:8080/npc/list">되돌아가기</a><br><br>
			
		</form>
	</div>

<!-- npc_name 중복 확인 -->
<script class="type11"> 
	$(".nameCheck").click(function(){
	 
	 var query = {NPC_name : $("#NPC_name").val()};
	 
	 $.ajax({
	  url : "${pageContext.request.contextPath}/npc/nameCheck",
	  type : "post",
	  data : query,
	  success : function(data) {
		  		
	   if(data == 1) {  //중복됨
		alert('등록되어 있는 npc입니다. 다시 입력해주세요');
	    $("#submit").attr("disabled", "disabled");		
	    $(".NPC_name").empty();	    
	   } else {	//중복안됨
			alert('등록가능한 npc입니다');
	    $("#submit").removeAttr("disabled");   
	   }
	  }
	 }); 
	});
</script>
	
	
	
	
</body>
</html>