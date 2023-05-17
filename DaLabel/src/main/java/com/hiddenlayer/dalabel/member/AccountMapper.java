package com.hiddenlayer.dalabel.member;

import java.util.ArrayList;

public interface AccountMapper {
	public abstract int addMember(Member member);
	public abstract ArrayList<Member> getUserinfo(Member member);
	public abstract int changeMember(Member member);
	public abstract int deleteMember(Member member);
}
