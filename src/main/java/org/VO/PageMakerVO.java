package org.VO;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMakerVO {

	private int totalCount;
	private int startPage;
	private int endPage;
	
	private boolean next;
	private boolean prev;
	
	private int displayPageNum = 5; //한번에 보일 페이지 갯수
	
	private PageVO pagevo;
	
	public void setPagevo(PageVO pagevo) {
		this.pagevo = pagevo;
	}
	
	public PageVO getPagevo() {
		return pagevo;
	}
	
	//페이지 계산.
	private void calcPage() {
		endPage = (int)(Math.ceil(pagevo.getPage()/(double)displayPageNum) * displayPageNum);
		
		startPage = (endPage-displayPageNum) +1;
		
		int tempEndPage = (int)(Math.ceil(totalCount/(double)pagevo.getPerPageNum()));
		
		
		//마지막 페이지 파트의 endPage 처리.
		if(endPage>tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage==1 ? false:true;
		
		next = endPage*pagevo.getPerPageNum() >= totalCount ? false: true;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		calcPage();
	}
	
	
	public String makeQuery(int page) {
		UriComponents uriComponents= UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", pagevo.getPerPageNum())
				.build();
		return uriComponents.toUriString();
	}
	
	
	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	
	
	
}
