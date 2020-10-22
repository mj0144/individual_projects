<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js'></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div id="display">

</div>
</body>
<script id="template" type="text/x-handlebars-template">
	<span> {{name}} </span>
	<div>
		{{#each .}}
			<li class="reply">
				<div>{{rno}}</div>
				<div>{{text}}</div>
				<div>{{date}}</div>
			</li>
		{{/each}}
	</div>
</script>

<script>
	var source=$("#template").html()
	var template = Handlebars.compile(source);
	var data = [
					{rno : 1, text : "text1", date:new Date()},
					{rno : 2, text : "text2", date:new Date()},
					{rno : 3, text : "text3", date:new Date()},
					{rno : 4, text : "text4", date:new Date()},
					{rno : 5, text : "text5", date:new Date()},			
				]

	$('#display').html(template(data));
</script>




</html>