<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <%@include file="../commons/authentication.jsp" %>

<!DOCTYPE html>
<html>
<head>		
	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

  			<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> 


	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
	<link rel="stylesheet" href="../resources/css/board/list.css">
	<!------ Include the above in your HEAD tag ---------->
</head>


<body id="back">
<!-- isAnonymous()는 익명사용자, isAuthenticated()는 인증한 사용자 -->
<%-- <sec:authorize access="isAuthenticated()">
 --%>

<div align=center class="container">

<div class="container">
	<div class="row justify-content-center">
                        <div class="col-12 col-md-10 col-lg-8">
                            <form>
                                <div class="card-body row no-gutters align-items-center">
                                    <!--end of col-->
                                    <div class="col">
                                        <input class="form-control form-control-lg form-control-borderless" type="search" placeholder="Search topics or keywords">
                                    </div>
                                    <!--end of col-->
                                    <div class="col-auto">
                                        <button class="btn btn-lg btn-success" type="submit">Search</button>
                                    </div>
                                    <!--end of col-->
                                </div>
                            </form>
                        </div>
                        <!--end of col-->
                    </div>
</div>



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
							    <td><a href="/board/read?board_num=${boardvo.board_num }">${boardvo.title}</a></td>
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
	</div>	<br>
		
	
		
		
	<!-- 페이징 -->
	<div class="text-center">
			<ul class="pagination pagination-sm justify-content-center">
			<!-- 이전 버튼 활성화 여부 -->
				<c:if test="${pageMaker.prev }">
					<li class="page-item"><a class="page-link" href="list?page=${pageMaker.startPage-1}">&laquo;</a></li>
				</c:if>
				
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="i">
					<li class="page-item" <c:out value="${pageMaker.pagevo.page==i? 'class=active' : '' }"/>>
						<a class="page-link" href="list?page=${i}">${i }</a>
					</li>
				</c:forEach>
				
			<!-- 다음 버튼 활성화 여부 -->
				<c:if test='${pageMaker.next && pageMaker.endPage >0 }'>
					<li class="page-item"><a class="page-link" href="list?page=${pageMaker.endPage+1 } ">&raquo;</a></li>
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