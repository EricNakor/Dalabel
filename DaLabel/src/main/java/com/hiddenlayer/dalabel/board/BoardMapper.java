package com.hiddenlayer.dalabel.board;

import java.math.BigDecimal;
import java.util.List;

import com.hiddenlayer.dalabel.member.Member;

public interface BoardMapper {
	public abstract int deletePost(BigDecimal b);

	public abstract List<BoardComment> getComment(int board_id);

	public abstract Board getDetailBoard(int board_id);

	public abstract List<Board> getPost(BoardSelector bs);
	
	public abstract List<Board> getCurNotice(int board_category);

	public abstract int getPostCount(BoardSelector bs);

	public abstract int getPostCountByUser(Member m);

	public abstract int updatePost(Board b);

	public abstract int writeComment(BoardComment bc);

	public abstract int writePost(Board b);
	
	public abstract int writeReply(BoardReply br);
	
	public abstract List<BoardReply> getReply(int board_id);
	
	public abstract int deleteComment(int bc);
	
	public abstract int updateComment(BoardComment bc);
		
	public abstract int deleteReply(int br);
	
	public abstract int updateReply(BoardReply br);

}
