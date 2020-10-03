<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.ArticleContentBox {
    padding: 29px 29px 0;
    border: 1px solid var(--skinLayoutBorder);
    border-radius: 6px;
}
.ArticleContentBox .article_header {
    position: relative;
    margin-bottom: 20px;
    padding-bottom: 20px;
    border-bottom: 1px solid var(--skinLayoutBorder);
}
div {
    display: block;
}
.ArticleTitle {
    margin-bottom: 12px;
    font-size: 13px;
}
.ArticleTitle .title_area {
    margin-top: 7px;
}

.ArticleTitle .title_area .title_text {
    font-weight: 400;
    font-size: 26px;
    word-break: break-all;
    word-wrap: break-word;
    word-break: break-word;
}
.WriterInfo .profile_area {
    float: left;
}


.WriterInfo .profile_info {
    margin-bottom: 6px;
}
.WriterInfo .profile_info .nick_box {
    display: inline-block;
    position: relative;
    vertical-align: top;
}
.WriterInfo .profile_info .nick_level {
    display: inline-block;
    margin-right: 6px;
    font-size: 13px;
    vertical-align: top;
    color: var(--skinText676767);
}
.WriterInfo .profile_info .nick_box .nickname {
    margin-right: 6px;
    font-size: 13px;
    font-weight: 700;
}
.WriterInfo .article_info {
    font-size: 12px;
    line-height: 13px;
    color: var(--skinText979797);
}
.WriterInfo .article_info .date {
    margin-right: 8px;
}
.WriterInfo .article_info {
    font-size: 12px;
    line-height: 13px;
    color: var(--skinText979797);
}
.ReplyBox {
    position: relative;
    margin-bottom: 27px;
    line-height: 19px;
}
.CommentBox {
    margin-top: -17px;
    border-top: 1px solid var(--skinLayoutBorder);
}
.CommentBox .comment_option {
    position: relative;
    padding-top: 16px;
    margin-bottom: 11px;
}
dl, ol, ul {
    list-style: none;
}
.CommentBox .comment_list .CommentItem:first-child {
    border-top: 0;
}
.CommentBox .comment_list .comment_area {
    position: relative;
    padding: 12px 23px 10px 0;
}
.CommentBox .comment_list .comment_box {
    padding-left: 46px;
}
.CommentBox .comment_list .comment_nick_box {
    margin-bottom: 4px;
}
.CommentBox .comment_list .comment_nick_box .comment_nick_info {
    display: inline-block;
    position: relative;
    font-size: 13px;
    vertical-align: top;
}
.CommentBox .comment_list .comment_nick_box .comment_nickname {
    font-weight: 700;
}

.CommentBox .comment_list .comment_text_box {
    position: relative;
    font-size: 13px;
    word-break: break-all;
    word-wrap: break-word;
}
.CommentBox .comment_list .comment_text_box .comment_text_view {
    overflow: hidden;
}
.CommentBox .comment_list .comment_text_box .text_comment {
    line-height: 17px;
    word-break: break-all;
    word-wrap: break-word;
    vertical-align: top;
}
.CommentBox .comment_list .comment_info_box {
    margin-top: 7px;
    font-size: 12px;
    color: var(--skinText979797);
}
.CommentBox .comment_list .comment_info_box .comment_info_date {
    margin-right: 8px;
}
.CommentBox a {
    color: inherit;
}
.CommentBox .comment_list .comment_tool {
    position: absolute;
    top: 12px;
    right: 0;
}
.CommentBox .comment_list+.CommentWriter {
    margin-top: 10px;
}
.CommentWriter .comment_inbox {
    position: relative;
    margin-bottom: 10px;
}
.blind {
    position: absolute;
    clip: rect(0 0 0 0);
    width: 1px;
    height: 1px;
    margin: -1px;
    overflow: hidden;
}
.CommentWriter .comment_inbox_name {
    display: block;
    margin-bottom: 10px;
    font-weight: 700;
    font-size: 13px;
}
textarea.comment_inbox_text[data-v-79bd409c] {
    max-height: 500px;
}
.CommentWriter .comment_inbox_text {
    overflow-x: hidden;
    overflow-y: auto;
    display: block;
    width: 100%;
    min-height: 17px;
    padding-right: 1px;
    border: 0;
    font-size: 13px;
    -webkit-appearance: none;
    resize: none;
    box-sizing: border-box;
    background: transparent;
    color: var(--skinTextColor);
    outline: 0;
}
strong {
    font-weight: bold;
}
button, textarea {
    font-family: Apple SD Gothic Neo,맑은 고딕,Malgun Gothic,돋움,dotum,sans-serif;
}
textarea {
    font-weight: 400;
}
body, button, dd, dl, dt, fieldset, form, h1, h2, h3, h4, h5, h6, input, legend, li, ol, p, select, table, td, textarea, th, ul {
    margin: 0;
    padding: 0;
}
textarea {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    appearance: textarea;
    background-color: -internal-light-dark(rgb(255, 255, 255), rgb(59, 59, 59));
    -webkit-rtl-ordering: logical;
    flex-direction: column;
    resize: auto;
    cursor: text;
    white-space: pre-wrap;
    overflow-wrap: break-word;
    margin: 0em;
    font: 400 13.3333px Arial;
    border-width: 1px;
    border-style: solid;
    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(195, 195, 195));
    border-image: initial;
    padding: 2px;
}


body, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, th, td, form, fieldset, legend, input, textarea, button, select {
    margin: 0;
    padding: 0;
    font-size: 13px;
}
#content-area:after {
    content: '';
    display: block;
    clear: both;
}
body {
    position: relative;
    -webkit-text-size-adjust: none;
    font-weight: 400;
    font-family: "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", 돋움, dotum, sans-serif;
}
#content-area {
    position: relative;
    width: 1080px;
    margin: 0 auto;
    clear: both;
}
#content-area #main-area {
    width: 860px;
}
.fr {
    float: right;
}




.CommentWriter .register_box {
    float: right;
}
.CommentWriter .register_box .button {
    display: inline-block;
    min-width: 46px;
    height: 34px;
    line-height: 36px;
    font-size: 13px;
    color: var(--skinCommentWriterText);
    border-radius: 6px;
    box-sizing: border-box;
    font-weight: 700;
    text-align: center;
    vertical-align: top;
}
.article_wrap {
    position: relative;
    width: 860px;
    margin: 0 auto;
    font-size: 12px;
}
.ArticleTopBtns {
    padding: 0 0 14px;
}
.ArticleTopBtns .left_area {
    float: left;
}
.BaseButton.size_default:first-child {
    margin-left: 0;
}
.BaseButton.size_default {
    min-width: 46px;
    height: 36px;
    margin-left: 10px;
    padding: 0 12px;
    font-size: 13px;
    line-height: 36px;
}
.BaseButton--skinGray {
    border: 1px solid var(--skinBaseButtonDefaultBorder);
    background: var(--skinBaseButtonDefaultBg);
    color: var(--skinBaseButtonDefaultColor);
}
.BaseButton {
    display: inline-block;
    border-radius: 6px;
    box-sizing: border-box;
    font-weight: 700;
    text-align: center;
    vertical-align: top;
}
a {
    text-decoration: none;
}
h3 {
    display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
:root {
    --skinTextColor: #000000;
    --skinText323232: #323232;
    --skinText676767: #676767;
    --skinText979797: #979797;
    --skinTextb7b7b7: #b7b7b7;
    --GnbLink: #333;
    --GnbLinkBar: #e5e5e5;
    --GnbLinkArrow: #777;
    --LayoutHeaderTitleBg: url(https://ssl.pstatic.net/static/cafe/cafe_pc/bg_default_title_white_180724.png);
    --LayoutHeaderTitleName: #212121;
    --LayoutHeaderTitleUrl: #666;
    --skinListBorder: #f2f2f2;
    --skinThumbBorder: rgba(0, 0, 0, 0.06);
    --skinBar: rgba(0,0,0,0.15);
    --skinArticleLink: -webkit-link;
    --skinSourceBadge: #323232;
    --skinTagLinkColor: #323232;
    --skinToggleSwitchBg: #a7a7a7;
    --skinTempSaveBorder: rgba(0, 0, 0, 0.2);
    --skinCommentWriterBorder: rgba(0, 0, 0, 0.1);
    --skinCommentWriterBg: #ffffff;
    --skinCommentWriterText: #b7b7b7;
    --skinCommentWriterFocus: #eeeeee;
    --skinBox: #f9f9fa;
    --skinSvgIconPostBtnArrowUp: #323232;
    --skinSvgIconPostTop: #323232;
    --skinLayoutBorder: #ebecef;
    --skinBaseButtonDefaultBg: #eff0f2;
    --skinBaseButtonDefaultColor: #000000;
    --skinBaseButtonPointBg: rgba(3, 199, 90, 0.12);
    --skinBaseButtonPointColor: #009f47;
    --skinBgPostRefresh: url(https://ca-fe.pstatic.net/web-pc/static/img/ico-post-refresh.svg?f332c2e…);
    --skinSvgIconNpay: url(https://ca-fe.pstatic.net/web-pc/static/img/pc-ico-npay.svg?d0a9d54…);
    --skinSvgIconSolidWriting: #009F47;
    --skinColor: #ffffff;
    --skinCommentMineBg: #f9f9fa;
    --skinListSelectedBg: #f9f9fa;
    --skinBaseButtonDefaultBorder: transparent;
    --skinCommentRefreshButtonBorder: transparent;
    --skinNoticeBadgeRequiredBg: #ffe3e4;
    --skinNoticeBadgeMenuBg: #ffffff;
    --skinNoticeBadgeMenuBorder: #ffe3e4;
    --skinNoticeBadgeColor: #f53535;
}
<style>
:root {
    --skinSpecialMenuWidth: 1px;
    --skinSpecialMenuBorder: #065093;
    --skinSpecialMenuBg: #065093;
    --skinSpecialMenuColor: #fff;
    --skinSpecialMenuDot: #fff;
}
.CafeViewer .se-viewer:lang(ko-KR) {
    font-family: Apple SD Gothic Neo,맑은 고딕,Malgun Gothic,돋움,dotum,sans-serif;
}
.se-viewer {
    font-family: se-nanumgothic,\\B098\B214\ACE0\B515,nanumgothic,sans-serif,Meiryo;
    line-height: 1;
    -webkit-font-smoothing: antialiased;
}
.se-viewer a, .se-viewer audio, .se-viewer blockquote, .se-viewer caption, .se-viewer code, .se-viewer dd, .se-viewer del, .se-viewer div, .se-viewer dl, .se-viewer dt, .se-viewer em, .se-viewer embed, .se-viewer h1, .se-viewer h2, .se-viewer h3, .se-viewer h4, .se-viewer h5, .se-viewer h6, .se-viewer iframe, .se-viewer img, .se-viewer ins, .se-viewer li, .se-viewer mark, .se-viewer object, .se-viewer ol, .se-viewer p, .se-viewer pre, .se-viewer q, .se-viewer s, .se-viewer small, .se-viewer span, .se-viewer strike, .se-viewer summary, .se-viewer table, .se-viewer tbody, .se-viewer td, .se-viewer tfoot, .se-viewer th, .se-viewer thead, .se-viewer tr, .se-viewer ul, .se-viewer video {
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 12px;
    font: inherit;
    vertical-align: baseline;
}
.se-viewer .se-component:first-child {
    margin-top: 0;
}
.CafeViewer .se-viewer .se-component-content {
    padding-right: 0;
    padding-left: 0;
}

</style>







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
</div>


<!-- <div id="content-area">
<div id="main-area" class="skin-1080 fr"> -->
<div class="ArticleContentBox">
	<div class="article_header">
		<div class="ArticleTitle">
			<a href="https://cafe.naver.com/ArticleList.nhn?search.clubid=15754634&amp;search.menuid=372&amp;search.boardtype=L&amp;userDisplay=15" class="link_board">
        		커뮤니티.	</a>
        		
        		
        	<div class="title_area">
        		<h3 class="title_text"> 게시물 제목  </h3>        	
        	</div>        				
		</div>
		
		<div class="WriterInfo">
			<div class="profile_area">
				<div class="profile_info">
					<div class="nick_box">
						<a id="writerInfowjdtjddk99" href="#" role="button" class="nickname">
		                    	닉네임 자리
		                </a>
	                </div>
                </div>
                <em class="nick_level"></em>
			</div>
			<div class="article_info">
				<span class="date">2020.09.29. 15:05</span>
				<span class="count">조회 1,144</span>
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
									<span style="" class="se-fs- se-ff-   " id="SE-fc584f1e-32ab-4d42-a6d2-2e0deb1f130c">​</span>
									</p><!-- } SE-TEXT --><!-- SE-TEXT { -->
									<p class="se-text-paragraph se-text-paragraph-align- " style="" id="SE-c5848165-2415-4d75-a341-5a3d78f8b2ff">
									<span style="" class="se-fs- se-ff-   " id="SE-f9f7fd95-ed02-4dca-a661-f0083fa0992d">처음 자소서 쓰기 시작하면서 이것저것 찾아보면서 하다보니 어느정도 채울수 있게 되었습니다</span>
									</p>
									<!-- } SE-TEXT --><!-- SE-TEXT { -->
									<p class="se-text-paragraph se-text-paragraph-align- " style="" id="SE-8b0c5870-72b8-43de-a686-f4b18c60239c">
									<span style="" class="se-fs- se-ff-   " id="SE-d71392b9-aae9-45e6-b84a-139e2dde23fe">그런데 자소서를 쓸때 끝맺임은 아직도 어떻게 해야할지 감이 잘 안오네요 ㅠㅠ 이것도 각 문항별로 다를까요??ㅠㅠ 끝맺이 이상하다보니 글이 전체적으로 좋게 보이지가 않네요ㅠㅠ</span>
									</p>
									<!-- } SE-TEXT --><!-- SE-TEXT { -->
									<p class="se-text-paragraph se-text-paragraph-align- " style="" id="SE-4c8020ca-e0f0-49cb-b58d-b966e5ece7d4">
									<span style="" class="se-fs- se-ff-   " id="SE-463ef19a-ab0f-4d12-bd35-c769230e9009">​</span>
									</p>
	                            </div>
	                        </div>
	                    </div>
	                </div>    
                </div>
			</div>
			</div>
			</div>










		
		</div>

		<div class="CommentBox">
				<div class="comment_option">
					<h3 class="comment_title"> 댓글</h3>
				</div>
				<ul class="comment_list">
					<li id="55605848" class="CommentItem">
						<div class="comment_area">						
							<div class="comment_box">
								<div class="comment_nick_box">
									<div class="comment_nick_info">
										<a id="cih55605848" href="#" role="button" aria-haspopup="true" aria-expanded="false" class="comment_nickname">댓글 작성자 닉네임 </a>
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
						<em data-v-79bd409c="" class="comment_inbox_name">닉네임</em>
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