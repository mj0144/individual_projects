<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../resources/npc.css" type="text/css"></link>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>


<meta charset="UTF-8">
<title>NPC List</title>
</head>


<body id="back">
<form name="form2">
	<div align=center>
		<h1><header>NPC 목록</header></h1><br>

		<table class="type11">		
		    <th>NPC_name</th><th>nomal</th><th>interest</th><th>friendship</th><th>turst</th><th>NPC_region</th><th>작성자</th><th></th>
		  </tr>
		  <c:forEach var="search" items="${search}" >				
			  <tr>
			    <td><c:out value="${npc.NPC_name}"/></td>
			    <td><c:out value="${npc.nomal}"/></td>
			    <td><c:out value="${npc.interest}"/></td>
			    <td><c:out value="${npc.friendship}"/></td>
			    <td><c:out value="${npc.turst}"/></td>
			    <td><c:out value="${npc.NPC_region}"/></td>
	 		    <td><c:out value="${npc.writer}"/></td>			 		    	    
			    <td>	
			       <c:url value="/npc/read?id=${npc.NPC_name}" var="url" /><a href="${url}">정보 보기</a><br>
			       	
			       	<!-- 작성자와 로그인 id가 같아야 수정, 삭제 버튼 생성. -->
				  <c:if test="${member.id == npc.writer}">				 			  
					<c:url value="/npc/modify?id=${npc.NPC_name}" var="url"/><a href="${url}">수정하기</a><br>		 			  				 
			      <c:url value="/npc/delete?id=${npc.NPC_name}" var="url"/><a href="${url}">삭제하기</a><br>
			      </c:if>
			      
			    </td>
			  </tr>
		  </c:forEach>
		  

		</table>
	</div>
	
		<!-- 로그인 되어 있으면, '로그아웃' 버튼뜨고, 로그인상태가 아니면 '로그인하러 가기'버튼. -->
			<c:if test="${member.id != null}">				 			  
				<c:url value="/member/logout" var="url"/><a href="${url}">로그아웃</a><br>
			</c:if>
			<c:if test="${member.id == null}">				 			  
				<c:url value="/member/login" var="url"/><a href="${url}">로그인하러 가기</a><br>
			</c:if>
				<c:url value="/npc/list" var="url"/><a href="${url}">되돌아가기</a><br>
			
</form>
</body>







</html>