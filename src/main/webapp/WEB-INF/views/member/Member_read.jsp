<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../resources/npc.css" type="text/css"></link>

<meta charset="UTF-8">
<title>Npc Info</title>
</head>
<body id="back">
	<div align=center>
		<h2><header>회원 정보</header></h2>
		<table class="type11">
		    <th> id </th><td><c:out value="${member.id}"/></td>
			<tr><th> passwd </th><td><c:out value="${member.passwd}"/></td></tr>
			<tr><th> nickname </th><td><c:out value="${member.nickname}"/></td></tr>
			<tr><th> server </th><td><c:out value="${member.server}"/></td></tr>
			<tr><th> post_count </th><td><c:out value="${member.post_count}"/></td></tr>
		</table>
		<c:url value="/npc/NpcList" var="url"/><a href="${url}">되돌아가기</a>
	</div>
</body>
</html>