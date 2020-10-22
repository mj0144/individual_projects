<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@include file="../commons/authentication.jsp" %>
<!DOCTYPE html>
<html>
<head>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>

<link rel="stylesheet" href="../resources/css/board/write.css">
<title></title>



</head>
<body>
	<div class="container">
		<div class="WritingHeader">
			<h2 class="title">
		                        커뮤니티 글쓰기
				 </h2>
				 <div class="tool_area">
					 <a href="#" role="button" class="BaseButton BaseButton--skinGreen size_default"><!---->
					 	<span class="BaseButton__txt">등록</span>
					 </a>
                  </div>
		</div>
		<form action="/board/write" method="post" id="boardWriteForm" enctype="multipart/form-data">
			<div class="WritingContent">								
						<div class="FlexableTextArea">
							<textarea placeholder="제목을 입력해 주세요." class="textarea_input" name="title" style="height: 40px;"></textarea>
						</div>
		
						<div class="FlexableTextArea"> 
							<textarea placeholder="내용을 입력해주세요." class="textarea_input" name="content" id="content" style="height: 500px;"></textarea>
							<div>
							<div id="file_some"></div>
								
						</div>
						</div>						
						
						<div>
							<input type="file" name="files" id="files" multiple="multiple">
						</div>
			</div>	
				
		</form>
	</div>
</body>
<script>

	$('.BaseButton').click(function(){
		$('#boardWriteForm').submit();
	})
	const files_array = {};


	//이미지 미리보기.
	$('#files').change(function(){
		
		for(var i=0 ; i<this.files.length; i++){
			var fr = new FileReader;
			files_array[i] = files[i];
			fr.readAsDataURL(this.files[i]);
			fr.onload = function(data){
				$("#file_some").append('<img id="file_some" src="'+data.target.result+'" width="400px">')		
			}
		}
	});


	


	
		
</script>






</html>