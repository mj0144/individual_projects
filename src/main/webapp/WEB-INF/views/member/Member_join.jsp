<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../resources/npc.css" type="text/css"></link>
<!-- <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script> -->
<script type="text/javascript" src="<c:url value="/resources/jquery-3.4.1.min.js"/>"></script>

<meta charset="UTF-8">
<title>Join</title>
</head>
<body id="back">
	<div align=center>
		<h2><header>회원가입</header></h2>
		
		<form name=form1 method="post">
		<table class="type11">	
			<tr><th>아이디</th><td><input type="text" name="id" id="id" autofocus placeholder="아이디를 입력하세요">
			<button type="button" class="idCheck">아이디 확인</button>
			</tr>
			<tr><th>비밀번호</th><td><input type="password" name="passwd" placeholder="********"></td></tr>
			<tr><th>비밀번호 확인</th><td><input type="password" name="passwdcheck" placeholder="********"></td></tr>
			
			<tr><th>닉네임</th><td><input type="text" name="nickname"  placeholder="닉네임을 입력하세요"></td></tr>
			<tr><th>server</th><td>
				<select name=server>
					<option selected>루페론</option>
					<option>이그히람</option>
					<option>기에나</option>
					<option>시리우스</option>
					<option>크라테르</option>
					<option>프로키온</option>
					<option>알데바란</option>
					<option>아크투르스</option>
					<option>안타레스</option>
					<option>에버그레이스</option>
					<option>베아트리스</option>
				</select>
			</td></tr>
		</table>
		<tr>
		<td><dl>
			<button type="submit" name="submit" id="submit" disabled="disabled">가입</button>
			<input type="reset" name="reset" value="다시 작성"></input>			
		</dl></td>
		</tr>
			<a href="<c:url value='http://localhost:8080/user/member/login'/>">되돌아가기</a><br></br>
		</form>
	</div>


<!-- 알림창 -->
<script type="text/javascript">
$(document).ready(function() {
	var message = "${message}";
	if(message != ""){
		alert(message);
	}
})
</script>


<!-- 빈칸 있을 때.  -->
<!-- 
<script type="text/javascript">
$(document).ready(function() {
	var focus = "${focus}";
	if(focus.equals("id")){
		document.getElementById('id').focus();		
	}else if(focus.equals("nickname")){
		document.getElementById('nickname').focus();		
	}else if(focus.equals("passwd")){
		document.getElementById('passwd').focus();		
	}
})
</script>
-->



<!-- 아이디 중복 체크 -->
<script class="type11"> 
	$(".idCheck").click(function(){
	 
	 var query = {id : $("#id").val()};
	 
	 $.ajax({
	  url : "/member/idCheck",
	  type : "post",
	  data : query,
	  success : function(data) {
		  		
	   if(data == 1) {  //중복됨
		alert('사용불가능한 ID입니다.');
	    $("#submit").attr("disabled", "disabled");
	    $(".id").empty();	    
	   } else {						//중복안됨.
		alert('사용가능한 ID입니다');   
	    $("#submit").removeAttr("disabled");   
	   }
	  }
	 }); 
	});
</script>
	
</body>
</html>