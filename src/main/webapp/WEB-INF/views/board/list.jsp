<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <%@include file="../commons/authentication.jsp" %>

<!DOCTYPE html>
<html>
<head>		
	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
			<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->
</head>
<style>
/* slide to right */
.slide_right {
 border:none;
 background-position: right;
 background: gray;
 -webkit-transition: all 200ms ease;
 -moz-transition: all 200ms ease;
 transition: all 200ms ease;
     text-align: right;
 position: relative;
}
.slide_right:hover, .slide_right.active {
 background-position: left;
 color: silver;
}
.btn {
    /*margin:.5rem; /* for this demo */
         margin: 0 auto;
    
}
</style>


<body id="back">



<!-- isAnonymous()는 익명사용자, isAuthenticated()는 인증한 사용자 -->
<%-- <sec:authorize access="isAuthenticated()">
 --%>


<div align=center class="container">
<div class="container">
<div class="row">
	<div class="col-md-3">
            <form action="#" method="get">
                <div class="input-group">
                    <!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->
                    <input class="form-control" id="system-search" name="q" placeholder="Search for" required>
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-default"><i class="glyphicon glyphicon-search"></i></button>
                    </span>
                </div>
            </form>
        </div>
        </div>
	<div class="row">
		<div class="col-md-9">
    	 <table class="table table-list-search">
                    <thead>
						<tr>
							<th>게시글 번호</th>	
							<th>제목</th>
						    <th>작성자</th>
						    <th>작성일</th>
						    <th></th>
						  </tr>
					 </thead>
                     <tbody>
						  <c:forEach var="boardvo" items="${boardvo}" >				
							  <tr>
							  	<td><c:out value='${boardvo.board_num}'/></td>
							    <td><a href="/board/read${pageMaker.makeQuery(pageMaker.pagevo.page)}&board_num=${boardvo.board_num }">${boardvo.title}</a></td>
							    <td><c:out value="${boardvo.writer}"/></td>
					 		    <td><c:out value="${boardvo.regdate}"/></td>			 		    	    							       							       		      
							  </tr>
					 	 </c:forEach>
		  			</tbody>
                </table>   
		</div>
	</div>
	<div class="row">
	    <a class="btn btn-primary slide_right" href="/board/write">글쓰기</a>
	</div>	
</div>
	</div>
		
	
		
		
	<!-- 페이징 -->
	<div class="text-center">
			<ul class="pagination pagination-sm justify-content-center">
				<c:if test="${pageMaker.prev }">
					<li><a href="list${pageMaker.makeQuery(pageMaker.startPage-1) }">&laquo;</a></li>
				</c:if>
				
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="i">
					<li class="page-item" <c:out value="${pageMaker.pagevo.page==i? 'class=active' : '' }"/>>
						<a class="page-link" href="list${pageMaker.makeQuery(i)}">${i }</a>
					</li>
				</c:forEach>
				
				<c:if test='${pageMaker.next && pageMaker.endPage >0 }'>
					<li class="page-item"><a class="page-link" href="list${pageMaker.makeQuery(pageMaker.endPage+1) }">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
				

			


		
<input type="hidden" id="msg" value="${msg }">



    
    
</body>
	<!-- 등록시, 로그인 여부 체크 -->
	   <script type="text/javascript">
	   var id = $('#id').val();
	 	$('#write').click(function(){     			
    			location.href = "/board/write";	 
		 })
/* 	        hw.addEventListener('click', function(){
	        	
	    		  })	 */
   		 </script>
   		 
  <script>

  	
		$(function(){
			var msg = decodeURI($('#msg').val())
			if(msg != ''){ 
				alert(msg)
				$('#msg').val('');
			}
		})
  </script>
	
</html>