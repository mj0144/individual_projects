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
<!--   			  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css3">
 -->			 
		 <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

</head>

<body>





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
	
	
	
	
<script>
SelectBox.DOCTYPE="loose";nhn.search={init:function(f,i,h,g,a,c,b,d){this.bMemo=f;this.sDomain=i||"";this.nClubId=h||0;this.nPerPage=g||null;this.bNaverSearch=a||null;this.nMenuId=c||null;this.DATE_REG=/^ *[\d]{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01]) *$/;this.bTop=b||null;if($("divSearchDate")!=null){$("divSearchDate").onclick=function(j){customResizeIFrame(j,400);};}this._createKeyManager();this._bindEventWithDateInput(this.bTop);if(a&&b){oBAStatSender.send([{eventType:cafe.BAStatEventType.PC_730_254,extra:{cafe_id:h,keyword:d}}]);}Event.register(window,"unload",nhn.search.destroy.bindForEvent(nhn.search));var e=this;document.addEventListener("click",function(j){e.blurTipLayer(j);});},_bindEventWithDateInput:function(e){var i=undefined,j=$(e?"input_1_top":"input_1"),c=$(e?"input_2_top":"input_2"),b=$(e?"searchdateTop":"searchdate"),k=$(e?"btn_set_top":"btn_set");if(!j||!c){return;}if(e){var f=$("searchByTop").value;if(typeof f!="undefined"){this.searchTargetNameChangeWide(f);}}var a=function(n,m){var p=new Date();if(typeof m!="undefined"&&m){p.setMonth(p.getMonth()-3);}n.value=p.getFullYear()+"-"+((p.getMonth()+1)<10?"0"+(p.getMonth()+1):(p.getMonth()+1))+"-"+(p.getDate()<10?"0"+p.getDate():p.getDate());try{n.focus();}catch(o){}};if(b.value.length>=20){j.value=b.value.substring(0,10);c.value=b.value.substring(10);}else{a(j,true);a(c);}var l=function(){var m=j.value;var r="";var n=false;for(var p=(m.length-1);p>=0;p--){var q=m.charAt(p).charCodeAt(0);if((q>=48&&q<=57)||q==45){r=m.charAt(p)+r;}else{n=true;}}if(n){var o=m;j.blur();j.value=o.substring(0,o.length-1);j.focus();}if(r.length>=8){if(/\d{8,8}/.test(r.replace(/-/g,""))){r=r.replace(/-/g,"");j.value=r.substring(0,4)+"-"+r.substring(4,6)+"-"+r.substring(6,8);}}};var h=function(){var m=c.value;var r="";var n=false;for(var p=(m.length-1);p>=0;p--){var q=m.charAt(p).charCodeAt(0);if((q>=48&&q<=57)||q==45){r=m.charAt(p)+r;}else{n=true;}}if(n){var o=m;c.blur();c.value=o.substring(0,o.length-1);c.focus();}if(r.length>=8){if(/\d{8,8}/.test(r.replace(/-/g,""))){r=r.replace(/-/g,"");c.value=r.substring(0,4)+"-"+r.substring(4,6)+"-"+r.substring(6,8);}}};if($Agent().ie){Event.register(j,"keyup",function(o){var n=o.keyInfo||o.key;if(o.keyCode==9||o.keyCode==16){return;}var m=j.value;if(m.length>=8){if(/\d{8,8}/.test(m.replace(/-/g,""))){m=m.replace(/-/g,"");j.value=m.substring(0,4)+"-"+m.substring(4,6)+"-"+m.substring(6,8);}}}.bindForEvent(this));Event.register(c,"keyup",function(n){if(n.keyCode==9||n.keyCode==16){return;}var m=c.value;if(m.length>=8){if(/\d{8,8}/.test(m.replace(/-/g,""))){m=m.replace(/-/g,"");c.value=m.substring(0,4)+"-"+m.substring(4,6)+"-"+m.substring(6,8);}}}.bindForEvent(this));}Event.register(j,"focus",function(m){j.select();if($Agent().Gecko){i=setInterval(l.bind(this),10);}this._keys.init();m.stop();}.bindForEvent(this));Event.register(c,"focus",function(m){c.select();if($Agent().Gecko){i=setInterval(h.bind(this),10);}this._keys.init();m.stop();}.bindForEvent(this));Event.register(j,"blur",function(m){if($Agent().Gecko){clearInterval(i);}}.bindForEvent(this));Event.register(c,"blur",function(m){if($Agent().Gecko){clearInterval(i);}}.bindForEvent(this));var g=function(p){var m=p.keyInfo||p.key,o=p.keyCode;this._keys.init();if(o==9&&m.shift){this._keys.sTab=true;j.focus();}else{if(o==9){this._keys.tab=true;}else{if(m.keyCode==38||m.keyCode==40||m.keyCode==27){this._keys.moveKey=true;j.focus();}else{if(m.enter){b.value=j.value+c.value;if(this.DATE_REG.test(j.value)&&this.DATE_REG.test(c.value)){var n=this.submitCall;n.call(window,p,e);}else{if(!this.DATE_REG.test(j.value)){j.focus();}else{c.focus();}p.stop();}}else{if(m.shift==false&&((o>=48&&o<=57)||(o>=96&&o<=106)||o==35||o==36||o==8||o==46)){}else{if(m.left||m.right){}else{p.stop();}}}}}}}.bindForEvent(this);var d=function(p){var m=p.keyInfo||p.key,o=p.keyCode;this._keys.init();if(o==9&&m.shift){this._keys.sTab=true;j.focus();}else{if(o==9){this._keys.tab=true;}else{if(m.keyCode==38||m.keyCode==40||m.keyCode==27){this._keys.moveKey=true;c.focus();}else{if(m.enter){b.value=j.value+c.value;if(this.DATE_REG.test(j.value)&&this.DATE_REG.test(c.value)){var n=this.submitCall;n.call(window,p,e);}else{if(!this.DATE_REG.test(j.value)){j.focus();}else{c.focus();}p.stop();}}else{if(m.shift==false&&((o>=48&&o<=57)||(o>=96&&o<=106)||o==35||o==36||o==8||o==46)){}else{if(m.left||m.right){}else{p.stop();}}}}}}};Event.register(j,"keydown",g.bindForEvent(this));Event.register(c,"keydown",d.bindForEvent(this));Event.register(k,"click",function(n){if(this.DATE_REG.test(j.value)&&this.DATE_REG.test(c.value)){b.value=j.value+c.value;var m=this.submitCall;m.call(window,n,e);}else{if(!this.DATE_REG.test(j.value)){this._alert=true;nhn.MessageBox.alert("검색기간을 잘못 입력하셨습니다.<br />확인 후 검색기간을 다시 입력해주세요.<br />(예) 2018-08-02",function(o){a(j,true);});}else{if(!this.DATE_REG.test(c.value)){this._alert=true;nhn.MessageBox.alert("검색기간을 잘못 입력하셨습니다.<br />확인 후 검색기간을 다시 입력해주세요.<br />(예) 2018-08-02",function(o){a(c);});}}n.stop();return false;}}.bindForEvent(this));},searchTargetNameChangeWide:function(c){if(typeof c=="undefined"){return;}var d=parseInt(c,10);var b=3;var a=5;if(d==b||d==a){this.disableDetailSearch(true);return;}if($("searchmenuTop").value.indexOf("M")<0){this.disableDetailSearch(false);}},disableDetailSearch:function(b){var a=$("detailSearchBtn");if(typeof a=="undefined"){return;}if(b){a.setAttribute("disabled","disabled");a.style.opacity="0.3";a.className=a.className.replace("is_selected","");return;}a.removeAttribute("disabled");a.style.opacity="1";},_createKeyManager:function(){this._keys={tab:false,sTab:false,moveKey:false,init:function(){this.tab=false;this.sTab=false;this.moveKey=false;}};},destroy:function(){this.selectsearchdate=this.selectsearchBy=this.bMemo=this.sDomain=this.nClubId=this.nPerPage=this.bNaverSearch=this.nMenuId=null;},submitCall:function(b,c){$(c?"queryTop":"query").focus();$(c?"currentSearchDateTop":"currentSearchDate").text="기간 입력";var a=$(c?"divSearchDateTop":"divSearchDate");a.className=a.className.replace("is_selected","");},goSearch:function(c,d){if(this.checkValidation(c,d)){var a=d?"Top":"",b=document["frmSearch"+a];if(b["query"+a].value.split(/[ \t]/g).join("")==""){nhn.MessageBox.alert("검색어를 입력하세요.");b["query"+a].focus();return;}this.searchFrmAfter(b,d);return;}},checkValidation:function(b,c){var a=c?$("searchdateTop"):$("searchdate");if(a.value.length>=20){if(!this.isValidPeriod(a.value)){nhn.MessageBox.alert("검색기간을 잘못 입력하셨습니다.<br />확인 후 검색기간을 다시 입력해주세요.<br />(예) 2018-08-02",function(d){$(c?"divSearchDateTop":"divSearchDate").className="select_component  is_selected";});return false;}}return true;},isValidPeriod:function(e){if(e.length!=20){return false;}var f=e.substring(0,10),b=e.substring(10),d=/\d{4,4}-\d{2,2}-\d{2,2}/,c=/^ *[\d]{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01]) *$/,a=/-/g;if(!d.test(f)||!d.test(b)||!c.test(f)||!c.test(b)){return false;}if(parseInt(f.replace(a,""),10)>parseInt(b.replace(a,""),10)){return false;}return true;},searchFrmAfter:function(i,d){var f;var h=1;if(d){f={searchBy:i.searchByTop.value,searchdate:i.searchdateTop.value,searchmenu:i.searchmenuTop.value,query:URLEncoder.encode(i.queryTop.value,"MS949")};}else{f={searchBy:i.searchBy.value,searchdate:i.searchdate.value,searchmenu:"",query:URLEncoder.encode(i.query.value,"MS949")};}var j=$("searchmenuTop");if(typeof j!="undefined"&&j!=null){this.bMemo=j.value.indexOf("M")>-1;}var c=this.nPerPage,b=this.sDomain+(this.bMemo?"/MemoSearchList.nhn":"/ArticleSearchList.nhn")+"?search.clubid="+this.nClubId+"&search.searchdate="+f.searchdate+"&search.searchBy="+f.searchBy+"&search.query="+f.query+"&search.defaultValue="+h;if(d&&f.searchBy!=3&&f.searchBy!=5){b+=this.getDetailInput();}if(!this.bMemo&&this.bNaverSearch==true){b+="&search.sortBy="+i.sortBy.value;if(f.searchBy==0||f.searchBy==1){var a=i.userDisplay.value||0,g=i.media.value||0,e=i.option.value||0;b+="&userDisplay="+a;b+="&search.media="+g;b+="&search.option="+e;}}if(f.searchmenu!=""){b+="&search.menuid="+this.findMenuId(f.searchmenu.replace(/_[MBE]/,""));}else{if(this.nMenuId&&!d){b+="&search.menuid="+this.nMenuId;}}if(!!$Agent()&&$Agent().macSafari&&typeof top.document!="undefined"){top.document.location.href=b;}else{document.location.href=b;}},getDetailInput:function(){var b=[],d=document.getElementsByClassName("_detail_input");for(var c=0,a;a=d[c];c++){b.push(URLEncoder.encode(a.value||"","MS949"));}return"&search.includeAll="+b[0]+"&search.exclude="+b[1]+"&search.include="+b[2]+"&search.exact="+b[3];},findMenuId:function(a){var b=a.split("_");if(b.size()>1){a=b[0];}return a;},toggleBoxLayer:function(b){var a=$(b);if(b=="detailSearchBtn"){this.executeBlurEventForOtherDiv();}if(a.className.indexOf("is_selected")>-1){a.className=a.className.replace("is_selected","");}else{this.executeBlurEventForOtherDiv();this.toggleIconLayer();a.className=a.className+" is_selected";}},blurTipLayer:function(c){if(c.element.className.indexOf("_tipLayer")>-1){return;}var b=$$("div[class*=tip_layer]");if(b==null){return;}for(var a=0;a<b.length;a++){b[a].style.display="none";}},toggleIconLayer:function(d){var b=typeof d!="null"?$(d):"undefined",e=$$("div[class*=tip_layer]"),a=false;if(typeof b!="undefined"){a=b.style.display==="block";}for(var c=0;c<e.length;c++){e[c].style.display="none";}this.executeBlurEventForOtherDiv();if(typeof b!=="undefined"){b.style.display=a?"none":"block";}},executeBlurEventForOtherDiv:function(){var a=$$("div[class*=is_selected]");if(typeof a=="undefined"||typeof a[0]=="undefined"){return;}a[0].className=a[0].className.replace("is_selected","");},toggleSearchBy:function(c){if(typeof c=="undefined"){return;}var a=$("sl_general"),d=$("sl_memo"),b=c=="M";a.style.display=b?"none":"";d.style.display=b?"":"none";setTimeout(function(){$("currentSearchByTop").click();if(b){d.children[0].children[0].click();nhn.search.disableDetailSearch(true);}else{a.children[0].children[0].click();}},10);}};nhn.searchTop={init:function(){},clearSearchDetail:function(){var a=document.getElementsByClassName("_detail_input");a.forEach(function(b){b.value="";});}};if(typeof window.jsCompFileCheckSum=="undefined"){window.jsCompFileCheckSum={};}window.jsCompFileCheckSum.CafeSearchWide=true;

</script>
	
	
	
	
</html>