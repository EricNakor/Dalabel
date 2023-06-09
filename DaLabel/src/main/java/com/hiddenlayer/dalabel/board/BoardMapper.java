package com.hiddenlayer.dalabel.board;

import java.util.List;

import com.hiddenlayer.dalabel.member.Member;

public interface BoardMapper {
	public abstract int deletePost(Board b);
	public abstract List<Board> getPost(BoardSelector bs);
	public abstract int getPostCount(BoardSelector bs);
	public abstract int getPostCountByUser(Member m);
	public abstract List<BoardComment> getComment(Board b);
	public abstract int writeComment(BoardComment bc);
	public abstract int writePost(Board b);
}
