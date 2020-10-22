<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/board/read.css" rel="stylesheet"/>
</head>
<body>
<div class="article_wrap">
<div class="ArticleTopBtns">
	<div class="left_area">
		<a href="#" role="button" class="BaseButton BaseButton--skinGray size_default">
			<span class="BaseButton__txt">수정</span>
		</a>
		<a href="#" role="button" class="BaseButton BaseButton--skinGray size_default">
			<span class="BaseButton__txt">삭제</span>
		</a>
	</div>
</div><br><br>


<!-- <div id="content-area">
<div id="main-area" class="skin-1080 fr"> -->
<div class="ArticleContentBox">
	<div class="article_header">
		<div class="ArticleTitle">
			<a href="https://cafe.naver.com/ArticleList.nhn?search.clubid=15754634&amp;search.menuid=372&amp;search.boardtype=L&amp;userDisplay=15" class="link_board">
        		커뮤니티.	</a>
        		
        		
        	<div class="title_area">
        		<h3 class="title_text">${boardvo.title }  </h3>        	
        	</div>        				
		</div>
		
		<div class="WriterInfo">
			<div class="profile_area">
				<div class="profile_info">
					<div class="nick_box">작성자 : 
						<a id="writerInfowjdtjddk99" href="#" role="button" class="nickname">
		                    	${boardvo.writer }
		                </a>
	                </div>
                </div>
                <em class="nick_level"></em>
			</div>
			<div class="article_info">
				<span class="date">${boardvo.regdate }</span>
				<span class="count">조회 : ${boardvo.viewcnt }</span>
			</div>		
		</div>
	
	
	</div>
	
	<div class="article_container">
		<div class="article_viewer">
			<div>
			<div class="content CafeViewer">
				<div class="se-viewer se-theme-default" lang="ko-KR">

   				<div class="se-main-container">
	                <div class="se-component se-text se-l-default" id="SE-5692de0c-38b4-4d9a-8602-16cd70ac0bb9">
	                    <div class="se-component-content">
	                        <div class="se-section se-section-text se-l-default">
	                            <div class="se-module se-module-text">               
									<p class="se-text-paragraph se-text-paragraph-align- " style="" id="SE-08003d85-33e5-40b4-bc86-6592eb11a716">
									<span style="" class="se-fs- se-ff-   " id="SE-fc584f1e-32ab-4d42-a6d2-2e0deb1f130c">${boardvo.content }​</span>
									</p><!-- } SE-TEXT --><!-- SE-TEXT { -->
									
	                            </div>
	                        </div>
	                    </div>
	                </div>    
                </div>
			</div>
			</div>
			</div>










		
		</div>

		<div class="CommentBox" style="margin-top : 100px">
				<div class="comment_option">
					<h3 class="comment_title"> 댓글</h3>
				</div>
				<ul class="comment_list">
					<li id="55605848" class="CommentItem">
						<div class="comment_area">						
							<div class="comment_box">
								<div class="comment_nick_box">
									<div class="comment_nick_info">
										<a id="cih55605848" href="#" role="button" aria-haspopup="true" aria-expanded="false" class="comment_nickname">댓그 작성자</a>
										</div>
								</div>
								<div class="comment_text_box">
									<p class="comment_text_view"><!---->
										<span class="text_comment">감사합니당!!</span>
									</p>
								</div>
		
								<div class="comment_info_box">
									<span class="comment_info_date">2020.09.29. 17:02</span>
									<a href="#" role="button" class="comment_info_button"> 답글쓰기</a>
								</div>
								<div class="comment_tool"> 수정,삭제 영역</div>
							</div>
						</div>
					</li>
				
				</ul>
				
				
				<div data-v-79bd409c="" class="CommentWriter">
					<div data-v-79bd409c="" class="comment_inbox">
						<strong data-v-79bd409c="" class="blind">댓글을 입력하세요</strong>
						<em data-v-79bd409c="" class="comment_inbox_name">${boardvo.writer }</em>
						<textarea data-v-79bd409c="" placeholder="댓글을 남겨보세요" rows="1" class="comment_inbox_text" style="overflow: hidden; overflow-wrap: break-word; height: 18px;"></textarea>
					</div>	
					<div data-v-79bd409c="" class="comment_attach">					
						 <div data-v-79bd409c="" class="register_box"><!---->
						 	<a data-v-79bd409c="" href="#" role="button" class="button btn_register">등록</a>
						 </div>
					 </div>				
    			</div>
				
				
				
				
				
				
		</div>
		
	
	</div>




</div>
</div>
</div>
</div>







</body>
</html>