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
		
		<form name=form1 method="post" action="/member/join" id="form1">
			<table class="type11">	
				<tr><th>아이디</th><td><input type="text" name="id" id="id" autofocus placeholder="아이디를 입력하세요">
				<input type="button" id="idCheck" value="중복확인"/>
				<div id="label" style="color:red"></div>
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
		
					<input type="button" id="commit" value="완료"/>
					<input type="reset" id="reset" value="다시 작성">	

		</form>
		<a href="/member/login">되돌아가기</a><br></br>
		
	</div>



  


<script>
	var idchk=false;

	
	$('#idCheck').click(function(){
		var id = $('#id').val()
		$.ajax({
			url : "/member/idCheck",
			type : "post",
			data : {"id":id},
			success : function(data){
				if(data === 1 ){ //중복값 존재
					$('#label').text('존재하는 아이디입니다')
					$('#label').attr('style', 'color:red')
					idchk = false;
				}else if(data === 0){
					$('#label').text('사용가능한 아이디입니다')
					$('#label').attr('style', 'color:blue')
					idchk=true;
				}else if(data === 2){
					$('#label').text('아이디를 입력해주세요')
					$('#label').attr('style', 'color:red')
					idchk=false;
				}
			},
			error : function(error){
				console.log("error : " + error)
			}

		})

	})
	
	
/* 	$('#commit').click(function(){
		if(idchk === true){
			$('#submit').submit();
		}else {
			$('#label').text('아이디 중복체크를 해주세요')
			$('#label').attr('style', 'color:red')
		}
		
	})  */
	
	   commit.addEventListener('click', function(){
		  if(idchk === true){
				$('#form1').submit()
			}else {
				$('#label').text('아이디 중복체크를 해주세요')
				$('#label').attr('style', 'color:red')
			}   
	    })	 


	
</script>





	
</body>
</html>