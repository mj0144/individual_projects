<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../resources/npc.css" type="text/css"></link>
				<link rel="stylesheet" href="../resources/css/bootstrap.css"></link>
	
<script type="text/javascript" src="<c:url value="/resources/jquery-3.4.1.min.js"/>"></script>

<meta charset="UTF-8">
<title>Login</title>
</head>
<body id="back">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>
	<div align=center>
		<h2><header class="text-info">로그인</header></h2>
		<form name=form1 action="login" method="post">
		<table class="type11">	
			<tr><th>아이디</th><td><input type="text" name="id" autofocus placeholder="아이디를 입력하세요"></td></tr>
			<tr><th>비밀번호</th><td><input type="password" name="passwd" placeholder="비밀번호를 입력하세요"></td></tr>
			<tr><th>server</th><td>
				<select name=server>
					<option selected>루페론</option>
					<option>이그히람</option>
					<option>gi</option>
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
		
		
						
			<input type="submit" name="submit" value="로그인" class="btn btn-default btn-lg"/><br>
		
			<c:url value="/member/join" var="url"/><a href="${url}">회원가입</a> <br>
			<c:url value="/" var="url"/><a href="${url}">되돌아가기</a><br><br>
		
		</form>
	</div>
</body>

<script type="text/javascript">


$(document).ready(function() {
	var result = "${result}";
	
	if(result == "fail"){
		alert("아이디 또는 비밀번호가 틀립니다.");
	}
	
})



</script>
</html>