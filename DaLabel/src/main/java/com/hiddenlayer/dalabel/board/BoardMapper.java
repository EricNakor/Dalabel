package com.hiddenlayer.dalabel.board;

import java.util.List;

public interface BoardMapper {
	public abstract List<Board> getAllPost();
	public abstract int getPostCount();
	public abstract int writePost(Board b);
}
