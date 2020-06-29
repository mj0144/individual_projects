<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
					<c:url value="/npc/list" var="url"/><a href="${url}">목록보러 가기</a> 			  				 
					 		</tr>	  				 




</body>
</html>
