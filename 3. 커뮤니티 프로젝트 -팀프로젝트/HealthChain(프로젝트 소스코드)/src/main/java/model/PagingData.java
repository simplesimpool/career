package model;

public class PagingData {
	private int totalBoardNum;
	private int limitBoardNum;
	private int limitPageNum;

	private int page;
	private int startPage;
	private int endPage;
	private int nextPage;
	private int prevPage;
	private int maxPage;

	public int getTotalBoardNum() {
		return totalBoardNum;
	}

	public void setTotalBoardNum(int totalBoardNum) {
		this.totalBoardNum = totalBoardNum;
	}

	public int getLimitBoardNum() {
		return limitBoardNum;
	}

	public void setLimitBoardNum(int limitBoardNum) {
		this.limitBoardNum = limitBoardNum;
	}

	public int getLimitPageNum() {
		return limitPageNum;
	}

	public void setLimitPageNum(int limitPageNum) {
		this.limitPageNum = limitPageNum;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
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

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
}
