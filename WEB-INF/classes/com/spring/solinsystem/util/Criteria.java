package com.spring.solinsystem.util;

public class Criteria {
	 	private int page;
	    private int perPageNum;
	    
	    public Criteria() {
	        this.page = 1;
	        this.perPageNum = 10;
	    }
	    
	    public int getPageStart() {
	        return (this.page-1)*perPageNum;
	    }
	    
	    //현재 페이지 번호
	    public int getPage() {
	        return page;
	    }
	    
	    public void setPage(int page) {
	        if(page <= 0) {
	            this.page = 1;
	        } else {
	            this.page = page;
	        }
	    }
	    //한페이당 보여줄 게시물의 갯수
	    
	    public int getPerPageNum() {
	        return perPageNum;
	    }
	    
	    public void setPerPageNum(int pageCount) {
	        int cnt = this.perPageNum;
	        if(pageCount != cnt) {
	            this.perPageNum = cnt;
	        } else {
	            this.perPageNum = pageCount;
	        }
	    }
	    
}
