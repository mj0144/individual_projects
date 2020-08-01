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
		<h2><header>Npc 정보</header></h2><br>
		<table class="type11">
		    <tr><th> NPC_name </th><td><c:out value="${npc.NPC_name}"/></td></tr>
			<tr><th> nomal </th><td><c:out value="${npc.nomal}"/></td></tr>
			<tr><th> interest </th><td><c:out value="${npc.interest}"/></td></tr>
			<tr><th> friendship </th><td><c:out value="${npc.friendship}"/></td></tr>
			<tr><th> turst </th><td><c:out value="${npc.turst}"/></td></tr>
			<tr><th> NPC_region </th><td><c:out value="${npc.NPC_region}"/></td></tr>
		</table>
		<c:url value="/npc/NpcList" var="url"/><a href="${url}">전체 목록 보기</a>
	</div>

</body>
</html>