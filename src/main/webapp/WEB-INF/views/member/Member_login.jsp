<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object info = auth.getPrincipal();

	String userId = "";
	if (info != null) {
		userId = auth.getName();
	}
%>
<html>
<head>

	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- Required meta tags -->
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Fonts -->
	<link rel="dns-prefetch" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600"
		rel="stylesheet" type="text/css">
	
	<link rel="stylesheet" href="../resources/css/home.css">
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	
	<title>Laravel</title>
</head>
<style>
	.cotainer{margin-top: 100px;}
</style>

<body>
	<!-- 로그인되어 있지 않은(인증되지 않은) 사용자가 접근 시, 로그인 창. -->

	<div class="cotainer">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header">로그인</div>
					<div class="card-body">
						<sec:authorize access="isAnonymous()">
								<form name=form1 action="login" method="post">
									<div class="form-group row">
										<label for="email_address"
											class="col-md-4 col-form-label text-md-right">ID</label>
										<div class="col-md-6">
											<input type="text" name="id" class="form-control" autofocus
												placeholder="아이디를 입력하세요">
										</div>
									</div>
	
									<div class="form-group row">
										<label for="password"
											class="col-md-4 col-form-label text-md-right">Password</label>
										<div class="col-md-6">
											<input type="password" name="passwd" class="form-control" placeholder="비밀번호를 입력하세요">
										</div>
									</div>
	
									<div class="col-md-6 offset-md-4">
										<input type="submit" name="submit" value="로그인"
											class="btn btn-primary" />
										<input type="button" name="submit" value="회원가입" onclick="join()"
											class="btn btn-primary" /><br>
										<br> <a href="#"
											class="btn btn-link"> Forgot Your Password? </a>
									</div>
									<!-- 로그인 실패시, security에서 에외발생시 저장하는 세션값을 가져와 출력.-->
									<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
										<div class="col-md-6 offset-md-4">
	
											<!-- <font color="red"> -->
											<p>
											${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
											</p>
											<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
										</div>
									</c:if>							
						</form>
					</sec:authorize>
					
					
					<!-- 이미 로그인 한 사람이 접속했을 시. -->
					<sec:authorize access="isAuthenticated()">
						<%=userId%>님 환영합니다

							<form id="logout-form" action='<c:url value='/member/logout'/>'
							method="POST">
							<a href="/member/logout"
								onclick="document.getElementById('logout-form').submit();">로그아웃</a>

							<!-- csrf token 인증 -->
							<input name="${_csrf.parameterName}" type="hidden"
								value="${_csrf.token}" />
						</form>
					</sec:authorize>


<input type="hidden" id="msg" value=${msg }>



				</div>
			</div>
		</div>
	</div>
</div>
</body>


<script>
		$(function(){
			if($('#msg').val() != '' && $('#msg').val){ 
				if($('#msg').val()==='logout'){
					alert('로그아웃되었습니다')
				}else if($('#msg').val()==='join_complete'){
					alert('가입이 완료되었습니다')
				}else{
					alert($('#msg').val())
					$('#msg').val('');
				}
			}
		})
		
		function join(){
			window.location.href = "/member/join";
		}
  </script>
</html>
