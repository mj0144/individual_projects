<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../resources/npc.css" type="text/css"></link>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<meta charset="UTF-8">
<title>Npc Modify</title>
</head>
<body id="back">
<div align=center>
		<h2><header>Npc 정보 수정</header></h2>
		<form name=form1 action="modify" method="post">
		<table class="type11">
			<tr><th>작성자</th><td><input type="text" name="writer" readonly="readonly" value="${npc.writer}"></td></tr>
			<tr><th>NPC_name</th><td><input type="text" name="NPC_name" value="${npc.NPC_name}"></td></tr>
			<tr><th>nomal</th><td><input type="text" name="nomal" value="${npc.nomal}"></td></tr>
			<tr><th>interest</th><td><input type="text" name="interest" value="${npc.interest}"></td></tr>
			<tr><th>friendship</th><td><input type="text" name="friendship" value="${npc.friendship}"></td></tr>
			<tr><th>turst</th><td><input type="text" name="turst" value="${npc.turst}"></td></tr>
			<tr><th>NPC_region</th><td><input type="text" name="NPC_region" value="${npc.NPC_region}"></td></tr>
			
			<input type="hidden" name="npc_num" value="${npc.npc_num}"/>
					
		</table>
		<dl>
			<input type="submit" name="submit" value="수정 완료">
			</dl>
			<a href="/npc/NpcList">되돌아가기</a><br><br>
			
		</form>
	</div>
</body>
</html>