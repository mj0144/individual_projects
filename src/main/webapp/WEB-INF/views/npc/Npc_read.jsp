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

<title>Npc Info</title>
<meta property="og:url" content="https://naver.com" /> 
<meta property="og:type" content="website" /> 
<meta property="og:title" content="공유 테스트" /> 
<meta property="og:description" content="페이스북 공유 테스트 내용" />
 <meta property="og:image" content="https://t1.daumcdn.net/cfile/tistory/9983C83C5AFB757A18" />

<script>
	function shareFaceBook(linkUrl){
		window.open('http://www.facebook.com/sharer.php?u=' + url)
	}
</script>




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

<div>
	<input type="button" id="share" value="페이스북 공유 테스트">
</div>




</body>
<script type="text/javascript">
/*
var url = 'https://naver.com';
var title = '공유'; 
var description = '네이버 공유 테스트';
var imgUrl = 'https://t1.daumcdn.net/cfile/tistory/9983C83C5AFB757A18'; 


if( ! $('meta[property="og:url"').attr('content') )
	{ $('head').append( StringTool.format('<meta property="og:url" content="{0}" />', url) ); } 
if( ! $('meta[property="og:type"').attr('content') ) 
	{ $('head').append( StringTool.format('<meta property="og:type" content="{0}" />', 'website') ); }
if( ! $('meta[property="og:title"').attr('content') )
	{ $('head').append( StringTool.format('<meta property="og:title" content="{0}" />', title) ); }
if( ! $('meta[property="og:description"').attr('content') )
	{ $('head').append( StringTool.format('<meta property="og:description" content="{0}" />', description) ); }
if( ! $('meta[property="og:image"').attr('content') ) 
	{ $('head').append( StringTool.format('<meta property="og:image" content="{0}" />', imgUrl) ); }
*/

//실제 테스트 중 실행되는 코드
$('#share').click(function(){
	var linkUrl = window.location.href; 
	//var linkUrl ='https://naver.com';
	shareFaceBook(linkUrl);
})


</script>


</html>

<meta property="og:url">