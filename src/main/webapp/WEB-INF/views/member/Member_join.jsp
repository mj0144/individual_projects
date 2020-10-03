<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script> -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">


<meta charset="UTF-8">
<title>Join</title>
</head>

<style>
	.card{margin-top: 100px; margin-bottom: 100px;}
</style>

<body>


<div class="row justify-content-center">
	<div class="col-md-6">
		<div class="card">
			<header class="card-header">
				<a href="/" class="float-right btn btn-outline-primary mt-1">Login</a>
				<h4 class="card-title mt-2">Sign up</h4>
			</header>
			
			<article class="card-body">
			<form>
				<div class="form-row">
					<div class="col form-group">
						<label>ID </label> 
							<input type="text" name="id" id="id" tabindex="1" class="form-control" placeholder="Username" value="">			  
					</div> <!-- form-group end.// -->
					
				</div> <!-- form-row end.// -->
				<div class="form-group">
					<label>nickName</label>
					<input type="text" name="nickname" id="nickname"class="form-control" placeholder="nickName">
				</div> <!-- form-group end.// -->
				<div class="form-group">
						<label>password </label> 
						<input type="password" name="passwd" id="passwd" tabindex="1" class="form-control" placeholder="Password">		
				</div>
				<div class="form-group">
						<label>passwordcheck </label> 
						<input type="password" name="passwdcheck" id="passwdcheck" tabindex="1" class="form-control" placeholder="Confirm Password">		
						<small class="form-text text-muted">We'll never share your email with anyone else.</small>
						
				</div>
				
				<div class="form-group">
        			<button type="submit" class="btn btn-primary btn-block"> Register  </button>
    			</div> <!-- form-group// -->   
			 </form>
			</article> <!-- card-body end .// -->

		</div> <!-- col.//-->	
	</div> <!-- row.//-->
</div> 
<!--container end.//-->










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
	    
	    $('#reset').click(function(){
			$('#label').text('');

		    })


	
</script>





	
</body>
</html>