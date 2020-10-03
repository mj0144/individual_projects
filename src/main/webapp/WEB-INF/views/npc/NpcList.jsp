<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../commons/authentication.jsp" %>

<!DOCTYPE html>
<html>
<head>
		
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script> 
 			
  			<!--   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
  			  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css3">
			 
		 <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->
</head>

<body>





<div align=center class="container">
    <div class="row">    
        <div class="col-xs-8 col-xs-offset-2">
		    <div class="input-group">
                <div class="input-group-btn search-panel">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    	<span id="search_concept">Filter by</span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                      <li><a href="">NPC_name</a></li>
                      <li><a href="">NPC_region</a></li>
                      <li><a href="">content</a></li>
                    </ul>
                </div>
                <input type="hidden" name="search_param" value="all" id="search_param">         
                <input type="text" class="form-control" name="x" placeholder="Search term...">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                </span>
            </div>
        </div>
	</div>
		<div class="col-md-9">
    	 <table class="table table-list-search">
                    <thead>
						<tr>	
							<th>num</th>
						    <th>NPC_name</th>
						    <th>NPC_region</th>
						    <th>작성자</th>
						    <th></th>
						  </tr>
					 </thead>
                     <tbody>
						  <c:forEach var="npc" items="${npcs}" >				
							  <tr>
							  	<td><c:out value="${npc.npc_num}"/></td>
							    <td><a href="/npc/Npc_read${pageMaker.makeQuery(pageMaker.pagevo.page)}&npc_num=${npc.npc_num }">${npc.NPC_name}</a></td>
							    <td><c:out value="${npc.NPC_region}"/></td>
					 		    <td><c:out value="${npc.writer}"/></td>			 		    	    							       							       		      
							  </tr>
					 	 </c:forEach>
		  			</tbody>
                </table>   
		</div>
	</div>


		
		
		
		
	<!-- 페이징 -->
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
				



		
<input type="hidden" id="msg" value="${msg }">



    
    
</body>	 
  <script>

  	
		$(function(){
			var msg = decodeURI($('#msg').val())
			if(msg != ''){ 
				alert(msg)
				$('#msg').val('');
			}
		})
  </script>
  <script>
  $(document).ready(function(e){
    $('.search-panel .dropdown-menu').find('a').click(function(e) {
		e.preventDefault();
		var param = $(this).attr("href").replace("#","");
		var concept = $(this).text();
		$('.search-panel span#search_concept').text(concept);
		$('.input-group #search_param').val(param);
	});
});
  </script>
	
</html>