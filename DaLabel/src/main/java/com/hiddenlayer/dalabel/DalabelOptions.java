package com.hiddenlayer.dalabel;

public class DalabelOptions {
	private int boardPostPerPage;
	private int qnaPostPerPage;

	public DalabelOptions() {
		// TODO Auto-generated constructor stub
	}

	public DalabelOptions(int boardPostPerPage, int qnaPostPerPage) {
		super();
		this.boardPostPerPage = boardPostPerPage;
		this.qnaPostPerPage = qnaPostPerPage;
	}

	public int getBoardPostPerPage() {
		return boardPostPerPage;
	}

	public void setBoardPostPerPage(int boardPostPerPage) {
		this.boardPostPerPage = boardPostPerPage;
	}

	public int getQnaPostPerPage() {
		return qnaPostPerPage;
	}

	public void setQnaPostPerPage(int qnaPostPerPage) {
		this.qnaPostPerPage = qnaPostPerPage;
	}

}
