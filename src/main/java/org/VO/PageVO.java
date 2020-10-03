package org.VO;

public class PageVO {
	private int page; // 선택한 페이지 번호
	private int perPageNum; // 한 페이지에 보여줄 게시글 갯수

	public PageVO() {
		this.page = 1;
		this.perPageNum = 5;
	}

	public void setPage(int page) {
		if (page <= 0) {	//잘못된 값 입력시 데이터 조정
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
	
		if(perPageNum <=0 || perPageNum>= 100) { //잘못된 값 입력시 데이터 조정
			this.perPageNum = 5;
			return;
		}
		
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	
	
	
	
	//sql구문에서 시작 위치를 지정할 때 사용.
	//limit #{pageStart}, #{perPageNum}
	public int getStartBoardNum() {
		return (this.page-1) * perPageNum; //게시물을 몇번부터 뽑을 건지.
	}
	
	
	
	
	
}
