<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>



<h4>${exception.getMessage()}</h4>

<ul>
	<c:forEach items="#{exception.getStackTrace() }" var="statck">
		<li>${stack.toString() }</li>
	
	</c:forEach>
</ul>


</body>
</html>