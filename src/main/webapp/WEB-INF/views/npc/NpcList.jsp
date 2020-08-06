<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<%
     Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal(); //사용자 정보를 가져옴.
    										//인증하지 않은 상태이면 anonymousUser 반환
    										//인증이 된 상태이면 로그인한 사용자의 정보가 담긴 Object 객체 return
    String name = "";
    if(principal != null) {
        name = auth.getName();
    } 
%>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../resources/npc.css" type="text/css"></link>
					<link rel="stylesheet" href="../resources/css/bootstrap.css"></link>
	
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta charset="UTF-8">
<title>NPC List</title>
</head>

<body id="back">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>


<!-- isAnonymous()는 익명사용자, isAuthenticated()는 인증한 사용자 -->
<sec:authorize access="isAuthenticated()">


<form name="form2">
	<div align=center class="container">
		<h1><header>NPC 목록</header></h1><br>
		
		
    <h5><%=name %>님, 반갑습니다.</h5>
    <input type="button" id="hw" value="등록하기" class="btn btn-default"/>	
	<input type="hidden" id="id" value='${member.id}'/>
<!-- <table class="type11"> -->
		<table class="table table-hover type11">	<!-- 마우스 커서 이동시 해당부분 회색으로 표시 -->
		<thead>
		<tr>	
		    <th>NPC_name</th
		    ><th>nomal</th>
		    <th>interest</th>
		    <th>friendship</th>
		    <th>turst</th>
		    <th>NPC_region</th>
		    <th>작성자</th>
		    <th></th>
		  </tr>
		  </thead>
		  <tbody>
		  <c:forEach var="npc" items="${npcs}" >				
			  <tr>
			    <td><c:out value="${npc.NPC_name}"/></td>
			    <td><c:out value="${npc.nomal}"/></td>
			    <td><c:out value="${npc.interest}"/></td>
			    <td><c:out value="${npc.friendship}"/></td>
			    <td><c:out value="${npc.turst}"/></td>
			    <td><c:out value="${npc.NPC_region}"/></td>
	 		    <td><c:out value="${npc.writer}"/></td>			 		    	    
			    <td>	
			      <%--  <c:url value="/npc/read?npc_num=${npc.npc_num}" var="url" /><a href="${url}">정보 보기</a><br> --%>
			      <a href="/npc/Npc_read${pageMaker.makeQuery(pageMaker.pagevo.page)}&npc_num=${npc.npc_num }">정보보기</a>
			       	
			       	<!-- 작성자와 로그인 id가 같아야 수정, 삭제 버튼 생성. -->
					  <c:if test="${member.id == npc.writer}">				 			  
						<c:url value="/npc/Npc_modify${pageMaker.makeQuery(pageMaker.pagevo.page) }&npc_num=${npc.npc_num}" var="url"/><a href="${url}">수정하기</a><br>		 			  				 
				      <c:url value="/npc/delete${pageMaker.makeQuery(pageMaker.pagevo.page) }&npc_num=${npc.npc_num}&writer=${npc.writer }" var="url"/><a href="${url}">삭제하기</a><br>
				      </c:if>			      
			    </td>
			  </tr>
		  </c:forEach>
		  </tbody>

		</table>
	</div>
	<div class="text-center">
			<ul class="pagination pagination-sm justify-content-center">
				<c:if test="${pageMaker.prev }">
					<%-- <li><a href="npc/NpcList?page=${pageMaker.startPage-1 }">&laquo;</a></li> --%>
					<li><a href="NpcList${pageMaker.makeQuery(pageMaker.startPage-1) }">&laquo;</a></li>
				</c:if>
				
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="i">
					<li class="page-item" <c:out value="${pageMaker.pagevo.page==i? 'class=active' : '' }"/>>
						<a class="page-link" href="NpcList${pageMaker.makeQuery(i)}">${i }</a>
					</li>
				</c:forEach>
				
				<c:if test='${pageMaker.next && pageMaker.endPage >0 }'>
					<li class="page-item"><a class="page-link" href="NpcList${pageMaker.makeQuery(pageMaker.endPage+1) }">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
				
	
		<!-- 로그인 되어 있으면, '로그아웃' 버튼뜨고, 로그인상태가 아니면 '로그인하러 가기'버튼. -->
			<%-- <c:if test="${member.id != null}">				 			  
				<c:url value="/member/logout" var="url"/><a href="${url}">로그아웃</a><br>
				<a href="/member/logout" onclick="document.getElementById('logout-form').submit();">로그아웃</a>
				<form id="logout-form" action='<c:url value='/member/logout'/>' method="POST">
				   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
				</form>
			       <c:url value="/member/read?id=${member.id}" var="url" /><a href="${url}">나의 정보 보기</a><br>
			</c:if>
				<c:if test="${member.id == null}">				 			  
				<c:url value="/member/login" var="url"/><a href="${url}">로그인하러 가기</a><br>
			</c:if> --%>
			<sec:authorize access="isAnonymous()">
			   <a href="/member/login">로그인</a>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
			   <a href="/member/logout" onclick="document.getElementById('logout-form').submit();">로그아웃</a>
				<form id="logout-form" action='<c:url value='/member/logout'/>' method="POST">
				<!-- csrf token 인증 -->
				   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
				</form>
			   <p><sec:authentication property="principal.username"/>님, 반갑습니다.</p>
			</sec:authorize> 
			
			<%-- <sec:authorize access="isAuthenticated()">
			   <a href="<c:url value='/member/login'/>">로그아웃</a>
				
				<!-- csrf token 인증 -->
				   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
				</form>
			   <p><sec:authentication property="principal.username"/>님, 반갑습니다.</p>
			</sec:authorize> 
 --%>

		
</form>
</sec:authorize>
<input type="hidden" id="msg" value="${msg }">


    
    
</body>
	<!-- 등록시, 로그인 여부 체크 -->
	   <script type="text/javascript">
	   var id = $('#id').val();
	 
	        hw.addEventListener('click', function(){
	        	if(){
	    			alert("로그인후 이용해 주세요");           	          	
	    			}else{        			
	    			location.href = "npc/register";	
	    			}    
	    		  })	
   		 </script>
   		 
  <script>
		$(function(){
			if($('#msg').val() != ''){ 
				alert($('#msg').val())
				$('#msg').val('');
			}
		})
  </script>
	
</html>