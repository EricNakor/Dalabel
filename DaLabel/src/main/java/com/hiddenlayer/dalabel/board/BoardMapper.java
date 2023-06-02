package com.hiddenlayer.dalabel.board;

import java.util.List;

public interface BoardMapper {
	public abstract int deletePost(Board b);
	public abstract List<Board> getAllPost(BoardSelector bs);
	public abstract int getPostCount(BoardSelector bs);
	public abstract int writePost(Board b);
}
