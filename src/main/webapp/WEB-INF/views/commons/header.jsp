<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../commons/authentication.jsp" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<html lang="en">
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">

	<link rel="stylesheet" href="../resources/css/home.css">
	<script src="../resources/js/commons/header.js"></script>
    <link rel="icon" href="Favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

    <title>Loa</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light navbar-laravel">
    <div class="container">
        <a class="navbar-brand" href="/">Loa</a>
        <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/npc/NpcList">정보게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/board/list">커뮤니티</a>
                </li>
                <c:set value="<%=authority %>" var="authority"/>

                <sec:authorize access="isAuthenticated()">
                	<c:if test="${authority eq 'admin' }">
		                <li class="nav-item">
		                    <a class="nav-link" href="/admin/apply">관리자 페이지</a>
		                </li>
	                </c:if>
                	
                </sec:authorize>
                
          </ul>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">

             <sec:authorize access="isAuthenticated()">	
		    	<li class="nav-item">
	            		<p class="nav-link"><%=name %>님, 반갑습니다.</p>
	            	</li>
	            <li class="nav-item">
	            	<p class="nav-link"> 회원님의 등급은 <%=authority %> 입니다.</p>
	            </li>
	             <li class="nav-item">
	                 <a class="nav-link" href="#">Mypage</a>
	            </li>
	            <li class="nav-item">	            
	           		 <a class="nav-link" href="/member/logout" onclick="document.getElementById('logout-form').submit();">로그아웃</a>
					<form id="logout-form" action='<c:url value='/member/logout'/>' method="POST">
					<!-- csrf token 인증 -->
					   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
					</form>	
				</li>
	           
    		</sec:authorize> 
    		<sec:authorize access="isAnonymous()">
    			<li class="nav-item">
	                 <a class="nav-link" href="/">Login</a>
	            </li>
    		</sec:authorize>
 
                

                </li>
            </ul>

        </div>
    </div>
</nav>

</body>
</html>
