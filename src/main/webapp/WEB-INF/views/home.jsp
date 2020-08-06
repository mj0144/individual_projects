<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
		<link rel="stylesheet" href="../resources/npc.css" type="text/css"></link>
			<link rel="stylesheet" href="../resources/css/bootstrap.css"></link>
	
</head>
<body id="back" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>

				<h1><header>LostArk NPC Likeability</header></h1>
		<HR>
		<tr>
			LostArk NPC 호감도 보상 목록페이지.
		</tr><br><br>

<tr>
					<c:url value="/member/login" var="url"/><a href="${url}">로그인하러 가기</a><br>		
					<c:url value="/npc/NpcList" var="url"/><a href="${url}">목록보러 가기</a> 	
					<!-- 인증을 하지 않은 이용자에게만 보이도록 권한 조건을 걸었다. -->
					<sec:authorize access="isAnonymous()">
    					<h5><a href='<c:url value="/admin/login"/>'>관리자로그인</a> 로그인 해주세요.</h5>
					</sec:authorize>		  				 
					 		</tr>	  				 







</body>
</html>
