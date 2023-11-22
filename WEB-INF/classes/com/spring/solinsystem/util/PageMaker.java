package com.spring.solinsystem.util;
//PageMaker 객체를 사용하려면 setCri()와 setTotalCount()를 먼저 호출해서 값을 셋팅해야한다.
public class PageMaker {
	private Criteria cri; //페이지네이션 기준 정보를 나타내는 Criteria 클래스의 인스턴스 저장
    private int totalCount; //전체 항목수를 나타냄 
    private int startPage; //페이지네이션에서 표시할 시작 페이지
    private int endPage; //마지막 페이지
    private boolean prev; //이전페이지 및 다음 페이지로 이동 할 수 있는 버튼 표시 여부를 나타냄
    private boolean next;
    private int displayPageNum = 5; //화면 하단에 보여질 페이지 버튼의 수
    
    //페이징 버튼들을 생성하는 계산식을 만든다
    //끝 페이지 번호, 시작 페이지 번호, 이전, 다음 버튼들을 구한다
    private void calcData() {
        //끝 페이지 번호 = (현재 페이지 번호 / 화면에 보여질 페이지 번호의 갯수) * 화면에 보여질 페이지 번호의 갯수
        endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
        
        //시작 페이지 번호 = (끝 페이지 번호 - 화면에 보여질 페이지 번호의 갯수) + 1 
        startPage = (endPage - displayPageNum) + 1;
        if(startPage <= 0) startPage = 1;
        
        //마지막 페이지 번호 = 총 게시글 수 / 한 페이지당 보여줄 게시글의 갯수
        int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }
        //이전 버튼 생성 여부 = 시작 페이지 번호 == 1 ? false : true
        prev = startPage == 1 ? false : true;
        //다음 버튼 생성 여부 = 끝 페이지 번호 * 한 페이지당 보여줄 게시글의 갯수 < 총 게시글의 수 ? ture : false
        next = endPage * cri.getPerPageNum() < totalCount ? true : false;
        
    }
    
    
    public Criteria getCri() {
        return cri;
    }
    public void setCri(Criteria cri) {
        this.cri = cri;
    }
    public int getTotalCount() {
        return totalCount;
    }
    //총게시물 수를 셋팅할때 calcData() 메서드를 호출하여 페이징 관련 버튼 계산을 한다.
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        calcData();
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
    public boolean isPrev() {
        return prev;
    }
    public void setPrev(boolean prev) {
        this.prev = prev;
    }
    public boolean isNext() {
        return next;
    }
    public void setNext(boolean next) {
        this.next = next;
    }
    public int getDisplayPageNum() {
        return displayPageNum;
    }
    public void setDisplayPageNum(int displayPageNum) {
        this.displayPageNum = displayPageNum;
    }
 
}
