package com.vos.web;

public class QnaCriteria {
	
	private int pageNum; //현재 페이지
	private int amount; //한페이지당 게시물 개수
	
	public QnaCriteria() { //기본 세팅은 현재 페이지 1, 게시물 개수 10
		this(1,10);
	}
	
	public QnaCriteria(int pageNum, int amount) { 
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "QnaCriteria [pageNum=" + pageNum + ", amount=" + amount + "]";
	}
	
	

}
