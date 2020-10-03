<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@include file="../commons/authentication.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>
	tr td b{ color:green ;}
	h2{margin-top: 50px; margin-bottom: 20px;}
</style>

<meta charset="UTF-8">
<title>Npc Info</title>
</head>
<body id="back">
		
<div class="container">
	<div class="row">
	<br>
		<h2 class="text-danger">Npc 정보</h2>
		
		
		<table class="table table-bordered success">
				<thead>
					<tr >
						<th >NPC_name</th>
						<td>${npc.NPC_name}</td>
					</tr>
					<tr>
						<th class="info">nomal</th>
						<td>${npc.nomal}</td>
					</tr>
					<tr>
						<th class="info">interest</th>
						<td>${npc.interest}</td>
					</tr>
					<tr>
						<th class="info">friendship</th>
						<td>${npc.friendship}</td>
					</tr>
					
					<tr>
						<th class="info">turst</th>
						<td>${npc.turst}</td>
					</tr>
					<tr>
						<th class="info">NPC_region</th>
						<td>${npc.NPC_region}</td>
					</tr>
					
				</thead>

			</table>
			<div>
				<%-- <c:url value="/npc/NpcList" var="url"/><a href="${url}">전체 목록 보기</a> --%>
			<!-- 작성자와 로그인 id가 같아야 수정, 삭제 버튼 생성. -->
				<c:set value="<%=name %>" var="memberId"/>
				<c:if test="${npc.writer eq memberId}">				 			  
					<br><c:url value="/npc/Npc_modify${pageMaker.makeQuery(pageMaker.pagevo.page) }&npc_num=${npc.npc_num}" var="url"/><a href="${url}">수정하기</a> &nbsp;		 			  				 
					<c:url value="/npc/delete${pageMaker.makeQuery(pageMaker.pagevo.page) }&npc_num=${npc.npc_num}&writer=${npc.writer }" var="url"/><a href="${url}">삭제하기</a><br>
				</c:if>			
				<a href="/npc/NpcList?page=${pageMaker.pagevo.page }&perPageNum=${pageMaker.pagevo.perPageNum }">전체 목록 보기</a>
			</div>
	</div>
</div>


</body>
</html>